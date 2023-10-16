Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91743CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 07:01:28 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.112191.1697439679386085225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 00:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qsHbH-00Awfk-2w;
	Mon, 16 Oct 2023 10:01:16 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qsHbH-00Be0F-LV; Mon, 16 Oct 2023 10:01:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] cve-check.bbclass: support embedded SW components with different version number
Date: Mon, 16 Oct 2023 10:01:06 +0300
Message-Id: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: FROM_HAS_DN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: ARC_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20231016070106.2772303-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189260

Many recipes embed other SW components. The name and version of the
embedded SW component differs from the main recipe. To detect CVEs in the
embedded SW component, it needs to be added to CVE_PRODUCT list using
name of the SW product in CVE database or with "vendor:product" syntax.
Then the version of the embedded SW component can be set using
CVE_VERSION_product variable.

For example in meta-arm, trusted-firmware-a embeds mbed_tls SW component.
Thus trusted-firmware-a can add CVE_PRODUCT for it since CVE database
uses product name "mbed_tls":

CVE_PRODUCT += "mbed_tls"

and set the version of mbed_tls:

CVE_VERSION_mbed_tls = "2.28.4"

(Real patches for both are a bit more complex due to conditional build
enabling mbed_tls support and due to mbed_tls version being set in an
.inc file.)

Now trusted-firmware-a CVE check output shows:

NOTE: recipe trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0: task do_cve_check: Started
WARNING: trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0 do_cve_check: Found unpatched CVE (CVE-2021-36647 CVE-2021-43666 CVE-2021-45451 CVE-2023-43615), for more information check /home/builder/src/base/build/tmp/work/arm64-poky-linux/trusted-firmware-a/2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122/temp/cve.log
NOTE: recipe trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0: task do_cve_check: Succeeded

Here CVE-2023-43615 is a newly added and fixed CVE in version 2.28.5 and the CVEs
from 2021 need to be checked but are likely fixed in 2.28.3 and newer 2.28.y releases.

Note that CVE-2023-43615 does not impact trusted-firmware-a since it doesn't use
TLS or null or RC4 ciphers, but I think it's a good idea to extend
CVE checker for this use case. I hope the "CVE_VERSION_vendor:product"
does not cause odd breakages.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes/cve-check.bbclass | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index b55f4299da..9c41d54188 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -309,7 +309,16 @@ def check_cves(d, patched_cves):
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not products:
         return ([], [], [], [])
-    pv = d.getVar("CVE_VERSION").split("+git")[0]
+
+    # Version is PV, CVE_VERSION or CVE_VERSION_%s where %s is one of the entries in CVE_PRODUCT.
+    # Enables checking embedded SW component CVEs provided that CVE_PRODUCT contains the embedded SW
+    # component and that version of that component is set via CVE_VERSION_embedded_component variable.
+    pv = {}
+    for product in products:
+        version = (d.getVar("CVE_VERSION_%s" % product) or "").split("+git")[0]
+        if version == "":
+            version = d.getVar("CVE_VERSION").split("+git")[0]
+        pv[product] = version
 
     # If the recipe has been skipped/ignored we return empty lists
     if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
@@ -329,6 +338,7 @@ def check_cves(d, patched_cves):
 
     # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
     for product in products:
+        full_product = product
         cves_in_product = False
         if ":" in product:
             vendor, product = product.split(":", 1)
@@ -341,7 +351,7 @@ def check_cves(d, patched_cves):
             cve = cverow[0]
 
             if cve in cve_ignore:
-                bb.note("%s-%s ignores %s" % (product, pv, cve))
+                bb.note("%s-%s ignores %s" % (product, pv[full_product], cve))
                 cves_ignored.append(cve)
                 continue
             elif cve in patched_cves:
@@ -366,27 +376,27 @@ def check_cves(d, patched_cves):
                 version_start = convert_cve_version(version_start)
                 version_end = convert_cve_version(version_end)
 
-                if (operator_start == '=' and pv == version_start) or version_start == '-':
+                if (operator_start == '=' and pv[full_product] == version_start) or version_start == '-':
                     vulnerable = True
                 else:
                     if operator_start:
                         try:
-                            vulnerable_start =  (operator_start == '>=' and Version(pv,suffix) >= Version(version_start,suffix))
-                            vulnerable_start |= (operator_start == '>' and Version(pv,suffix) > Version(version_start,suffix))
+                            vulnerable_start =  (operator_start == '>=' and Version(pv[full_product],suffix) >= Version(version_start,suffix))
+                            vulnerable_start |= (operator_start == '>' and Version(pv[full_product],suffix) > Version(version_start,suffix))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
-                                    (product, pv, operator_start, version_start, cve))
+                                    (product, pv[full_product], operator_start, version_start, cve))
                             vulnerable_start = False
                     else:
                         vulnerable_start = False
 
                     if operator_end:
                         try:
-                            vulnerable_end  = (operator_end == '<=' and Version(pv,suffix) <= Version(version_end,suffix) )
-                            vulnerable_end |= (operator_end == '<' and Version(pv,suffix) < Version(version_end,suffix) )
+                            vulnerable_end  = (operator_end == '<=' and Version(pv[full_product],suffix) <= Version(version_end,suffix) )
+                            vulnerable_end |= (operator_end == '<' and Version(pv[full_product],suffix) < Version(version_end,suffix) )
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
-                                    (product, pv, operator_end, version_end, cve))
+                                    (product, pv[full_product], operator_end, version_end, cve))
                             vulnerable_end = False
                     else:
                         vulnerable_end = False
-- 
2.34.1


