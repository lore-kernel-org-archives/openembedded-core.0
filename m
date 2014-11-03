Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3ED6FCA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:13:55 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id z12so566090lbi.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 02:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KuOY5hNSGmzxZNM2WKEYmm7A0L6gT4KDsvO+PfsXaGQ=;
	b=ZnZvG1vvW6tmf47y1x2WyC99U2hTmc8/l75zQUwpXmvlitPnXz1/bYaDCcNw+yMiaN
	MuDaiWldE9dRCtVV/p8tnytlHHJSSh9dD2Aez04S9O1KcJfVhQWZQpVoAgCGY0qgN+H0
	xoVqaXq96JqenZ4qaQYZFmqmLmoExXxpXf1lQYvVK+tf614qx2GhpspWjPj3ZHjbkrso
	2fSinVcjctAObnZ8q1AfI+Pa+1b2FrzxqTDO0YmLugSNxkYjAJg/ZXl7NDIHVKUbU9Ip
	bpBC+uQYm68FJh4V4q7OCgsvWgyiT2EaHJXTuIKYRZhQZ9+Pk6tI47W2znBZcCKiogqk
	25bA==
X-Received: by 10.113.5.7 with SMTP id ci7mr50548780lbd.9.1415009634572;
	Mon, 03 Nov 2014 02:13:54 -0800 (PST)
Received: from neopili.fritz.box
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id l1sm2239300lbd.32.2014.11.03.02.13.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Nov 2014 02:13:53 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Mon,  3 Nov 2014 11:13:49 +0100
Message-Id: <1415009631-13851-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [PATCH 0/2] Add missing running depency of apt-key
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
X-List-Received-Date: Mon, 03 Nov 2014 10:13:56 -0000

apt-file calls run-parts with options --list and --regex

root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/work/bobcat_64-poky-linux/apt/0.9.9.4-r0/apt-0.9.9.4# grep run-parts cmdline/apt-key -rn 
187:		for trusted in $(run-parts --list $TRUSTEDPARTS --regex '^.*\.gpg$'); do


busybox implementation of run-parts does not support --regex. And --list option is not enabled on yocto busybox configuration.

Adding recipe debianutils from meta-oe fixes the issue.

This fixes bug #6924

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6924

Ricardo Ribalda Delgado (2):
  debianutils: Add recipe from meta-oe
  apt: Add missing running depency debianutils

 meta/recipes-devtools/apt/apt_0.9.9.4.bb           |  2 +-
 .../recipes-support/debianutils/debianutils_4.4.bb | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/debianutils/debianutils_4.4.bb

-- 
2.1.1


