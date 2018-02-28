Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF63788D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 18:30:52 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id v194so4694874itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 10:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q4uj/jcockcaew3fJ8V/Jkgcv+vwcugxgIOWnQuITUg=;
	b=WdP9OmRMC0K8mniwJFobn5CXOejBcw/TqxKkouOU5+k2fGv+7JFRok/JiHWIwln+Wr
	JJ0a5y7AhI8PTcc78eQZiPKLOX0dq3FUqrEcYw9nddBiGJeYSiWyU1OIAee974eE1omD
	aOENWUH7CSM5C4QKYJxAjVFTvSqP9e/7MPp7zgUsNn4WVI3SQ7c/xCrJzs+ZssRYvNOv
	XkJVZMBbNboXXTIN1iyNJs/0kdpQBqJEQ43T3Yd4++oeetgWSvmDgh0srhv6izrauVdC
	zzli+4pe12DJLl0INmhDa7IjEv+X7cyAUKq9QFPjsQsjww7jODTOhF6cd1vqV3l6NdcB
	lsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q4uj/jcockcaew3fJ8V/Jkgcv+vwcugxgIOWnQuITUg=;
	b=TsR/IPe995CHDhRpw+s2gcRTd8FPDFLl8MCAbdwDLDW63gyyXv7FwUXFHgHu7pzjE5
	zJeHxOL3WTIwZwwJSarIso6ydzrh5XDCEtzfSqeSonvNqRxOxIKXAfwYvoxzyve4br0i
	f3ZLuiwbGOLBUGWRhsA5VP/2nF5txMt3OXzEFFSBU59FuNoydHwf8IviBCGL9XmrnYzZ
	iGye4fi26ImtXHZ3dGT/Y3LvEUSwQYV9cJDNab9RSt4SfFR40LvhIxXoL8C1l5Ew0lNQ
	P+f2xDAeucBlj9PTmkHAHkwJcxcGtjqPjli8WqE4PMj89MauOAQUd41VC3kjlIJCfOKU
	5lLA==
X-Gm-Message-State: AElRT7Fe5Q2H2uNuOO253sSxkQO/9o9EKwu3ceJ4RSfOPbW7g5DhT0eP
	Wh/TzmGIv+qWeWsWGRhNA7uD0rHy
X-Google-Smtp-Source: AG47ELu61SgLMXtwFWoacsN/b9YIEAgHP9WG2+3gu4GTuxOIh69tlS15CiSg3iczNpUzzXiaaTdTCQ==
X-Received: by 10.36.9.84 with SMTP id 81mr2911669itm.89.1519842653611;
	Wed, 28 Feb 2018 10:30:53 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	l64sm1989916itb.25.2018.02.28.10.30.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 10:30:53 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 12:30:32 -0600
Message-Id: <20180228183032.3787-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [pyro][PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Wed, 28 Feb 2018 18:30:53 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Generating the host keys atomically prevents power interruptions during the
first boot from leaving the key files incomplete, which often prevents users
from being able to ssh into the device.

[YOCTO #11671]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43fc3d8e180c168dbe5dd5faa577e69a279bd1bd)
---
 .../openssh/openssh/sshd_check_keys                | 42 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index f5bba53ca31..5463b1a4cb1 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -1,5 +1,35 @@
 #! /bin/sh
 
+generate_key() {
+    local FILE=$1
+    local TYPE=$2
+    local DIR="$(dirname "$FILE")"
+
+    mkdir -p "$DIR"
+    ssh-keygen -q -f "${FILE}.tmp" -N '' -t $TYPE
+
+    # Atomically rename file public key
+    mv -f "${FILE}.tmp.pub" "${FILE}.pub"
+
+    # This sync does double duty: Ensuring that the data in the temporary
+    # private key file is on disk before the rename, and ensuring that the
+    # public key rename is completed before the private key rename, since we
+    # switch on the existence of the private key to trigger key generation.
+    # This does mean it is possible for the public key to exist, but be garbage
+    # but this is OK because in that case the private key won't exist and the
+    # keys will be regenerated.
+    #
+    # In the event that sync understands arguments that limit what it tries to
+    # fsync(), we provided them. If it does not, it will simply call sync()
+    # which is just as well
+    sync "${FILE}.pub" "$DIR" "${FILE}.tmp"
+
+    mv "${FILE}.tmp" "$FILE"
+
+    # sync to ensure the atomic rename is committed
+    sync "$DIR"
+}
+
 # /etc/default/ssh may set SYSCONFDIR and SSHD_OPTS
 if test -f /etc/default/ssh; then
     . /etc/default/ssh
@@ -43,22 +73,18 @@ HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | a
 # create keys if necessary
 if [ ! -f $HOST_KEY_RSA ]; then
     echo "  generating ssh RSA key..."
-    mkdir -p $(dirname $HOST_KEY_RSA)
-    ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
+    generate_key $HOST_KEY_RSA rsa
 fi
 if [ ! -f $HOST_KEY_ECDSA ]; then
     echo "  generating ssh ECDSA key..."
-    mkdir -p $(dirname $HOST_KEY_ECDSA)
-    ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
+    generate_key $HOST_KEY_ECDSA ecdsa
 fi
 if [ ! -f $HOST_KEY_DSA ]; then
     echo "  generating ssh DSA key..."
-    mkdir -p $(dirname $HOST_KEY_DSA)
-    ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
+    generate_key $HOST_KEY_DSA dsa
 fi
 if [ ! -f $HOST_KEY_ED25519 ]; then
     echo "  generating ssh ED25519 key..."
-    mkdir -p $(dirname $HOST_KEY_ED25519)
-    ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
+    generate_key $HOST_KEY_ED25519 ed25519
 fi
 
-- 
2.14.3


