Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 799536014F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 21:46:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u38LkSq1008876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Apr 2016 14:46:29 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Apr 2016 14:46:28 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Apr 2016 17:46:26 -0400
Message-ID: <1460151987-17663-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] extrausers.bbclass: drop retry count for perform_user/group* calls
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
X-List-Received-Date: Fri, 08 Apr 2016 21:46:30 -0000
Content-Type: text/plain

Commit 2ebf697b46c42cee8bfa6d2e6087397f8cce385c [useradd_base.bbclass:
replace retry logic with flock] dropped the 3rd (retry) parameter for
these functions. These are simply being ignored now but we should
remove the retry count to avoid confusion.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/classes/extrausers.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index faf57b1..43900f3 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -33,22 +33,22 @@ set_user_group () {
 		# this setting is actually a serial process. So we only retry once.
 		case $cmd in
 			useradd)
-				perform_useradd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				perform_useradd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
 				;;
 			groupadd)
-				perform_groupadd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				perform_groupadd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
 				;;
 			userdel)
-				perform_userdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				perform_userdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
 				;;
 			groupdel)
-				perform_groupdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				perform_groupdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
 				;;
 			usermod)
-				perform_usermod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				perform_usermod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
 				;;
 			groupmod)
-				perform_groupmod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				perform_groupmod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
 				;;
 			*)
 				bbfatal "Invalid command in EXTRA_USERS_PARAMS: $cmd"
-- 
2.1.4


