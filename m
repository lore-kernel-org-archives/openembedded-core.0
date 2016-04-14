Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0227D6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3EDrHdb014319 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:53:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AMzKTj-yAyjY
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:53:17 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3EDrEin014316
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:53:15 +0100
Message-ID: <1460641994.9308.179.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Apr 2016 14:53:14 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] buildstats: Fix trackbacks for early task failures
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
X-List-Received-Date: Thu, 14 Apr 2016 13:53:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If a failure occurs early in the task, its possible we can have a
TaskFailed before the TaskStarted event can be triggered. This in
turn causes another traceback as the directory buildstats writes 
files into doesn't exist.

Ensure the directory exists so we can see the original error.
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index d381c93..ab72af5 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -195,6 +195,8 @@ python run_buildstats () {
                 f.write("Uncompressed Rootfs size: %s" % rootfs_size)
 
     elif isinstance(e, bb.build.TaskFailed):
+        # Can have a failure before TaskStarted so need to mkdir here too
+        bb.utils.mkdirhier(taskdir)
         write_task_data("failed", os.path.join(taskdir, e.task), e, d)
         ########################################################################
         # Lets make things easier and tell people where the build failed in

