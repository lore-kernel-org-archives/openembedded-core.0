Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47021C54E6A
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:19:12 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.666.1710177546010535894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=kMe9fQV4;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHJ3vR107331
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:19:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710177543;
	bh=6iTXxwz5if2BUiPgtinO/bQ0O+VbZsUzn8i18D/eUJc=; l=3362;
	h=From:To:Cc:Subject:Date;
	b=kMe9fQV4nhmylVVkiCCSQysax1SoY06exvnvSmJEcnawA9+K5l8k6m59Bo+ESnV6m
	 ZbgfWNyycFNNnbww/JvGG5Iqzs0Bobe68xaU8k4MumGH1x05qSYitvNVV/3Hr0fsdj
	 MyE3GHIUOR9KAWyr4Qab0c9+ojQdwM7ofcjwShSObKpi78TbJFrzY+TKMxcnUkUfnK
	 X6xS1EKCQrIHgkyBMS04JKk8NuLp29X5zoFtpDwk6cxRttVd9+QRc3Ptyq2eO9+Dmn
	 e+9KaTRIhTiHTi003K7Dq17m4xq0mmUj/Vm9mB0D6vTVzlddRnXcRLjaywjtpkX2Dg
	 Vy4jWcKH/CM0A==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BHJ0K3279263
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 18:19:00 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id BIUPYURXS6; Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHIxXh164810
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjjIh-00000008xuH-0VKb;
	Mon, 11 Mar 2024 18:18:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 0/7] Replace sshd_config patching by snippets
Date: Mon, 11 Mar 2024 18:18:41 +0100
Message-ID: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef3d03b121c496daa8ef70
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196955

To deal with system setups, sshd was configured in the following way:

 - sshd_config is shipped completely by OE and DISTRO_FEATURES (pam,
   x11) are patched in during do_install

   --> this is difficulty to maintain; e.g. sshd_config must be
       synchronized between OpenSSH releases and OE adaptations
       manually inserted

 - two different configuration files (sshd_config + sshd_config_readonly)
   are created; IMAGE_FEATURES decides which one is used and it is patched
   in a ROOTFS_COMMAND in the system

   --> this make it difficult for third party recipes to incorporate
       their changes (they have to go over both files)

   --> the readonly HostKey locations and algorithms are hardcoded
       which makes it difficult to place them e.g. on a persistent
       /opt partition and disable e.g. ecdsa

 - depending on IMAGE_FEATURES (empty passwords, root login), both
   files are patched by a ROOTFS_POSTCOMMAND

   --> these changes are lost when pkgmgmt is used for the image and
       openssh being updated


The patchset:

 - reduces changes to sshd_config to

   | Include /etc/ssh/sshd_config.d/*.conf

   --> This is already the done in current recipe and most mainline
       Linux distributions are doing it

 - moves configuration in new openssh-config recipe which is a weak
   dependency of openssh (and can be replaced by another IMAGE_INSTALL)

   Recipe ships configuration as small snippets which might contain
   dynamically created content (e.g. 'UsePAM yes')

 - IMAGE_FEATURE based setup is done by creating subpackages with
   the corresponding options.  These subpackages are added to
   FEATURE_PACKAGES_ssh-server-openssh

 - readonly rootfs setup has been enhanced by

   | RO_KEYDIR ??= "/var/run/ssh"
   | KEY_ALGORITHMS ??= "rsa ecdsa ed25519"

   parameters which can be overridden.


Enrico Scholz (7):
  openssh: replace complete configuration files by patch
  openssh-config: initial checkin
  openssh: move configuration tweaking in configuration recipe
  image: prepare openssh configuration
  openssh: replace 'allow-empty-password' rootfs scipt by configuration
  openssh: replace 'allow-root-login' rootfs scipt by configuration
  openssh: move read-only-rootfs setup in configuration snippet

 meta/classes-recipe/core-image.bbclass        |  19 ++-
 .../rootfs-postcommands.bbclass               |  25 +---
 .../openssh/openssh-config.bb                 |  51 ++++++++
 .../60-allow-empty-password.conf              |   1 +
 .../openssh-config/60-allow-root-login.conf   |   1 +
 .../openssh/openssh-config/80-oe.conf         |   5 +
 .../openssh/openssh/include-conf.patch        |  32 +++++
 .../openssh/openssh/ssh_config                |  48 -------
 .../openssh/openssh/sshd_config               | 119 ------------------
 .../openssh/openssh_9.6p1.bb                  |  20 +--
 10 files changed, 112 insertions(+), 209 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-config.bb
 create mode 100644 meta/recipes-connectivity/openssh/openssh-config/60-allow-empty-password.conf
 create mode 100644 meta/recipes-connectivity/openssh/openssh-config/60-allow-root-login.conf
 create mode 100644 meta/recipes-connectivity/openssh/openssh-config/80-oe.conf
 create mode 100644 meta/recipes-connectivity/openssh/openssh/include-conf.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/ssh_config
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/sshd_config

-- 
2.44.0


