Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1B71B6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBAMnpwp022618 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:49:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eMzRNaTJR_ql
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:49:51 +0000 (GMT)
Received: from [192.168.3.30] ([192.168.3.30]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBAMncHE022610
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:49:49 GMT
Message-ID: <1449787778.29412.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Dec 2015 22:49:38 +0000
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] sstate: Ensure populate_lic dependencies are not followed
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
X-List-Received-Date: Thu, 10 Dec 2015 22:49:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It was observed that do_fetch dependencies (e.g. subversion-native of tremor)
were being installed even when sstate was available and hence no fetch was
needed. This turned out to be due to the recursive nature of the rootfs
dependencies which include populate_lic.

We can explicitly whitelist these dependencies as being ones we don't
need to follow when installing sstate (the code defaults to being paranoid).

[YOCTO #8746]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d09e27a..a912cbf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -879,6 +879,9 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         if taskdependees[task][1] == 'do_shared_workdir':
             continue
 
+        if taskdependees[dep][1] == "do_populate_lic":
+            continue
+
         # This is due to the [depends] in useradd.bbclass complicating matters
         # The logic *is* reversed here due to the way hard setscene dependencies are injected
         if taskdependees[task][1] == 'do_package' and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':



