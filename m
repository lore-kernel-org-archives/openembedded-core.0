Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5836D746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:34:02 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id CEA7B401B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:05:21 +0100 (CET)
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 09:33:57 +0100
Message-Id: <1384245243-20247-4-git-send-email-tobias.henkel@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
References: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
Subject: [PATCH 3/9] icecc: Reduce verbosity with empty PARALLEL_MAKE
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
X-List-Received-Date: Tue, 12 Nov 2013 08:34:03 -0000

From: Tobias Henkel <tobias.henkel@bmw-carit.de>

Currently the icecc class prints a note for every package which
disables parallel make at parse time. This is unneccessary as many
packages don't support parallel building. Changing the log level from
info to debug hides these messages in normal builds without removing
the information when needed.

Signed-off-by: Tobias Henkel <tobias.henkel@bmw-carit.de>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index c4088af..eaa2aac 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -106,7 +106,7 @@ def use_icc(bb,d):
             return "no"
 
     if d.getVar('PARALLEL_MAKE') == "":
-        bb.note(package_tmp, " ", d.expand('${PV}'), " has empty PARALLEL_MAKE, disable icecc")
+        bb.debug(1, package_tmp, " ", d.expand('${PV}'), " has empty PARALLEL_MAKE, disable icecc")
         return "no"
 
     return "yes"
-- 
1.8.3.1


