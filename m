Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF1165FE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 06:00:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4F606HN025832
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 23:00:06 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 23:00:05 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 14:00:03 +0800
Message-ID: <b74bfff1afc65394039affcb9dc6c713255a54b1.1400133537.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400133537.git.rongqing.li@windriver.com>
References: <cover.1400133537.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] nss: CVE-2014-1492
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
X-List-Received-Date: Thu, 15 May 2014 06:00:10 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

the patch comes from:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-1492
https://bugzilla.mozilla.org/show_bug.cgi?id=903885

changeset:   11063:709d4e597979
user:        Kai Engert <kaie@kuix.de>
date:        Wed Mar 05 18:38:55 2014 +0100
summary:     Bug 903885, address requests to clarify comments from wtc

changeset:   11046:2ffa40a3ff55
tag:         tip
user:        Wan-Teh Chang <wtc@google.com>
date:        Tue Feb 25 18:17:08 2014 +0100
summary:     Bug 903885, fix IDNA wildcard handling v4, r=kaie

changeset:   11045:15ea62260c21
user:        Christian Heimes <sites@cheimes.de>
date:        Mon Feb 24 17:50:25 2014 +0100
summary:     Bug 903885, fix IDNA wildcard handling, r=kaie

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../nss/files/nss-CVE-2014-1492.patch              |   66 ++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |    1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1492.patch

diff --git a/meta/recipes-support/nss/files/nss-CVE-2014-1492.patch b/meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
new file mode 100644
index 0000000..134c87f
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
@@ -0,0 +1,66 @@
+nss: CVE-2014-1492
+
+the patch comes from:
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-1492
+https://bugzilla.mozilla.org/show_bug.cgi?id=903885
+
+changeset:   11063:709d4e597979
+user:        Kai Engert <kaie@kuix.de>
+date:        Wed Mar 05 18:38:55 2014 +0100
+summary:     Bug 903885, address requests to clarify comments from wtc
+
+changeset:   11046:2ffa40a3ff55
+tag:         tip
+user:        Wan-Teh Chang <wtc@google.com>
+date:        Tue Feb 25 18:17:08 2014 +0100
+summary:     Bug 903885, fix IDNA wildcard handling v4, r=kaie
+
+changeset:   11045:15ea62260c21
+user:        Christian Heimes <sites@cheimes.de>
+date:        Mon Feb 24 17:50:25 2014 +0100
+summary:     Bug 903885, fix IDNA wildcard handling, r=kaie
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ nss/lib/certdb/certdb.c |   15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/nss/lib/certdb/certdb.c b/nss/lib/certdb/certdb.c
+index b7d22bd..91877b7 100644
+--- a/nss/lib/certdb/certdb.c
++++ b/nss/lib/certdb/certdb.c
+@@ -1381,7 +1381,7 @@ cert_TestHostName(char * cn, const char * hn)
+ 	    return rv;
+ 	}
+     } else {
+-	/* New approach conforms to RFC 2818. */
++	/* New approach conforms to RFC 6125. */
+ 	char *wildcard    = PORT_Strchr(cn, '*');
+ 	char *firstcndot  = PORT_Strchr(cn, '.');
+ 	char *secondcndot = firstcndot ? PORT_Strchr(firstcndot+1, '.') : NULL;
+@@ -1390,14 +1390,17 @@ cert_TestHostName(char * cn, const char * hn)
+ 	/* For a cn pattern to be considered valid, the wildcard character...
+ 	 * - may occur only in a DNS name with at least 3 components, and
+ 	 * - may occur only as last character in the first component, and
+-	 * - may be preceded by additional characters
++         * - may be preceded by additional characters, and
++         * - must not be preceded by an IDNA ACE prefix (xn--)
+ 	 */
+ 	if (wildcard && secondcndot && secondcndot[1] && firsthndot 
+-	    && firstcndot  - wildcard  == 1
+-	    && secondcndot - firstcndot > 1
+-	    && PORT_Strrchr(cn, '*') == wildcard
++            && firstcndot  - wildcard  == 1 /* wildcard is last char in first component */
++            && secondcndot - firstcndot > 1 /* second component is non-empty */
++            && PORT_Strrchr(cn, '*') == wildcard /* only one wildcard in cn */
+ 	    && !PORT_Strncasecmp(cn, hn, wildcard - cn)
+-	    && !PORT_Strcasecmp(firstcndot, firsthndot)) {
++            && !PORT_Strcasecmp(firstcndot, firsthndot)
++               /* If hn starts with xn--, then cn must start with wildcard */
++            && (PORT_Strncasecmp(hn, "xn--", 4) || wildcard == cn)) {
+ 	    /* valid wildcard pattern match */
+ 	    return SECSuccess;
+ 	}
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 404decc..fbe4001 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -18,6 +18,7 @@ SRC_URI = "\
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-3.15.1-fix-CVE-2013-1741.patch \
     file://nss-3.15.1-fix-CVE-2013-5605.patch \
+    file://nss-CVE-2014-1492.patch \
 "
 SRC_URI_append_class-target = "\
     file://nss.pc.in \
-- 
1.7.10.4


