Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBos5-00068x-0e for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:24:25 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96EPAjh011955; Thu, 6 Oct 2011 15:25:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gPmqEjTNhswS; Thu,  6 Oct 2011 15:25:10 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96EP4lv011952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 6 Oct 2011 15:25:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 15:18:27 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317910715.6398.84.camel@ted>
Mime-Version: 1.0
Subject: base.bbclass: Implement PACKAGECONFIG
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
X-List-Received-Date: Thu, 06 Oct 2011 14:24:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These enabled options to be specified in the form:

PACKAGECONFIG ?? = "<default options>"
PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"

So that DEPENDS, RDEPENDS_${PN} and EXTRA_OECONF can be automatically
built from specific options. Those options can easily be customised
by the distro config or the user.

Based on some ideas from Chris Elston <celston@katalix.com> but with
an improved easier to use one line interface.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7cd6efa..f539744 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -291,6 +291,44 @@ do_build () {
 python () {
     import exceptions, string, re
 
+    # Handle PACKAGECONFIG
+    #
+    # These take the form:
+    #
+    # PACKAGECONFIG ?? = "<default options>"
+    # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
+    pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
+    if pkgconfig:
+        def appendVar(varname, appends):
+            if not appends:
+                return
+            varname = bb.data.expand(varname, d)
+            content = d.getVar(varname, False) or ""
+            content = content + " " + " ".join(appends)
+            d.setVar(varname, content)
+
+        extradeps = []
+        extrardeps = []
+        extraconf = []
+        for flag, flagval in (d.getVarFlags("PACKAGECONFIG") or {}).items():
+            if flag == "defaultval":
+                continue
+            items = flagval.split(",")
+            if len(items) == 3:
+                enable, disable, depend = items
+                rdepend = ""
+            elif len(items) == 4:
+                enable, disable, depend, rdepend = items
+            if flag in pkgconfig:
+                extradeps.append(depend)
+                extrardeps.append(rdepend)
+                extraconf.append(enable)
+            else:
+                extraconf.append(disable)
+        appendVar('DEPENDS', extradeps)
+        appendVar('RDEPENDS_${PN}', extrardeps)
+        appendVar('EXTRA_OECONF', extraconf)
+
     # If PRINC is set, try and increase the PR value by the amount specified
     princ = bb.data.getVar('PRINC', d, True)
     if princ:




