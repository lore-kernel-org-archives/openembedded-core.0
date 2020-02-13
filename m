Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B65A760BC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:55:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01D8tEEs010442
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:55:24 -0800
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 13 Feb 2020 00:55:03 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Feb 2020 16:55:01 +0800
Message-ID: <20200213085501.3398-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [PATCH] ppp: Security fix CVE-2020-8597
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
X-List-Received-Date: Thu, 13 Feb 2020 08:55:33 -0000
Content-Type: text/plain

CVE-2020-8597: eap.c in pppd in ppp 2.4.2 through 2.4.8 has an rhostname
buffer overflow in the eap_request and eap_response functions.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-8597

Patch from:
https://github.com/paulusmack/ppp/commit/8d7970b8f3db727fe798b65f3377fe6787575426

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...01-pppd-Fix-bounds-check-in-EAP-code.patch | 47 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
new file mode 100644
index 0000000000..b7ba7ba643
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
@@ -0,0 +1,47 @@
+From 8d7970b8f3db727fe798b65f3377fe6787575426 Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@ozlabs.org>
+Date: Mon, 3 Feb 2020 15:53:28 +1100
+Subject: [PATCH] pppd: Fix bounds check in EAP code
+
+Given that we have just checked vallen < len, it can never be the case
+that vallen >= len + sizeof(rhostname).  This fixes the check so we
+actually avoid overflowing the rhostname array.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+
+Upstream-Status: Backport
+[https://github.com/paulusmack/ppp/commit/8d7970b8f3db727fe798b65f3377fe6787575426]
+
+CVE: CVE-2020-8597
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ pppd/eap.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pppd/eap.c b/pppd/eap.c
+index 94407f5..1b93db0 100644
+--- a/pppd/eap.c
++++ b/pppd/eap.c
+@@ -1420,7 +1420,7 @@ int len;
+ 		}
+ 
+ 		/* Not so likely to happen. */
+-		if (vallen >= len + sizeof (rhostname)) {
++		if (len - vallen >= sizeof (rhostname)) {
+ 			dbglog("EAP: trimming really long peer name down");
+ 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
+ 			rhostname[sizeof (rhostname) - 1] = '\0';
+@@ -1846,7 +1846,7 @@ int len;
+ 		}
+ 
+ 		/* Not so likely to happen. */
+-		if (vallen >= len + sizeof (rhostname)) {
++		if (len - vallen >= sizeof (rhostname)) {
+ 			dbglog("EAP: trimming really long peer name down");
+ 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
+ 			rhostname[sizeof (rhostname) - 1] = '\0';
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 644cde4562..60c56dd0bd 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
            file://0001-ppp-Remove-unneeded-include.patch \
            file://ppp-2.4.7-DES-openssl.patch \
+           file://0001-pppd-Fix-bounds-check-in-EAP-code.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.17.1


