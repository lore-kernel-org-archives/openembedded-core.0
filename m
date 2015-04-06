Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6385C73C60
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:12 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so25034846igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LawMF6K9FhLxICAFwj4Qrkfa0FyW7usabkqn1uEP+Ug=;
	b=YAwNXD22P3WEYjV7Fuv5c4Yy5kFo2YNit1zkxvZL+h2FAYMappgt952/DEhgu77kGh
	LUv5pfNYYjGkc+NMziOif/ZmSIRV7ANu3S2QQKFryWPqZKCaGUDQDXcAckOqlua7BZpN
	uy+ePK53dE3/vG+3eI3AVs9TxpiqiaDCC5cQe3ETgo2d/pkL9mFy3W88N6ipkQKAhmYM
	HDDnSj+GCPmspjilfmMho94on647EcAY/XoAtN4gfPAwfgcSoBklrBPjFlG4VeG3sExY
	lMc6mC+BTgL4sO0MkHiC02rMEqlMZvHrsCEuQ2C6DtBTK3L9CFrc9Gf8oNWYb5VsDYZi
	eR+w==
X-Received: by 10.50.25.225 with SMTP id f1mr24741821igg.29.1428341833406;
	Mon, 06 Apr 2015 10:37:13 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:45 +0000
Message-Id: <7b171e5aeaaa42f0a2e5a6b14598789ac117a815.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 17/24] bluez4: Fix encrypt symbol namespace collision
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:12 -0000

| Makefile:3352: recipe for target 'test/l2test.o' failed
| make[1]: *** [test/l2test.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| test/rctest.c:82:12: error: 'encrypt' redeclared as different kind of
symbol
|  static int encrypt = 0;
|             ^
| In file included from test/rctest.c:33:0:

Change-Id: Iaf2f644ef3cef6f96c6e4bc421c9e78a0e23e674
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 +++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
new file mode 100644
index 0000000..1bc390f
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
@@ -0,0 +1,110 @@
+Avoid namepspace collision with encrypt function from libc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: bluez-4.101/test/l2test.c
+===================================================================
+--- bluez-4.101.orig/test/l2test.c
++++ bluez-4.101/test/l2test.c
+@@ -107,7 +107,7 @@ static char *filename = NULL;
+ static int rfcmode = 0;
+ static int master = 0;
+ static int auth = 0;
+-static int encrypt = 0;
++static int encryption_request = 0;
+ static int secure = 0;
+ static int socktype = SOCK_SEQPACKET;
+ static int linger = 0;
+@@ -340,7 +340,7 @@ static int do_connect(char *svr)
+ 		opt |= L2CAP_LM_MASTER;
+ 	if (auth)
+ 		opt |= L2CAP_LM_AUTH;
+-	if (encrypt)
++	if (encryption_request)
+ 		opt |= L2CAP_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |= L2CAP_LM_SECURE;
+@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(in
+ 		opt |= L2CAP_LM_MASTER;
+ 	if (auth)
+ 		opt |= L2CAP_LM_AUTH;
+-	if (encrypt)
++	if (encryption_request)
+ 		opt |= L2CAP_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |= L2CAP_LM_SECURE;
+@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
+ 			break;
+ 
+ 		case 'E':
+-			encrypt = 1;
++			encryption_request = 1;
+ 			break;
+ 
+ 		case 'S':
+Index: bluez-4.101/test/rctest.c
+===================================================================
+--- bluez-4.101.orig/test/rctest.c
++++ bluez-4.101/test/rctest.c
+@@ -79,7 +79,7 @@ static char *filename = NULL;
+ 
+ static int master = 0;
+ static int auth = 0;
+-static int encrypt = 0;
++static int encryption_request = 0;
+ static int secure = 0;
+ static int socktype = SOCK_STREAM;
+ static int linger = 0;
+@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
+ 		opt |= RFCOMM_LM_MASTER;
+ 	if (auth)
+ 		opt |= RFCOMM_LM_AUTH;
+-	if (encrypt)
++	if (encryption_request)
+ 		opt |= RFCOMM_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |= RFCOMM_LM_SECURE;
+@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(in
+ 		opt |= RFCOMM_LM_MASTER;
+ 	if (auth)
+ 		opt |= RFCOMM_LM_AUTH;
+-	if (encrypt)
++	if (encryption_request)
+ 		opt |= RFCOMM_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |= RFCOMM_LM_SECURE;
+@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
+ 			break;
+ 
+ 		case 'E':
+-			encrypt = 1;
++			encryption_request = 1;
+ 			break;
+ 
+ 		case 'S':
+Index: bluez-4.101/src/textfile.h
+===================================================================
+--- bluez-4.101.orig/src/textfile.h
++++ bluez-4.101/src/textfile.h
+@@ -24,6 +24,8 @@
+ #ifndef __TEXTFILE_H
+ #define __TEXTFILE_H
+ 
++#include <sys/types.h>
++
+ int create_dirs(const char *filename, const mode_t mode);
+ int create_file(const char *filename, const mode_t mode);
+ int create_name(char *buf, size_t size, const char *path,
+Index: bluez-4.101/test/attest.c
+===================================================================
+--- bluez-4.101.orig/test/attest.c
++++ bluez-4.101/test/attest.c
+@@ -34,6 +34,7 @@
+ #include <termios.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
++#include <sys/select.h>
+ 
+ #include <bluetooth/bluetooth.h>
+ #include <bluetooth/rfcomm.h>
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index 28a94ed..f900c7c 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://bluetooth.conf \
             file://network-fix-network-Connect-method-parameters.patch \
             file://install-test-script.patch \
             file://use-legacy-pygobject-instead-ofgobject-introspection.patch \
+            file://fix_encrypt_collision.patch \
 "
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-- 
2.1.4


