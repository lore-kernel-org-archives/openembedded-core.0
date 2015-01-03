Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C142727C6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Jan 2015 14:39:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t03EdOFl002641
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Jan 2015 06:39:24 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 Jan 2015 06:39:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 3 Jan 2015 06:39:21 -0800
Message-ID: <1923e96b3913d7ef8886af02508526f20609b68b.1420295873.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420295873.git.liezhi.yang@windriver.com>
References: <cover.1420295873.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] cups: check avahi before use it
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
X-List-Received-Date: Sat, 03 Jan 2015 14:39:25 -0000
Content-Type: text/plain

Fixed the error when --disable-avahi:
ippserver.c:425:8: error: unknown type name 'AvahiThreadedPoll'

The avahi is optional, we need check whether it is enabled before use as
other code does.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/cups/cups.inc                |    1 +
 ...1-test-ippserver.c-check-avahi-before-use.patch |   34 ++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 16fdd4f..5ff557a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -10,6 +10,7 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://cups.socket \
            file://cups.path \
            file://cups.service \
+           file://0001-test-ippserver.c-check-avahi-before-use.patch \
 	  "
 
 LEAD_SONAME = "libcupsdriver.so"
diff --git a/meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch b/meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch
new file mode 100644
index 0000000..4bcff69
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch
@@ -0,0 +1,34 @@
+From fba92768324e76fa60d9c5f709e045bd4f7aee89 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 3 Jan 2015 05:56:24 +0000
+Subject: [PATCH] test/ippserver.c: check avahi before use it
+
+Fixed the error when --disable-avahi:
+ippserver.c:425:8: error: unknown type name 'AvahiThreadedPoll'
+
+The avahi is optional, we need check whether it is enabled before use as
+other code does.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ test/ippserver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/ippserver.c b/test/ippserver.c
+index c785e5f..26c8a66 100644
+--- a/test/ippserver.c
++++ b/test/ippserver.c
+@@ -421,7 +421,7 @@ static int		valid_job_attributes(_ipp_client_t *client);
+ 
+ #  ifdef HAVE_DNSSD
+ static DNSServiceRef	DNSSDMaster = NULL;
+-#  else /* HAVE_AVAHI */
++#  elif defined(HAVE_AVAHI) /* HAVE_AVAHI */
+ static AvahiThreadedPoll *DNSSDMaster = NULL;
+ static AvahiClient	*DNSSDClient = NULL;
+ #  endif /* HAVE_DNSSD */
+-- 
+2.0.1
+
-- 
1.7.9.5


