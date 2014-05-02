Return-Path: <radek.dostal@streamunlimited.com>
X-Greylist: delayed 158278 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 09:00:28 UTC
Received: from bsmtp.bon.at (bsmtp3.bon.at [213.33.87.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1006460577
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 09:00:28 +0000 (UTC)
Received: from rdostal-desktop.sue.net (unknown [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTP id 9ACEE1300DA;
	Fri,  2 May 2014 11:00:25 +0200 (CEST)
From: Radek Dostal <radek.dostal@streamunlimited.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 May 2014 11:00:18 +0200
Message-Id: <1399021218-27441-1-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1398872793.16672.526.camel@ted>
References: <1398872793.16672.526.camel@ted>
Cc: Radek Dostal <radek.dostal@streamunlimited.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 02 May 2014 09:00:31 -0000

Currently sed command touches every single *.py file. This modifies the
timestamp of the file. All *.pyo files will be recompiled during the first
boot, because timestamp will not match. This should be only necessary if
sed command changes the file.

Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
---
 meta/classes/distutils.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index f3da023..18e1a34 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -43,7 +43,11 @@ distutils_do_install() {
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
-            sed -i -e s:${D}::g "$i"
+            # only modify file if it contains path to avoid recompilation on the target
+            if (grep "${D}" "$i") >/dev/null 2>&1
+            then
+                sed -i -e s:${D}::g "$i"
+            fi
         done
 
         if test -e ${D}${bindir} ; then	
-- 
1.7.9.5


