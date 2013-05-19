Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ue18Y-0000Iy-PS for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 12:46:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4JAVU2x032709; Sun, 19 May 2013 11:31:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RKGiL1MqfdRI; Sun, 19 May 2013 11:31:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4JAVhEb032723
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 19 May 2013 11:31:44 +0100
Message-ID: <1368959294.32727.102.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 19 May 2013 13:28:14 +0300
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [RFC PATCH] devshell: Add interactive python shell
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 May 2013 10:47:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Being able to interact with the python context in the Bitbake task execution
environment has long been desirable. This patch introduces such a
mechanism. Executing "bitbake X -c devpyshell" will open a terminal connected
to a python interactive interpretor in the task context so for example you can
run commands like "d.getVar('WORKDIR')"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
I've marked this as RFC since this is not production ready at this
point. It does illustrate what we could possibly do for an interactive
python shell though. Usage is "bitbake bash -c devpyshell" and then you
can type 'd.getVar("WORKDIR")' into the prompt.

Cleanup needed:

 * The formatting of the prompt and return data is ugly and needs 
   correctly handling.
 * Shutdown is broken as there is a hanging python child process left 
   around you have to kill manually before you can restart bitbake.
 * d.keys() crashes the terminal. Large data transfer breaks it?
 * Would local=locals() get us the correct context rather than building 
   manually?

Whether I'll find time to fix these things I don't know, is anyone
interested in working on this?

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index a780118..8a54b74 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -25,3 +25,35 @@ python () {
             d.appendVar("OE_TERMINAL_EXPORTS", " " + k[0])
        d.delVarFlag("do_devshell", "fakeroot")
 } 
+
+python do_devpyshell() {
+    m, s = os.openpty()
+    sname = os.ttyname(s)
+    os.system('stty cs8 -icanon -echo < %s' % sname)
+    pid = os.fork()
+    if pid:
+        oe_terminal("oepydevshell-internal.py %s" % sname, 'OpenEmbedded Developer PyShell', d)
+        os._exit(0)
+    else:
+        os.dup2(m, sys.stdin.fileno())
+        os.dup2(m, sys.stdout.fileno())
+        os.dup2(m, sys.stderr.fileno())
+        bb.utils.nonblockingfd(sys.stdout)
+        bb.utils.nonblockingfd(sys.stdin)
+
+        _context = {
+            "os": os,
+            "bb": bb,
+            "time": time,
+            "d": d,
+        }
+
+        import code
+        try:
+            code.interact("BB: ", local=_context)
+        except Exception as e:
+            bb.fatal(str(e))
+}
+addtask devpyshell after do_patch
+
+do_devpyshell[nostamp] = "1"
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
new file mode 100755
index 0000000..946f562
--- /dev/null
+++ b/scripts/oepydevshell-internal.py
@@ -0,0 +1,32 @@
+#!/usr/bin/env python
+
+import os
+import sys
+import time
+import select
+import fcntl
+
+def nonblockingfd(fd):
+    fcntl.fcntl(fd, fcntl.F_SETFL, fcntl.fcntl(fd, fcntl.F_GETFL) | os.O_NONBLOCK)
+
+if len(sys.argv) != 2:
+    print("Incorrect parameters")
+    sys.exit(1)
+
+try:
+    print(sys.argv[1])
+    pty = open(sys.argv[1], "w+b")
+    nonblockingfd(pty)
+    nonblockingfd(sys.stdin)
+    while True:
+        (ready, _, _) = select.select([pty, sys.stdin], [] , [], 1)
+        if pty in ready:
+            r = pty.read()
+            sys.stdout.write(r)
+        if sys.stdin in ready:
+            r = sys.stdin.read()
+            pty.write(r)
+except Exception as e:
+    print(str(e))
+    time.sleep(5)
+




