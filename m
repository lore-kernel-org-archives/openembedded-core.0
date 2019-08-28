Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 611177F27C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:28:50 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b10so1944174ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jZB5GdDCgtnn3pafk/yZeCxLmy5Xkzwe4YABtaqM7ng=;
	b=s6kmnH2BYnAR04je94H2IcnPU0JayxnO1BE4UV3AB6pnVKgSv0txgZZNrXMcbWMZaA
	Wz1Chrh8B6138BlrYa3/uAUDI5Lo09erWgG+0PVxyItf9QGtKpPj/WTXkZG3cXJsnef9
	lxInK9d64FPeZWLo4gR05UhYiABOHkOHJIS5ocStsbv9IU61Vjmq/UqV7N/H9u3FS7Ak
	P/fEYPIb5MtVo26w82d2cZTcMUAKCLeYzjpcpfBtJH1zFal1pUo5upxxOB8O+pX18C8a
	sHvxGw8V7sZuM0ecUq+I84hh74y6tvR1N7JzgW8q1BJc9mGh/97iP0NzUHdmxdpxc+pO
	AAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jZB5GdDCgtnn3pafk/yZeCxLmy5Xkzwe4YABtaqM7ng=;
	b=dlpqUk/NCQcLQ0QPYeqIhRNdvRMbpO7eqeqfsBkit8hMTbD0OXrq1TNKT21Qq7r/02
	D7cD0wRjhGwuc55eef3oE+K4DQUGqVb9Rz9dgtlvIS2TwZCR2RCxpysRDXkN1tTYYhnd
	Lhc9LUWzI5q0gt9F+Y7iZfMVA6JUR8OEL8WEf+Qdx2+8UpXNHUdhOq0qb8w3s6nds5v/
	s80loNcTpoMgN5DQiPEXkDGxtRdDcSQrDsjz7C/eA6IYkxblOhWMm5gjer3lcLrcBI+e
	6oGz2vWG4CO/64C6ZSEuglnJjt74JZ20ujRkeHLEBTfflm9mcCUaV7aHDTBPe+EU0kFj
	ul8w==
X-Gm-Message-State: APjAAAUpD8c8zVHzotVOdS88gAa6oNOdo1o0NWhamO2wqzoXGAJAPIz2
	qh+BwUfFwy74BRq69saQxcU=
X-Google-Smtp-Source: APXvYqy734rCmDL9Aevo6wUpP35ELs1T98gQMOxz04P4WdMO15e2OFtWEYgWrJaegsbZ6TDEeM8Yvw==
X-Received: by 2002:a5e:de0d:: with SMTP id e13mr6299995iok.144.1567020531418; 
	Wed, 28 Aug 2019 12:28:51 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d6sm4454375iod.17.2019.08.28.12.28.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:28:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 15:28:37 -0400
Message-Id: <2791b8b82e1f03d8497d4faaa6f5fce79f99227c.1567019771.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567019771.git.bruce.ashfield@gmail.com>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] bluez5: fix build against libc-headers 5.2+
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
X-List-Received-Date: Wed, 28 Aug 2019 19:28:51 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Backporting the following upstream commit to fix the build against
kernel 5.2+ headers:

[
   Subject: [PATCH] tools: Fix build after y2038 changes in glibc

   The 32-bit SIOCGSTAMP has been deprecated. Use the deprecated name
   to fix the build.
]

Upstream-Status: backport commit f36f71f60b1e68c0f12e615b9b128d089ec3dd19

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...x-build-after-y2038-changes-in-glibc.patch | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index bffd174c0a..6c79ed0606 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -57,6 +57,7 @@ SRC_URI = "\
     file://0001-Makefile.am-Fix-a-race-issue-for-tools.patch \
     file://CVE-2018-10910.patch \
     file://gcc9-fixes.patch \
+    file://0001-tools-Fix-build-after-y2038-changes-in-glibc.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch
new file mode 100644
index 0000000000..9ca20ae53b
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch
@@ -0,0 +1,68 @@
+From f36f71f60b1e68c0f12e615b9b128d089ec3dd19 Mon Sep 17 00:00:00 2001
+From: Bastien Nocera <hadess@hadess.net>
+Date: Fri, 7 Jun 2019 09:51:33 +0200
+Subject: [PATCH] tools: Fix build after y2038 changes in glibc
+
+The 32-bit SIOCGSTAMP has been deprecated. Use the deprecated name
+to fix the build.
+
+Upstream-Status: backport commit f36f71f60b1e68c0f12e615b9b128d089ec3dd19
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+---
+ tools/l2test.c | 6 +++++-
+ tools/rctest.c | 6 +++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/tools/l2test.c b/tools/l2test.c
+index e755ac881..e787c2ce2 100644
+--- a/tools/l2test.c
++++ b/tools/l2test.c
+@@ -55,6 +55,10 @@
+ #define BREDR_DEFAULT_PSM	0x1011
+ #define LE_DEFAULT_PSM		0x0080
+ 
++#ifndef SIOCGSTAMP_OLD
++#define SIOCGSTAMP_OLD SIOCGSTAMP
++#endif
++
+ /* Test modes */
+ enum {
+ 	SEND,
+@@ -907,7 +911,7 @@ static void recv_mode(int sk)
+ 			if (timestamp) {
+ 				struct timeval tv;
+ 
+-				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
++				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
+ 					timestamp = 0;
+ 					memset(ts, 0, sizeof(ts));
+ 				} else {
+diff --git a/tools/rctest.c b/tools/rctest.c
+index 94490f462..bc8ed875d 100644
+--- a/tools/rctest.c
++++ b/tools/rctest.c
+@@ -50,6 +50,10 @@
+ 
+ #include "src/shared/util.h"
+ 
++#ifndef SIOCGSTAMP_OLD
++#define SIOCGSTAMP_OLD SIOCGSTAMP
++#endif
++
+ /* Test modes */
+ enum {
+ 	SEND,
+@@ -505,7 +509,7 @@ static void recv_mode(int sk)
+ 			if (timestamp) {
+ 				struct timeval tv;
+ 
+-				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
++				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
+ 					timestamp = 0;
+ 					memset(ts, 0, sizeof(ts));
+ 				} else {
+-- 
+2.19.1
+
-- 
2.19.1


