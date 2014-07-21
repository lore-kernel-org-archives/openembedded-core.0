Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 065866028A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:51:07 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LFp8UI015387 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:51:08 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072110510861-32913 ;
	Mon, 21 Jul 2014 10:51:08 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 10:50:55 -0500
Message-Id: <1405957856-15114-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405957856-15114-1-git-send-email-ben.shelton@ni.com>
References: <1405957856-15114-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:51:08 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:51:08 AM,
	Serialize complete at 07/21/2014 10:51:08 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: [PATCH 2/3] bootlogd: Don't run savelog if it's not installed
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
X-List-Received-Date: Mon, 21 Jul 2014 15:51:16 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

bootlogd's default log rotation code on stop requires `savelog`, which
is in debianutils, which may not be installed.  If it's not installed,
don't try to perform the log rotation.

That is: in the affected code block, `savelog` is what is responsible
for creating "boot.0".  When `savelog` doesn't exist, an error message
gets printed on bootup to the effect of "mv: can't find boot.0".

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index 06af465..df5aa43 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -63,8 +63,8 @@ case "$ACTION" in
 		[ "${VERBOSE}" != "no" ] && echo -n "Stopping $DESC: "
 		start-stop-daemon --stop --quiet --exec $DAEMON
 
-		if [ "$STOPPER" ] && [ -f /var/log/boot ] && \
-		   [ -f /var/log/boot~ ]
+		if [ "$STOPPER" ] && [ "$(which savelog 2>/dev/null)" ] && \
+		   [ -f /var/log/boot ] && [ -f /var/log/boot~ ]
 		then
 			cd /var/log
 			chgrp adm boot
-- 
2.0.2


