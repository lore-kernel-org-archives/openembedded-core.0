Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 73FEB6FE64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 08:59:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s818xwtZ023735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Sep 2014 01:59:59 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Sep 2014 01:59:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Sep 2014 04:59:56 -0400
Message-ID: <1409561996-25407-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] ghostscript: Don't build-depend on libgcrypt for the local cups
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
X-List-Received-Date: Mon, 01 Sep 2014 09:00:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Backported for the ghostscript supplied cups code from
http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch

This addresses the cryto dependency seen during build.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ghostscript/ghostscript/cups-no-gcrypt.patch   | 28 ++++++++++++++++++++++
 .../ghostscript/ghostscript_9.14.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch b/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
new file mode 100644
index 0000000..1c0a6d5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
@@ -0,0 +1,28 @@
+Subject: [PATCH] Don't build-depend on libgcrypt, as nothing is used from it
+
+Backported from http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
+
+This addresses the cryto dependency seen during build.
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ cups/libs/cups/http-private.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/cups/libs/cups/http-private.h b/cups/libs/cups/http-private.h
+index 9c88281..94a9817 100644
+--- a/cups/libs/cups/http-private.h
++++ b/cups/libs/cups/http-private.h
+@@ -98,7 +98,6 @@ extern BIO_METHOD *_httpBIOMethods(void);
+  * The GNU TLS library is more of a "bare metal" SSL/TLS library...
+  */
+ #    include <gnutls/gnutls.h>
+-#    include <gcrypt.h>
+ 
+ typedef struct
+ {
+-- 
+2.0.0
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
index 2e892f3..130dc1c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
@@ -23,6 +23,7 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://ghostscript-9.02-parallel-make.patch \
+           file://cups-no-gcrypt.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.0.0


