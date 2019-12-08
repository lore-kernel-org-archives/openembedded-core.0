Return-Path: <niko.mauno@iki.fi>
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net
	[83.102.40.152])
	by mail.openembedded.org (Postfix) with ESMTP id 0A99A7F9B4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 18:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 2A7E5F9A5;
	Sun,  8 Dec 2019 20:38:20 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id mwIzW070HLRb; Sun,  8 Dec 2019 20:38:19 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id CD0E1F8A1;
	Sun,  8 Dec 2019 20:38:19 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 01D802C63;
	Sun,  8 Dec 2019 20:38:14 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 20:35:48 +0200
Message-Id: <20191208183557.32589-2-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191208183557.32589-1-niko.mauno@iki.fi>
References: <20191208183557.32589-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [thud-next][PATCH 02/11] cve-check: ensure all known CVEs are in the report
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
X-List-Received-Date: Sun, 08 Dec 2019 18:38:20 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

CVEs that are whitelisted or were not vulnerable when there are version
comparisons were not included in the report, so alter the logic to ensure that
all relevant CVEs are in the report for completeness.

(From OE-Core rev: 98256ff05fcfe9d5ccad360582c36eafb577c264)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c00d2910be..f87bcc9dc6 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -208,12 +208,14 @@ def check_cves(d, patched_cves):
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
+                # TODO: this should be in the report as 'whitelisted'
+                patched_cves.add(cve)
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
             else:
                 to_append = False
                 if (operator_start == '=' and pv == version_start):
-                    cves_unpatched.append(cve)
+                    to_append = True
                 else:
                     if operator_start:
                         try:
@@ -243,8 +245,11 @@ def check_cves(d, patched_cves):
                         to_append = to_append_start or to_append_end
 
                 if to_append:
+                    bb.note("%s-%s is vulnerable to %s" % (product, pv, cve))
                     cves_unpatched.append(cve)
-                bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
+                else:
+                    bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
+                    patched_cves.add(cve)
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
2.20.1


