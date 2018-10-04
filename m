Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 417E676060
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 10:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D154F184D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 12:43:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xaAXDhK0RWdu
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 12:43:28 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3E4881831E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 12:43:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C3BC1A07D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 12:43:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2103B1A07C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 12:43:28 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 12:43:28 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 150E52924
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 12:43:28 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 10AF2409D8; Thu,  4 Oct 2018 12:43:28 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 12:43:28 +0200
Message-Id: <20181004104328.24651-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH] externalsrc.bbclass: Set BB_DONT_CACHE for non-target recipes
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
X-List-Received-Date: Thu, 04 Oct 2018 10:43:28 -0000

BB_DONT_CACHE was not set for non-virtual recipes where PN != BPN, such
as quilt-native.  Recipes that do not set BBCLASSEXTEND should always
have BB_DONT_CACHE set by externalsrc.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/externalsrc.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index ad87d85f78..3618b99a86 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -41,8 +41,8 @@ python () {
     # re-parsed so that the file-checksums function for do_compile is run every
     # time.
     bpn = d.getVar('BPN')
-    if bpn == d.getVar('PN'):
-        classextend = (d.getVar('BBCLASSEXTEND') or '').split()
+    classextend = (d.getVar('BBCLASSEXTEND') or '').split()
+    if bpn == d.getVar('PN') or not classextend:
         if (externalsrc or
                 ('native' in classextend and
                  d.getVar('EXTERNALSRC_pn-%s-native' % bpn)) or
-- 
2.11.0


