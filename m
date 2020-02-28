Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56C046197D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:26 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272161"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:43 +0800
Message-Id: <f0c7e7d03d1e9f7426031acdde3f7452118edd8c.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 19/22] ppp: Security fix CVE-2020-8597
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:25 -0000

From: Yi Zhao <yi.zhao@windriver.com>

CVE-2020-8597: eap.c in pppd in ppp 2.4.2 through 2.4.8 has an rhostname
buffer overflow in the eap_request and eap_response functions.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-8597

Patch from:
https://github.com/paulusmack/ppp/commit/8d7970b8f3db727fe798b65f3377fe6787575426

(From OE-Core rev: b01505e018ff46f1af34f98219d55f4ca700cd5a)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-pppd-Fix-bounds-check-in-EAP-code.patch   | 47 ++++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
new file mode 100644
index 0000000..b7ba7ba
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
index 644cde4..60c56dd 100644
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
2.7.4


