Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4151C7FCA8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:18:47 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id cq11so4525332pjb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8QfQ4O4Hhji/rfx5xutanKp1zR7+uF9lmZmuUpkwNeQ=;
	b=Z8NY/2v7lXhocZapxkcWLltH2eztUllmNQgOVQs2BOWWDGAiYhwfX6bThAO1b6GpR2
	5mbQ5QxqtqksY6JcblwdfnZLaPun0l8CnVuNn8anyPTE66Jz/o6hiuXc8fwTixlXygNl
	ed3/R5/OLRAcZi2+jDSSAUz/Di41tMoxzrKMfGqV5c/UBmzA7aTruRrna0EysJb0mBXr
	vr2+LjczIcDCg0Y3IlCO9RATh5RPmAkuH0/qrCVrQX0xJWmVVgXUAZa3Jcb4WSYUfw6c
	KgV9AfA9v+sdj/mVpQrObf9iPwRo1ND8CYrJ2YpPpNEpsbFVQ64+N0xoknRs3CdHnxqa
	unGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8QfQ4O4Hhji/rfx5xutanKp1zR7+uF9lmZmuUpkwNeQ=;
	b=SNQXcbvXnW1QfuOcL6oU/5vpSr91NaSzadSB5eTeDOBwoauPqjWq6IfN5iQqtblcV8
	QTUrofoNy08QkyTRJLCCXcHYc2q4cYZQTzW17YBlK9MiFAu8CGshoY1aCskudKYwhYBe
	ThJPY9Uge/sfwvvai4p8/ZF6kWgyBZAYneRMDEKfyu6+Ew+Fap1z5lGcJLKk4TOQeTxA
	F33a65B7UYArlmXxq2dRiF4oePBdp8GQADCk70FnDLj6tX9+yKmD8H0v/5VTt2wnMqQ5
	XoL0gE2P1/IskF/4vxc9GplIFUC60ronvztQjNrIooPWvjv/QS132xOm94yvy9AMJPjP
	qRsQ==
X-Gm-Message-State: APjAAAXxNQJ6cFA3iZ0vy8NEbeG7L1VF0nigq/GVIs/QxY03Zf3Xcvc6
	/W1WtFIwbdTOAr/cqOED7QMv8wsr
X-Google-Smtp-Source: APXvYqzSH1gto74I+DgLirNK5mhcEA1hZ+xZXWqNYnPhoDOGqFp5D22f/lK6qJXrtEZHCj0aT/TMgg==
X-Received: by 2002:a17:902:b10b:: with SMTP id
	q11mr20132115plr.172.1574525928013; 
	Sat, 23 Nov 2019 08:18:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id u7sm2647804pjx.19.2019.11.23.08.18.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:18:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:18:39 -0800
Message-Id: <1574525924-20765-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
References: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 2/7] opkg-utils: Fix silent empty/broken opkg package creation
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
X-List-Received-Date: Sat, 23 Nov 2019 16:18:47 -0000

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


