Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2EC7C587
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 20:58:51 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id c16so12950959lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H75GI7zHlYErR7lVt9E1s/jBotasAznOT91ZA9R1uTg=;
	b=DlPCNcTcLOnTYD512DaPJSNQPnQGYx1O9wAZsPoFYbSz32NAfF+cZ/AJ2i5HzTwvrM
	1N+KJEm9hFxAxF1BQstgsT54YrA4txZjcUfbT8TgjbRSr5c4VhZ8c0O51tyYvcBpQr/X
	LQA4qZrPFqkK0Vtd253kBXJMIUZQxQDEcCDwEFuBLwon+oJFMX4Bkhh+Dq16uSxTOuQf
	JohCW3Vk1wcwgToEYFXziPA1Y9RwP8yU/yryg8Oa65LYKX5lehH8/Va0EAO5XM1EusbI
	I3VTTJRpiqnpa10Z9Xwc4srxjEkcSpINq7PDywLpFlm2xBINmts3LNwM/DWjkra4TP/I
	X6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H75GI7zHlYErR7lVt9E1s/jBotasAznOT91ZA9R1uTg=;
	b=eJkTNH0qsH4Ww2mPcup74S98bmvMMXnRzdP7cNb6CIXTsFsPJKxhCt3tjNRVpENOZl
	dSrAkjSdE2xDYvOlAGpattKuR1bh3XrVhOAF+UBFhNY+W/LNA2Z0S3m9cKUH+qlju1i4
	PWqQbnBv6tOkGvb629sSrwD+ekdEptotDnji6/zcCyzCjTEQ12LhUiGk0yvHpHhXR5EE
	pgYhGIiJSpf0aDjze4X12xcJRsGuXTbokobrTwkKTesCPWIgXZ/607bF7zyn4LtTceEG
	M17c+SkaQZ4T7xibtScwtaL7numTp67r2LJakF8DVQlhiogzxpjJPCHdVBVn5Y9dwAC9
	e29w==
X-Gm-Message-State: AJcUukc3OvTsHe/FviwuR2q2HvW0wwCSO7mBglSXPAyUmkrtpqQahuiJ
	N3I/lX2XYLaSkNT1BdVvS0Doaben6vc=
X-Google-Smtp-Source: ALg8bN4fVN1e+9JCfYY+IotsUFIGEuWE8xSCJVbrEA9T0r9Lu8kkMDY5PKvEjFTNIj2DZ5GM/UbM3g==
X-Received: by 2002:a19:d90c:: with SMTP id q12mr18712224lfg.24.1548709131846; 
	Mon, 28 Jan 2019 12:58:51 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id w9sm3142340lfc.66.2019.01.28.12.58.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 12:58:51 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 21:58:42 +0100
Message-Id: <20190128205848.12834-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH v4 0/6] systemd patches
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
X-List-Received-Date: Mon, 28 Jan 2019 20:58:53 -0000
Content-Transfer-Encoding: 8bit

Changed in v4:
- add patch to make systemd-firstboot a non-default option to systemd to
  prevent unexpected prompts at runtime

Changed in v3:
- parameterize preset-file installation location (as suggested in patch
  review)

Changed in v2:
- address patchtest warnings:
  - include sign-offs on patches
  - include License-Update tag on patch that makes licensing change
- dropped patch implementing brute-force removal of unit files installed
  by systemd into /etc
- reworked the systemd-conf patch to restore the installation of the
  base systemd configuration files


**********

These patches make some modifications to systemd with the long-term goal
of being able to run OE in systemd's "stateless" configuration.
"Stateless" boils down to building an image with empty /etc and /var
directories so that volatile (tmpfs) filesystems can be mounted there;
this requires that the system subsequently be able to populate these
directories dynamically, which systemd mostly takes care of if things
are done right.

In these patches:
i)    Don't include machine-id in writable images so that systemd can run
its first-boot machinery
ii)   Move systemd configuration files out of /etc
iii)  Allow systemd to dynamically enable services and populate
/etc/systemd/system via the presets mechanism

There's a long way to go to get to a working "stateless" configuration.
Getting to a "volatile" system (just empty /var) should be easier and
I'll post patches moving things in that direction shortly.

/Jonas

Jonas Bonn (6):
  systemd: don't build firstboot by default
  systemd: do not create machine-id
  systemd-conf: simplify creation of machine-specific configuration
  systemd: create preset files instead of installing in image
  systemd-systemctl-native: simplify and support preset-all
  rootfs-postcommands: call preset-all for read-only-rootfs

 meta/classes/rootfs-postcommands.bbclass      |  8 +++
 meta/classes/systemd.bbclass                  | 33 ++++++------
 meta/recipes-core/systemd/systemd-conf.bb     | 53 ++++++++-----------
 .../systemd/systemd-systemctl/systemctl       | 36 +++----------
 meta/recipes-core/systemd/systemd_239.bb      | 18 +++----
 5 files changed, 62 insertions(+), 86 deletions(-)

-- 
2.19.1


