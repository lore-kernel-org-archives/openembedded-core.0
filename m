Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B294460EFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 15:41:42 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74FfhnO024785 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 10:41:43 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080410414381-615739 ;
	Mon, 4 Aug 2014 10:41:43 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 10:40:30 -0500
Message-Id: <1407166830-3981-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 10:41:43 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 10:41:43 AM,
	Serialize complete at 08/04/2014 10:41:43 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_02:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Cc: Gratian Crisan <gratian.crisan@ni.com>, Scot Salmon <scot.salmon@ni.com>
Subject: [PATCH] sysvinit: allow stack size configuration from rcS
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
X-List-Received-Date: Mon, 04 Aug 2014 15:41:46 -0000

From: Scot Salmon <scot.salmon@ni.com>

For certain swap/overcommit settings (e.g. when overcommit is disabled
on a real-time system), we need to limit the stack size used by
initscripts.  When the STACK_SIZE environment variable is set (usually
in /etc/default/rcS), ulimit the stack size to the value specified.

Make the stack size ulimit a soft limit, which allows the user to
increase the stack size where required without having to run the
respective application as root.

Signed-off-by: Scot Salmon <scot.salmon@ni.com>
Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Rich Tollerton <rich.tollerton@ni.com>
Acked-by: Brad Mouring <brad.mouring@ni.com>
Acked-by: Bill Pittman <bill.pittman@ni.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 1f400d9..7ca41ae 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -65,6 +65,9 @@ startup() {
   # Set onlcr to avoid staircase effect.
   stty onlcr 0>&1
 
+  # Limit stack size for startup scripts
+  [ "$STACK_SIZE" == "" ] || ulimit -S -s $STACK_SIZE
+
   # Now find out what the current and what the previous runlevel are.
 
   runlevel=$RUNLEVEL
-- 
2.0.4


