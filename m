Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4F060233
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 14:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OEDw0b027132 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:13:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qcZboI8oxEDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:13:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OEDuDl027126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:13:57 +0100
Message-ID: <1414160071.30118.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 15:14:31 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] rm_work: Speed up rootfs/populate_sdk removal
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
X-List-Received-Date: Fri, 24 Oct 2014 14:14:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commands like bitbake X -c rootfs or bitbake X -c populate_sdk do not
trigger rm_work to clean up the directories afterwards since it
traditionally hooks onto do_build. This change means those two tasks now
clean up after themselves. We use the cleandirs function attribute to
handle this.

[YOCTO #6413]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index f0f6d18..7b1ec17 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -97,3 +97,16 @@ do_rm_work_all () {
 }
 do_rm_work_all[recrdeptask] = "do_rm_work"
 addtask rm_work_all after do_rm_work
+
+do_populate_sdk[postfuncs] += "rm_work_populatesdk"
+rm_work_populatesdk () {
+    :
+}
+rm_work_populatesdk[cleandirs] = "${WORKDIR}/sdk"
+
+do_rootfs[postfuncs] += "rm_work_rootfs"
+rm_work_rootfs () {
+    :
+}
+rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
+



