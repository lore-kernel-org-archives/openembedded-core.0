Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AFD686FA95
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 15:09:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4RF9QP3019117 for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 16:09:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id m0J07o3wKnX9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 16:09:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4RF9Nu1019111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 16:09:25 +0100
Message-ID: <1401203356.2607.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 16:09:16 +0100
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
X-List-Received-Date: Tue, 27 May 2014 15:09:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Being able to interact with the python context in the Bitbake task execution
environment has long been desireable. This patch introduces such a
mechanism. Executing "bitbake X -c devpyshell" will open a terminal connected
to a python interactive interpretor in the task context so for example you can
run commands like "d.getVar('WORKDIR')"

This version now includes readline support for command history and various other
bug fixes such as exiting cleanly compared to previous versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 92edb9e..41164a3 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -31,3 +31,124 @@ python () {
        d.setVarFlag("do_devshell", "manualfakeroot", "1")
        d.delVarFlag("do_devshell", "fakeroot")
 } 
+
+def devpyshell(d):
+
+    import code
+    import select
+    import signal
+    import termios
+
+    m, s = os.openpty()
+    sname = os.ttyname(s)
+
+    def noechoicanon(fd):
+        old = termios.tcgetattr(fd)
+        old[3] = old[3] &~ termios.ECHO &~ termios.ICANON
+        # &~ termios.ISIG
+        termios.tcsetattr(fd, termios.TCSADRAIN, old)
+    
+    # No echo or buffering over the pty
+    noechoicanon(s)
+
+    pid = os.fork()
+    if pid:
+        os.close(m)
+        oe_terminal("oepydevshell-internal.py %s %d" % (sname, pid), 'OpenEmbedded Developer PyShell', d)
+        os._exit(0)
+    else:
+        os.close(s)
+
+        os.dup2(m, sys.stdin.fileno())
+        os.dup2(m, sys.stdout.fileno())
+        os.dup2(m, sys.stderr.fileno())
+
+        sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
+        sys.stdin = os.fdopen(sys.stdin.fileno(), 'r', 0)
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
+        ps1 = "pydevshell> "
+        ps2 = "... "
+        buf = []
+        more = False
+
+        i = code.InteractiveInterpreter(locals=_context)
+        print("OE PyShell (PN = %s)\n" % d.getVar("PN", True))
+
+        def prompt(more):
+            if more:
+                prompt = ps2
+            else:
+                prompt = ps1
+            sys.stdout.write(prompt)
+
+        # Restore Ctrl+C since bitbake masks this
+        def signal_handler(signal, frame):
+            raise KeyboardInterrupt
+        signal.signal(signal.SIGINT, signal_handler)
+
+        child = None
+
+        prompt(more)
+        while True:
+            try:
+                try:
+                    (r, _, _) = select.select([sys.stdin], [], [], 1)
+                    if not r:
+                        continue
+                    line = sys.stdin.readline().strip()
+                    if not line:
+                        prompt(more)
+                        continue
+                except EOFError as e:
+                    sys.stdout.write("\n")
+                except (OSError, IOError) as e:
+                    if e.errno == 11:
+                        continue
+                    if e.errno == 5:
+                        return
+                    raise
+                else:
+                    if not child:
+                        child = int(line)
+                        continue
+                    buf.append(line)
+                    source = "\n".join(buf)
+                    more = i.runsource(source, "<pyshell>")
+                    if not more:
+                        buf = []
+                    prompt(more)
+            except KeyboardInterrupt:
+                i.write("\nKeyboardInterrupt\n")
+                buf = []
+                more = False
+                prompt(more)
+            except SystemExit:
+                # Easiest way to ensure everything exits
+                os.kill(child, signal.SIGTERM)
+                break
+
+python do_devpyshell() {
+    import signal
+
+    try:
+        devpyshell(d)
+    except SystemExit:
+        # Stop the SIGTERM above causing an error exit code    
+        return
+    finally:
+        return
+}
+addtask devpyshell after do_patch
+
+do_devpyshell[nostamp] = "1"
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
new file mode 100755
index 0000000..f7b2e4e
--- /dev/null
+++ b/scripts/oepydevshell-internal.py
@@ -0,0 +1,92 @@
+#!/usr/bin/env python
+
+import os
+import sys
+import time
+import select
+import fcntl
+import termios
+import readline
+import signal
+
+def nonblockingfd(fd):
+    fcntl.fcntl(fd, fcntl.F_SETFL, fcntl.fcntl(fd, fcntl.F_GETFL) | os.O_NONBLOCK)
+
+def echonocbreak(fd):
+    old = termios.tcgetattr(fd)
+    old[3] = old[3] | termios.ECHO | termios.ICANON
+    termios.tcsetattr(fd, termios.TCSADRAIN, old)
+
+def cbreaknoecho(fd):
+    old = termios.tcgetattr(fd)
+    old[3] = old[3] &~ termios.ECHO &~ termios.ICANON
+    termios.tcsetattr(fd, termios.TCSADRAIN, old)
+
+if len(sys.argv) != 3:
+    print("Incorrect parameters")
+    sys.exit(1)
+
+pty = open(sys.argv[1], "w+b", 0)
+parent = int(sys.argv[2])
+
+# Don't buffer output by line endings
+sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
+sys.stdin = os.fdopen(sys.stdin.fileno(), 'r', 0)
+nonblockingfd(pty)
+nonblockingfd(sys.stdin)
+
+
+histfile = os.path.expanduser("~/.oedevpyshell-history")
+readline.parse_and_bind("tab: complete")
+try:
+    readline.read_history_file(histfile)
+except IOError:
+    pass 
+
+try:
+
+    i = ""
+    o = ""
+    # Need cbreak/noecho whilst in select so we trigger on any keypress
+    cbreaknoecho(sys.stdin.fileno())
+    # Send our PID to the other end so they can kill us.
+    pty.write(str(os.getpid()) + "\n")
+    while True:
+        try:
+            writers = []
+            if i:
+                writers.append(sys.stdout)
+            (ready, _, _) = select.select([pty, sys.stdin], writers , [], 0)
+            try:
+                if pty in ready:
+                    i = i + pty.read()
+                if i:
+                    # Write a page at a time to avoid overflowing output 
+                    # d.keys() is a good way to do that
+                    sys.stdout.write(i[:4096])
+                    i = i[4096:]
+                if sys.stdin in ready:
+                    echonocbreak(sys.stdin.fileno())
+                    o = raw_input()
+                    cbreaknoecho(sys.stdin.fileno())
+                    pty.write(o + "\n")
+            except (IOError, OSError) as e:
+                if e.errno == 11:
+                    continue
+                if e.errno == 5:
+                    sys.exit(0)
+                raise
+            except EOFError:
+                sys.exit(0)
+        except KeyboardInterrupt:
+            os.kill(parent, signal.SIGINT)
+
+except SystemExit:
+    pass
+except Exception as e:
+    import traceback
+    print("Exception in oepydehshell-internal: " + str(e))
+    traceback.print_exc()
+    time.sleep(5)
+finally:
+    readline.write_history_file(histfile)



