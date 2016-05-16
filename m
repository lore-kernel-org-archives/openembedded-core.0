Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 43F8A606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 21:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4GLqMBA020918 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 22:53:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jv3q0eOtcfUn
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 22:53:30 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4GLrPvB020946
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 22:53:27 +0100
Message-ID: <1463435605.9746.165.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 22:53:25 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Ensure we sort the value used for SSTATETASKS for determinism
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
X-List-Received-Date: Mon, 16 May 2016 21:53:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids 'basehash changed' errors with python 3 but could break
build determinism in general.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6491bad..5fca0ea 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -95,7 +95,7 @@ python () {
         scan_cmd = "grep -Irl ${STAGING_DIR} ${SSTATE_BUILDDIR}"
         d.setVar('SSTATE_SCAN_CMD', scan_cmd)
 
-    unique_tasks = set((d.getVar('SSTATETASKS', True) or "").split())
+    unique_tasks = sorted(set((d.getVar('SSTATETASKS', True) or "").split()))
     d.setVar('SSTATETASKS', " ".join(unique_tasks))
     for task in unique_tasks:
         d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")



