Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A58DF733AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:37:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5bMwk024467
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:37:22 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:37:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 21:37:17 -0800
Message-ID: <dbe9f2d73a2d43c990b3dcec1e1320415e36cf9d.1424410597.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424410597.git.liezhi.yang@windriver.com>
References: <cover.1424410597.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] cups: 2.0.1 -> 2.0.2
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
X-List-Received-Date: Fri, 20 Feb 2015 05:37:23 -0000
Content-Type: text/plain

Removed the patch since upstream has fixed it:
0001-test-ippserver.c-check-avahi-before-use.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/cups/cups.inc                |    1 -
 ...1-test-ippserver.c-check-avahi-before-use.patch |   34 --------------------
 .../cups/{cups_2.0.1.bb => cups_2.0.2.bb}          |    4 +--
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch
 rename meta/recipes-extended/cups/{cups_2.0.1.bb => cups_2.0.2.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index cfcd19c..df47c81 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -10,7 +10,6 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://cups.socket \
            file://cups.path \
            file://cups.service \
-           file://0001-test-ippserver.c-check-avahi-before-use.patch \
 	  "
 
 LEAD_SONAME = "libcupsdriver.so"
diff --git a/meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch b/meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch
deleted file mode 100644
index 4bcff69..0000000
--- a/meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fba92768324e76fa60d9c5f709e045bd4f7aee89 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sat, 3 Jan 2015 05:56:24 +0000
-Subject: [PATCH] test/ippserver.c: check avahi before use it
-
-Fixed the error when --disable-avahi:
-ippserver.c:425:8: error: unknown type name 'AvahiThreadedPoll'
-
-The avahi is optional, we need check whether it is enabled before use as
-other code does.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- test/ippserver.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/ippserver.c b/test/ippserver.c
-index c785e5f..26c8a66 100644
---- a/test/ippserver.c
-+++ b/test/ippserver.c
-@@ -421,7 +421,7 @@ static int		valid_job_attributes(_ipp_client_t *client);
- 
- #  ifdef HAVE_DNSSD
- static DNSServiceRef	DNSSDMaster = NULL;
--#  else /* HAVE_AVAHI */
-+#  elif defined(HAVE_AVAHI) /* HAVE_AVAHI */
- static AvahiThreadedPoll *DNSSDMaster = NULL;
- static AvahiClient	*DNSSDClient = NULL;
- #  endif /* HAVE_DNSSD */
--- 
-2.0.1
-
diff --git a/meta/recipes-extended/cups/cups_2.0.1.bb b/meta/recipes-extended/cups/cups_2.0.2.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.0.1.bb
rename to meta/recipes-extended/cups/cups_2.0.2.bb
index c78b44d..96c24cd 100644
--- a/meta/recipes-extended/cups/cups_2.0.1.bb
+++ b/meta/recipes-extended/cups/cups_2.0.2.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "7f7c33071035fb20d0879929a42da711"
-SRC_URI[sha256sum] = "60f7f2cca69f3b761a029fb314ee4299e3ea0fc02350f06d192cf31d58215525"
+SRC_URI[md5sum] = "6e0ea72dbafcf5baaa1cf4178e71096d"
+SRC_URI[sha256sum] = "858720f76b66fd0441ae2a16f7cabd9554c8c64607e28ffacf16c36c53a3b18b"
-- 
1.7.9.5


