Return-Path: <tylerwhall@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 67AC96AA78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 20:17:04 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id l10so2432580qcy.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/DjxgPE0nA4rNBaGaW66eAjfiF1A/f1hFgEguf0HKb4=;
	b=LYAiB7nwmllTf7H9g3qpaWR8EhvClzWC3LZKhL8w5MSHc8sNniie9JYsnDDpKuVcox
	o13VN7G2gX1GPjkPZncEb472uefGSSdwuzVAVnW9wTW1Yc/1myKJurNwqcUFEducP2++
	YxskHE16UXga+Gj/ZJCP2ATCll2mkorq9FH/RXNlvvuqlCUUs6s2Fx0BZk3YZr+e286w
	knrP/OTecIMih/ehAQJiWgefMTpPY0VaxK8YudzajP89WcDV/7m+4WEZ1VCx4BHVwcuT
	yJUX0LXHWs9piW3DKIBMR+0klgotcdMzBXON44L3qbWqhgug8bI+ife5Nr3exL2qDcsH
	bMFg==
X-Received: by 10.49.71.14 with SMTP id q14mr27949393qeu.90.1372623424017;
	Sun, 30 Jun 2013 13:17:04 -0700 (PDT)
Received: from localhost.localdomain (74-134-75-179.dhcp.insightbb.com.
	[74.134.75.179])
	by mx.google.com with ESMTPSA id 4sm885207qaq.6.2013.06.30.13.17.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Jun 2013 13:17:03 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2013 16:16:19 -0400
Message-Id: <1372623379-13963-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [RFC PATCH] terminal: Run command using a wrapper script
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
X-List-Received-Date: Sun, 30 Jun 2013 20:17:04 -0000

Some terminals may not pass the environment into the child process. This
is true when using "tmux split-window." If tmux is already running, it
will start the command with the tmux session environment, ignoring the
environment where the command was issued.

This could possibly be worked around when launching tmux by injecting
variables into the user's session environment or adding the variables to
the "update-environment" tmux setting. However, both methods would
permanently alter the user's session, which is undesirable.

By using a wrapper script, we have full control over the final
environment. Replace the env dictionary with an empty data smart that
will contain the exported variables and a wrapper function that execs
the original command.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---

Currently the devshell command fails when run from tmux, because tmux doesn't
pass the environment necessary for pseudo. Tmux starts new shells using the
session environment and ignores the environment that invoked the command.

I can think of three tmux-specifc ways to fix this, but they are all
suboptimal.

1. Modify the user's session environment before spawning the shell
    - This is a global operation that can't be done atomically and may be
    destructive to the user's session environment
2. Add variables to tmux's "update-environment" variable
    - Has the same problem as 1.
3. A multi-step process:
    A. Make a new session containing a dummy shell (with the wrong env)
    B. Set the session's environment, one variable at a time
    C. Launch the command in that session
    D. Move the window to the current session
    E. Destroy the temporary session containing the dummy shell

    - This feels too complicated and fragile

My current solution is to run the command via a wrapper script that takes the
form of a standard task run script. This achieves the desired environment
without relying on the terminal's behavior.

It also may be convenient to have the task script in the temp directory so
one can enter the devshell environment without running bitbake.

There is some code duplication with bitbake's exec_func(), particularly when
getting the script file name from BB_RUNFMT, though it is only a few lines.

 meta/classes/terminal.bbclass | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 8cebad4..ae338e9 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -11,43 +11,66 @@ XAUTHORITY ?= "${HOME}/.Xauthority"
 SHELL ?= "bash"
 
 
+def emit_terminal_func(command, envdata, d):
+    cmd_func = 'do_terminal'
+
+    envdata.setVar(cmd_func, 'exec ' + command)
+    envdata.setVarFlag(cmd_func, 'func', 1)
+
+    runfmt = d.getVar('BB_RUNFMT', True) or "run.{func}.{pid}"
+    runfile = runfmt.format(func=cmd_func, pid=os.getpid())
+    runfile = os.path.join(d.getVar('T', True), runfile)
+    with open(runfile, 'w') as script:
+        script.write('#!/bin/sh -e\n')
+        bb.data.emit_func(cmd_func, script, envdata)
+        script.write(cmd_func)
+        script.write("\n")
+    os.chmod(runfile, 0755)
+
+    return runfile
+
 def oe_terminal(command, title, d):
     import oe.data
     import oe.terminal
 
-    env = dict()
+    envdata = bb.data.init()
 
     for v in os.environ:
-        env[v] = os.environ[v]
+        envdata.setVar(v, os.environ[v])
+        envdata.setVarFlag(v, 'export', 1)
 
     for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
         value = d.getVar(export, True)
         if value is not None:
             os.environ[export] = str(value)
-            env[export] = str(value)
+            envdata.setVar(export, str(value))
+            envdata.setVarFlag(export, 'export', 1)
         if export == "PSEUDO_DISABLED":
             if "PSEUDO_UNLOAD" in os.environ:
                 del os.environ["PSEUDO_UNLOAD"]
-            if "PSEUDO_UNLOAD" in env:
-                del env["PSEUDO_UNLOAD"]
+            envdata.delVar("PSEUDO_UNLOAD")
 
     # Add in all variables from the user's original environment which
     # haven't subsequntly been set/changed
     origbbenv = d.getVar("BB_ORIGENV", False) or {}
     for key in origbbenv:
-        if key in env:
+        if key in envdata:
             continue
         value = origbbenv.getVar(key, True)
         if value is not None:
             os.environ[key] = str(value)
-            env[key] = str(value)
+            envdata.setVar(key, str(value))
+            envdata.setVarFlag(key, 'export', 1)
+
+    # Replace command with an executable wrapper script
+    command = emit_terminal_func(command, envdata, d)
 
     terminal = oe.data.typed_value('OE_TERMINAL', d).lower()
     if terminal == 'none':
         bb.fatal('Devshell usage disabled with OE_TERMINAL')
     elif terminal != 'auto':
         try:
-            oe.terminal.spawn(terminal, command, title, env, d)
+            oe.terminal.spawn(terminal, command, title, None, d)
             return
         except oe.terminal.UnsupportedTerminal:
             bb.warn('Unsupported terminal "%s", defaulting to "auto"' %
@@ -56,7 +79,7 @@ def oe_terminal(command, title, d):
             bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
 
     try:
-        oe.terminal.spawn_preferred(command, title, env, d)
+        oe.terminal.spawn_preferred(command, title, None, d)
     except oe.terminal.NoSupportedTerminals:
         bb.fatal('No valid terminal found, unable to open devshell')
     except oe.terminal.ExecutionError as exc:
-- 
1.8.3.2


