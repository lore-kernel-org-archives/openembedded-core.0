Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 81757771D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 08:44:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r144so32962244wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 00:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0K0bA4WfkcvwadjQ6JBTeVUpdYn3fmvbX/jFX6ophMM=;
	b=lSO+aHW8BtvrC/rcvhWFlrvfIZ6Ua0gJMnNJjtHRIanRIzag1J882yiFVI12GpSgiU
	nUdFza/spY5aDufIYELgO0cymQ3xdCoZ2VSQuH/H5HUiwhS1IeLcnxe4fTgHxAs50YKz
	Didg0oB8ouziH5k4nhzjO3Nqw4XPljwoEvCpFTJxfq9bMOdeltKaiZNm35+2RnYMFGJd
	jTPrBsHZ7cKKR9ZH23UQwHYVtP7bigV6HON5JTkjGUcQwDo9/DIBZp9SVqhYoyEB0zK3
	I5PNP26i4AEmFjp7v8W5RXKFcK2fP9WvP6DsCbDmLsC9mOZuOTduwBqeyAsvwpEXv5qp
	q18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0K0bA4WfkcvwadjQ6JBTeVUpdYn3fmvbX/jFX6ophMM=;
	b=qUvjkjMt1z5HPEadCiCgCsKoX5tYyIMmPXs0QK4PbuTtAQiBBfolaPXJe+Ba5CaCnh
	74ZllKpu1PVYfCId7qdWrgU/OOS38o6/jWjcQWJ98jHkgs0RGlOyE6JlNcJookjxeyb6
	Phy7FRFmrsE31CjPOT7e9rKpnCAicroCvaLcS78R1ux5myQUFCca8jL/vu4zXJcnKY7E
	mnzXQtK/7JlGy8u/QLVbivbrEZ+++g48Ck+CeYf6FEt3kuXqVnWc+I/mnmb2j1RfkQND
	cdG01MQMceqBSu3TGulJY/K3ZsfrQg3oXPjhGXdQjPm2Ik6jrlt4kqWPP7qDc9svoaHT
	cnKA==
X-Gm-Message-State: AIkVDXIRey9hgP96P+GVqSWsI/cgTszMa+5n+qyQCFnWG9dTSYkvNz3gLTPHeuVjSZGrHQ==
X-Received: by 10.223.139.27 with SMTP id n27mr31251983wra.149.1485247453385; 
	Tue, 24 Jan 2017 00:44:13 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	l140sm25240314wmg.12.2017.01.24.00.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 00:44:12 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 09:43:13 +0100
Message-Id: <20170124084314.8046-3-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170124084314.8046-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<20170124084314.8046-1-freesilicon@gmail.com>
Subject: [PATCH 2/3] core-image: Set default sshd configuration
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
X-List-Received-Date: Tue, 24 Jan 2017 08:44:13 -0000

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


