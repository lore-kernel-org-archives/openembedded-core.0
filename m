Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8980D6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 08:44:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so32954446wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 00:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rb7uMgkKB/cCWJHiRjqRyyK6gbCS7FT8GmXjFK05A+A=;
	b=QAXJeBU2GwFE58v2onnp2y4Y+RllKnbSM7Urwid56/pcvbywEw6vxn+zblQwV5NO3o
	40tHzt7fTZcMTJ3nypIUjacSw9OLaOPOv/gCs9VVM2o8f6zIDOHFxZz3un1Ia5ZxfxBz
	2PjeVeA4hyHl+ztTwtIN9Kv0KNSoLX+7WuZ9lIlwvm4oniJMgj1NItSOh6EIVipfXvrk
	Fl/Z5JiAgeOgq3lS0bEGt9sgyLqKtho93XU5c/SxmOgSAqo/kzAzZOtLEaWLpzFWUBy2
	Ihq3Jt8SOG7mSdjgN5SZhY5N2Px7NgumjScBlRslU41xOrts5MfMEzO3peiC2Uf5dXa6
	otcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rb7uMgkKB/cCWJHiRjqRyyK6gbCS7FT8GmXjFK05A+A=;
	b=St6afdLV+ZtnldAsBC4MemEK7/2RfrQrH7hu4AkBacRCm8/ijd3nOTN15N/fAtu+mu
	d61bPOaeCLWkfDLFEEEZrzeb/5igI6y2NjNWZDPzY2K2RJSuK+ErQJoJCgsgn8Hx0TwO
	hbTsmbhiSohKd2OZXYTdJe6A2LdR3m5y+bmMVPKnvTj3XUn2aBqOA8LDZzy37/aid8IU
	JAmniANhTdXUuYwMK5WT6q36R/2+u35J9V/So9Y+Roo7Ik0ZEcmn0jUcNKiv6VlBNALG
	KLG09qZvCQY2zw+5gMpeMtAc4IT4wTm9w/86BLubq759bktRAkz15J/3YwFkaex2Oi+w
	hj8Q==
X-Gm-Message-State: AIkVDXJxnti2oNSDrw+1emP0uAgoMSXcHzmDfpRYI6WlOdnroDgjRG6VKMhnlJKyrv4pvg==
X-Received: by 10.28.103.69 with SMTP id b66mr15968860wmc.73.1485247444070;
	Tue, 24 Jan 2017 00:44:04 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	l140sm25240314wmg.12.2017.01.24.00.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 00:44:03 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 09:43:11 +0100
Message-Id: <20170124084314.8046-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170123145508.9252-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
Subject: [PATCH 0/3] openssh: Make sshd-config a package
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
X-List-Received-Date: Tue, 24 Jan 2017 08:44:05 -0000

This series of patch introduces a new way of modifying OpenSSH sshd
configuration. Instead of modifying the files and launching the server with
custom options, a package which RPROVIDES sshd-config must be installed.

The package to use is selected using a new variable called SSHD_CONFIG which is
used exclusively when selecting ssh-server-openssh in IMAGE_FEATURES.

Changes since v2:
  Remove documentation

David Vincent (3):
  openssh: Package server configuration
  core-image: Set default sshd configuration
  rootfs-postcommands: Modify ssh-related commands

 meta/classes/core-image.bbclass                    |  3 +-
 meta/classes/rootfs-postcommands.bbclass           | 28 ++++---------
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb | 47 ++++++++++++++++++----
 3 files changed, 49 insertions(+), 29 deletions(-)

-- 
2.11.0


