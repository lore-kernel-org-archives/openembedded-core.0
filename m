Return-Path: <net147@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id BAF0F77389
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 09:12:13 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id x65so49143983pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5fuKNcfiP6DSFpEradGUItnFH+IXHjWQJ3QgrNpPU7c=;
	b=p8ThnksW1jiH0b1a6M9ID4f/47Bx5CUIcxPxC8/HUqRFAgg9uH/HJb4atFFrbpQZk0
	zWTEelSi+9Absqop48Me2vuDrrhiZUjqEHlER4VsqlNaKnQSopwCrkRCVJ+q0pQVoiJN
	ZlKpNzGXTvKHnFzhjLkUfh0ROUN3um+3nBvxkQxzWcIRgqyUBdjEran3HW0rbM6+CR9c
	51MdepGJ9dVKBaupfVKjkX7O6s/96dU3822DKfJ/RRbVeKkjlr1muojktkq0U7j1fWD6
	Ed0fKUN93Dhamrm0HlJjn0Eo6RCvveYXj7Ouojcv8zGu8Ivn8+tU3iWf21kAn9XBMtxK
	RIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5fuKNcfiP6DSFpEradGUItnFH+IXHjWQJ3QgrNpPU7c=;
	b=GNxidKmTL+RAoLJGM5PjOVej72NjNigIIGaLc7wCXkQ/jZuy84sZWOgAQAvkApNzVO
	zg/LW6ABMGyQc+Uk7KLGR6U8db52pB3ymmacTr6c+LQUFHlI48cuxFZQffwBsk30mXPw
	6jrTKZQPXSSPOii/G66nqaSzdKXWUMILRL99dysDLR4S1KIACYUa3B+IMokZPqeOAIGc
	yn7C6Fq4/ODZEHqQdnkxFKHqy0yKKw4aL7/DtRpRluzSsGQAWjNQyco+o7Gou9wKs/ni
	3BUj+LehoKiE06vqfwLsmubnQTYioPmZwn/q1d/F5YaT+0NjTcDkkXPD96chQZM5AcOb
	/m1A==
X-Gm-Message-State: AD7BkJL3fG/8QMSHlRjxymQyKAg4Twr/84peWRfB9ve3OLHCbCzwCmEELiin+y3yje4ZiA==
X-Received: by 10.98.74.144 with SMTP id c16mr536342pfj.129.1456477933973;
	Fri, 26 Feb 2016 01:12:13 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	i13sm17695968pfi.95.2016.02.26.01.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 01:12:13 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 20:12:21 +1100
Message-Id: <1456477941-27719-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] rootfs-postcommands: fix ssh_allow_empty_password checking
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
X-List-Received-Date: Fri, 26 Feb 2016 09:12:13 -0000

The ssh_allow_empty_password function doesn't check if
sshd_config_readonly exists before running sed which can result in an
error if sshd_config exists but sshd_config_readonly doesn't.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index f5d6147..e184667 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -112,10 +112,12 @@ zap_empty_root_password () {
 # allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
 #
 ssh_allow_empty_password () {
-	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-		sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config_readonly
-		sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config_readonly
-	fi
+	for config in sshd_config sshd_config_readonly; do
+		if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config ]; then
+			sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
+			sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
+		fi
+	done
 
 	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
 		if grep -q DROPBEAR_EXTRA_ARGS ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2>/dev/null ; then
-- 
2.7.1


