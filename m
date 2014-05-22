Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 29B026B700
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 16:29:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4MGTAn4012190 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 17:29:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vyKuXQWDy5Hl
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 17:29:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4MGT4nx012182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 17:29:06 +0100
Message-ID: <1400776137.17834.78.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 17:28:57 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] devshell: Add interactive python shell
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
X-List-Received-Date: Thu, 22 May 2014 16:29:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Being able to interact with the python context in the Bitbake task execution
environment has long been desirable. This patch introduces such a
mechanism. Executing "bitbake X -c devpyshell" will open a terminal connected
to a python interactive interpretor in the task context so for example you can
run commands like "d.getVar('WORKDIR')"

This version fixes various issues with the previous RFC version from a
while ago and generally seems to work effectively.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 92edb9e..a8e707d 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -31,3 +31,79 @@ python () {
        d.setVarFlag("do_devshell", "manualfakeroot", "1")
        d.delVarFlag("do_devshell", "fakeroot")
 } 
+
+python do_devpyshell() {
+    m, s = os.openpty()
+    sname = os.ttyname(s)
+    os.system('stty cs8 -icanon min 1 -isig -echo -F %s > /dev/null 2> /dev/null' % sname)
+    pid = os.fork()
+    if pid:
+        oe_terminal("oepydevshell-internal.py %s" % sname, 'OpenEmbedded Developer PyShell', d)
+        os._exit(0)
+    else:
+        os.dup2(m, sys.stdin.fileno())
+        os.dup2(m, sys.stdout.fileno())
+        os.dup2(m, sys.stderr.fileno())
+        os.close(s)
+
+        sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
+
+        bb.utils.nonblockingfd(sys.stdout)
+        bb.utils.nonblockingfd(sys.stderr)
+        bb.utils.nonblockingfd(sys.stdin)
+
+        _context = {
+            "os": os,
+            "bb": bb,
+            "time": time,
+            "d": d,
+        }
+
+        import code, select
+
+        ps1 = "pydevshell> "
+        ps2 = "... "
+        buf = []
+        more = False
+        try:
+            i = code.InteractiveInterpreter(locals=_context)
+            print("OE PyShell (PN = %s)\n" % d.getVar("PN", True))
+
+            def prompt(more):
+                if more:
+                    prompt = ps2
+                else:
+                    prompt = ps1
+                sys.stdout.write(prompt)
+
+            prompt(more)
+            while True:
+                try:
+                    try:
+                        (r, _, _) = select.select([sys.stdin], [], [], 1)
+                        if not r:
+                            continue
+                        line = sys.stdin.readline().strip()
+                    except EOFError as e:
+                        sys.stdout.write("\n")
+                    except (OSError, IOError) as e:
+                        if e.errno == 11:
+                            continue
+                        raise
+                    else:
+                        buf.append(line)
+                        source = "\n".join(buf)
+                        more = i.runsource(source, "<pyshell>")
+                        if not more:
+                            buf = []
+                        prompt(more)
+                except KeyboardInterrupt:
+                    i.write("\nKeyboardInterrupt\n")
+                    buf = []
+                    more = False
+        except Exception as e:
+            bb.fatal(str(e))
+}
+addtask devpyshell after do_patch
+
+do_devpyshell[nostamp] = "1"
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
new file mode 100755
index 0000000..11bb828
--- /dev/null
+++ b/scripts/oepydevshell-internal.py
@@ -0,0 +1,54 @@
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
+    pty = open(sys.argv[1], "w+b", 0)
+    nonblockingfd(pty)
+    nonblockingfd(sys.stdin)
+    # Don't buffer output by line endings
+    sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
+
+    i = ""
+    o = ""
+
+    while True:
+        writers = []
+        if i:
+            writers.append(sys.stdout)
+        if o:
+            writers.append(pty)
+        (ready, _, _) = select.select([pty, sys.stdin], writers , [], 1)
+        try:
+            if pty in ready:
+                i = i + pty.read()
+            if i:
+                # Write a page at a time to avoid overflowing output 
+                # d.keys() is a good way to do that
+                sys.stdout.write(i[:4096])
+                i = i[4096:]
+            if sys.stdin in ready:
+                o = o + sys.stdin.read()
+            if o:
+                pty.write(o)
+                o = ""
+        except (IOError, OSError) as e:
+            if e.errno == 11:
+                continue
+            raise
+except Exception as e:
+    print("Exception in oepydehshell-internal: " + str(e))
+    time.sleep(5)
+
+



