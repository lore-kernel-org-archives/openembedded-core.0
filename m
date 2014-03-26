Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12FF26FA93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:31:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q8VUO2000919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 01:31:31 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 01:31:30 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 16:32:12 +0800
Message-ID: <f7bb5746bd55de4d8018f18efddaca97af58e7a1.1395822606.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395822606.git.jackie.huang@windriver.com>
References: <cover.1395822606.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gnupg: CVE-2013-4351
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
X-List-Received-Date: Wed, 26 Mar 2014 08:31:32 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

GnuPG 1.4.x, 2.0.x, and 2.1.x treats a key flags subpacket with all bits
cleared (no usage permitted) as if it has all bits set (all usage permitted),
which might allow remote attackers to bypass intended cryptographic protection
mechanisms by leveraging the subkey.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../gnupg/gnupg-1.4.7/CVE-2013-4351.patch          |   44 ++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch

diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch
new file mode 100644
index 0000000..b29ede4
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Backport
+
+Index: gnupg-1.4.7/g10/getkey.c
+===================================================================
+--- gnupg-1.4.7.orig/g10/getkey.c	2007-03-05 16:54:41.000000000 +0800
++++ gnupg-1.4.7/g10/getkey.c	2013-11-28 14:41:59.640212240 +0800
+@@ -1454,7 +1454,11 @@
+ 
+       if(flags)
+ 	key_usage |= PUBKEY_USAGE_UNKNOWN;
++      if (!key_usage)
++	key_usage |= PUBKEY_USAGE_NONE;
+     }
++  else if (p)
++    key_usage |= PUBKEY_USAGE_NONE;
+ 
+   /* We set PUBKEY_USAGE_UNKNOWN to indicate that this key has a
+      capability that we do not handle.  This serves to distinguish
+Index: gnupg-1.4.7/g10/keygen.c
+===================================================================
+--- gnupg-1.4.7.orig/g10/keygen.c	2007-02-05 00:27:40.000000000 +0800
++++ gnupg-1.4.7/g10/keygen.c	2013-11-28 14:43:05.016670092 +0800
+@@ -209,9 +209,6 @@
+     if (use & PUBKEY_USAGE_AUTH)
+         buf[0] |= 0x20;
+ 
+-    if (!buf[0]) 
+-        return;
+-
+     build_sig_subpkt (sig, SIGSUBPKT_KEY_FLAGS, buf, 1);
+ }
+ 
+Index: gnupg-1.4.7/include/cipher.h
+===================================================================
+--- gnupg-1.4.7.orig/include/cipher.h	2006-04-21 20:39:49.000000000 +0800
++++ gnupg-1.4.7/include/cipher.h	2013-11-28 14:49:24.159322744 +0800
+@@ -52,6 +52,7 @@
+ #define PUBKEY_USAGE_CERT    4      /* key is also good to certify other keys*/
+ #define PUBKEY_USAGE_AUTH    8      /* key is good for authentication */
+ #define PUBKEY_USAGE_UNKNOWN 128    /* key has an unknown usage bit */
++#define PUBKEY_USAGE_NONE    256    /* No usage given. */
+ 
+ #define DIGEST_ALGO_MD5       1
+ #define DIGEST_ALGO_SHA1      2
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index fcc5fba..83d8fab 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -14,7 +14,9 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
            file://configure.patch \
            file://mips_gcc4.4.patch \
            file://GnuPG1-CVE-2012-6085.patch \
-           file://curl_typeof_fix_backport.patch"
+           file://curl_typeof_fix_backport.patch \
+           file://CVE-2013-4351.patch \
+	  "
 
 SRC_URI[md5sum] = "b06a141cca5cd1a55bbdd25ab833303c"
 SRC_URI[sha256sum] = "69d18b7d193f62ca27ed4febcb4c9044aa0c95305d3258fe902e2fae5fc6468d"
-- 
1.7.9.5


