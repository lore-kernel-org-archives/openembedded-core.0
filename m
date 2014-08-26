Return-Path: <Li.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 756006FE3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 08:33:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7Q8XQR1003165
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 01:33:27 -0700 (PDT)
Received: from lwang1-OptiPlex-9010.corp.ad.wrs.com (128.224.162.134) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 26 Aug 2014 01:33:26 -0700
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Aug 2014 16:33:24 +0800
Message-ID: <1409042004-6029-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] nss: CVE-2014-1544
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
X-List-Received-Date: Tue, 26 Aug 2014 08:33:33 -0000
Content-Type: text/plain

the patch comes from:
https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-1544
https://hg.mozilla.org/projects/nss/rev/204f22c527f8

author  Robert Relyea <rrelyea@redhat.com>
https://bugzilla.mozilla.org/show_bug.cgi?id=963150
Bug 963150: Add nssCertificate_AddRef and nssCertificate_Destroy calls
to PK11_ImportCert to prevent nssTrustDomain_AddCertsToCache from
freeing the CERTCertificate associated with the NSSCertificate. r=wtc.

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../nss/files/nss-CVE-2014-1544.patch              |   41 ++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |    1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1544.patch

diff --git a/meta/recipes-support/nss/files/nss-CVE-2014-1544.patch b/meta/recipes-support/nss/files/nss-CVE-2014-1544.patch
new file mode 100644
index 0000000..d6434df
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-CVE-2014-1544.patch
@@ -0,0 +1,41 @@
+nss: CVE-2014-1544
+
+the patch comes from:
+https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-1544
+https://hg.mozilla.org/projects/nss/rev/204f22c527f8
+
+author	Robert Relyea <rrelyea@redhat.com>
+https://bugzilla.mozilla.org/show_bug.cgi?id=963150
+Bug 963150: Add nssCertificate_AddRef and nssCertificate_Destroy calls
+to PK11_ImportCert to prevent nssTrustDomain_AddCertsToCache from
+freeing the CERTCertificate associated with the NSSCertificate. r=wtc.
+
+Upstream-Status: Pending
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ nss/lib/pk11wrap/pk11cert.c |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/nss/lib/pk11wrap/pk11cert.c b/nss/lib/pk11wrap/pk11cert.c
+index 39168b9..3f3edb1 100644
+--- a/nss/lib/pk11wrap/pk11cert.c
++++ b/nss/lib/pk11wrap/pk11cert.c
+@@ -981,8 +981,15 @@ PK11_ImportCert(PK11SlotInfo *slot, CERTCertificate *cert,
+      * CERTCertificate, and finish
+      */
+     nssPKIObject_AddInstance(&c->object, certobj);
++    /* nssTrustDomain_AddCertsToCache may release a reference to 'c' and
++     * replace 'c' by a different value. So we add a reference to 'c' to
++     * prevent 'c' from being destroyed. */
++    nssCertificate_AddRef(c);
+     nssTrustDomain_AddCertsToCache(STAN_GetDefaultTrustDomain(), &c, 1);
++    /* XXX should we pass the original value of 'c' to
++     * STAN_ForceCERTCertificateUpdate? */
+     (void)STAN_ForceCERTCertificateUpdate(c);
++    nssCertificate_Destroy(c);
+     SECITEM_FreeItem(keyID,PR_TRUE);
+     return SECSuccess;
+ loser:
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 69f98b5..d706c43 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -22,6 +22,7 @@ SRC_URI = "\
     file://nss-CVE-2013-1740.patch \
     file://nss-3.15.1-fix-CVE-2013-1739.patch \
     file://nss-CVE-2013-5606.patch \
+    file://nss-CVE-2014-1544.patch \
 "
 SRC_URI_append_class-target = "\
     file://nss.pc.in \
-- 
1.7.9.5


