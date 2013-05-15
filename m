Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1Uca5r-00013U-D8
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 13:42:08 +0200
Received: from localhost.localdomain (sarotti.TechFak.Uni-Bielefeld.DE
	[129.70.144.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	7965E8000C; Wed, 15 May 2013 13:23:50 +0200 (CEST)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2013 13:23:24 +0200
Message-Id: <1368617004-14299-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] tcf-agent: Use common two-digit sequence numbers for init script links
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 11:42:18 -0000

The common init script links use two-digit sequence numbers and
systemd interprets everything behind the two-digits as service name.
This leads to the following failure during boot:
  Cannot add dependency job for unit 9tcf-agent.service

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index ced2b41..5df661c 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
 SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
 PV = "0.4.0+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=git \
            file://fix_ranlib.patch \
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 inherit update-rc.d
 
 INITSCRIPT_NAME = "tcf-agent"
-INITSCRIPT_PARAMS = "start 999 3 5 . stop 20 0 1 2 6 ."
+INITSCRIPT_PARAMS = "start 99 3 5 . stop 20 0 1 2 6 ."
 
 # mangling needed for make
 MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686,`"
-- 
1.7.0.4



