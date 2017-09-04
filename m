Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 4197 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Sep 2017 07:32:12 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 173C577DCD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=ZDVo1reCA4mt1UU3fRZoIplwuZ6+m6fxWw5g7g1dZgg=; 
	b=f5ylX7B37lrqWkNKYDg84biaVAasupLvX5OpO4tfRgHgGln7T6xsn/Ad6QMPp3ErhBFrwsc5Qh1eyyeuGQS6ci1foi1aMgKAWG2Ecb6Ncs0bcrOUAPFmAgVAgquyll/hHXz0AJtsMiZagVxFF3RpNf019dIdehb5amRmGr7X97fxfS+kVls13/T9HEiGw8kyVhTdvJt2HgmKGhJS2Vud/cvwA8R31AfT/VZumCmbvYJOiMvCaF7QYVae2X+WqUZvLmFO4IYDVsMkbLiqQSctXnx1ZzxVZOp5A2DbAp9yUCJyAG3KETKaEHgZ0FDpM5CM2tHXVodUbRXhFSDQkplRTA==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1doklz-0002q2-JZ; Mon, 04 Sep 2017 09:22:15 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1doklz-0000xh-GB; Mon, 04 Sep 2017 09:22:15 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 09:22:14 +0300
Message-Id: <1504506134-3477-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH] cve-check.bbclass: detect patched CVE's also from patch file names
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
X-List-Received-Date: Mon, 04 Sep 2017 07:32:13 -0000

While poky master branch has been fixed so that all CVE patch files have
the:

CVE: CVE-2017-1234556

strings in the patch comments, many older versions of poky and other meta
layers are not, but the CVE patches quite often have the CVE id in the
patch file name.

If the CVE: string also found, there are no duplicates in the report.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/cve-check.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

resending to openembedded-core

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f44bbed..bc2f03f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -118,10 +118,24 @@ def get_patches_cves(d):
 
     pn = d.getVar("PN")
     cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+
+    # Matches last CVE-1234-211432 in the file name, also if written
+    # with small letters. Not supporting multiple CVE id's in a single
+    # file name.
+    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+
     patched_cves = set()
     bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
     for url in src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
+
+        # Check patch file name for CVE ID
+        fname_match = cve_file_name_match.search(patch_file)
+        if fname_match:
+            cve = fname_match.group(1).upper()
+            patched_cves.add(cve)
+            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
+
         with open(patch_file, "r", encoding="utf-8") as f:
             try:
                 patch_text = f.read()
@@ -140,7 +154,7 @@ def get_patches_cves(d):
             for cve in cves.split():
                 bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
                 patched_cves.add(cve)
-        else:
+        elif not fname_match:
             bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
 
     return patched_cves
-- 
1.9.1


