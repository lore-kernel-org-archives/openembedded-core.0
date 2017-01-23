Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0425E73D46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:55:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r126so26996327wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BRNcNhUZ8z8XbTHiF7YigjUuFOH1yVGLR3LAkxvDYno=;
	b=scBFy20M7ejKO7RfSO/2UnoZs5w/oAMjmKdffzk/RiYLUH19ZO/MchY3vt7gtgXMZX
	Kc2r6sa9JWbP7OiZfjFta3gMUBZCik/3+3JX/Rieh62bcd8p7Fs090JfytRRI6m5VU+k
	Tt18UCbYx5Z/8pHbxinlQLBgjn7b+rEFOUexSXjJig1YLdyn649zyMlVWh7EsgH80Ya/
	lDOJzVNoT1ki0Lgp8v0k5Es+juhuRReVQgqSBfoTTjjJvBWh+rdbrAJnu98J8CZ7k6PC
	Hgz7YIntTrVlIodSPBNOv+bZbzsS6BEXwAZXJHGByn837tgD9pbnsfPMyeHn6SsaIm+M
	EiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BRNcNhUZ8z8XbTHiF7YigjUuFOH1yVGLR3LAkxvDYno=;
	b=kmAds2rd8sg2EURZ1k4o4iBVF+9NKz1XlYpHUBPbAOJ9r+nHmuyftN22zTh1K2ft/0
	Wyjts1Rlu2t7YnMKD3ae+tjQRcDIFl4KNUsEqP/OsKtYns9nASsDZ06XUCFw3Q51hkmy
	WIt29mKkMwEAR7NAcksJ29lpEKc2oHAD/008kSZHMOsJy1g/PUHeyqd/7V6pk+Wd/y2c
	bGJBMJ8oN1URxyIuTJznZMD0xw+jvr3zzI6jncSkI91nT4TnIif0KBbxNLrBDBvL45gP
	jKkSFpI4s/1+ONs45woGVONb3Po0Zdp647MAdA0QO0sQbVdQ0/peyNoTX0R2pwHT2kuW
	mKMw==
X-Gm-Message-State: AIkVDXLEPRu4Ubt6PwkcBk9kgH6jBZ9/Y4hD4AQEagIQC6X9ycf3xfnN/lmU269PdAxCbA==
X-Received: by 10.28.131.72 with SMTP id f69mr15291592wmd.140.1485183358979;
	Mon, 23 Jan 2017 06:55:58 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	q5sm15129433wrd.32.2017.01.23.06.55.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:55:58 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:55:04 +0100
Message-Id: <20170123145508.9252-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/4] openssh: Make sshd-config a package
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
X-List-Received-Date: Mon, 23 Jan 2017 14:56:02 -0000

This series of patch introduces a new way of modifying OpenSSH sshd
configuration. Instead of modifying the files and launching the server with
custom options, a package which RPROVIDES sshd-config must be installed.

The package to use is selected using a new variable called SSHD_CONFIG which is
used exclusively when selecting ssh-server-openssh in IMAGE_FEATURES.

David Vincent (4):
  openssh: Package server configuration
  core-image: Set default sshd configuration
  rootfs-postcommands: Modify ssh-related commands
  ref-manual: Add SSHD_CONFIG

 documentation/ref-manual/ref-variables.xml         | 21 ++++++++++
 meta/classes/core-image.bbclass                    |  3 +-
 meta/classes/rootfs-postcommands.bbclass           | 28 ++++---------
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb | 47 ++++++++++++++++++----
 4 files changed, 70 insertions(+), 29 deletions(-)

-- 
2.11.0


