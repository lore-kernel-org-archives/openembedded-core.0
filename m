Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 616776FF7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=dWpdA1cULdQAGbJZHTdiYO0KRE2PlK/IZ1XUSjcHFzE=; 
	b=sYe0aDvIE+PlgExgzaUv4vhN2D7062TP/FcL71U8nXi5mU3Y9M5kti2nBTANJkbEUksIdYcQzqwBO5IuyBKsW1hTyoqYBlDBX8/1L/DhaxWfrWi8DHKWanpyzj7u9K75uvZgapJSADP4BmXX/jTtkXh851dybwseTyp8LklXUEkHUUJt7rpPDeU3Uxxd4nWTpB3TXPzatFzAeI3hlIwBfiZiMVz/QEVxd2WRhgWu9uT0gVxdp7SrSCTL/iqgqiOHWx5BPE9TCvSajgObd4tKPWDV8t5GOok5UiLTR5nhcTgkKOm90WiN1lN29QYbgp6H3V8hH8K5PttE0ZCd0Aw5nw==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005Nu-Bj; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003UV-9g; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:11 +0300
Message-Id: <1500556991-11471-24-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 23/23] cve-check.bbclass: use "+git" as separator in PV instead of "git+"
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:29 -0000

PV is the recipe major version number. cve-check tries to map that to
NVD database release versions of the component. If the recipe sources
are taken from git, the PV can be automatically modified to include
git details, but the syntax is like 233+gitAUTOINC+a1e2ef7ec9.
In CVE checks we want to remove the git details and just use the major
version information, in this example 233.

Thus use "+git" as the separator and use the first part before the separator
as SW product version number in CVE check.

Fixes version number for e.g. systemd recipe. If systemd PV is
233+gitAUTOINC+a1e2ef7ec9 there will be no matches from CVE database where
latest release mentioned is plain 233. If the filter is set to +git, then
CVE PV is 233 and issues like this are detected by do_cve_check:

https://nvd.nist.gov/vuln/detail/CVE-2017-1000082

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 8dde4a2..f44bbed 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -155,7 +155,7 @@ def check_cves(d, patched_cves):
     cves_patched = []
     cves_unpatched = []
     bpn = d.getVar("CVE_PRODUCT")
-    pv = d.getVar("PV").split("git+")[0]
+    pv = d.getVar("PV").split("+git")[0]
     cves = " ".join(patched_cves)
     cve_db_dir = d.getVar("CVE_CHECK_DB_DIR")
     cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
-- 
1.9.1


