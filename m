Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 530DD78A3B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 17:08:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w23H8k2h025241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 3 Mar 2018 17:08:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1esAeM-0003LE-1s; Sat, 03 Mar 2018 17:08:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2018 17:08:42 +0000
Message-Id: <1520096924-12804-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/3] base: Don't print LICENSE warning for non-recipe context
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
X-List-Received-Date: Sat, 03 Mar 2018 17:08:47 -0000

Now bitbake is executing anonymous python fragments in bitbake -e,
ensure we don't show the error in that context (where PN would be
unchanged from default).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 21cacfb..b0a72c7 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -456,7 +456,7 @@ python () {
 
     pn = d.getVar('PN')
     license = d.getVar('LICENSE')
-    if license == "INVALID":
+    if license == "INVALID" and pn != "defaultpkgname":
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
     if bb.data.inherits_class('license', d):
-- 
2.7.4


