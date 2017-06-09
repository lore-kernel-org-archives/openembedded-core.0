Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 55BD678287
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 07:05:10 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g76so5523191wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 00:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BlRcOFptyQRyNHDgimzDr/fCG/tPwP4dqPQYtga2meQ=;
	b=hdXb7NbsslST3Rwhkp3E8eAyR6/gBEps3FPcWUAHANFnI4txCwe9Rh50iIt3LajoEs
	jhxm9DkE9tHmUvlnugPsuTNgMa5rd7+4p8JVo0D28v5um7ewjomSKBEZ/GkA+PK1o80p
	Jx+qJwVjBX5vfTv8qGi9PgvDzPHfdwgyqt4fQ7jOZqrjPP2NVGD8OGevU3DFQb3wFC2G
	GqlNrUmYfXCk0DnyzmAek2dgY+1DAR1+qr/Jvfa04Dv1X15Zv7SUm2q6LkM9swfVYM9f
	66DgLm7WA8aJIYFcsCjsNSyYCG/4dck/bB8D2QJUNlRMpdXCGP3+XUpvOt1D8zr8fHLw
	PxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BlRcOFptyQRyNHDgimzDr/fCG/tPwP4dqPQYtga2meQ=;
	b=pyYbdLzI4NtPvDLemK7XbLwnPndiBVdJNzQ+lWlHHxh3rpusUfxPxbslOYpurS8mNL
	8E1sWiEX8DMSzk2DHHTr/KzzDW1tFWCYeaOTZ65hejGwi6I2T/dqhHWagiypi8Lky/3s
	BI03Bu5AqqUjUxfDeuqIUlSopRhsePTDVHfIyF7eO152g00HOZI63PFgcvAGfiJFuLiA
	PX48EpF1o7zyE00ns1zjcLf81lu49DxYiMbBPXjcYUkoaIofCmg5p/xTTy53d71kfrQG
	hPKBHrEwSL4d6OMLkqP1tyVMEoFwh5dix/HIGZJvRacu9AU6O+7USpytCgoJ0Yrsg3vn
	lcaA==
X-Gm-Message-State: AODbwcAMdAlfNrd7raExxC1ZPDpsAx/g5hgKVigZwt/RKcgZ5gvSs3L5
	/ljvIjU7CP2I557Aass=
X-Received: by 10.223.171.24 with SMTP id q24mr23798644wrc.89.1496991911687;
	Fri, 09 Jun 2017 00:05:11 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id 62sm304574wra.44.2017.06.09.00.05.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 00:05:11 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 09:04:28 +0200
Message-Id: <20170609070429.17376-3-freesilicon@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170609070429.17376-1-freesilicon@gmail.com>
References: <20170609070429.17376-1-freesilicon@gmail.com>
Subject: [PATCH RESEND 2/3] core-image: Set default sshd configuration
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
X-List-Received-Date: Fri, 09 Jun 2017 07:05:11 -0000

When selecting OpenSSH as ssh server provider instead of dropbear, also
install the correct configuration depending on whether the final rootfs
is read-only or not.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/core-image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index a9a2cec68f..77f3c19494 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -45,7 +45,7 @@ FEATURE_PACKAGES_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone
 FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server"
 FEATURE_PACKAGES_nfs-client = "packagegroup-core-nfs-client"
 FEATURE_PACKAGES_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
-FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh"
+FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh ${SSHD_CONFIG}"
 FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"
 
 
@@ -56,6 +56,7 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
 
+SSHD_CONFIG ??= "${@bb.utils.contains('IMAGE_FEATURES','read-only-rootfs','openssh-sshd-config-readonly','openssh-sshd-config',d)}"
 MACHINE_HWCODECS ??= ""
 
 CORE_IMAGE_BASE_INSTALL = '\
-- 
2.13.0


