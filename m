Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4A4C54E60
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:19:22 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.670.1710177553529188444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=sI2AjGHY;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHJBO1107344
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:19:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710177552;
	bh=AmH8cYv60/0VMV7hB0AHahDoy7sc65jAX/35Qmp313g=; l=1260;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sI2AjGHY/LtKonBE31NuirmZ+kuF7DuzJCcO5WWwQwLERWAYdA6tYUcogL1XUL4EI
	 4m3MTlt2Fh+W3fZHsYMnYBX/o832jGBfh1c1/6rXYHjcKxqGCPMSmdYEaN84cEUzCh
	 I0JI6fIlQW+DZVgH8Y8Ui1m1hZ7L28wHhv6UwOj2x7R9UZQQhZLH0jWP/xaaY23Eg8
	 LO4bqnRTV+rhtJZYhZIn7/JdcX7AbJJqtImOUWNAtYZB8rnu/bh9alMj9FNFIMPC18
	 Q4FKNMu/Th6Q7Swet/P3/ZYdZvOW2hUORf1P2Ir+SgHOcFQ+1h6DnsbNOLdrSGh+5Q
	 DGmHyVmu8kCeQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BHJ0NP279267
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 18:19:02 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id LH3MV0R2K8; Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHIxs7164812
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjjIh-00000008xuU-1Lrd;
	Mon, 11 Mar 2024 18:18:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 4/7] image: prepare openssh configuration
Date: Mon, 11 Mar 2024 18:18:45 +0100
Message-ID: <5748988eada480a0d1db0546cfd95be6b2a1faf7.1710177387.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef3d03b121c496daa8ef72
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196959

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Add an OPENSSH_FEATURE_CONFIGURATION variable which will hold openssh
configuration packages.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-recipe/core-image.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index 40fc15cb04f2..adf236e0693e 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -55,7 +55,7 @@ FEATURE_PACKAGES_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone
 FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server"
 FEATURE_PACKAGES_nfs-client = "packagegroup-core-nfs-client"
 FEATURE_PACKAGES_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
-FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh"
+FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh ${OPENSSH_FEATURE_CONFIGURATION}"
 FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"
 
 
@@ -83,4 +83,7 @@ CORE_IMAGE_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
+OPENSSH_FEATURE_CONFIGURATION = "\
+"
+
 inherit image
-- 
2.44.0


