Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AE4C560232
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBEAC9020387 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:15:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SubuVWUfu2OG
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:15:16 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBFFFx020475
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:15:16 GMT
Message-ID: <1453029314.27999.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jan 2016 11:15:14 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] rootfs-postcommands: Ensure license manifests respect RM_OLD_IMAGE
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
X-List-Received-Date: Sun, 17 Jan 2016 11:15:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When RM_OLD_IMAGE is set, old manifest files should be removed
along with old image files and our QA tests expect this.

This patch ensures this happens.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 96d3051..970e9f3 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -219,6 +219,9 @@ python write_image_manifest () {
     if manifest_name is not None and os.path.exists(manifest_name):
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
         if os.path.exists(manifest_link):
+            if d.getVar('RM_OLD_IMAGE', True) == "1" and \
+                    os.path.exists(os.path.realpath(manifest_link)):
+                os.remove(os.path.realpath(manifest_link))
             os.remove(manifest_link)
         os.symlink(os.path.basename(manifest_name), manifest_link)
 }



