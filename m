Return-Path: <flihp@twobit.us>
X-Greylist: delayed 2415 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 04 Jan 2015 00:32:02 UTC
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 83C81727CB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 00:32:02 +0000 (UTC)
Received: from c-50-185-54-102.hsd1.ca.comcast.net ([50.185.54.102]
	helo=scrapper.twobit.us)
	by smtp.twobit.us with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1Y7YSX-0002cU-Ef; Sat, 03 Jan 2015 23:50:26 +0000
From: Philip Tricca <flihp@twobit.us>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Jan 2015 23:52:10 +0000
Message-Id: <1420329130-19982-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 50.185.54.102
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH] image.bbclass: Catch readonly sshd config in ssh_allow_empty_password.
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
X-List-Received-Date: Sun, 04 Jan 2015 00:32:08 -0000

The ssh_allow_empty_password function modifies the standard sshd_config
file but not sshd_config_readonly. This patch uses a simple shell wildcard
to catch all openssh server config files so long as they're in /etc/ssh
and are named with the sshd_config prefix.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 meta/classes/image.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07e7f99..80c90f6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -323,8 +323,8 @@ zap_empty_root_password () {
 # allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
 ssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-		sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
-		sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+		sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config*
+		sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config*
 	fi
 
 	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
-- 
1.7.10.4


