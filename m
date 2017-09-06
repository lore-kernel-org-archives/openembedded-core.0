Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0A09F606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=Mcieg8J6pRo6FG4CyQM3b2c4uuF1A/YaxbohwuDLzuY=; 
	b=rBF88Ylka0WtQstDx/Ame1eTFwttMwafX2psZ8bSG4YkpcLXv565wcBS8WcpHy74dT6mL4FbwILbWB0yfjqGkaRDRWAYMHkcWqy5gRwF9rqE5Njmm1SafC2KBTCF+B+B5Qlks9RlmlcbV9rL4OwmKe5SW6lcx6RqWd21s4aQ9kC6i7bhze6w4L6004brigvZNKYJzwXdeZNdD/Y/alea16hHrM0efZOTi3qHguExSYL/MBIHRUR2QGWKtkI/pk+uAWzMV4kL8RZYWpYMD6ZZYQ18z7iBgy+TfFh1TKFobs+mrcR8q6FMCaKQ9hybqEaAKITGzrLCE/glbLUgKKRrdQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dpZU7-0002dg-PQ; Wed, 06 Sep 2017 15:31:11 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dpZU7-00074z-NL; Wed, 06 Sep 2017 15:31:11 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 15:31:09 +0300
Message-Id: <1504701069-26988-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH v2] cve-check-tool: change BB_NO_NETWORK error to a warning
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
X-List-Received-Date: Wed, 06 Sep 2017 12:31:13 -0000

It is perfectly fine to execute cve_check tasks against a cached
CVE database during a BB_NO_NETWORK build.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: send to correct mailing lists: bitbake stuff to bitbake, this to oe-core

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


