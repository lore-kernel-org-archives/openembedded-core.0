Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5D47E732F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 09:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4E9W3UE015336 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:32:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2s20hueBqnpo
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:32:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4E9Vprg015321
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:32:02 +0100
Message-ID: <1431595911.30971.189.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 May 2015 10:31:51 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] kernel/rm_work: Improve interaction
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
X-List-Received-Date: Thu, 14 May 2015 09:32:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The do_shared_workdir task does leave behind the necessary information in
shared-work after it completes. We don't make this a "full" sstate task
however since that means tarring up and copying what is usually a large
amount of data which would be better extracted straight from the original
SCM.

The issue with rm_work occurs since it removes the do_shared_workdir stamp
meaning subsequent builds will add it back if they need to touch any kernel
modules for example. This ends up triggering a near enough complete kernerl
rebuild since if configure reruns, populate_sysroot has to rerun.

This change promotes the task to have a "setscene" variant but it doesn't use
any of the sstate class lifting to generate the sstate file. The sstate function
will therefore never get called since the sstate object will never exist.

We can add the task to the list of tasks rm_work promotes to a setscene variant
and unwanted rebuilds of the kernel should be avoided.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 74092e9..54725ba 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -235,6 +235,11 @@ kernel_do_install() {
 do_install[prefuncs] += "package_get_auto_pr"
 
 addtask shared_workdir after do_compile before do_compile_kernelmodules
+addtask shared_workdir_setscene
+
+do_shared_workdir_setscene () {
+	exit 1
+}
 
 emit_depmod_pkgdata() {
 	# Stash data for depmod
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index e68d02a..5e9efc1 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -49,7 +49,7 @@ do_rm_work () {
     cd `dirname ${STAMP}`
     for i in `basename ${STAMP}`*
     do
-        for j in ${SSTATETASKS}
+        for j in ${SSTATETASKS} do_shared_workdir
         do
             case $i in
             *do_setscene*)



