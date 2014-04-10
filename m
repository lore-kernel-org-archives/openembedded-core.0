Return-Path: <net147@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 04F9065D5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:18:06 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so3619705pbb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ivFUVEzWnLufUK7YaGVpl2wwmbNAECmpJCAfXlwkSr8=;
	b=uB5NdOplmWAXv/f/DAzdzxdYVpT+tod978xoJDn1BVgwxyuVpPjRMd86CmFcfzJN0h
	0PqvNvHhOipKsbzkCZYmh9PB5wUma8kv1VS7Zx+IP1Wt+8zjn8LorxeI9F8ETTK/PoEz
	8+N5Ui9ZjKk9ndb506XfnWNeneAT+ryhhwHenF9tCoUrZa1WVos8mcUzGkt7/SmPLCdk
	A1XffFE1W42LeqmZ+TsNXdyMnzHVa7nMrO7W4/038WoB/8nvOmWJ0cJpTGqM92Bk7GjG
	Ic7RvMCE3ABkqWTtnH9Kcw9hi7j01wW1b1MFS6P4U/TXL2jVkJtdAI2BVZDGW8exMP0q
	SSIQ==
X-Received: by 10.67.13.226 with SMTP id fb2mr18082210pad.146.1397117887892;
	Thu, 10 Apr 2014 01:18:07 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id jd5sm7415118pbb.18.2014.04.10.01.18.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 01:18:07 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2014 18:24:48 +1000
Message-Id: <1397118288-4173-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssh: fix sshd_config_readonly creation
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
X-List-Received-Date: Thu, 10 Apr 2014 08:18:07 -0000

The readonly sshd config sshd_config_readonly needs to be created from
the installed sshd_config as make install will adjust the paths in
the config file. This fixes the path for sftp-server being correct
in sshd_config but incorrect in sshd_config_readonly.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index 3496b4d..2c4da70 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -99,7 +99,7 @@ do_install_append () {
 
         # Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
-	install -m 644 ${WORKDIR}/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
+	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
-- 
1.9.1


