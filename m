Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 03D6177456
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHgEAb019778; Fri, 27 Jan 2017 17:42:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ULW9jNxlLrku; Fri, 27 Jan 2017 17:42:15 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHg9W1019763
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 27 Jan 2017 17:42:10 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cXAXJ-0001WZ-NN; Fri, 27 Jan 2017 17:42:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 17:42:05 +0000
Message-Id: <1485538927-5797-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/7] staging: Drop common prefix WORKDIR from manifest files
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
X-List-Received-Date: Fri, 27 Jan 2017 17:42:18 -0000

Manifest files containing the same duplicated prefix are wasteful on space
and ultimately this costs build time. Drop the WORKDIR prefix from the manifest
files since this small change mounts up a lot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 1fe60ac..1b618fb 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -360,6 +360,7 @@ python extend_recipe_sysroot() {
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     mytaskname = d.getVar("BB_RUNTASK")
+    workdir = d.getVar("WORKDIR")
     #bb.warn(str(taskdepdata))
     pn = d.getVar("PN")
 
@@ -504,7 +505,7 @@ python extend_recipe_sysroot() {
                 continue
             else:
                 bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
-                sstate_clean_manifest(depdir + "/" + lnk, d)
+                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
                 os.unlink(depdir + "/" + c)
         elif os.path.lexists(depdir + "/" + c):
             os.unlink(depdir + "/" + c)
@@ -559,7 +560,7 @@ python extend_recipe_sysroot() {
                     else:
                         dest = staging_copyfile(l, destsysroot, fixme[''], postinsts, stagingdir)
                     if dest:
-                        m.write(dest + "\n")
+                        m.write(dest.replace(workdir + "/", "") + "\n")
 
     for f in fixme:
         if f == '':
-- 
2.7.4


