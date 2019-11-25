Return-Path: <kergoth@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id D9E847FCAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:12:28 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id bb5so7135622plb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0+XRBBaILQ/roVHMbsCeJ+NVfOcIlcovvEJIOmWUygA=;
	b=V5OPLiYJCMl2a5ra0ThnAN2fgu1mNONfX9ZgUnY8aWIoj3XlR/LMGi3NEJ4u3IBYJc
	7vSpEYvsBEO90RlKBYUaSaXxmyG+BQLl1TpQnnnmNNiUu1EeYzoUuk1BuW4HAMeClX6J
	RGn+pNvP5+nfwbnNOv1iTgBEZo2isJ2QQWghIOn9iYAgn2bCqgQvp2lEytflhak59P8R
	jWUxYsRh7Vz8QJzTuIzltmlZQcvS0/LBmVAV9SyGrrsau+CBSZ5eSfcu9b7US43kfpmb
	4mF2Kgawf57sXvGQLOgcjEjsYJrTEKrZ638GsM8YY+BSItBa6ivhfHxLD4qauVrAVIXn
	sh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0+XRBBaILQ/roVHMbsCeJ+NVfOcIlcovvEJIOmWUygA=;
	b=hmeuinLcEa4GFlBkKuidf4RfN91aAyD5vNNiswKYuACCM4LpOvkQnIzO2ABSMSj82R
	y2z4GOeZdhqUCj0s4TFFa42K69S0qX0LyCUWCkRL1v2/hrhIQungszD6yOcpnFdViQzK
	SK/dF+ZoprtygpsS199vOvnBHsoVO5YMKbYTneMrd+xTfpIiv8grUqssZ03i57ZzxG7p
	9r0tP4Nq+z+43hPJIun4LO3uxNhW5MJFyyRGU3ZPE8jLgyDMdAOnhIDhz5d9AYX6fQf5
	4Bx20ZR/KzorXnuOY8ljCCgkagRjViL3HBjFAat5glw/6cY51HD1oQ7u0l9qwMP1cxBI
	uk8Q==
X-Gm-Message-State: APjAAAVFCD5Y2uqKbmHjPRzUQ28G+kk2yHzgvxBt4ZGB3vHCLfeF2R5h
	FtCf5o+aCawItFH1VE4BTYbNvWp2P0c=
X-Google-Smtp-Source: APXvYqyBYwFcC1Y3trQt0YZkjA2dUz44tbRWnLibAe0gRJVRRtqau7PdHGs9t3gmaIABQVVTMXKUUQ==
X-Received: by 2002:a17:90b:438b:: with SMTP id
	in11mr1711836pjb.129.1574719949496; 
	Mon, 25 Nov 2019 14:12:29 -0800 (PST)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id h3sm352996pji.16.2019.11.25.14.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Nov 2019 14:12:27 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 03:13:57 +0500
Message-Id: <20191125221357.6560-3-kergoth@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20191125221357.6560-1-kergoth@gmail.com>
References: <20191125221357.6560-1-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] libcap-ng: fix built failure with some external toolchains due to missing pthread
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
X-List-Received-Date: Mon, 25 Nov 2019 22:12:28 -0000

From: Christopher Larson <chris_larson@mentor.com>

The libcap-ng build doesn't pass -pthread and can fail to link.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/libcap-ng/libcap-ng.inc       |  1 +
 .../libcap-ng/revert-pthread_atfork-fix.patch      | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/revert-pthread_atfork-fix.patch

diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index aec83896e4..46d37e6807 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://python.patch \
+           file://revert-pthread_atfork-fix.patch \
 "
 
 SRC_URI[md5sum] = "57dc267e2949cdecb651a929f9206572"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread_atfork-fix.patch b/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread_atfork-fix.patch
new file mode 100644
index 0000000000..d3f7790b1e
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread_atfork-fix.patch
@@ -0,0 +1,56 @@
+From 81dc82393fae9851397fa5d94094434aa1d5c3d1 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Thu, 14 Nov 2019 21:13:24 +0500
+Subject: [PATCH] Revert "Fix usage of pthread_atfork a whole different way"
+
+This reverts commit 08a09cba90f3d960c080a20833fb8c0908f1cea6.
+
+The fix was breaking builds with some toolchains.
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ src/Makefile.am |  2 +-
+ src/cap-ng.c    | 12 +++++++++++-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 5a66d4e..d46d02b 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -34,5 +34,5 @@ noinst_HEADERS = captab.h
+ libcap_ng_la_SOURCES = cap-ng.c lookup_table.c
+ libcap_ng_la_LIBADD =
+ libcap_ng_la_DEPENDENCIES = $(libcap_ng_la_SOURCES) ../config.h
+-libcap_ng_la_LDFLAGS = -Wl,-z,relro
++libcap_ng_la_LDFLAGS = -Wl,-z,relro -Wl,-z,nodelete
+ 
+diff --git a/src/cap-ng.c b/src/cap-ng.c
+index 35fcd7a..ed31afa 100644
+--- a/src/cap-ng.c
++++ b/src/cap-ng.c
+@@ -155,6 +155,15 @@ static __thread struct cap_ng m =	{ 1,
+ 					CAPNG_NEW,
+ 					{0, 0} };
+ 
++
++/*
++ * The pthread_atfork function is being made weak so that we can use it
++ * if the program is linked with pthreads and not requiring it for
++ * everything that uses libcap-ng.
++ */
++extern int __attribute__((weak)) pthread_atfork(void (*prepare)(void),
++	void (*parent)(void), void (*child)(void));
++
+ /*
+  * Reset the state so that init gets called to erase everything
+  */
+@@ -166,7 +175,8 @@ static void deinit(void)
+ static void init_lib(void) __attribute__ ((constructor));
+ static void init_lib(void)
+ {
+-	pthread_atfork(NULL, NULL, deinit);
++	if (pthread_atfork)
++		pthread_atfork(NULL, NULL, deinit);
+ }
+ 
+ static void init(void)
-- 
2.11.1


