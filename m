Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9438A60017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 20:15:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s52KFBSt021939; Mon, 2 Jun 2014 21:15:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8XeHg5TZBnr6; Mon,  2 Jun 2014 21:15:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s52KF95O021934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 2 Jun 2014 21:15:10 +0100
Message-ID: <1401740101.12440.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jun 2014 21:15:01 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC] autotools: Improve configure dependency code for finding m4 files
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
X-List-Received-Date: Mon, 02 Jun 2014 20:15:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have an open bug about the warnings issues in builds from an sstate
cache when something like glib-2.0 gets rebuilt. The issue is that
sstate is "clever" and prunes unneeded dependencies out the tree.

For example is X depends on pkgconfig-native but we've already build X
and installed it from sstate, it will not get installed when you build Y
which depends on X.

This patch changes the logic to match the sstate behaviour and prune out
unnecessary dependencies from the scope of aclocal. This in turn removes
the warning about missing manifest files.

The issue is that this patch exposes holes in our DEPENDS in recipes,
specifically that some native tools are not listed, specifically, and
problematically, pkgconfig, gtk-doc and intltool-native in particular.

I've sent out patches against OE-Core that address the bulk of the
issues there however I'm conscious this is probably going to a bug issue
in other layers and may be too annoying to consider at this point. The
other alternative is simply to turn the warning into a debug statement.

I appreciate the code below has commented blocks, this is simply debug
I've left around for now. It will be cleaned from any final version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 0dc1e6b..34d432e 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -142,15 +142,51 @@ python autotools_copy_aclocals () {
             return
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    #bb.warn(str(taskdepdata))
     pn = d.getVar("PN", True)
     aclocaldir = d.getVar("ACLOCALDIR", True)
     oe.path.remove(aclocaldir)
     bb.utils.mkdirhier(aclocaldir)
+    start = None
     configuredeps = []
+
     for dep in taskdepdata:
         data = taskdepdata[dep]
-        if data[1] == "do_configure" and data[0] != pn:
-            configuredeps.append(data[0])
+        if data[1] == "do_configure" and data[0] == pn:
+            start = dep
+            break
+    if not start:
+        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
+
+    # We need to find configure tasks which are either from <target> -> <target>
+    # or <native> -> <native> but not <target> -> <native> unless they're direct
+    # dependencies. This mirrors what would get restored from sstate.
+    done = [dep]
+    next = [dep]
+    while next:
+        new = []
+        for dep in next:
+            data = taskdepdata[dep]
+            for datadep in data[3]:
+                if datadep in done:
+                    continue
+                done.append(datadep)
+                if (not data[0].endswith("-native")) and taskdepdata[datadep][0].endswith("-native") and dep != start:
+                    continue
+                new.append(datadep)
+                if taskdepdata[datadep][1] == "do_configure":
+                    configuredeps.append(taskdepdata[datadep][0])
+        next = new
+
+    #configuredeps2 = []
+    #for dep in taskdepdata:
+    #    data = taskdepdata[dep]
+    #    if data[1] == "do_configure" and data[0] != pn:
+    #        configuredeps2.append(data[0])
+    #configuredeps.sort()
+    #configuredeps2.sort()
+    #bb.warn(str(configuredeps))
+    #bb.warn(str(configuredeps2))
 
     cp = []
     for c in configuredeps:



