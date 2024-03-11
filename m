Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3815DC54E68
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:19:12 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.625.1710177548700851030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=mb+VVZNY;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHJ7gj166683
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:19:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710177547;
	bh=ro9IudAkgFjqPllF9qSXqIiiJLHbpf1VcVxS8NwTe5c=; l=3137;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mb+VVZNYnR2v3bF43BobfhPRbBkQiVtqc6LboHQYDAmawVuAt6MgrNdIWBvxAHUt9
	 Sqd2+1+hGdLFdk1zJrQ1wejkdEDDoVJ8CwbEPbJw1PptHGUyvewC45Tk3abdWwWMFv
	 CF/qDThrtnba/ZS0vbFsynEkIErw2XBrM9SOhsbrp8EJ98YCvDxFbGDWghh99vmdd2
	 5nBJiQxjXuh342LnCBWXTul8kSiIfV4sfFC49kircNuz2lnW/EBCIqu29LWYLRY96s
	 gf0nO8t0F4ctSQe0b4i9+IYUpQ/+6CbQqOeXhfjfYpIx//aGn7TzmKDPsPP1eBV1hf
	 TDAOBJ5AVEuAQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BHIx9l279254
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 18:19:00 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id AP636QMJDF; Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHIxn9164813
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjjIh-00000008xuX-1Vi0;
	Mon, 11 Mar 2024 18:18:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 5/7] openssh: replace 'allow-empty-password' rootfs scipt by configuration
Date: Mon, 11 Mar 2024 18:18:46 +0100
Message-ID: <d0b6498a823c9f17c71c1bcbaa718db9790e3b25.1710177387.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef3d03b121c496daa8ef74
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196956

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Install 'openssh-config-allow-empty-password' when corresponding
IMAGE_FEATURES are active.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-recipe/core-image.bbclass                      | 1 +
 meta/classes-recipe/rootfs-postcommands.bbclass             | 6 ------
 meta/recipes-connectivity/openssh/openssh-config.bb         | 2 ++
 .../openssh/openssh-config/60-allow-empty-password.conf     | 1 +
 4 files changed, 4 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-config/60-allow-empty-password.conf

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index adf236e0693e..63e0e99b2a56 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -84,6 +84,7 @@ CORE_IMAGE_EXTRA_INSTALL ?= ""
 IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
 OPENSSH_FEATURE_CONFIGURATION = "\
+    ${@bb.utils.contains_any('IMAGE_FEATURES', [ 'debug-tweaks', 'allow-empty-password' ], 'openssh-config-allow-empty-password', '',d)} \
 "
 
 inherit image
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index e81b69a239b5..88f88505b5ed 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -246,12 +246,6 @@ zap_empty_root_password () {
 # allow dropbear/openssh to accept logins from accounts with an empty password string
 #
 ssh_allow_empty_password () {
-	for config in sshd_config sshd_config_readonly; do
-		if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config ]; then
-			sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
-		fi
-	done
-
 	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
 		if grep -q DROPBEAR_EXTRA_ARGS ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2>/dev/null ; then
 			if ! grep -q "DROPBEAR_EXTRA_ARGS=.*-B" ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear ; then
diff --git a/meta/recipes-connectivity/openssh/openssh-config.bb b/meta/recipes-connectivity/openssh/openssh-config.bb
index 312a1c903f63..20dfe086f8ab 100644
--- a/meta/recipes-connectivity/openssh/openssh-config.bb
+++ b/meta/recipes-connectivity/openssh/openssh-config.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "\
+    file://60-allow-empty-password.conf \
     file://80-oe.conf \
 "
 
@@ -11,6 +12,7 @@ do_install() {
     d=${D}${sysconfdir}/ssh/sshd_config.d
     install -d "$d"
     install -p -m 0644 \
+        ${WORKDIR}/60-allow-empty-password.conf \
         ${WORKDIR}/80-oe.conf \
         "$d"/
 
diff --git a/meta/recipes-connectivity/openssh/openssh-config/60-allow-empty-password.conf b/meta/recipes-connectivity/openssh/openssh-config/60-allow-empty-password.conf
new file mode 100644
index 000000000000..04e75ab6cefa
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-config/60-allow-empty-password.conf
@@ -0,0 +1 @@
+PermitEmptyPasswords yes
-- 
2.44.0


