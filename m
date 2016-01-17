Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id E003E770C6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:38:00 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id ho8so157842813pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4F3IapZAJgs2h/keXc7RJjQlOWT/LebDzGchb2VEp0s=;
	b=JywHbyHpQ2elYJdS4LIHa0M9nIMkQgpfk3UWVhDJyv+FHsD0t3iFS78ed5F/jPxJoQ
	mHUYQtkY/1cLW0xmBflu6W27UTJxHZ+JhPeM5knAj+Cc5on7Jrbmg9WvhMkXa1KSkT/j
	QegMCEWvmYelZ/RxGSP3Iekmzb2KLkqD6WdCx65VA6W/8wzENH3kHDxqOVcpdnqMw6nO
	FWrTfo4eyvgPmMXOtrCJedL/d8RzFo5MDROE+jYfCO9NC9jKXsxQwKymKTu2V9SuG0v0
	rqGLv+wfQ2QtSfoS58tBugWz7lq0T8FxRA4slkL7VTFQaSmYsD1/G1bd8DW2wp/s1HEG
	klKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4F3IapZAJgs2h/keXc7RJjQlOWT/LebDzGchb2VEp0s=;
	b=chbnMfGc4rgwSFhVx2vCnrEPAOflK/AtTuQI2Gsw/UEjLgvIGqtvlO5c0cgmj1T+zA
	CPk2MdjdIFJzOfUyUV6XUAOt739yXCBfB6pNnHmJFA4oXbh8bdY3drEafMpWKti4MHJJ
	Edt2GqcRuWQuOkASTZSlM19aj2NZ/VKv8/+N7W30WERRyGlsdT2P6rs/AFGSDcZ8uMCB
	Sci23Yn8sRXKjJqDMJtlxYC+SMfcTHr+eZeRec47yQFOQKFkJ1wkAiaclrYqLASc24MM
	H0+8EZAWCNH+LwwTs1OKC1q902lZXAy2zrdHp7KSHBd8HCfsWXN1FJhnmMwIYey+bfSe
	T1XA==
X-Gm-Message-State: ALoCoQmNDjfROuLeU5XsiSv9XxVz2yjVjG0JTRGxWc4Qvfm3nbB8JDGnbuLx03GoLwMvu2J7IIz8LJaxsP5ZreZuf67uG2w0lA==
X-Received: by 10.66.158.129 with SMTP id wu1mr28655305pab.146.1453030681437; 
	Sun, 17 Jan 2016 03:38:01 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:38:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:41 -0800
Message-Id: <a8d86f976ca4573df82fab90bcdafb393e71af73.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 68/73] mdadm: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:38:01 -0000

Define _POSIX_C_SOURCE if not defined
Add sockaddr_un* to sockaddr* typecast to make compiler happy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Define-_POSIX_C_SOURCE-if-undefined.patch | 59 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |  2 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined.patch b/meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined.patch
new file mode 100644
index 0000000..a461b76
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined.patch
@@ -0,0 +1,59 @@
+From d74b02d4653d1ea26029c2528eb93d7268b83eb3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jan 2016 07:28:33 +0000
+Subject: [PATCH] Define _POSIX_C_SOURCE if undefined
+
+typecast second argument of connect() API to use struct sockaddr*
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ config.c | 3 +++
+ mdmon.c  | 2 +-
+ msg.c    | 2 +-
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/config.c b/config.c
+index a882ed3..a675688 100644
+--- a/config.c
++++ b/config.c
+@@ -63,6 +63,9 @@
+  * but may not wrap over lines
+  *
+  */
++#ifndef _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE 200809L
++#endif
+ 
+ #ifndef CONFFILE
+ #define CONFFILE "/etc/mdadm.conf"
+diff --git a/mdmon.c b/mdmon.c
+index ee12b7c..e4b73d9 100644
+--- a/mdmon.c
++++ b/mdmon.c
+@@ -235,7 +235,7 @@ static int make_control_sock(char *devname)
+ 	addr.sun_family = PF_LOCAL;
+ 	strcpy(addr.sun_path, path);
+ 	umask(077); /* ensure no world write access */
+-	if (bind(sfd, &addr, sizeof(addr)) < 0) {
++	if (bind(sfd, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
+ 		close(sfd);
+ 		return -1;
+ 	}
+diff --git a/msg.c b/msg.c
+index 754630b..45cd450 100644
+--- a/msg.c
++++ b/msg.c
+@@ -170,7 +170,7 @@ int connect_monitor(char *devname)
+ 
+ 	addr.sun_family = PF_LOCAL;
+ 	strcpy(addr.sun_path, path);
+-	if (connect(sfd, &addr, sizeof(addr)) < 0) {
++	if (connect(sfd, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
+ 		close(sfd);
+ 		return -1;
+ 	}
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
index 0993611..e004030 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
@@ -14,13 +14,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://0001-Fix-typo-in-comparision.patch \
            file://mdadm-fix-ptest-build-errors.patch \
+           file://0001-Define-_POSIX_C_SOURCE-if-undefined.patch \
            file://run-ptest \
 	  "
 SRC_URI[md5sum] = "7ca8b114710f98f53f20c5787b674a09"
 SRC_URI[sha256sum] = "8ae5f45306b873190e91f410709b00e51997b633c072b33f8efd9f7df022ca68"
 
 CFLAGS += "-fno-strict-aliasing"
-
 inherit autotools-brokensep
 
 EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
-- 
2.7.0


