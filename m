Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3E273201
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 09:08:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r144so33103427wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 01:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0K0bA4WfkcvwadjQ6JBTeVUpdYn3fmvbX/jFX6ophMM=;
	b=YZRoZeiVXnrGm5pnflXfw3dKWs/IZUfIOVN4DSeQ6NUjdeqKO2jVE/ZiieUxY0mEzJ
	5uCBXtAp/E9o2REwlWHKed7EPiy9XLBjpqp2t9yk/nL4PfWX/rPeEd13ec1Qun8Kd9uN
	EyN7S7qxOPeqQ3b24hoOuSutwCy+qXMVNPN0f443wRPCB+ynSipEiQOoqUUkdaEsS4pH
	Wzs2i3xheeuXa09/6ZX+p7DqZ8qcFnQ4zSh75vBDlW57J8IlHDvGWtbNrToG7RDEFy1N
	rK5wAAf7qpsjVnzZqWTcjNdibhp2GRwuj9snK47a1Dr2JhBIzmF5R7PG7E9eVbz9LpX2
	4gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0K0bA4WfkcvwadjQ6JBTeVUpdYn3fmvbX/jFX6ophMM=;
	b=DvdSd7jj/vK+bNcMxiZ7lgqHc/2U2rAeEDXdZTkHEiIHPDdg0rvyr1KBwWZJ4Kad+T
	iqFtCNHn9KZOiUgfjG7to5eDSPt5zaO650OtSEAKXJWCU2PF4OntjJ01Jmpw6iJMAW8G
	MiEUzn4kRg6Dk6FFnrWUOfabvTVC+fY32qCIMiDDEytNDBjn8n3SLywabyFWb5dj/QJU
	lpS/2asak6NdTy4M8yjBmwK2TYK29e4Vs+5P54YMBhcOfLygMmw0r5lZSG00nCQYLRWz
	XX7leMUhDdFq2EV2gmxGn4NwjnSAZMmEgjYcn9ycHuaCBgDEw4yRPwsuYrz/SDaU9e5q
	RU5g==
X-Gm-Message-State: AIkVDXLqyneVQeN/Xn4miM7545sbDwJwQi3lbz7v6thIutdbaD8AyIAeKtQMXaTH3UBgpA==
X-Received: by 10.223.148.2 with SMTP id 2mr30683199wrq.75.1485248884281;
	Tue, 24 Jan 2017 01:08:04 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	w70sm18781208wrc.47.2017.01.24.01.08.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 01:08:03 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 10:07:14 +0100
Message-Id: <20170124090715.11646-3-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170124090715.11646-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<20170124090715.11646-1-freesilicon@gmail.com>
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
X-List-Received-Date: Tue, 24 Jan 2017 09:08:04 -0000

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


