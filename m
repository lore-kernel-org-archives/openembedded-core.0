Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143E3C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:19:12 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.626.1710177550583664897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=eYNcd33S;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHJ8vQ107339
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:19:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710177549;
	bh=If8iq1JlfkrcWIWrFLFZWSQo7lDVj0CzSasoygqGluA=; l=3150;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eYNcd33SAnlQYbr2xjpnYBjcI6qOSaWA9xHnhBFD/mGs/tQN7i0k02A8ZvFdAsF3k
	 nuOL+ggKvKSMI+bkE4tknm9XNMKVVGIP9Hsx9XtMLIX+ypwmeIM0fR9arrrgDvXnX+
	 gVrdls8dhq2YzBv9lf+XCH3TFGq3+WrHwmYT1xXU/bSl4jv0IaNj/2AyrglM2t+Urv
	 lYzrZuD6KPAK3wa+VJHTcj1RJWAoZSWtGR0YNS3+zLOS6bnxyarzT5Ppxj8dF3gTKw
	 Uqin7fmKd1Yi0xoisCc/l1/aklvuk6NLOUDxRLP5p76fp7HDy4nBSy5zjspR8m2jdU
	 l+Nd7qEmvMXsA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BHJ0HG211298
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 18:19:02 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 652T3PVFF6; Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHIxup164820
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjjIh-00000008xua-1hBJ;
	Mon, 11 Mar 2024 18:18:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 6/7] openssh: replace 'allow-root-login' rootfs scipt by configuration
Date: Mon, 11 Mar 2024 18:18:47 +0100
Message-ID: <2ac1ebb744fa62cd2e8691070d6af440b186c315.1710177387.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef3d03b121c496daa8ef79
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196958

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Install 'openssh-config-allow-root-login' when corresponding
IMAGE_FEATURES are active.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-recipe/core-image.bbclass                      | 1 +
 meta/classes-recipe/rootfs-postcommands.bbclass             | 6 ------
 meta/recipes-connectivity/openssh/openssh-config.bb         | 2 ++
 .../openssh/openssh-config/60-allow-root-login.conf         | 1 +
 4 files changed, 4 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-config/60-allow-root-login.conf

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index 63e0e99b2a56..10a2905d9a27 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -85,6 +85,7 @@ IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
 OPENSSH_FEATURE_CONFIGURATION = "\
     ${@bb.utils.contains_any('IMAGE_FEATURES', [ 'debug-tweaks', 'allow-empty-password' ], 'openssh-config-allow-empty-password', '',d)} \
+    ${@bb.utils.contains_any('IMAGE_FEATURES', [ 'debug-tweaks', 'allow-root-login' ], 'openssh-config-allow-root-login', '',d)} \
 "
 
 inherit image
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 88f88505b5ed..633f88de6ec8 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -268,12 +268,6 @@ ssh_allow_empty_password () {
 # allow dropbear/openssh to accept root logins
 #
 ssh_allow_root_login () {
-	for config in sshd_config sshd_config_readonly; do
-		if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config ]; then
-			sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
-		fi
-	done
-
 	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
 		if grep -q DROPBEAR_EXTRA_ARGS ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2>/dev/null ; then
 			sed -i '/^DROPBEAR_EXTRA_ARGS=/ s/-w//' ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
diff --git a/meta/recipes-connectivity/openssh/openssh-config.bb b/meta/recipes-connectivity/openssh/openssh-config.bb
index 20dfe086f8ab..d4ed661d8299 100644
--- a/meta/recipes-connectivity/openssh/openssh-config.bb
+++ b/meta/recipes-connectivity/openssh/openssh-config.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "\
     file://60-allow-empty-password.conf \
+    file://60-allow-root-login.conf \
     file://80-oe.conf \
 "
 
@@ -13,6 +14,7 @@ do_install() {
     install -d "$d"
     install -p -m 0644 \
         ${WORKDIR}/60-allow-empty-password.conf \
+        ${WORKDIR}/60-allow-root-login.conf \
         ${WORKDIR}/80-oe.conf \
         "$d"/
 
diff --git a/meta/recipes-connectivity/openssh/openssh-config/60-allow-root-login.conf b/meta/recipes-connectivity/openssh/openssh-config/60-allow-root-login.conf
new file mode 100644
index 000000000000..1073982f77c1
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-config/60-allow-root-login.conf
@@ -0,0 +1 @@
+PermitRootLogin yes
-- 
2.44.0


