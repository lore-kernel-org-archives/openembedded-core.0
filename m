Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDCB076230
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:48:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J8mtuG028141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 00:48:55 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Feb 2016 00:48:54 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2016 00:48:36 -0800
Message-ID: <edff15c4e11f0e17c34431a766616538f0a3df03.1455871674.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1455871674.git.liezhi.yang@windriver.com>
References: <cover.1455871674.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] terminal.bbclass: import oe.terminal for oe.terminal.prioritized()
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
X-List-Received-Date: Fri, 19 Feb 2016 08:48:55 -0000
Content-Type: text/plain

Fixed:
INHERIT += "typecheck"
$ bitbake -p
ERROR: Failure expanding expression auto none ${@" ".join(o.name for o in oe.terminal.prioritized())}
which triggered exception AttributeError: 'module' object has no attribute 'terminal'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/terminal.bbclass |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index fd87cfe..9f4c24e 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -1,8 +1,7 @@
 OE_TERMINAL ?= 'auto'
 OE_TERMINAL[type] = 'choice'
 OE_TERMINAL[choices] = 'auto none \
-                        ${@" ".join(o.name \
-                                    for o in oe.terminal.prioritized())}'
+                        ${@oe_terminal_prioritized()}'
 
 OE_TERMINAL_EXPORTS += 'EXTRA_OEMAKE'
 OE_TERMINAL_EXPORTS[type] = 'list'
@@ -10,6 +9,9 @@ OE_TERMINAL_EXPORTS[type] = 'list'
 XAUTHORITY ?= "${HOME}/.Xauthority"
 SHELL ?= "bash"
 
+def oe_terminal_prioritized():
+    import oe.terminal
+    return " ".join(o.name for o in oe.terminal.prioritized())
 
 def emit_terminal_func(command, envdata, d):
     cmd_func = 'do_terminal'
-- 
1.7.9.5


