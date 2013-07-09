Return-Path: <Sergey_Matyukevich@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C6149619DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 13:47:25 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1UwYGM-0001NE-8H from Sergey_Matyukevich@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Jul 2013 06:47:26 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 9 Jul 2013 06:47:25 -0700
Received: from bars.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.2.247.3; Tue, 9 Jul 2013 14:47:24 +0100
From: Sergey Matyukevich <sergey_matyukevich@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jul 2013 17:47:22 +0400
Message-ID: <1373377642-11032-1-git-send-email-sergey_matyukevich@mentor.com>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Jul 2013 13:47:25.0610 (UTC)
	FILETIME=[D855A8A0:01CE7CAA]
Subject: [PATCH] powertop: fix update-alternatives link
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
X-List-Received-Date: Tue, 09 Jul 2013 13:47:25 -0000
Content-Type: text/plain

In the new stable busybox_1.21.1 default location of symbolic link for
powertop has been changed: /usr/sbin instead of /bin. This update breaks
creation of alternative links when both busybox and powertop packages are
installed on the system.

Fix: modification of ALTERNATIVE_LINK_NAME in powertop recipe.

Signed-off-by: Sergey Matyukevich <sergey_matyukevich@mentor.com>
---
 meta/recipes-kernel/powertop/powertop_2.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/powertop/powertop_2.3.bb b/meta/recipes-kernel/powertop/powertop_2.3.bb
index 8ee349c..5dae1b6 100644
--- a/meta/recipes-kernel/powertop/powertop_2.3.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.3.bb
@@ -26,5 +26,5 @@ do_configure_prepend() {
 inherit update-alternatives
 ALTERNATIVE_${PN} = "powertop"
 ALTERNATIVE_TARGET[powertop] = "${sbindir}/powertop"
-ALTERNATIVE_LINK_NAME[powertop] = "${base_bindir}/powertop"
+ALTERNATIVE_LINK_NAME[powertop] = "${sbindir}/powertop"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.2.5


