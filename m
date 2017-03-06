Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E31C577682
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 08:47:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n11so12493800wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 00:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B/+cmPQsZNf4KyaNN7kskl3pQDR6lRGERgB/jWCKV8A=;
	b=imFOc2aevFEVSewQJu2Nkrn4nYBX5/kxltP4HcuieoGcCYGN2OhO/5gSl0+xgdfkAk
	+j+Q+M4r75JKrl1n1r7WZM1amavjK1wCJru98+H7dUa0wvJK2cT7V156wyQUrqoORSat
	mgDHWjJ2ZC5FQ8lVFndsaUFsNaLpN3f0EAOTEyXs6S0K79gDl0gpuaAK9JL8p3Wj+8Rj
	wfzBu7Q4AUeTCkqUfnDM/005apyz48PPmaEGIq3hzyNjmM38ZE+tje5u2jCGX/RC/T3F
	xwtffcnyPpmaQowVDP88pVdOu3/PV5lamRAmCyFDp9PaylfBEXpLvRSQXHeydopWmA2u
	U/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B/+cmPQsZNf4KyaNN7kskl3pQDR6lRGERgB/jWCKV8A=;
	b=m11sxOPDaQ2ESLe1+VJ7DqQODc2WCIWNMocV5ebgT/5eftg+kDRYZ52Vp+oMnd9/Bq
	nJtBVZM9T14Pg0hltleclQni+QQ3tsbWTACgB/Zy2vYYSJSWYrZH9WTsmZirNfwXND3u
	iRLi45rNPonlysUfwuGayJNIu8MHVaKixRaMcSs1UNEQbVnn8kPuXpW/uQ4YifjO/9oW
	up6EuCauZQKtISQX56Jo6Q4nJn3GSxhjHR9FaFkLQZY09YZcv34BaumQB25ZXNAqZRRN
	tp2+oCg1Vy8NYvPmIS4V/RF6PoobF5R2OZF+3XdnxUTD74YW6YOmQCQ+93XzQakqCZ30
	Otgw==
X-Gm-Message-State: AMke39lLL0VF6gcImzsYwOohnGxCxV9yq/q1csDr9uvifwL5Eh7WXqG8kpybq+Yp6214Pg==
X-Received: by 10.28.146.207 with SMTP id u198mr12564353wmd.36.1488790066091; 
	Mon, 06 Mar 2017 00:47:46 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	x69sm13916067wma.15.2017.03.06.00.47.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 00:47:45 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 09:46:10 +0100
Message-Id: <20170306084611.12507-3-freesilicon@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170306084611.12507-1-freesilicon@gmail.com>
References: <20170306084611.12507-1-freesilicon@gmail.com>
Subject: [PATCH v4 2/3] core-image: Set default sshd configuration
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
X-List-Received-Date: Mon, 06 Mar 2017 08:47:45 -0000

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
2.12.0


