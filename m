Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U7ZpO-0007Gu-61 for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 00:08:59 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1IMxDr9028058 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 22:59:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qJkBvQO8VeXp
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 22:59:13 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1IMwvMe028023
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 22:59:10 GMT
Message-ID: <1361193590.5927.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Feb 2013 13:19:50 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.6.3-1 
Subject: [PATCH] devshell.bbclass: Allow running devshell and fakeroot together
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
X-List-Received-Date: Mon, 18 Feb 2013 23:09:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently its hard to run a devshell complete with fakeroot context. This
patch allows the fakeroot flag on the task to do this, as with any other
task. Since we may need to start X terminal applications, we need to
only start the fakeroot session on the final command, hence the hoops
this code jumps through.

As always with fakeroot, you can break out and run a command without
the fake permissions with syntax like "PSEUDO_UNLOAD=1 <command>"

[YOCTO #3374]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/devshell.bbclass |   19 ++++++++++++++++++-
 meta/classes/terminal.bbclass |    5 +++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index ddb6e55..a780118 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -1,10 +1,27 @@
 inherit terminal
 
+DEVSHELL = "${SHELL}"
+
 python do_devshell () {
-    oe_terminal(d.getVar('SHELL', True), 'OpenEmbedded Developer Shell', d)
+    oe_terminal(d.getVar('DEVSHELL', True), 'OpenEmbedded Developer Shell', d)
 }
 
 addtask devshell after do_patch
 
 do_devshell[dirs] = "${S}"
 do_devshell[nostamp] = "1"
+
+# devshell and fakeroot/pseudo need careful handling since only the final
+# command should run under fakeroot emulation, any X connection should
+# be done as the normal user. We therfore carefully construct the envionment
+# manually
+python () {
+    if d.getVarFlag("do_devshell", "fakeroot"):
+       d.prependVar("DEVSHELL", "pseudo ")
+       fakeenv = d.getVar("FAKEROOTENV", True).split()
+       for f in fakeenv:
+            k = f.split("=")
+            d.setVar(k[0], k[1])           
+            d.appendVar("OE_TERMINAL_EXPORTS", " " + k[0])
+       d.delVarFlag("do_devshell", "fakeroot")
+} 
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index d5a6277..8cebad4 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -25,6 +25,11 @@ def oe_terminal(command, title, d):
         if value is not None:
             os.environ[export] = str(value)
             env[export] = str(value)
+        if export == "PSEUDO_DISABLED":
+            if "PSEUDO_UNLOAD" in os.environ:
+                del os.environ["PSEUDO_UNLOAD"]
+            if "PSEUDO_UNLOAD" in env:
+                del env["PSEUDO_UNLOAD"]
 
     # Add in all variables from the user's original environment which
     # haven't subsequntly been set/changed




