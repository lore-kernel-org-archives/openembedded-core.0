Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC09788A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:40:59 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id d9-v6so8687258plo.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kTfX/vMzKMwh/HmVSBUklDpQLRjuHYXJru/9JmlKo6Q=;
	b=lDIJG1r1o4FVp/ve5tdKg2NmApruKg/yOKz20gRAWRv+bA36dPSR4U5M67oJ1Vpazy
	X7F0JX30+LViqcxsAUs3x7pKX2Nh0GW2PHVmVpAuF1IrrafeV/1EoJFX7CLT3t342uZv
	AYMdXvXdX6N4WZ7qwtc0lUroj9IagnPwJKUDDFquYYlp+clLKUjcHW8Wr970tLNADYYa
	pynMGhSml7Y5QtYdNthnAVOEP09AEj7uTIgwRnwZ1UbcoYbVD61X43EXZ4I++LIfWIUe
	nlN0mA6jyfEV9Icno/PKxKJB2HvwVcnI0z/equCY0Yh9f7RCvwUSeTu5ZtqUxIiSK1xz
	uPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kTfX/vMzKMwh/HmVSBUklDpQLRjuHYXJru/9JmlKo6Q=;
	b=E8stwH2BgpmzePsZXWORMYeyyyOu1FQAEDq+7+h1J/9odH9BOpFQn49c/wSmgqfJ9c
	9sCnhpWYDWzc4UDdAnl88f0iqPzHqHtvWc2Zazu7wdVtxHfhHwY5e/4FS1gHNHBFcLIZ
	U3CbLfG8XoIZwA8A/XuryPJfIEFEE6O2LfxWod9kB6sJZLh6NjTrOASYhHmC6/7A0A91
	89OebEYlUchhAbzEzo9dqBHI6N6v3dBZBY3Z43uDxtIv4Kq5rCisdQHW3LOp5ku4bNaX
	ctxje+Wiy0PGyUE6ZQ5hMuscSp65ztoyPKjLOPNulgl6HwE7zxyf+g634RTsB2QptwBj
	nu5A==
X-Gm-Message-State: AElRT7GgurgjyXS2OJKkeuevo9kfwRQcPxZmWa2T4vd93WJhT3o+ap3B
	6mxoM9pyHpWxcSSPJeomxSZIew==
X-Google-Smtp-Source: AG47ELunSDFzQw+xhapmZfniksa1pS1vnxKoK+l4oeeQ8LgNRN5yCqBqqUQzl+N7IroV/8c8SD/8iw==
X-Received: by 2002:a17:902:9045:: with SMTP id
	w5-v6mr1537535plz.104.1520829660792; 
	Sun, 11 Mar 2018 21:41:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	y1sm964765pgs.80.2018.03.11.21.40.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 21:41:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 21:40:51 -0700
Message-Id: <53b92abb4311b720cb97512a2fb91c42fdbd5938.1520829505.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520829505.git.raj.khem@gmail.com>
References: <cover.1520829505.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] unfs3: Fix build with musl
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
X-List-Received-Date: Mon, 12 Mar 2018 04:41:00 -0000

Should also fix build on new build hosts where
with glibc 2.27 rpc support is dropped in favor
of libtirpc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/world-broken.inc          |  4 ---
 .../0001-daemon.c-Libtirpc-porting-fixes.patch     | 37 ++++++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb   | 10 ++++--
 3 files changed, 44 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index 49e9516d53..42cacfdf2e 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -5,10 +5,6 @@
 # rt-tests needs PI mutex support in libc
 EXCLUDE_FROM_WORLD_pn-rt-tests_libc-musl = "1"
 
-# error: no member named 'sin_port' in 'struct sockaddr_in6'
-# this is due to libtirpc using ipv6 but portmap rpc expecting ipv4
-EXCLUDE_FROM_WORLD_pn-unfs3_libc-musl = "1"
-
 # error: use of undeclared identifier '_STAT_VER'
 EXCLUDE_FROM_WORLD_pn-pseudo_libc-musl = "1"
 
diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch b/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
new file mode 100644
index 0000000000..6eee6748f9
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch
@@ -0,0 +1,37 @@
+From c7a2a65d6c2a433312540c207860740d6e4e7629 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Mar 2018 17:32:54 -0700
+Subject: [PATCH] daemon.c: Libtirpc porting fixes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ daemon.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/daemon.c b/daemon.c
+index 22f30f6..028a181 100644
+--- a/daemon.c
++++ b/daemon.c
+@@ -117,7 +117,7 @@ void logmsg(int prio, const char *fmt, ...)
+  */
+ struct in_addr get_remote(struct svc_req *rqstp)
+ {
+-    return (svc_getcaller(rqstp->rq_xprt))->sin_addr;
++    return ((struct sockaddr_in*)svc_getcaller(rqstp->rq_xprt))->sin_addr;
+ }
+ 
+ /*
+@@ -125,7 +125,7 @@ struct in_addr get_remote(struct svc_req *rqstp)
+  */
+ short get_port(struct svc_req *rqstp)
+ {
+-    return (svc_getcaller(rqstp->rq_xprt))->sin_port;
++    return ((struct sockaddr_in*)svc_getcaller(rqstp->rq_xprt))->sin_port;
+ }
+ 
+ /*
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
index cebc8660d0..46ac3692b1 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
@@ -9,9 +9,11 @@ RECIPE_UPSTREAM_DATE = "Oct 08, 2015"
 CHECK_DATE = "Dec 10, 2015"
 
 DEPENDS = "flex-native bison-native flex"
-DEPENDS_append_libc-musl = " libtirpc"
+DEPENDS += "libtirpc"
 DEPENDS_append_class-nativesdk = " flex-nativesdk"
 
+ASNEEDED = ""
+
 MOD_PV = "497"
 S = "${WORKDIR}/trunk"
 # Only subversion url left in OE-Core, use a mirror tarball instead since
@@ -26,7 +28,8 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/unfs3-0.9.22.r497.ta
            file://rename_fh_cache.patch \
            file://relative_max_socket_path_len.patch \
            file://tcp_no_delay.patch \
-          "
+           file://0001-daemon.c-Libtirpc-porting-fixes.patch \
+           "
 SRC_URI[md5sum] = "2e43e471c77ade0331901c40b8f8e9a3"
 SRC_URI[sha256sum] = "21009468a9ba07b72ea93780d025a63ab4e55bf8fc3127803c296f0900fe1bac"
 
@@ -34,7 +37,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 inherit autotools
 EXTRA_OECONF_append_class-native = " --sbindir=${bindir}"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+CFLAGS += " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS += " -ltirpc"
 
 # Turn off these header detects else the inode search
 # will walk entire file systems and this is a real problem
-- 
2.16.2


