Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0526FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 04:00:23 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x64so55750778qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 21:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WYjhRdzSXOPORCRyA/8NOrnuyYPApmGgB0Fe1pcOn7c=;
	b=D+oZ5FmqD+Znkc+NqWhEzIYdWLyMECVOWGFhmJ1y52MR/XKevAAGcf4M0bwepO7WL7
	OX9oBk44Xcfjjbystf/+8sXWO+GIRNJ0nozkJrRvZQ+WqP/F1yfLpgTrGBWHJ37UFWHw
	l0Td/c7ZOrPlHSK83nSeq3xPNQtOzO13kbQZySr8AbbkUsWghQBYgIedokqNEDbP6Lqi
	6/n419DyWa1vhf2uzCPP2no6gJBTJXbFo7NGtFzSET1yViRNoa5lbpQqXz7QTJvuTfEr
	6N5bgp3/2gEEy0TI2xQYXhd0lLYT4w4h/fvfoOUmLmESADTGoE2zPpelo8RIp8VHanQ5
	4www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WYjhRdzSXOPORCRyA/8NOrnuyYPApmGgB0Fe1pcOn7c=;
	b=IRw4QYY9wnLcqvjC5A2CR5SfMSoRGLe1m2CjGHmz3rfqvIrpjwPpt+HBA4atvYvBIr
	ZJntym4Lal2lOyZJIonhFEiFIjPSevSXs9TJQv5RrGPjcj4RzPXlZUjiCezdt9RmS9I0
	jzw8D3s+tu2ArOOqs2E6ac7RkPNza50VY/cJDzS+JSfoC+6auyIFo2tWmoLNxel794LW
	/cyfI8JTFWy4O4r+0VrG2AqIE0YmZPsfPyDTWrRzWainBAz9uxba+9GDbq6ssGZYGM84
	0CZc6t80n1qgmkM/MANO+NkjOQPYdb2q6R1LOoXY76BcDfKtUo+NlSn5oPzi4ARHD7r6
	/vgg==
X-Gm-Message-State: AD7BkJL6yG1sp0jURYA5A1w5oOAuzHDzET6W4+H4FxB4zQbWuv59BZX+ey3f/2/N37vjGw==
X-Received: by 10.55.77.216 with SMTP id a207mr32366036qkb.80.1459137623590;
	Sun, 27 Mar 2016 21:00:23 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	i46sm11057224qgd.19.2016.03.27.21.00.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Mar 2016 21:00:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 04:00:13 +0000
Message-Id: <cover.1459137452.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/3] musl update, gcc fix for ssp on musl
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
X-List-Received-Date: Mon, 28 Mar 2016 04:00:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series bring musl to tip of tree.
backports gcc fixes to fix libssp detection on musl
as well as unwinding
64bit musl targets e.g. mips64 did not define sitefiles
correctly, as a result applications were failing to compile
e.g. python-pygobject was getting incorrect sizeof ssize_t

Khem Raj (3):
  musl: Update to tip
  siteinfo: Fix musl 64bit targets
  gcc: Backport fixes for musl ssp configuration

 meta/classes/siteinfo.bbclass                      |  7 +-
 meta/recipes-core/musl/musl.inc                    |  2 +-
 meta/recipes-core/musl/musl_git.bb                 |  2 +-
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +-
 ...-provide-ssp-and-gcc_cv_target_dl_iterate.patch | 85 ++++++++++++++++++++++
 .../gcc/gcc-5.3/0057-unwind-fix-for-musl.patch     | 42 +++++++++++
 6 files changed, 136 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0057-unwind-fix-for-musl.patch

-- 
1.8.3.1


