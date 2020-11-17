Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web09.4631.1605596112826529026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 22:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ASyBtKLc;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id 62so15476140pgg.12
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 22:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AjFpS3O2tvDQI+Vlen07P5MO187ZiXUl8B8+I3MkWJI=;
        b=ASyBtKLcHtidgjaSD2FBxTBVqIPiyU2c6J03E+u3wAuQ4DUrQ/YRM1VSPf4AbJhG6O
         z5C49NA6Sj1spUGLVnvTbo8aKQYQOsRAMbf2PatHAu+1McFUalaa3Cju4yG3W24E+t5h
         xEfVsRmWftggE87MAuL2c9NVDMXnSfovUigSZid+ito3ByK8bNVShF+ZGO2l2IgPgPon
         BkpEzxLuzV+JpzId8lF/WbgF4mLNJKOr8BEQ/zPbh8pkQ4lG5RiX6AwMinIqo2sxCAD4
         P1Ydoy0egm+DfQsx7cXRxIsF9zmyZlmn+P2acuHuCbiLa17qY80k9yQEIN8RFjHxCGeh
         MvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AjFpS3O2tvDQI+Vlen07P5MO187ZiXUl8B8+I3MkWJI=;
        b=YYMmrUNwPbpF2tzq0OLEHq4Vg+uslTmTTarq4UJu8Yjjf4I2ri6XtStRtswXfl+Mau
         /KWTeXJN8v+QySTPBH4Hm3ms5VlEhe3wZEyacPHZgi1iTFnUH3jVFfZn4OOlFgtFnDXw
         JxIWb2K2IpTgzWCNc3VMcx8AY3a+3SBkbViA3eONLF9imJBcNTGQqYA2FE+ZRaxsZAeO
         QcLWICgFOML/TBdFZWTkue+tB1ryO7qtyIVsiAC/R+/XgyK+HURI+PwjpLO1EK+w0Dq5
         Mo5JrueYmxyZdPqvLgACr2iXr6oIh2h/C0V3KSY1XfldcNYEQENKYfv4ldlzYXRZ0Ntn
         WkEQ==
X-Gm-Message-State: AOAM533V3RHNkkcUZumXXPqOlJpOuFLLgWIfPQeQ6hoW1cZ3J1KI0vmV
	C+HkSTV586KEpIQfGMHk3FI94xLBxaLH6g==
X-Google-Smtp-Source: ABdhPJxldVJE7aB4PvUUuSmCDhOTY8DnnRM+J8M5IqabVOv3FtZycOv5SdFkjBH7GHDuWw7371SPdQ==
X-Received: by 2002:aa7:9ac7:0:b029:18b:36d2:784b with SMTP id x7-20020aa79ac70000b029018b36d2784bmr17632601pfp.20.1605596111973;
        Mon, 16 Nov 2020 22:55:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id v19sm17392479pgi.2.2020.11.16.22.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 22:55:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
Date: Mon, 16 Nov 2020 22:55:08 -0800
Message-Id: <20201117065508.1575532-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3targetconfig append target python3 to dependencies
unconditionally, and here its inherited unconditionally too but
distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other not-target
recipes as well. Hence the change added via 9c8f666097802cb594a759989edcf01603a22df3
is now bridging the native dependencies with target python3 and thats
resulting all sorts of rebuilds for multimachine builds e.g.

MACHINE=qemuarm bitbake python3-scons-native
MACHINE=qemumips bitbake python3-scons-native

results in rebuilds for python3-scons-native

bitbake-diffsigs shows

Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
0e3b97bd058d162065
    Hash for dependent task python/python3-scons-native_3.1.2.bb:do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
229cb0f5ebb11
        Hash for dependent task python/python3-scons-native_3.1.2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
7cc9769194c43eae1
            Hash for dependent task python/python3-scons-native_3.1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee778f848acdfaa2
b346650fbdf114ac70ab57b
                Hash for dependent task python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to 474333fb565f908992fd3716
4935aaecf31a79e867826fe634cde4f44171d8e7
                    Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
08777e46a6fa6e417c0445018

...

Therefore limit inheriting this class only for target recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/distutils3-base.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index a277d1c7bc..882db9f605 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,5 +1,4 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
-inherit distutils-common-base python3native python3targetconfig
-
+inherit distutils-common-base python3native ${@['python3targetconfig', '']['${CLASSOVERRIDE}' == 'class-target']}
-- 
2.29.2

