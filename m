Return-Path: <radek.dostal@streamunlimited.com>
Received: from bsmtp.bon.at (bsmtp3.bon.at [213.33.87.17])
	by mail.openembedded.org (Postfix) with ESMTP id A7295606E1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 07:39:29 +0000 (UTC)
Received: from rdostal-desktop.sue.net (unknown [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTP id E906BA7EB9;
	Mon,  5 May 2014 09:39:27 +0200 (CEST)
From: Radek Dostal <radek.dostal@streamunlimited.com>
To: clarson@kergoth.com
Date: Mon,  5 May 2014 09:38:22 +0200
Message-Id: <1399275502-13602-1-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CABcZANmQENs+H2A1FBKtNonAF2N5TjZg6sc7cuKpWO9BjBVPOQ@mail.gmail.com>
References: <CABcZANmQENs+H2A1FBKtNonAF2N5TjZg6sc7cuKpWO9BjBVPOQ@mail.gmail.com>
Cc: Radek Dostal <radek.dostal@streamunlimited.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v3] distutils.bbclass: only modify *.py file if it contains path to be removed
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
X-List-Received-Date: Mon, 05 May 2014 07:39:31 -0000

Currently sed command touches every single *.py file. This modifies the
timestamp of the file. All *.pyo files will be recompiled during the first
boot, because timestamp will not match. This should be only necessary if
sed command changes the file.

Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
---
 meta/classes/distutils.bbclass |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index f3da023..12f2603 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -43,7 +43,10 @@ distutils_do_install() {
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
-            sed -i -e s:${D}::g "$i"
+            # only modify file if it contains path to avoid recompilation on the target
+            if grep -q "${D}" "$i"; then
+                sed -i -e s:${D}::g "$i"
+            fi
         done
 
         if test -e ${D}${bindir} ; then	
-- 
1.7.9.5


