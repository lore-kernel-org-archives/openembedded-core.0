Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D011865CC6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 13:13:53 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n11so46179251wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Rf/K4hsz2XWF6k/JhuM43KZqWRp7fkDqPXiycl1UHhU=;
	b=uhjBm5RGuuJ8i69ISZdqj36biIwtRLGeUqa8NkDZPB6gElXWhC/Uri/yP1m1MHvlEG
	Gf+tIqvrjfZ9LROaf5JcInlvLmyipFLv87dgmzNS0wHnTphr2Up+c4Vxw34o5/mhNTwB
	CxjHtsC2jdK9Bi5JFMU0LPA9MO5cbDWG39yW0cUh8kXEYkj3Jm0qskEveRdHd5DKLxVG
	fsar3jsMxZX0coE0mG7V3uvk9Gyhc6N6CsWDRzZYL9qzJERky4cReCbsPRBbParEqFka
	diIsYafEAASnkrcCheNwqMLn74GPV7IDJxGlg3MViaqd9WLzbEPAvYk9Y7EavMaRWWlr
	eY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rf/K4hsz2XWF6k/JhuM43KZqWRp7fkDqPXiycl1UHhU=;
	b=ruVjG0Mr7KQfCjWQkHxfhr9lb7iAmKAHFu4SmmrZo/D+MaGrEkNXXT2hLeW+GncfD/
	B/Yuxa0VR6A83qySvCBEtWoQsnASFs4YomRruccFSHbVM+oGNlHY0BkScplPM1/Y9tij
	TQQW3gdCZF21RrnwLE/yK9DnC/DNbbIUYJgPYZhYKcR+9zlNzRItTf3t9XsnFkKijl3J
	OA+fzU/vYslEV9btxKsUgPO7s16eip4qstbGPPTPpieNlnSu/3Y/i08zsCv7L4i6tV51
	19iOFMQOjGngkvdFCaEGf73GiXjvSI0pn338ZHOSkegP82CKaCVGWvlUWKjaW0GsaIW2
	oZQw==
X-Gm-Message-State: AFeK/H1+Op31KSCYaHpHfzOvZH2psejUf/GKPz7ahJsFqxALvUGWJ2Fp4dLx/paaTQZz3g==
X-Received: by 10.28.151.7 with SMTP id z7mr5815894wmd.53.1489929234449;
	Sun, 19 Mar 2017 06:13:54 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162])
	by smtp.gmail.com with ESMTPSA id 36sm1114616wrk.15.2017.03.19.06.13.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Mar 2017 06:13:53 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Mar 2017 14:13:33 +0100
Message-Id: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 0/4] Fix some issues of kernel/image recipes
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
X-List-Received-Date: Sun, 19 Mar 2017 13:13:54 -0000

From: Ming Liu <liu.ming50@gmail.com>

The changes include:
kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
image.bbclass: remove initramfs bundle related code
kernel-initramfs: add recipe

Ming Liu (4):
  kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
  kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
  image.bbclass: remove initramfs bundle related code
  kernel-initramfs: add recipe

 meta/classes/image.bbclass                    |  13 ----
 meta/classes/kernel-fitimage.bbclass          |  10 +--
 meta/classes/kernel.bbclass                   |  68 ++++++++----------
 meta/recipes-kernel/linux/kernel-initramfs.bb | 100 ++++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 55 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

-- 
2.7.4


