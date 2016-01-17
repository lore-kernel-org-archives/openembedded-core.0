Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EF3FA60232
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBSMEW020940 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:28:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IYvkUSKYPrnS
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:28:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBSHIq020937
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:28:18 GMT
Message-ID: <1453030097.27999.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jan 2016 11:28:17 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image: Ensure we don't expand TMPDIR in image commands
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
X-List-Received-Date: Sun, 17 Jan 2016 11:28:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Similarly to DATETIME, don't expand TMPDIR in image commands.
This ensures some of the stamp comparisons we make in the
QA tests work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a2e966e..e85869d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -369,7 +369,9 @@ python () {
         # Delete DATETIME so we don't expand any references to it now
         # This means the task's hash can be stable rather than having hardcoded
         # date/time values. It will get expanded at execution time.
+        # Similarly TMPDIR since otherwise we see QA stamp comparision problems
         localdata.delVar('DATETIME')
+        localdata.delVar('TMPDIR')
 
         image_cmd = localdata.getVar("IMAGE_CMD", True)
         vardeps.add('IMAGE_CMD_' + realt)



