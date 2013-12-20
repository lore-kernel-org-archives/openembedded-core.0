Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3989160D67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:09:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBKC97Qm005569 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:09:07 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DH0h6WufsqmO
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:09:07 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBKC90tw005538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:09:02 GMT
Message-ID: <1387541336.6402.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Dec 2013 12:08:56 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate/sstatesig: Add populate_lic to list of arch invariant sstate tasks
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
X-List-Received-Date: Fri, 20 Dec 2013 12:09:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Like fetch, unpack and patch, populate_lic doesn't vary between different
archs so we should mark it as such. This means better sstate cache reuse
with fewer duplicate files as well as less confusing sstate debugging.

sstatesig also needs to account for the fact BPN is used for sstate files
in these cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 324d1c1..377af20 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -103,6 +103,10 @@ def sstate_state_fromvars(d, task = None):
     if not name or len(inputs) != len(outputs):
         bb.fatal("sstate variables not setup correctly?!")
 
+    if name == "populate_lic":
+        d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
+        d.setVar("SSTATE_EXTRAPATH", "")
+
     ss = sstate_init(name, task, d)
     for i in range(len(inputs)):
         sstate_add(ss, inputs[i], outputs[i], d)
@@ -603,7 +607,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
         tname = sq_task[task][3:]
 
-        if tname in ["fetch", "unpack", "patch"] and splithashfn[2]:
+        if tname in ["fetch", "unpack", "patch", "populate_lic"] and splithashfn[2]:
             spec = splithashfn[2]
             extrapath = ""
 
@@ -749,7 +753,7 @@ python sstate_eventhandler() {
         taskname = d.getVar("BB_RUNTASK", True)[3:]
         spec = d.getVar('SSTATE_PKGSPEC', True)
         swspec = d.getVar('SSTATE_SWSPEC', True)
-        if taskname in ["fetch", "unpack", "patch"] and swspec:
+        if taskname in ["fetch", "unpack", "patch", "populate_lic"] and swspec:
             d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
             d.setVar("SSTATE_EXTRAPATH", "")
         sstatepkg = d.getVar('SSTATE_PKG', True)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 68e53f6..3011f16 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -103,6 +103,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
         if key.startswith('virtual:native:'):
             pn = pn + '-native'
 
+    if taskname in ['do_fetch', 'do_unpack', 'do_patch', 'do_populate_lic']:
+        pn.replace("-native", "")
+
     filedates = {}
 
     # First search in stamps dir



