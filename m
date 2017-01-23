Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0C352771DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:56:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d140so27053613wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0K0bA4WfkcvwadjQ6JBTeVUpdYn3fmvbX/jFX6ophMM=;
	b=CqM0W4yduOENRPNN0n7zrp49Llkoiq/lGn1JaGw7zoUEd6LFdPfqIYN7N5WDOe3Uqu
	jYStKdnjG/ISOcGugYyJFBHf1qFG5Kv6jUf/BjnQSpTrgXCuIOHQXYKi8LPD9Hq5/MMk
	60KplofjAizq+JO+9aJkE9eODZCAUSb3AGrIfQTaEw3vQEJVG/hpJ/2lK1ryrl52A4Lw
	IfkYE4+EY0Y1aukSNz+iDYn7K/8jQIS+n2RVXZqgZ84cK6Lb9nZpV3rywToiksxge8al
	h2GxLBdUDqGyvqNS620CJENUbZVzKgmO6v4f9bTM39RKSNKxyARlfKH+Nv0C9W7D7aqI
	E/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0K0bA4WfkcvwadjQ6JBTeVUpdYn3fmvbX/jFX6ophMM=;
	b=mWskk6nMoP9qz9DE4ry/GR0IYyCoSrjRWuX58W2L693TOETwpR9PaTFE+IQ+ufVPBk
	44HsuRvno37FhPhiYvH0D/EHOuPs99HxutnRkUJOsBRacQhPP1NQ5wsYWlI8hCXukpWM
	5rZdI/srfA3Oz7/DSyESTFL10HlgizLRYctS6nfZOkuWg68FupZEOZz4G16dZTfXkNEw
	mAoBTiP5u/frdZxIYW/1NCQYXDaSdH46yMsTBqRrt6rNfy3evV4TukNC0C8WkMC5iElJ
	ifWHS5neeNovqYBoms9hFoiXXpMiE5u3+IZ+sKIbOMxFGSyJ/skcYXmei96FR0+1YHI5
	2IBw==
X-Gm-Message-State: AIkVDXJ8tUz7Km77Ap7tgljF4yzpVVh0UfWh3FhB4jtelDNKoHn+Mz+i4SnyG7uEDsqMOQ==
X-Received: by 10.28.54.195 with SMTP id y64mr13259588wmh.10.1485183369315;
	Mon, 23 Jan 2017 06:56:09 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	q5sm15129433wrd.32.2017.01.23.06.56.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:56:08 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:55:06 +0100
Message-Id: <20170123145508.9252-3-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170123145508.9252-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
Subject: [PATCH 2/4] core-image: Set default sshd configuration
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
X-List-Received-Date: Mon, 23 Jan 2017 14:56:10 -0000

When selecting OpenSSH as ssh server provider instead of dropbear, also
install the correct configuration depending on whether the final rootfs
is read-only or not.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/core-image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 8431440db4..d1f643d920 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -41,7 +41,7 @@ FEATURE_PACKAGES_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone
 FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server"
 FEATURE_PACKAGES_nfs-client = "packagegroup-core-nfs-client"
 FEATURE_PACKAGES_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
-FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh"
+FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh ${SSHD_CONFIG}"
 FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"
 
 
@@ -52,6 +52,7 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
 
+SSHD_CONFIG ??= "${@bb.utils.contains('IMAGE_FEATURES','read-only-rootfs','openssh-sshd-config-readonly','openssh-sshd-config',d)}"
 MACHINE_HWCODECS ??= ""
 
 CORE_IMAGE_BASE_INSTALL = '\
-- 
2.11.0


