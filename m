Return-Path: <net147@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id DCEF860173
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:17:38 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id rr13so3688268pbb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JwVEXRs2+Z5C4frAuVvuyRET2h7Uc3vQvrK2y/UTu8Y=;
	b=ZPRFuMW3QZTaQBb+3mKocz9UL/jBM5BSj6a3h9iQg2xdIAljxmKrbfvB/FXBPVqifQ
	4OMnJ3w2Vdt3nCYl63vEA7uGJv1gewStcvwL4re8O46Esm4iIOltDucV0VjO+5K7YzM1
	jd/XMjX5amAYa67DiLe2epSh6jJsonSdeUM5hbPgGhoP7aifkCwOdI/DPxkmjtxiAH/P
	x1amh3K1L9rtdjKVAAJR9Tex0yeVyy4GdaCnov3vcTliVSwZPhiH3RmC//uZyvfTTdY4
	YG8kAkYSRwV/nsIZf6rEzQb+Mfr9Cm5Wno+JT3Pk/GCPUYry6vpb3Y0nLNokfGYDA6Vt
	DrLg==
X-Received: by 10.66.241.66 with SMTP id wg2mr18048752pac.132.1397117858950;
	Thu, 10 Apr 2014 01:17:38 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ja8sm7431798pbd.3.2014.04.10.01.17.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 01:17:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2014 18:24:19 +1000
Message-Id: <1397118259-4086-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] image.bbclass: improve sed expressions for ssh_allow_empty_password()
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
X-List-Received-Date: Thu, 10 Apr 2014 08:17:39 -0000

The sed expression was also replacing documentation text containing
PermitRootLogin in the line so "PermitRootLogin yes" was specified
twice.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 32df01d..79de5a2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -285,8 +285,8 @@ zap_empty_root_password () {
 # allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
 ssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-		sed -i 's#.*PermitRootLogin.*#PermitRootLogin yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
-		sed -i 's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+		sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+		sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
 	fi
 
 	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
-- 
1.9.1


