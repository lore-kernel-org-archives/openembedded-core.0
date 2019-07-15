Return-Path: <jrey@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1CEF77EC5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 20:39:18 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x6FKd8bN167766; Mon, 15 Jul 2019 16:39:19 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
	[169.55.85.253])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2trxbe5s0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Jul 2019 16:39:18 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	x6FKTr9i007708; Mon, 15 Jul 2019 20:39:18 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
	[9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 2tq6x5sxnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Jul 2019 20:39:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
	[9.57.199.110])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x6FKdHGX51970382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 15 Jul 2019 20:39:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A6FAAE05C;
	Mon, 15 Jul 2019 20:39:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED57AAE05F;
	Mon, 15 Jul 2019 20:39:16 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 15 Jul 2019 20:39:16 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 15:38:57 -0500
Message-Id: <20190715203857.65119-1-jrey@linux.ibm.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-07-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1907150236
Cc: Joseph Reynolds <joseph.reynolds1@ibm.com>,
	Joseph Reynolds <jrey@linux.ibm.com>
Subject: [warrior][PATCH] dropbear: new feature: disable-weak-ciphers
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
X-List-Received-Date: Mon, 15 Jul 2019 20:39:19 -0000
Content-Transfer-Encoding: 8bit

Enhances dropbear with a new feature "disable-weak-ciphers", on by default.
This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers in
the dropbear ssh server and client.

Disable this feature if you need to connect to the ssh server from older
clients.  Additional customization can be done with local_options.h as usual.

Tested: On dropbear_2019.78.

Upstream-Status: Inappropriate [configuration]

Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dropbear/dropbear.inc            |  6 ++-
 .../dropbear/dropbear-disable-weak-ciphers.patch   | 44 ++++++++++++++++++++++
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 2537603..b090377 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -19,7 +19,8 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear@.service \
            file://dropbear.socket \
            file://dropbear.default \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
@@ -45,8 +46,9 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 
-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "disable-weak-ciphers"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
+PACKAGECONFIG[disable-weak-ciphers] = ""
 
 EXTRA_OECONF += "\
  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
new file mode 100644
index 0000000..e48a34b
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -0,0 +1,44 @@
+This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers 
+in the dropbear ssh server and client since they're considered weak ciphers
+and we want to support the stong algorithms.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
+
+Index: dropbear-2019.78/default_options.h
+===================================================================
+--- dropbear-2019.78.orig/default_options.h
++++ dropbear-2019.78/default_options.h
+@@ -91,7 +91,7 @@ IMPORTANT: Some options will require "ma
+ 
+ /* Enable CBC mode for ciphers. This has security issues though
+  * is the most compatible with older SSH implementations */
+-#define DROPBEAR_ENABLE_CBC_MODE 1
++#define DROPBEAR_ENABLE_CBC_MODE 0
+ 
+ /* Enable "Counter Mode" for ciphers. This is more secure than
+  * CBC mode against certain attacks. It is recommended for security
+@@ -101,7 +101,7 @@ IMPORTANT: Some options will require "ma
+ /* Message integrity. sha2-256 is recommended as a default, 
+    sha1 for compatibility */
+ #define DROPBEAR_SHA1_HMAC 1
+-#define DROPBEAR_SHA1_96_HMAC 1
++#define DROPBEAR_SHA1_96_HMAC 0
+ #define DROPBEAR_SHA2_256_HMAC 1
+ 
+ /* Hostkey/public key algorithms - at least one required, these are used
+@@ -149,12 +149,12 @@ IMPORTANT: Some options will require "ma
+  * Small systems should generally include either curve25519 or ecdh for performance.
+  * curve25519 is less widely supported but is faster
+  */ 
+-#define DROPBEAR_DH_GROUP14_SHA1 1
++#define DROPBEAR_DH_GROUP14_SHA1 0
+ #define DROPBEAR_DH_GROUP14_SHA256 1
+ #define DROPBEAR_DH_GROUP16 0
+ #define DROPBEAR_CURVE25519 1
+ #define DROPBEAR_ECDH 1
+-#define DROPBEAR_DH_GROUP1 1
++#define DROPBEAR_DH_GROUP1 0
+ 
+ /* When group1 is enabled it will only be allowed by Dropbear client
+ not as a server, due to concerns over its strength. Set to 0 to allow
-- 
1.8.3.1


