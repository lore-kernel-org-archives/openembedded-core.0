Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 22C2A6B0DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 19:56:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6FJv0I6019567
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 12:57:00 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Jul 2013 12:56:59 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 15:10:27 -0500
Message-ID: <1373919029-19108-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1373919029-19108-1-git-send-email-mark.hatle@windriver.com>
References: <1373919029-19108-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/4] terminal.bbclass: Fix BB_RUNFMT processing
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
X-List-Received-Date: Mon, 15 Jul 2013 19:56:58 -0000
Content-Type: text/plain

BB_RUNFMT can include task and taskfunc, as well as func and pid.  Add the
two missing items toe the runfmt processing.

Also BB_RUNFMT can include arbitrary directory structure.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/terminal.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index ae338e9..591b4ac 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -18,8 +18,10 @@ def emit_terminal_func(command, envdata, d):
     envdata.setVarFlag(cmd_func, 'func', 1)
 
     runfmt = d.getVar('BB_RUNFMT', True) or "run.{func}.{pid}"
-    runfile = runfmt.format(func=cmd_func, pid=os.getpid())
+    runfile = runfmt.format(func=cmd_func, task=cmd_func, taskfunc=cmd_func, pid=os.getpid())
     runfile = os.path.join(d.getVar('T', True), runfile)
+    bb.mkdirhier(os.path.dirname(runfile))
+
     with open(runfile, 'w') as script:
         script.write('#!/bin/sh -e\n')
         bb.data.emit_func(cmd_func, script, envdata)
-- 
1.8.3


