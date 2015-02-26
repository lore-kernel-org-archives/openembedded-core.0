Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id DAA1A605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 12:26:54 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 46531F811D9; Thu, 26 Feb 2015 05:26:55 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A0F01F811D8;
	Thu, 26 Feb 2015 05:26:54 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Feb 2015 05:27:05 -0700
Message-Id: <1424953625-26492-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] sysvinit: Fix bootlogd startup
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
X-List-Received-Date: Thu, 26 Feb 2015 12:26:55 -0000

The bootlogd program currently does not start correctly.  This
is because it is being started at S07, but the program requires
access to /dev/pts which is normally started at S38.  This yields
an error like:
    bootlogd: cannot allocate pseudo tty: No such file or directory

Starting bootlogd at S39 fixes this.

n.b. Moving the creation of /dev/pts to S06 in the initscripts
package is an alternative solution.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 00d3333..c740bf3 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -91,7 +91,7 @@ do_install () {
 	install -m 0755    ${WORKDIR}/bootlogd.init     ${D}${sysconfdir}/init.d/bootlogd
 	ln -sf bootlogd ${D}${sysconfdir}/init.d/stop-bootlogd
 
-	update-rc.d -r ${D} bootlogd start 07 S .
+	update-rc.d -r ${D} bootlogd start 39 S .
 	update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
 
 	install -d ${D}${sysconfdir}/default/volatiles
-- 
1.9.1


