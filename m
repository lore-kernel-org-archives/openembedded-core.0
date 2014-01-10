Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id E184360C16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 14:59:02 +0000 (UTC)
Received: from localhost (213.114.79.21) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Fri, 10 Jan 2014
	15:58:50 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 15:59:01 +0100
Message-ID: <8da3468e95268dad80132de5e8398c7491cc7b71.1389365909.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389365909.git.anders@chargestorm.se>
References: <cover.1389365909.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 1/1] terminal.bbclass: do not export PS1
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
X-List-Received-Date: Fri, 10 Jan 2014 14:59:03 -0000
Content-Type: text/plain

With a complex PS1 setup, PS1 might not have all characters correctly escaped
when terminal.bbclass writes the export. This caused the run.do_terminal.PID to
terminate, making it impossible to use the devshell.

As the spawned shell will parse e.g. .bashrc (or whatever rc-file is being
used), PS1 will be reset in the devshell.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/terminal.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 774f055..e577c6d 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -64,6 +64,10 @@ def oe_terminal(command, title, d):
             envdata.setVar(key, str(value))
             envdata.setVarFlag(key, 'export', 1)
 
+    # A complex PS1 might need more escaping of chars.
+    # Lets not export PS1 instead.
+    envdata.delVar("PS1")
+
     # Replace command with an executable wrapper script
     command = emit_terminal_func(command, envdata, d)
 
-- 
1.8.5.2


