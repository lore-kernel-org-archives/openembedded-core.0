Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95A7D7025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 06:50:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S6oiNv011313
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 23:50:44 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 27 Jul 2014 23:50:43 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jul 2014 02:50:42 -0400
Message-ID: <1406530242-12620-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] nss: CVE-2013-5606
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
X-List-Received-Date: Mon, 28 Jul 2014 06:50:42 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

the patch comes from:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-5606
https://bugzilla.mozilla.org/show_bug.cgi?id=910438
http://hg.mozilla.org/projects/nss/rev/d29898e0981c

The CERT_VerifyCert function in lib/certhigh/certvfy.c in
Mozilla Network Security Services (NSS) 3.15 before 3.15.3 provides
an unexpected return value for an incompatible key-usage certificate
when the CERTVerifyLog argument is valid, which might allow remote
attackers to bypass intended access restrictions via a crafted certificate.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../nss/files/nss-CVE-2013-5606.patch              | 48 ++++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-5606.patch

diff --git a/meta/recipes-support/nss/files/nss-CVE-2013-5606.patch b/meta/recipes-support/nss/files/nss-CVE-2013-5606.patch
new file mode 100644
index 0000000..f30475b
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-CVE-2013-5606.patch
@@ -0,0 +1,48 @@
+nss: CVE-2013-5606
+
+Upstream-Status: Backport
+
+the patch comes from:
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-5606
+https://bugzilla.mozilla.org/show_bug.cgi?id=910438
+http://hg.mozilla.org/projects/nss/rev/d29898e0981c
+
+The CERT_VerifyCert function in lib/certhigh/certvfy.c in
+Mozilla Network Security Services (NSS) 3.15 before 3.15.3 provides
+an unexpected return value for an incompatible key-usage certificate
+when the CERTVerifyLog argument is valid, which might allow remote
+attackers to bypass intended access restrictions via a crafted certificate.
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ nss/lib/certhigh/certvfy.c |    7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/nss/lib/certhigh/certvfy.c b/nss/lib/certhigh/certvfy.c
+index f364ceb..f450205 100644
+--- a/nss/lib/certhigh/certvfy.c
++++ b/nss/lib/certhigh/certvfy.c
+@@ -1312,7 +1312,7 @@ CERT_VerifyCert(CERTCertDBHandle *handle, CERTCertificate *cert,
+ 	PORT_SetError(SEC_ERROR_UNTRUSTED_CERT);
+ 	LOG_ERROR_OR_EXIT(log,cert,0,flags);
+     } else if (trusted) {
+-	goto winner;
++	goto done;
+     }
+ 
+ 
+@@ -1340,7 +1340,10 @@ CERT_VerifyCert(CERTCertDBHandle *handle, CERTCertificate *cert,
+ 	}
+     }
+ 
+-winner:
++done:
++    if (log && log->head) {
++        return SECFailure;
++    }
+     return(SECSuccess);
+ 
+ loser:
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index cc9e7b9..ce7d4a4 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://nss-CVE-2014-1492.patch \
     file://nss-CVE-2013-1740.patch \
     file://nss-3.15.1-fix-CVE-2013-1739.patch \
+    file://nss-CVE-2013-5606.patch \
 "
 SRC_URI_append_class-target = "\
     file://nss.pc.in \
-- 
2.0.0


