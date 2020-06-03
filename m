Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.13913.1591190936662030286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 06:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AqMP1+jp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id q25so2083493wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmY9aXBwmQLp3IhPCubJpwp8AdWryu+icE0BuAbw99c=;
        b=AqMP1+jpwg9V4zJG/qovFSm9q+CmMneS04FId1Yi151ANriIvvQ3n2XtFyr6gjfd36
         PP4nZUI7rSoSIq7dy6xGRmU41t6qMwN3sylHDWDxMYp+d2BM2m8zU4wVwPWRWXtkBZiA
         kJDypfgog2CrRNZYCWowoEumkbTxS+pkTwhiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmY9aXBwmQLp3IhPCubJpwp8AdWryu+icE0BuAbw99c=;
        b=Ha42ZWNypMHIw6iEMTCDCSAeeYMMOgWmN1ohllCsvi56Av4BN8XFajaT9XaLd4yA87
         7Vl+Z2qoCb2/37phd+cneB5+uqhrrnViEQohcx4llPOY4W8mUx6oQZWtrcxWDDmsyIc+
         EAB+MQsQ5Pj67VbUv8AAfADauDfOh5o0PRCC2IWXwBxuav4kIk7KVnilkHSKC/PniG4D
         m4WIKCZrEeys0jfhLPooKBwoEH0BM/87lZJjxoBjhHT6j9diAysL0QIsGobVxukDCO86
         3G0EHoFUJ8OgMu7rfMJhNsylvgW4N6TIHpcG9hgeA+7yAZRFv+P1Lky1gsKeN6d5t1ot
         XI8w==
X-Gm-Message-State: AOAM5318NFZTgHW+F4xRVOyGXeqI12tqyJTHTR+3pFcxGl4I5h2r3BWU
	19enu8QLefDNDMwukYZpvSObCnAITAyIBg==
X-Google-Smtp-Source: ABdhPJzjBgdg/4Mwt0zSOfTV3+VNVlvdkPzDwjhawMe1TizdqEIecT0/kKP/3Y/JmiSn8dmuzcOAuQ==
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr3287636wmi.185.1591190934747;
        Wed, 03 Jun 2020 06:28:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id n7sm3404053wrx.82.2020.06.03.06.28.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 06:28:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: Add patch to address corrupt shared library issue
Date: Wed,  3 Jun 2020 14:28:53 +0100
Message-Id: <20200603132853.15139-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

patchelf can corrupt shared libraries if the program headers don't
immediately follow the elf header. Add a patch submitted upstream
to address this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/patchelf/fix-phdrs.patch         | 37 +++++++++++++++++++
 .../patchelf/patchelf_0.10.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch b/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
new file mode 100644
index 00000000000..d087bd7855c
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
@@ -0,0 +1,37 @@
+When running patchelf on some existing patchelf'd binaries to change to longer 
+RPATHS, ldd would report the binaries as invalid. The output of objdump -x on 
+those libraryies should show the top of the .dynamic section is getting trashed,
+something like:
+
+0x600000001 0x0000000000429000
+0x335000 0x0000000000335000
+0xc740 0x000000000000c740
+0x1000 0x0000000000009098
+SONAME libglib-2.0.so.0
+
+(which should be RPATH and DT_NEEDED entries)
+
+This was tracked down to the code which injects the PT_LOAD section.
+
+The issue is that if the program headers were previously relocated to the end 
+of the file which was how patchelf operated previously, the relocation code 
+wouldn't work properly on a second run as it now assumes they're located after 
+the elf header. This change forces them back to immediately follow the elf
+header which is where the code has made space for them.
+
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/202]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+RP 2020/6/2
+
+Index: git/src/patchelf.cc
+===================================================================
+--- git.orig/src/patchelf.cc
++++ git/src/patchelf.cc
+@@ -762,6 +762,7 @@ void ElfFile<ElfFileParamNames>::rewrite
+     }
+ 
+     /* Add a segment that maps the replaced sections into memory. */
++    wri(hdr->e_phoff, sizeof(Elf_Ehdr));
+     phdrs.resize(rdi(hdr->e_phnum) + 1);
+     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
+     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.10.bb b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
index d29e094edd6..84e640773b2 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -1,6 +1,7 @@
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
+           file://fix-phdrs.patch \
            "
 
 LICENSE = "GPLv3"
-- 
2.25.1

