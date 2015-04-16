Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE0773D48
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 02:00:36 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so71447140pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Yc0lqgVeFtzYsUGz+39NPRT75SvGJIeKzvtl8UDZbJA=;
	b=dxNLEYb7K+o+//qtfBEgNubYD9Y1XktvJcbbwqeqazUSj3E9x5+HDQBUazMRAvxgiT
	aXybdcK3Iqi5p0lpA47M5iTKJ6PBW7WxzeTkXJd416Ih3cSex6dfmDb7UdaXkdfyz6sg
	jZWvBVDLmplhI6zoyXycAt6uG+EMPHy/8Njy+79pOkbYngy8e7/Acc4J79X3BkMek3go
	5GZdt5QNy7QhMvtNtuRHEVvWNo95P/vGLZmzItctD461pdgARhwZzgcLdEzeFbyls5HP
	a7UUyRN8f8Fb/1UpgiElu8bB/j2WtMT9IIRZ/xaTiRcxzCw7EGyCBmamHDxUADxiefyV
	s/GQ==
X-Received: by 10.70.138.70 with SMTP id qo6mr23004434pdb.163.1429149637558;
	Wed, 15 Apr 2015 19:00:37 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	nt15sm5371563pdb.14.2015.04.15.19.00.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 19:00:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:00:20 -0700
Message-Id: <b0467366b90baa1a758d141e42128e13eeb74ba5.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
References: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429149397.git.raj.khem@gmail.com>
References: <cover.1429149397.git.raj.khem@gmail.com>
Subject: [PATCH 03/10] openssh: Upgrade 6.7 - > 6.8
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
X-List-Received-Date: Thu, 16 Apr 2015 02:00:36 -0000

Its a major releaseof openssh, should be fully
compatible with 6.7 additionally works with musl

Change-Id: I903d31247b8a318b9be1c21f764ffe56b5971ca9
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openssh/add-test-support-for-busybox.patch     | 38 +++++++++++++---------
 .../openssh/{openssh_6.7p1.bb => openssh_6.8p1.bb} |  4 +--
 2 files changed, 25 insertions(+), 17 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_6.7p1.bb => openssh_6.8p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
index 07af667..adc25c6 100644
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
@@ -6,10 +6,12 @@ Adjust test cases to work with busybox.
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
 
---- a/regress/cipher-speed.sh	2012-06-30 07:08:53.000000000 +0200
-+++ b/regress/cipher-speed.sh	2013-02-15 11:30:20.670022055 +0100
-@@ -26,7 +26,7 @@
- 		echon "$c/$m:\t"
+Index: openssh-6.8p1/regress/cipher-speed.sh
+===================================================================
+--- openssh-6.8p1.orig/regress/cipher-speed.sh
++++ openssh-6.8p1/regress/cipher-speed.sh
+@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
+ 		printf "%-60s" "$c/$m:"
  		( ${SSH} -o 'compression no' \
  			-F $OBJ/ssh_proxy -2 -m $m -c $c somehost \
 -			exec sh -c \'"dd of=/dev/null obs=32k"\' \
@@ -17,8 +19,8 @@ Upstream-Status: Pending
  		< ${DATA} ) 2>&1 | getbytes
  
  		if [ $? -ne 0 ]; then
-@@ -42,7 +42,7 @@
- 		echon "$c:\t"
+@@ -42,7 +42,7 @@ for c in $ciphers; do
+ 		printf "%-60s" "$c:"
  		( ${SSH} -o 'compression no' \
  			-F $OBJ/ssh_proxy -1 -c $c somehost \
 -			exec sh -c \'"dd of=/dev/null obs=32k"\' \
@@ -26,9 +28,11 @@ Upstream-Status: Pending
  		< ${DATA} ) 2>&1 | getbytes
  		if [ $? -ne 0 ]; then
  			fail "ssh -1 failed with cipher $c"
---- a/regress/transfer.sh	2003-09-04 06:54:40.000000000 +0200
-+++ b/regress/transfer.sh	2013-02-15 11:25:34.666411185 +0100
-@@ -18,7 +18,7 @@
+Index: openssh-6.8p1/regress/transfer.sh
+===================================================================
+--- openssh-6.8p1.orig/regress/transfer.sh
++++ openssh-6.8p1/regress/transfer.sh
+@@ -15,7 +15,7 @@ for p in ${SSH_PROTOCOLS}; do
  	for s in 10 100 1k 32k 64k 128k 256k; do
  		trace "proto $p dd-size ${s}"
  		rm -f ${COPY}
@@ -37,20 +41,24 @@ Upstream-Status: Pending
  			${SSH} -q -$p -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
  		if [ $? -ne 0 ]; then
  			fail "ssh cat $DATA failed"
---- a/regress/yes-head.sh	2005-11-28 06:41:03.000000000 +0100
-+++ b/regress/yes-head.sh	2013-02-15 11:55:11.413715068 +0100
+Index: openssh-6.8p1/regress/yes-head.sh
+===================================================================
+--- openssh-6.8p1.orig/regress/yes-head.sh
++++ openssh-6.8p1/regress/yes-head.sh
 @@ -4,7 +4,7 @@
  tid="yes pipe head"
  
- for p in 1 2; do
+ for p in ${SSH_PROTOCOLS}; do
 -	lines=`${SSH} -$p -F $OBJ/ssh_proxy thishost 'sh -c "while true;do echo yes;done | _POSIX2_VERSION=199209 head -2000"' | (sleep 3 ; wc -l)`
 +	lines=`${SSH} -$p -F $OBJ/ssh_proxy thishost 'sh -c "while true;do echo yes;done | _POSIX2_VERSION=199209 head -n 2000"' | (sleep 3 ; wc -l)`
  	if [ $? -ne 0 ]; then
  		fail "yes|head test failed"
  		lines = 0;
---- a/regress/key-options.sh	2008-07-04 09:08:58.000000000 +0200
-+++ b/regress/key-options.sh	2013-02-15 12:06:05.109486098 +0100
-@@ -54,7 +54,7 @@
+Index: openssh-6.8p1/regress/key-options.sh
+===================================================================
+--- openssh-6.8p1.orig/regress/key-options.sh
++++ openssh-6.8p1/regress/key-options.sh
+@@ -54,7 +54,7 @@ for p in ${SSH_PROTOCOLS}; do
  	fi
  
  	sed 's/.*/from="'"$f"'" &/' $origkeys >$authkeys
diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb b/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_6.7p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.8p1.bb
index a272629..8e07e00 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
@@ -25,8 +25,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "3246aa79317b1d23cae783a3bf8275d6"
-SRC_URI[sha256sum] = "b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507"
+SRC_URI[md5sum] = "08f72de6751acfbd0892b5f003922701"
+SRC_URI[sha256sum] = "3ff64ce73ee124480b5bf767b9830d7d3c03bbcb6abe716b78f0192c37ce160e"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.1.4


