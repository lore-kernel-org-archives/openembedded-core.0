Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 078357275D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 01:02:50 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBI12pMq003820 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:02:51 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121719025104-195351 ;
	Wed, 17 Dec 2014 19:02:51 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Dec 2014 19:02:47 -0600
Message-Id: <1418864567-9676-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.1.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/17/2014 07:02:51 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/17/2014 07:02:51 PM,
	Serialize complete at 12/17/2014 07:02:51 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-17_07:2014-12-17, 2014-12-17,
	1970-01-01 signatures=0
Subject: [PATCH] terminal: Disable shopt errexit
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
X-List-Received-Date: Thu, 18 Dec 2014 01:02:51 -0000

`sh -e` causes any errors encountered during shell execution to abort
the shell. For terminal sessions like devshell, this causes errors
encountered while executing do_terminal to instantaneously kill the
session. This is explicitly not what we want for interactive/debugging
situations like with terminal, so just remove the '-e' from the sh
invocation.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/classes/terminal.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index e577c6d..51e9aa3 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -23,7 +23,7 @@ def emit_terminal_func(command, envdata, d):
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
-        script.write('#!/bin/sh -e\n')
+        script.write('#!/bin/sh\n')
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
         script.write("\n")
-- 
2.1.3


