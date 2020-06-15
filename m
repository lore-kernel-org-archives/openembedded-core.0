Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.26506.1592249794930114638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FnepQEO1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id b5so8247346pfp.9
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=e84afYnSduT6wlb8lA7/QxNdJWBABlNCvWpVh4fgYUc=;
        b=FnepQEO19dWksMNi/FqS39m9puJYlorWKRexAcQwNqPQCTL1k7zgz7XLOAZ8RftnZb
         fdLa6fs6p9d20ONpV/opIFoP3yAyM1AE20GanG7srwkgI33xfXrLVTf5dHvuCFATs24I
         ARLyDtnydKqd9jtAeUN3leeNpkWSDpNfLndRhSLo/p0nNHBnCfJrSym1wRE18XIO50SI
         +sqqFjs5WiqKOIZLXGtZ6GoELj7pDisAFJ936WecN0NshjYk8Q/SndxyxH5qJ20FYy82
         LPFA8pIr9E2nyTjA77uiPK7wvVDc9asrxTzsAa+oPj1PSGyE5RvSCFsKNR8gdeBP0IXq
         6Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=e84afYnSduT6wlb8lA7/QxNdJWBABlNCvWpVh4fgYUc=;
        b=jMZBpCF6/r3MaJPk7PyLE2/sptokTbfWNG/PkoLJMF/MANOwBuLW6g3iGTC+cyqN5r
         hLLq6mAG4UWuz0jJRmgrfWGlSs32l+LbmO265sNVAkdWVarbJk46hOpbs5VPIeLdbbiq
         uYhSrwbPukzaQIQeJUymUxBVNUeoYjXY4McI3A63kkt4UoZ+vhcjbcTAd5A8QImoJOtO
         hpvZTI96U4rz8iIVyEU4eDpUqOu7DGCsEvvlrTjQUrt1mOD8mgQRO9fr9MX+TxC61saH
         ECeSbUkSXEaVYrlnzqPqm0eIQgmJzrOLDzED0jpx1Vgu4fN/YBJWol/xn0I7uDtMlYjG
         ROaw==
X-Gm-Message-State: AOAM533AI2+8djh/sYPcwdg4m78xF7ZLQALDNhaFLVF7EYm7Yq0RLHrN
	sTGGPnHs3AHGK7tg8V3GVujCbWcpC60=
X-Google-Smtp-Source: ABdhPJz8jyyEJG/g1wjtJZYufyQsXzVGvyxx+JVnc98bZs7xpRjvpni/Cyw/zEPiSiKv9rvX0GSs2w==
X-Received: by 2002:a63:3c16:: with SMTP id j22mr8884583pga.335.1592249793811;
        Mon, 15 Jun 2020 12:36:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/21] patchelf: Add patch to address corrupt shared library issue
Date: Mon, 15 Jun 2020 09:35:32 -1000
Message-Id: <28e079d74c99f66428844176f640747d3e5353ed.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

patchelf can corrupt shared libraries if the program headers don't
immediately follow the elf header. Add a patch submitted upstream
to address this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e7811c787bbe2f5d49b3506309499acc27189988)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../patchelf/patchelf/fix-phdrs.patch         | 37 +++++++++++++++++++
 .../patchelf/patchelf_0.10.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch b/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
new file mode 100644
index 0000000000..d087bd7855
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
index cc983e033a..e4a604ec70 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -1,6 +1,7 @@
 SRC_URI = "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
+           file://fix-phdrs.patch \
            "
 
 LICENSE = "GPLv3"
-- 
2.17.1

