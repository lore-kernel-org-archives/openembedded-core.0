Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A876C72AE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 23:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07Nih2u001750 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 23:44:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sz_AgycDiQOR
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 23:44:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07NiVfi001743
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 23:44:42 GMT
Message-ID: <1420674308.25779.77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Jan 2015 23:45:08 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] rm_work: Fix RM_WORK_EXCLUDE for image/sdk recipes
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
X-List-Received-Date: Wed, 07 Jan 2015 23:45:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

A previous change meant image/sdk recipes were removed unconditionally
by the class and did not respect RM_WORK_EXCLUDE. This fixes that
problem.

[YOCTO #7114]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 7b1ec17..e68d02a 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -110,3 +110,11 @@ rm_work_rootfs () {
 }
 rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
 
+python () {
+    # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
+    excludes = (d.getVar("RM_WORK_EXCLUDE", True) or "").split()
+    pn = d.getVar("PN", True)
+    if pn in excludes:
+        d.delVarFlag('rm_work_rootfs', 'cleandirs')
+        d.delVarFlag('rm_work_populatesdk', 'cleandirs')
+}



