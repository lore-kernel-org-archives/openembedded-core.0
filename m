Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 007D971C90
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 10:31:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so3185930wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 02:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CF6WJ7w0AMxNchUXDVEhBQGB+CYSevg3zpEKYj/iyyQ=;
	b=hiUqNQ0i6Wn3+IyLq3oopmw2dCm/RUmmpIdQw3Hlx5mUjwvGFoaswP0cyzNzkzzEXP
	gQFWaaYUXcAFjcMPCK3/HlHSNlSGUbd2SzdyFb5rBcuFX2Enr50h8pvOj3z3KfXO3D7I
	8A9DLTHI6D0Xao7OIxn+aa7N8xmkR0B5gk2D85qupDmoAJE3FIOjZeFmFVWlav+1x4L/
	cDQhlvgCrcaiRvoukmzwfCwLMpZ/7ih+7aBXt+GJMVBzCCjVS+DLG2LbFKvhYFfRktim
	FcYWRtt1ifZIVujmHBgWjhCCkmZZozncGbKiU/ZBaXZFsUIYXDD0gfkeh1P3O+ZTK8WG
	FGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CF6WJ7w0AMxNchUXDVEhBQGB+CYSevg3zpEKYj/iyyQ=;
	b=Lgdmht8nFATDJ7vjLhKRPA9p40zgYog779pZUmn3s4Kw8ZHVMbQDQdRvbqGSKJaNb9
	wdbxYzADYjwWNiGWe2ENzpDKTBaWiH+r+IYBEDx6yLySbxGeTF3M/fCpCLbP0LBdSHTY
	8sxn2OMINrggy+cBChqnuPnQj88km5opKfBBA3yKDMQvwXReB09EWn/pFyOGsmTS0MAR
	vb30+BHKEdR+txoXtPiBpjmjZ+QtwAUATdT/aD3xKWlvC3C7QvT0h16n7f/1sTCnwNjK
	1DxElVNvzK+Q6pep2TzO8Xa/v1XR3UbgUHdUOMcQtth0UhdCyLd8JtYaXrZt6RMYVkeE
	a1vg==
X-Gm-Message-State: AIkVDXLQU1/0OR1kKe+oXSSO0ilzdWnIn1XUTxP9lGhtuvLW4IvkaVMW3BJQUR0KsTI/NA==
X-Received: by 10.28.66.88 with SMTP id p85mr6606993wma.64.1486031507653;
	Thu, 02 Feb 2017 02:31:47 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	a186sm34632192wmh.1.2017.02.02.02.31.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 02:31:47 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 11:30:39 +0100
Message-Id: <20170202103042.14571-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170124090715.11646-1-freesilicon@gmail.com>
References: <20170124090715.11646-1-freesilicon@gmail.com>
Subject: [PATCH v3 0/3] openssh: Make sshd-config a package
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
X-List-Received-Date: Thu, 02 Feb 2017 10:31:49 -0000

This series of patch introduces a new way of modifying OpenSSH sshd
configuration. Instead of modifying the files and launching the server with
custom options, a package which RPROVIDES sshd-config must be installed.

The package to use is selected using a new variable called SSHD_CONFIG which is
used exclusively when selecting ssh-server-openssh in IMAGE_FEATURES.

Changes since v1:
  Remove documentation

Changes since v2:
  Restore SYSCONFDIR in /etc/default/ssh, otherwise keys are not correctly
  generated

David Vincent (3):
  openssh: Package server configuration
  core-image: Set default sshd configuration
  rootfs-postcommands: Modify ssh-related commands

 meta/classes/core-image.bbclass                    |  3 +-
 meta/classes/rootfs-postcommands.bbclass           | 17 +++-----
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb | 47 ++++++++++++++++++----
 3 files changed, 48 insertions(+), 19 deletions(-)

-- 
2.11.0


