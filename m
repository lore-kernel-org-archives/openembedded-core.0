Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4566018C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 14:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3CEiBbR016744 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:44:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tm6jgSCyMAgd
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:44:11 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3CEi85r016741
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:44:09 +0100
Message-ID: <1460472248.9308.57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Apr 2016 15:44:08 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] archiver: Ensure sstate-inputdir directory is created
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
X-List-Received-Date: Tue, 12 Apr 2016 14:44:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this, do_archive_sources will fail for the gcc tasks where there is
common source and the other tasks are not added as dependencies. The failure
happens when trying to restore these tasks from sstate.

To fix this ensure the sources directory is created as expected by the
sstate code.

[YOCTO #9433]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 89a24d9..cea5b3b 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -368,6 +368,7 @@ do_deploy_archives () {
 python do_deploy_archives_setscene () {
     sstate_setscene(d)
 }
+do_deploy_archives[dirs] = "${ARCHIVER_TOPDIR}"
 do_deploy_archives[sstate-inputdirs] = "${ARCHIVER_TOPDIR}"
 do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 addtask do_deploy_archives_setscene



