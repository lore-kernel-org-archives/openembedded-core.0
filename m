Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BB8AA60DFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:49:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIDnWsG004442 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:49:32 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FOFLdBFBLkF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:49:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIDnSAR004438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:49:29 GMT
Message-ID: <1387374563.6402.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Dec 2013 13:49:23 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Write out siginfo files for non-sstate tasks
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
X-List-Received-Date: Wed, 18 Dec 2013 13:49:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently siginfo files are only written for sstate tasks. In order to be truly
debuggable, its helpful to have the siginfo for intermediate tasks. This
adds that functionality so the extra siginfo files are written out too.

This will be used to add better sstate debugging in future changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 517c100..678d5e3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -735,3 +735,14 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         return False
     return True
 
+addhandler sstate_eventhandler
+sstate_eventhandler[eventmask] = "bb.build.TaskSucceeded"
+python sstate_eventhandler() {
+    d = e.data
+    # When we write an sstate package we rewrite the SSTATE_PKG
+    spkg = d.getVar('SSTATE_PKG', True)
+    if not spkg.endswith(".tgz"):
+        taskname = d.getVar("BB_RUNTASK", True)[3:]
+        bb.siggen.dump_this_task(d.getVar('SSTATE_PKG', True) + '_' + taskname + ".tgz" ".siginfo", d)
+}
+



