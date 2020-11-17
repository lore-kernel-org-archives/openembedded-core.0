Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.11949.1605636285550732945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 10:04:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bnQzHq+b;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id gi3so941908pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 10:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6qnaMQYG4PAmqI5LdAoO7MvNJ8HlRgo1vtTWqPwYJo=;
        b=bnQzHq+b1KFGbjq7V9h5JjEQk5+MZgGzgVwT1mRpN4R/vFZnPnT1pU6u4VQ5LNDec5
         uHTTXMOyjwoggwBgoqGnxFUNFRBzc6ga0xKUyBO/5ZNksi6zjFNUQ71rWoivlmzh0SiN
         PDBlnDY00zHQFsKcQizrpMWkPFgtHB2YoPusBtU8su8hQ6/Kqeywe+VQEnc1cv7IJ0Ks
         dITqbj0LIVaq8ieC/tf1WIwpOkMyGw1qel+yrWoGd0i7djE653rjT+Bjm4nq/rUrTT3G
         dkMa9hjyVekmYkjv5+VE8u3sKiksnGtdrjT6W/vEMwk/xLKJI8UacU1/9E3vFbi8Spg8
         6LWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6qnaMQYG4PAmqI5LdAoO7MvNJ8HlRgo1vtTWqPwYJo=;
        b=nJ8X0TE7itcOipyW6pqyqEgE9IjqC9tpAZ6ZfxGGB4FabL4yZAZFrwLP5sGVH2BeiM
         Jc7Hoh2XxnvpPovV2fql7nI4x/3usCxpDbN2J0O5GfPIVfhoGtbyZCWeezH7krAheskj
         BHq9mbJmc6JHo1/nZmoUkJjXl1PN8aKfOKAn+n/+9k2BsH8ztmnS9lLhicoYrZ2kwH0A
         9xQC45WaGmlFWE7ryLFHMZno68/JZSR8YeKW0MXBf4S9axrlx1xzd3H3/tw2bnOWNWp9
         Xwq1plbNcYQZ0+LeP9nD3bvxAVSzwq+sSEhP2Zz9hjPrXp9NAISJR75BPLzNNfdKAYc1
         nUUg==
X-Gm-Message-State: AOAM530SQ9tUGDi/7QcG6daRni5u8fkuJR95Vh9bfo9kNvG1DNx6GK/V
	OCcz3UiAT4jLft/ZlcsXC7YmBlaVfbGFdw==
X-Google-Smtp-Source: ABdhPJzyYthZbcfS4dEcGFXmT641Ur2pTqVk24sv34NG0VxCT6zrLaV9Z/76An7CHfGsGaAYO9AEww==
X-Received: by 2002:a17:90a:4814:: with SMTP id a20mr245418pjh.163.1605636284671;
        Tue, 17 Nov 2020 10:04:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id mt2sm4032107pjb.7.2020.11.17.10.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 10:04:44 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH v3] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
Date: Tue, 17 Nov 2020 10:04:41 -0800
Message-Id: <20201117180441.296304-1-raj.khem@gmail.com>
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
---
v2: Mark depends conditional instead
v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target
    and mark tasks with target override

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
