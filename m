Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 928EF6076F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 19:42:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c13-v6so10351474wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 12:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PZJMb2VBm0pwoOGMh39Yylkxcld48CbR7fHGMN+3c1k=;
	b=mh8ypy5sZiJscg4+r3/gU+ZiMw7vvw32Y0Hf2Wz1Rn8h3Q+CpD5HXkrY/e4fuhsN8z
	BbS713S+68qPkELrVKiUwpRxGp7lzo+7djtWSXD5fjQVTHBcdaiJ97+jv6tBt0qMK1NS
	pSbP6hF7hMAGtIDuYg9duJvTUREGew+7T9Ag9hxF2+PxC05kw0kOkDh+Xk/QzQtw25WK
	XAWFnj409Mh6+bOQz0/rWlb4nLD6VqO1aCMa4qHw14U8Sew2f0Kn9g1wr2OjGGyW4xTj
	xILcoXyVX+C4N+em7bLLY+nZmGPJWMJyRsoPBeHu881BdsVOa8XsuzcCqHn5irj+TR+N
	y0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PZJMb2VBm0pwoOGMh39Yylkxcld48CbR7fHGMN+3c1k=;
	b=of2uzyMqCJke0RNbM7Q8kE5v0BpddA0qhW0itg+s+oWa58Wey9IK2yROdmhT25OGce
	qOxuydyee5ijEhxU5UXtpuj2OTm4zGcu+/SUoOoCV6afDRR/YjorfE5NeEMAqjutwPW0
	wviVGjZf2M09uEvwC7zpfoQ4e4SoBJLd4uJ1BN2XYcWsBb3W+g0q24SJCAdfxOqhcsjp
	oZAL9dy/ulqUbER9GuV+7OQk6pAlcWVyUv3D1uM9qiADtMoLwMda2pHNeJabwKzcMt6h
	xwCxRo2lXdcnSwCwQIo4lOgJkY0Gk6/Fw5gKlxS1QdeQrH2PaLu1jbOHRVwkuDeiBafe
	s/pQ==
X-Gm-Message-State: AOUpUlEKQEDdqcLPihDqMseHAwhyB8kfv/vFXHH7wPIbeudbuOmxExfh
	YqBPTAR5MRV9Zo0X2yTvz69rK03R
X-Google-Smtp-Source: AAOMgpd/ZYh9mffS6nyE8aJyEGyMJj+G/AucxtpH5U5oSpRT4PK1L+opDnm3vzaUGMmkPowrXduC/g==
X-Received: by 2002:adf:a197:: with SMTP id
	u23-v6mr8245978wru.50.1533498137026; 
	Sun, 05 Aug 2018 12:42:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y203-v6sm7133417wmd.1.2018.08.05.12.42.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Aug 2018 12:42:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2018 19:40:57 +0000
Message-Id: <20180805194057.29488-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bash: libjpeg-turbo: add -fomit-frame-pointer to DEBUG_OPTIMIZATION for armv[45] with thumb enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2018 19:42:16 -0000

with thumb and debug enabled bash and libjpeg-turbo gets stuck forever
when building for qemuarm.

bash gets stuck in:
bash/4.4.18-r0/build/builtins$ arm-webos-linux-gnueabi-gcc  -march=armv5te -mthumb -fstack-protector-strong   --sysroot=bash/4.4.18-r0/recipe-sysroot -c  -DHAVE_CONFIG_H -DSHELL  -I. -I..  -I../../bash-4.4.18 -I../../bash-4.4.18/include -I../../bash-4.4.18/lib -I../../bash-4.4.18/builtins    -O -fno-omit-frame-pointer -g -DNON_INTERACTIVE_LOGIN_SHELLS read.c
libjpeg-turbo gets stuck in:
libjpeg-turbo/1_1.5.3-r0/build$ arm-webos-linux-gnueabi-gcc -march=armv5te -mthumb -fstack-protector-strong -Wformat -Wformat-security -Werror=format-security --sysroot=libjpeg-turbo/1_1.5.3-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../libjpeg-turbo-1.5.3 -Wall -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types -pipe -c ../libjpeg-turbo-1.5.3/turbojpeg.c  -fPIC -DPIC -o .libs/libturbojpeg_la-turbojpeg.o

when -mthumb, -fstack-protector-strong, -fno-omit-frame-pointer appear
together, removing one of them is enough for successful build.

similar to:
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654.html
but in this case the build gets stuck instead of failure

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/bash/bash_4.4.18.bb         | 3 +++
 meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_4.4.18.bb b/meta/recipes-extended/bash/bash_4.4.18.bb
index 0b22ca7a69..b338acd9dc 100644
--- a/meta/recipes-extended/bash/bash_4.4.18.bb
+++ b/meta/recipes-extended/bash/bash_4.4.18.bb
@@ -19,4 +19,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
 SRC_URI[tarball.md5sum] = "518e2c187cc11a17040f0915dddce54e"
 SRC_URI[tarball.sha256sum] = "604d9eec5e4ed5fd2180ee44dd756ddca92e0b6aa4217bbab2b6227380317f23"
 
+DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
index c453fdd9e0..9e1bc0e34d 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
@@ -41,6 +41,9 @@ EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf
 EXTRA_OECONF_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
 EXTRA_OECONF_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
 
+DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+
 def get_build_time(d):
     if d.getVar('SOURCE_DATE_EPOCH') != None:
         import datetime
-- 
2.17.1


