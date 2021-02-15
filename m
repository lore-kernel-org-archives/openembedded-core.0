Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.31977.1613399951910272411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x8TrpNsP;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id r75so7900349oie.11
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lizB9Ft+Lg/Z/nXCHjhsxnGlwBMITMtnU7FOS29JpwQ=;
        b=x8TrpNsP0jQ3cizTkqCBN4HvBGNaMLyg3jK8NKPMIU5WJDX+s+Pwl7SW3ALCjCQRxZ
         fsvHqEpcsSfhPs462CcKsGQEz3UWa1iAjT5l7cCcDSabHXNWgJOdoGlij5CClYKf50ZM
         /uKtEdpZ3W8TamHNNyTz+BjU98xJviot4A6yUwhH1wYMujzv+esM0fBWwF4s1K5YiQvB
         +sxIsjwBMd/nMbaIXeSHC0Qv5kJAQ0f8K5cR1raooy00ndezPkSmPXydT06k3sZ+9Wt0
         sVYHIN+NB1PeqOfhZ+uhA1YgdOQGJ7k1ybRVncvfQXZGEwzw2FiJkcN+u7Q3EAB8Z9EP
         Z/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lizB9Ft+Lg/Z/nXCHjhsxnGlwBMITMtnU7FOS29JpwQ=;
        b=bRDbPRIUvzuMDE/H/9/U0ZFrkyxbT7zkMT53s0aLuPKNLbSg6qfdPXk/K+6++B1uuM
         zt9aindvxQdB77iRjShgNYyVS/Cn46F2DqbfgvwEpB+5f7MIIJ673Fs/x28F10PU/cjs
         97a0++6rDYG1HSzrhkrD0THOOudHw3hcsCSRkN5j62tN/K85WlEEGe3YPnd6CnbDKYIJ
         AkCYRaxlX+a0SrBnpz6c4XpFRUn4N3z4FUZjahtZke4Nw0UK7FOC8jU6KSZOVLqjH0E4
         Gzv7yOoqdPsEVZz8Wg4ZRuCuFzAtBHBnuPPqzB5BiGPjpluTlejyY0jcW2mtvKG57oAS
         hQfA==
X-Gm-Message-State: AOAM533zDKtNjpiWH4lPKTcAPR5Sv8ioEd7VizQ4YLLW3MovmgzE2LDW
	QgGezFREqpnpj/QM3aQiO3vgLeAXNDtka5F2
X-Google-Smtp-Source: ABdhPJzfM+kQV76lX3stwPFuT8gxiQCcxQA/HUfg3T+nRO6Ks6jfJ3qnaXsBzJ95TMkiBFVOSWRa1Q==
X-Received: by 2002:a05:6808:bc3:: with SMTP id o3mr8625925oik.134.1613399950903;
        Mon, 15 Feb 2021 06:39:10 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.39.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:39:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/17] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
Date: Mon, 15 Feb 2021 04:37:28 -1000
Message-Id: <48157a1ca663e574fd6c7dd5cbc54524a81155c3.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

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

Therefore limit effects of this class only for target recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c99bb79087e74a967286469e1d8888a546ebec83)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/python3targetconfig.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
index 640d0c97b6..fc1025c207 100644
--- a/meta/classes/python3targetconfig.bbclass
+++ b/meta/classes/python3targetconfig.bbclass
@@ -1,15 +1,17 @@
 inherit python3native
 
-DEPENDS_append = " python3"
+EXTRA_PYTHON_DEPENDS ?= ""
+EXTRA_PYTHON_DEPENDS_class-target = "python3"
+DEPENDS_append = " ${EXTRA_PYTHON_DEPENDS}"
 
-do_configure_prepend() {
+do_configure_prepend_class-target() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 }
 
-do_compile_prepend() {
+do_compile_prepend_class-target() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 }
 
-do_install_prepend() {
+do_install_prepend_class-target() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 }
-- 
2.25.1

