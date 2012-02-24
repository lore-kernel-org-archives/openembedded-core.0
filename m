Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0uoe-0001P0-FT for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 14:04:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OCtglk006071
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:55:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05627-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:55:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OCtYr6006065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:55:35 GMT
Message-ID: <1330088135.32006.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 12:55:35 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Using external source trees with OE-Core
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
X-List-Received-Date: Fri, 24 Feb 2012 13:04:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Someone recently asked me about using external source trees with
OE-Core. I was aware of srctree.bbclass in OE-Classic and did start
looking at it but it has various elements I wasn't so keen on. I
therefore wondered if I could improve upon it. I did start from that
code base but came up with:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/a0&id=ac8a54c18c33aaab6758c34a3d6093d3d3384cee
[patch inline below]

which I've called externalsrc.bbclass since it behaves a bit
differently. In particular, all the usual task targets are available.

As an example usage with the above patch applied:

cd ~
tar -xvzf $DL_DIR/libfm-0.1.17.tar.gz
(creates libfm-0.1.17 in my homedir)

edit libfm_0.1.17.bb and add:

inherit externalsrc
S = "/home/richard/libfm-0.1.17"

bitbake libfm

and it does what you'd expect. You can also -c clean and it will wipe
out WORKDIR but it won't touch ${S}. I picked libfm effectively at
random. It won't remove the autoreconf changes from configure but I'm
not sure I care much about that.

Admittedly, I did have to fix one Makefile.am which did '-I../' instead
of "-I$(srcdir)/../" but that is a bug in libfm.

Obviously this won't work quite as well with some recipes like
linux-yocto which manipulate ${S} a lot more but it should work in most
cases. I also found it very hard to remove tasks from the anonymous
python, we probably need to improve the API for this.

Opinions on including this class?

Cheers,

Richard



From ac8a54c18c33aaab6758c34a3d6093d3d3384cee Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Feb 2012 12:29:36 +0000
Subject: externalsrc.bbclass: Add class for handling external source trees

This is loosly based upon srctree.bbclass from OE-Classic but with some
changes appropriate to OE-Core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
new file mode 100644
index 0000000..7e00ef8
--- a/dev/null
+++ b/meta/classes/externalsrc.bbclass
@@ -0,0 +1,53 @@
+# Copyright (C) 2012 Linux Foundation
+# Author: Richard Purdie
+# Some code and influence taken from srctree.bbclass:
+# Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+#
+# externalsrc.bbclass enables use of an existing source tree, usually external to 
+# the build system to build a piece of software rather than the usual fetch/unpack/patch
+# process.
+#
+# To use, set S to point at the directory you want to use containing the sources
+# e.g. S = "/path/to/my/source/tree"
+#
+# If the class is to work for both target and native versions (or with multilibs/
+# cross or other BBCLASSEXTEND variants), its expected that setting B to point to 
+# where to place the compiled binaries will work (split source and build directories).
+# This is the default but B can be set to S if circumstaces dictate.
+#
+
+SRC_URI = ""
+SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
+B = "${WORKDIR}/${BPN}-${PV}/"
+
+def remove_tasks(tasks, deltasks, d):
+    for task in tasks:
+        deps = d.getVarFlag(task, "deps")
+        for preptask in deltasks:
+            if preptask in deps:
+                deps.remove(preptask)
+        d.setVarFlag(task, "deps", deps)
+    # Poking around bitbake internal variables is evil but there appears to be no better way :(
+    tasklist = d.getVar('__BBTASKS') or []
+    for task in deltasks:
+        d.delVarFlag(task, "task")
+        if task in tasklist:
+            tasklist.remove(task)
+    d.setVar('__BBTASKS', tasklist)
+
+python () {
+    tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
+    covered = d.getVar("SRCTREECOVEREDTASKS", True).split()
+
+    for task in tasks:
+        if task.endswith("_setscene"):
+            # sstate is never going to work for external source trees, disable it
+            covered.append(task)
+        else:
+            # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
+            d.appendVarFlag(task, "lockfiles", "${S}/singletask.lock")
+
+    remove_tasks(tasks, covered, d)
+}
+




