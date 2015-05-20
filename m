Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CDDA56ABB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4KC5GgN004851; Wed, 20 May 2015 13:05:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QZNB4ixiGf3X; Wed, 20 May 2015 13:05:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4KC53QX004826
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 May 2015 13:05:15 +0100
Message-ID: <1432123503.28910.55.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 May 2015 13:05:03 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Add handling of do_shared_workdir task
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
X-List-Received-Date: Wed, 20 May 2015 12:05:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Changing TMPDIR and rebuilding an image was resulting in rebuilds of
kernels due to dependencies on the shared_workdir task. If installed
from sstate, nothing needs this task so add it to the whitelisted
task patterns.

After this change, the kernel does not rebuild when a new TMPDIR and
hot sstate cache is used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ccf2ea7..9e04388 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -867,6 +867,9 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
             # Target populate_sysroot need their dependencies
             return False
 
+        if taskdependees[task][1] == 'do_shared_workdir':
+            continue
+
         # This is due to the [depends] in useradd.bbclass complicating matters
         # The logic *is* reversed here due to the way hard setscene dependencies are injected
         if taskdependees[task][1] == 'do_package' and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':



