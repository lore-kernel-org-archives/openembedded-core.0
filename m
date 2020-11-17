Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.15715.1605650582817742954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 14:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aIeevgAI;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id l11so1253253plt.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 14:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nZ1NB4mYfQhvyGeWva9O5FFvbwunyZDwX022tt6sLe4=;
        b=aIeevgAI6ByYcTjlSMzJD+Xj7+aGGbXai03teBlNAFhF7T3xbZ957zo/OHBPw09OpW
         1l8aG7BGoDvvyqYzjFqOzMbj0qsdLlFR7NG4XHBcZLeOMggTf/j4zxiL+aeIUbQ7tK5B
         IAJy49eKIwECOK5i5Kv5Dznokf7GrMvR11XHRcojYKbTDp8l2f/mzPJ1i8by2rAHTKTD
         SGRTUt/FKRVtiiaX8LNoN8NieHQibnEk1r/r3+13+lzLsftTNoy06rmWsRc5MC506jFW
         ytimSE/TuFlvEOciGunOZkE4HS3cHawOXok4SqTJiz2GzMKjnLZtOWbNRF+440iBAhkC
         UFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nZ1NB4mYfQhvyGeWva9O5FFvbwunyZDwX022tt6sLe4=;
        b=txUaMeFz79NJFzEWDOFYVpnpxtyysOEkCYcwczKLEr7eB1mD9UgzFHOqCdEBu1SVlL
         TSZYYd3twMXmCyXK69ToMa1te6rXJv2THocsDZMVTHrpFJNYy/NKnUxyqoj713SZR2wN
         GHGVhIyHdPMXib2t7GKbbQHE43abf7TN4PZ24f24MGJ3RnkVAr4v67ChPlRdd53h4tzC
         LKSh7IbDmy3w/EA6rAXQ3q6K/mYz435IhwQZWPhQZ1MFbPq8bXIaCRqBVYP2gtCQ3vep
         g20JMYC7/6E//Vbk9h2lFmLI4fLGLiHLZ1aA7xXdC3yxJwHleE/ZfdZB/1JndqamxJ4c
         Nhpw==
X-Gm-Message-State: AOAM530/HxCdJyLMUHkt5XjpgDNySloLaY40p+Z4LtAUO27j5AsEyowV
	4ngjoYPG7oH8Z0YG/jTgXDDN1aWhHYG6/w==
X-Google-Smtp-Source: ABdhPJxnp2fVtag5swR3QbcynalYNCQePchfS0rmA95VCLkedNjMcC8TPxt8dGZzsRR//1TNN4qLIw==
X-Received: by 2002:a17:902:a404:b029:d6:ebe0:6e57 with SMTP id p4-20020a170902a404b02900d6ebe06e57mr1512183plq.12.1605650581894;
        Tue, 17 Nov 2020 14:03:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id ce19sm38744pjb.53.2020.11.17.14.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 14:03:00 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
Date: Tue, 17 Nov 2020 14:02:57 -0800
Message-Id: <20201117220257.434468-1-raj.khem@gmail.com>
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

Therefore limit effects of this class only for target recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
---
v2: Mark depends conditional instead
v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target
    and mark tasks with target override
v4: Move space into EXTRA_PYTHON_DEPENDS
v5: Revert the space fix
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
2.29.2

