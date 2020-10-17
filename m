Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.9433.1602926855693875293
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 02:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PRZM+Y+w;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id dg9so5155700edb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vNPHhKhewHK/oiJnGlx8TjFF9BA2jZWJgQjIymxd+xY=;
        b=PRZM+Y+wKUV84MjI4SKyBJUoD55ffs9LuAwFYanolHe49nZG57Fv57ADMNKhAgw6tR
         o/HP3OWjRYrVwOUSXOt1jV4hDdSNGi2pMzTd7cmJVlJxs9I8hz1yssjNbq2Mbnkust8w
         F3bh7gUODISXzOnpSpgInVp3hnp1SLduGlPXw5ghwxNMYJiGQ0ApdEHgMVs6Xr6Qa9Di
         Mwq/2Eudwuq4O1uGrhWOpyseOelhlRjF53WAKFsCYySWGJ4sbLt9qK9e+him7JMBGLyo
         qX26mL1dWYJde5vUOnlLLWMKgXQUpQH/sg9L312gSw8og7eo5nhmK16onDIspKuOZIYj
         WBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vNPHhKhewHK/oiJnGlx8TjFF9BA2jZWJgQjIymxd+xY=;
        b=FEU3nPzp+LUfLi5OArjXdSX/HZd50psWPcso4ujZO4bHiipC6/VVyLiK/4yafc6irX
         qy3fiUTvNNNbYMFq2teNhEl2fsn6uUatO2BYfPJmyARDKrg8kvfqAZrtMAmRMnYrCFLD
         QF4GYDBQA4+qFv/2GEyILT/t6VwySckAOkrqekv0rya3dR+JFrQrPjLQ+94rtlvr9wni
         TupTP/26DTuTjfKDdH6g7/mg+nRliWgdP0+rxgrtnd8b//+YsBOn9wmamlcij/ynXhWJ
         C0y1ZzxlCeatypfBzTUEFD2IMyH1Z/H6rvHFqeZCn97HRATyNDikGXD5+uW3oJPGa1Wk
         7SoA==
X-Gm-Message-State: AOAM533BvrE4W1croQjwA5jmlqZbMpqqCt2UZV5XL/J7uivZc95Hyfw7
	h7PFWDYGdaCbk6cZkA4HhC+l5HnMpq8=
X-Google-Smtp-Source: ABdhPJwsDVBJ5sJ53bI4gQCQu+T88wYijsGLMhXeKiwFbVH+DK7mnN3ol54yW7dGsSkWgV1UekyNXA==
X-Received: by 2002:aa7:d783:: with SMTP id s3mr8575709edq.214.1602926853731;
        Sat, 17 Oct 2020 02:27:33 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n22sm4683923eji.106.2020.10.17.02.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 02:27:33 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 2/3] siteinfo: Recognize 32bit PPC LE
Date: Sat, 17 Oct 2020 11:27:11 +0200
Message-Id: <20201017092712.2343122-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201017092712.2343122-1-Martin.Jansa@gmail.com>
References: <20201017092712.2343122-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* since this commit, all powerpc little-endians (both 32bit and 64bit) use "le" suffix:
  commit b6ac40f1cbabb20896bf113568f7735a462ed1a6
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Sun Dec 29 10:44:03 2019 -0800

    powerpc, powerpc64: Append little-endianness to tune arch

* 64bit variants were already fixed in:
  commit e62cdb9b88b575b5cfcdd65ca558edc237c43b2a
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Sun Dec 29 10:44:02 2019 -0800

    siteinfo: Recognize 64bit PPC LE

* but 32bit are still failing:
  scripts/tune/log.fake-power5.powerpcle
  scripts/tune/log.fake-power5.powerpcle-nf
  scripts/tune/log.fake-power6.powerpcle
  scripts/tune/log.fake-power6.powerpcle-nf
  scripts/tune/log.fake-power7.powerpcle
  scripts/tune/log.fake-power7.powerpcle-nf
  scripts/tune/log.fake-power9.powerpcle
  scripts/tune/log.fake-power9.powerpcle-nf
  scripts/tune/log.fake-power9.ppcp9le
  scripts/tune/log.fake-ppc476.powerpcle
  scripts/tune/log.fake-ppc476.powerpcle-nf
  scripts/tune/log.fake-ppc603e.powerpcle
  scripts/tune/log.fake-ppc603e.powerpcle-nf
  scripts/tune/log.fake-ppc7400.powerpcle
  scripts/tune/log.fake-ppc7400.powerpcle-nf
  scripts/tune/log.fake-ppce300c2.powerpcle
  scripts/tune/log.fake-ppce300c2.powerpcle-nf
  scripts/tune/log.fake-ppce300c3.powerpcle
  scripts/tune/log.fake-ppce300c3.powerpcle-nf
  scripts/tune/log.fake-ppce500.powerpcle
  scripts/tune/log.fake-ppce500.powerpcle-nf
  scripts/tune/log.fake-ppce500mc.powerpcle
  scripts/tune/log.fake-ppce500mc.powerpcle-nf
  scripts/tune/log.fake-ppce500v2.powerpcle
  scripts/tune/log.fake-ppce500v2.powerpcle-nf
  scripts/tune/log.fake-ppce5500.powerpcle
  scripts/tune/log.fake-ppce5500.powerpcle-nf
  scripts/tune/log.fake-ppce6500.powerpcle
  scripts/tune/log.fake-ppce6500.powerpcle-nf

  Parsing recipes...
  ERROR: /OE/build/oe-core/openembedded-core/meta/recipes-support/debianutils/debianutils_4.11.1.bb: Unable to determine endianness for architecture 'powerpcle'
  ERROR: /OE/build/oe-core/openembedded-core/meta/recipes-support/debianutils/debianutils_4.11.1.bb: Please add your architecture to siteinfo.bbclass
  ...

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/siteinfo.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 1a048c053f..1fe5eea717 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -45,6 +45,7 @@ def siteinfo_data_for_machine(arch, os, d):
         "mipsisa32r6": "endian-big bit-32 mips-common",
         "mipsisa32r6el": "endian-little bit-32 mips-common",
         "powerpc": "endian-big bit-32 powerpc-common",
+        "powerpcle": "endian-little bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
         "powerpc64": "endian-big bit-64 powerpc-common",
         "powerpc64le": "endian-little bit-64 powerpc-common",
@@ -100,6 +101,8 @@ def siteinfo_data_for_machine(arch, os, d):
         "mipsisa64r6el-linux-gnun32": "mipsisa32r6el-linux bit-32",
         "powerpc-linux": "powerpc32-linux",
         "powerpc-linux-musl": "powerpc-linux powerpc32-linux",
+        "powerpcle-linux": "powerpc32-linux",
+        "powerpcle-linux-musl": "powerpc-linux powerpc32-linux",
         "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
         "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
-- 
2.25.1

