Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EDA7771C9A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 10:31:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u63so3297498wmu.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 02:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0K0bA4WfkcvwadjQ6JBTeVUpdYn3fmvbX/jFX6ophMM=;
	b=g//LKgIKIuK+O9AcWehDGCCZ8iDHpKZHZ+WS6AAzHtasgWMkQkxdMbNhn8GDL1JqT4
	IxaerXGRYjwhAur580fF0LBL006TcH6iJKhMBKcMTuuQ9yX8cGqVfTk15SF2Cud1ppUn
	/y8eJNDai9diGOFyTMiG4vhkoi7z/2lFXkBo/5zy4meMgo5vyJoypAgIKyoIigvdxmh8
	sI3moh4KZteF2TdaI/LPO0SFBJ35/+xLfXKlwHN8q/0455IgK75e1JIq3HXOEWKcaT+f
	Te93Qo1zGtS2fSnrij1QjcdYL8uA7yxumEeSLIg4PrNN6YrJ/oRQNpQRSWRmApS9ruE6
	XDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0K0bA4WfkcvwadjQ6JBTeVUpdYn3fmvbX/jFX6ophMM=;
	b=QuMhWVpiODUVpTuof0d063AulmM48J32d1MbDcDKPQwQsTAlgWSR+hUo4oUi2yHBGy
	LIwSMMjTON88oh6rI5Azo29TMENwcSDow5vY97gA0q+bgqZRgnlIy4W4mMuMWcKWd5AK
	bnL17fk8nYn3YH74oHx3kLzfKvqfcswUFxKmnEXr1oYwgvpp8WL1928i/vWgcGTanCLR
	RdIPlY6mJvbZSj925yitkFGIUK2o1NdY/1sj5ffnWe/wBDnOgH4/fm3I5IziKjV801Go
	DJPcmyKxnnW7ExXq5Bi0Cn6QovIOvPuL1+rJP08b942AmI/cpq4pQReSR17C0aedhKPd
	6AoQ==
X-Gm-Message-State: AIkVDXJ5gynSMq9ZjSFhLhZyhtWb0wR4DVy5rOSEqXHWlJZyV/nPJq8cKQWYXkwlDFppnw==
X-Received: by 10.28.150.202 with SMTP id y193mr7288051wmd.106.1486031509135; 
	Thu, 02 Feb 2017 02:31:49 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	a186sm34632192wmh.1.2017.02.02.02.31.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 02:31:48 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 11:30:41 +0100
Message-Id: <20170202103042.14571-3-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170202103042.14571-1-freesilicon@gmail.com>
References: <20170124090715.11646-1-freesilicon@gmail.com>
	<20170202103042.14571-1-freesilicon@gmail.com>
Subject: [PATCH v3 2/3] core-image: Set default sshd configuration
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
X-List-Received-Date: Thu, 02 Feb 2017 10:31:50 -0000

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


