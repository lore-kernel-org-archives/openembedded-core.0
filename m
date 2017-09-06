Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id BC76C77BE0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Nvwt57Gx/0xjR2BNPAfiqXniC+L5g+9RzB+/wnBgiZ8=; 
	b=EQ/tRWg2IWEe+XICTT1CFrFjg/VSpFd8UXxIt+FOgmmF3eVbM3HLX/PBcGCuJMwCBNGvyux23rzelXG0fiKMBqSAcwxI5zPs9uQhDl8+LBO0H/geTsigQStfGxTP+gkpT36qjdRebzD/HCEGBppPNQNXl9ILDpwkxYv9H9auw7N2tdtTz3dvdUvT+UbQhVG49ZhdCnx9bUMuoFEyPtADD75dx2ltbOR9/kTC75ZXTv7b6eP7lijtHX8Qk3ahwnbywgfJW3IgTTTv7Itqty5UZjfsmflNnQxLn7jBPEPXjErpnxtLjsLQ08H5QirMQoc67ICjwWQMxH7W+N/u+9gwmQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dpYC9-0000wz-T5; Wed, 06 Sep 2017 14:08:33 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dpYC9-0003ur-Qu; Wed, 06 Sep 2017 14:08:33 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 14:08:16 +0300
Message-Id: <1504696096-13095-3-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1504696096-13095-1-git-send-email-mikko.rapeli@bmw.de>
References: <1504696096-13095-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 3/3] cve-check-tool: change BB_NO_NETWORK error to a warning
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
X-List-Received-Date: Wed, 06 Sep 2017 11:08:33 -0000

It is perfectly fine to execute cve_check tasks against a cached
CVE database during a BB_NO_NETWORK build.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index 4829b11..7b70daa 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -30,7 +30,7 @@ CFLAGS_append = " -Wno-error=pedantic"
 
 do_populate_cve_db() {
     if [ "${BB_NO_NETWORK}" = "1" ] ; then
-        bberror "BB_NO_NETWORK is set; Can't update cve-check-tool database, CVEs won't be checked"
+        bbwarn "BB_NO_NETWORK is set; Can't update cve-check-tool database, new CVEs won't be detected"
         return
     fi
 
-- 
1.9.1


