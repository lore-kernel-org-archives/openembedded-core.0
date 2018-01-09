Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCB7578872
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 09:44:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w099ip72013826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jan 2018 01:44:52 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 9 Jan 2018 01:44:51 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jan 2018 17:43:54 +0800
Message-ID: <1515491034-206803-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] terminal.bbclass: use SHELL to interpret the init script
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
X-List-Received-Date: Tue, 09 Jan 2018 09:44:51 -0000
Content-Type: text/plain

/bin/sh was used to interpret the init script of the new terminal, below
issue occurs when SHELL="/bin/bash" and /bin/sh is linked to /bin/dash:
function foobar { echo foobar; };
export -f foobar
bitbake -c devshell virtual/kernel
Then the devshell fails to be started because "export -f xxx" is wrong
for dash.

So start the new terminal using SHELL to interpret the init srcipt,
which can solve the issue caused by the difference between SHELL and
/bin/sh.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/classes/terminal.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index a27e10c..c8e1b2f 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -25,7 +25,7 @@ def emit_terminal_func(command, envdata, d):
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
-        script.write('#!/bin/sh -e\n')
+        script.write('#!%s -e\n' % (d.getVar('SHELL')))
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
         script.write("\n")
-- 
1.9.1


