Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 64A2F74197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 17:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7FH5Skk011089 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:05:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nyHg9eaUUAMH
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:05:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7FH5ORk011086
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:05:25 +0100
Message-ID: <1471280724.20391.101.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2016 18:05:24 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] report-error: Fix tracebacks
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
X-List-Received-Date: Mon, 15 Aug 2016 17:05:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the code gives tracebacks if there are no recipes to be built in a 
BuildStarted event. Parse the list into a string rather than just taking the
first item. There is nothing special about the first time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index c8c15bd..5bb231e 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -42,7 +42,7 @@ python errorreport_handler () {
             data['distro'] = e.data.getVar("DISTRO", True)
             data['target_sys'] = e.data.getVar("TARGET_SYS", True)
             data['failures'] = []
-            data['component'] = e.getPkgs()[0]
+            data['component'] = " ".join(e.getPkgs())
             data['branch_commit'] = str(base_detect_branch(e.data)) + ": " + str(base_detect_revision(e.data))
             lock = bb.utils.lockfile(datafile + '.lock')
             errorreport_savedata(e, data, "error-report.txt")



