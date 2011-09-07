Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1MBO-0001rL-CU for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 19:45:06 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87Hk1GG018376 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 18:46:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wTtXrgc2OE9Y
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 18:46:01 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87HjvRE018363
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 18:45:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Sep 2011 18:39:54 +0100
Message-ID: <1315417194.13021.17.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: terminal.bbclass: Improve environment handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2011 17:45:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the environment handling for terminals is inconsistent. There
are two fixes here:

a) Ensure the environment is setup before all oe.terminal call

b) Actually set the environment before the spawn calls since we need
variables like DISPLAY when the commands are being executed, not just
within the terminal environment. If this doesn't happen, DISPLAY can end
up not set with the errors that brings with it when trying to run X
commands.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index f29aeb0..ca28bd2 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -15,6 +15,11 @@ def oe_terminal(command, title, d):
     import oe.data
     import oe.terminal
 
+    for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
+        value = d.getVar(export, True)
+        if value is not None:
+            os.environ[export] = str(value)
+
     terminal = oe.data.typed_value('OE_TERMINAL', d).lower()
     if terminal == 'none':
         bb.fatal('Devshell usage disabled with OE_TERMINAL')
@@ -28,14 +33,8 @@ def oe_terminal(command, title, d):
         except oe.terminal.ExecutionError as exc:
             bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
 
-    env = dict(os.environ)
-    for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
-        value = d.getVar(export, True)
-        if value is not None:
-            env[export] = str(value)
-
     try:
-        oe.terminal.spawn_preferred(command, title, env)
+        oe.terminal.spawn_preferred(command, title)
     except oe.terminal.NoSupportedTerminals:
         bb.fatal('No valid terminal found, unable to open devshell')
     except oe.terminal.ExecutionError as exc:



