Return-Path: <radek.dostal@streamunlimited.com>
X-Greylist: delayed 1243 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 13:23:21 UTC
Received: from lbmfmo03.bon.at (bsmtp4.bon.at [195.3.86.186])
	by mail.openembedded.org (Postfix) with ESMTP id 7A06665D9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 13:23:21 +0000 (UTC)
Received: from bsmtp.bon.at (unknown [192.168.181.108])
	by lbmfmo03.bon.at (Postfix) with ESMTP id 8FBD2CE726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 15:02:38 +0200 (CEST)
Received: from rdostal-desktop.sue.net (unknown [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTP id 18E7B13007B;
	Wed, 30 Apr 2014 15:02:25 +0200 (CEST)
From: Radek Dostal <radek.dostal@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 15:01:58 +0200
Message-Id: <1398862918-1604-1-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Radek Dostal <radek.dostal@streamunlimited.com>
Subject: [PATCH] distutils.bbclass: only modify *.py file if it contains path to be removed
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
X-List-Received-Date: Wed, 30 Apr 2014 13:23:25 -0000

Currently sed command touches every single *.py file. This modifies the
timestamp of the file. All *.pyo files will be recompiled during the first
boot, because timestamp will not match. This should be only necessary if
sed command changes the file.

Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
---
 meta/classes/distutils.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index f3da023..cd1d148 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -43,7 +43,11 @@ distutils_do_install() {
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
-            sed -i -e s:${D}::g "$i"
+            # only modify file if it contains path to avoid recompilation on the target
+            if (cat "$i" | grep "${D}") >/dev/null 2>&1
+            then
+                sed -i -e s:${D}::g "$i"
+            fi
         done
 
         if test -e ${D}${bindir} ; then	
-- 
1.7.9.5


