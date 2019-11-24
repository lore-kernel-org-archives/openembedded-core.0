Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id CD8F87FC5D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:09 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id w8so5585670pjh.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8QfQ4O4Hhji/rfx5xutanKp1zR7+uF9lmZmuUpkwNeQ=;
	b=PEtsOvfragEFrfP6C5xrPGUyYugxjTT8xCGXtIS2ssY2SI596HkTKcoLAv8eSWzNmz
	YMgX2vvxGP+PnFAaB4oyXnDcpfERemdPtG2ifqlQk3by+BoUZqQegkwKDal3M8zSsvMF
	eJH8oPvD9ezRV6qJZqf9on9tUHRfHLgI70dA5royh7DFIUXDboUUpjOyjGPOf7vJFaS6
	8oEWUK1gARwtrb7XEhwK6SGs9AcmPhMpDusPn5ul0tOriYXkxgkTaSdWE6QRGuHHIZwr
	WIK9BAMszGh2938TYD8AiYlpxeXXt6euAuCt/5O4DBOjYiViOBu2SLW1fKB1wlGoa9jH
	qXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8QfQ4O4Hhji/rfx5xutanKp1zR7+uF9lmZmuUpkwNeQ=;
	b=QnYFkHhM4cJvJ5//CiZDZbkbBm62WKMqbfQXYAvh3XH6xTKunla4au1zMojgJEdLuA
	lVi6944KScBCruc2nzzcZaFuQutAYQb+nZreKP7CEABI/+VQBWMAGtn8uHH2bjAZvF+p
	gqpNWCDdoxBKc7Nqi9dhMpoyUIo1euKpHsxUGIGdPRuMzQGJoINZENJjo8Uw5naKp+qa
	g4I7QeYpxcCsmU3VkKDYVRhFeDOTS4r8ZLebtEm8Lp8LuTqz/I/xug5cPOgaB/M0MzKG
	790gF+TviMFJ/IOKbqntcmp+VIhNqZBd8Zji9xC+XtalLnJOXC++/72cp2uJR0/Nj9qd
	RdGg==
X-Gm-Message-State: APjAAAUk4n9AlWrnmbqnOq21C2EIcRB+pN9BKnh3f/ELWryRoZdfOHSc
	4gpUzNzqX0wx9BGLT+A1guHgskih
X-Google-Smtp-Source: APXvYqxa9bhrDSEuhFLAcUlvzrGt7ZLJVZFRlh6flSGySOoir/F27/oLtv7xKdzkEoa1DGx+KolE4w==
X-Received: by 2002:a17:90b:d8e:: with SMTP id
	bg14mr33895469pjb.26.1574639470737; 
	Sun, 24 Nov 2019 15:51:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:34 -0800
Message-Id: <fac3f314e5888e4c7cef5b431ef63961624594ca.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 29/35] opkg-utils: Fix silent empty/broken opkg package creation
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:10 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

opkg-build was failing on hosts where tar < 1.28 and reproducibile builds
were enabled but it was doing this silently and generating corrupted
(empty) ipk files. Add a fix for this (submitted upstream).

The fix requires bash but if you're building ipk files this shoudn't be
a problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../opkg-utils/opkg-utils/pipefail.patch           | 31 ++++++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.1.bb                 |  3 +++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
new file mode 100644
index 0000000..55ddcc1
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
@@ -0,0 +1,31 @@
+We need opkg-build to fail if for example the tar command is passed invalid 
+options. Without this, we see silently created empty packaged where data.tar
+is zero bytes in size. This creates hard to debug problems.
+
+An example is when reproducible builds are enabled and run on old hosts like
+centos7 which has tar < 1.28:
+
+Subprocess output:tar: unrecognized option '--clamp-mtime'
+Try `tar --help' or `tar --usage' for more information.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: opkg-utils-0.4.1/opkg-build
+===================================================================
+--- opkg-utils-0.4.1.orig/opkg-build
++++ opkg-utils-0.4.1/opkg-build
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ : <<=cut
+ =head1 NAME
+@@ -12,6 +12,7 @@ opkg-build - construct an .opk from a di
+ #   Updated to work on Familiar Pre0.7rc1, with busybox tar.
+ #   Note it Requires: binutils-ar (since the busybox ar can't create)
+ set -e
++set -o pipefail
+ 
+ version=1.0
+ 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
index cf1e467..eb6c7a3 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
@@ -10,6 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
            file://0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch \
+           file://pipefail.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
@@ -19,6 +20,8 @@ SRC_URI[sha256sum] = "9ea9efdd9fe13661ad251e3a2860c1c93045adcfaa6659c3e86d9748ec
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+RDEPENDS_${PN} += "bash"
+
 # For native builds we use the host Python
 PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-pickle python3-compression python3-stringold"
 PYTHONRDEPS_class-native = ""
-- 
2.7.4


