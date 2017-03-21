Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E501671B32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 14:35:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n11so3276402wma.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SZ9R7kh+F9LT1BbYctvVlktPVfH+XImHwGxtuLwUEfg=;
	b=cktpKeNt0qOjHX4ZHpe5JTv+7V4QW7votW+lsF7naYPGd1SoZZfLZyorOJXnmqVVPS
	osvHOtzZaDgfZogoGavI5D44xtpG/QDbmydlm0LnuIFk71UbcH6itISI1N0f0SOBpbCg
	UDE6mjk8Lrkqi/l1iC2v5VdyxQ/CqWUakP0CpcmjRFmJBPJhCqkPRHwbPHwhHZ3yiAaW
	iY3jRnlD4TUVpIp4N+k83ei/D1M51FPiiC+xa3/E7NpjzN6N01tIt7EoDaRFOprBIJeh
	ASCDn1y0OAgRS4FdPrXQT0TXAOs1SYqQ8warP+XXd4lErXTqxPbqPgRFeE3EdAeK1VBy
	FXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SZ9R7kh+F9LT1BbYctvVlktPVfH+XImHwGxtuLwUEfg=;
	b=dq8d7OUB5QBrt0Au0O5N9HiKGWVXD9VQODXPB4gmpj2dRqheTFg6y2imHrkXt1faVw
	p4pfcQXgRztXrhBrSZSqilSY5plCi39cXu/HQv9PnP9uNJAi8MkGfuFQxFceYg0nKbHa
	OuBG79BhVQdnJG4BH91Hoz8T2evZhYgGWTcNWk7ag+FoGAAUU0onSgLDKKNTtXRp0q3b
	HEmn87uW2lW5xb1opY+qNw9q5OBTIY9WK0yWjobOWK6TEXnuDXZXHwC/TxRWKvgHkl4h
	Dx3LUnGSW55Makqy7yX4KxgWNB3gLcZ1l+FIaVvBBdO0RrdRQ+HnRitStSXm7eLj+NUB
	y47Q==
X-Gm-Message-State: AFeK/H21XZl4r3wOTu+qnVMCxiH4UZwfltl5S76ZbhTLPbxvwc2X4xzf4fr+cDq8qe8OGQ==
X-Received: by 10.28.139.195 with SMTP id n186mr3281973wmd.139.1490106904832; 
	Tue, 21 Mar 2017 07:35:04 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	u41sm25225692wrc.24.2017.03.21.07.35.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 07:35:03 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 15:34:47 +0100
Message-Id: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 0/4] [V3] Fix some issues of kernel/image recipes
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
X-List-Received-Date: Tue, 21 Mar 2017 14:35:04 -0000

From: Ming Liu <liu.ming50@gmail.com>

The changes in V3:
1 Drop one patch which is problematic.
2 Change a conditional checking line in kernel-initramfs.bb:
From: "if type != 'vmlinux' or d.getVar('KERNEL_IMAGETYPE') == 'vmlinux':"
To: "if type != 'vmlinux' or 'vmlinux' in (d.getVar('KERNEL_IMAGETYPE') or ""):"

provided that KERNEL_IMAGETYPE might be extended in machine confs.

Ming Liu (4):
  kernel.bbclass: fix some incorrect inter-task dependencies
  kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
  image.bbclass: remove initramfs bundle related code
  kernel-initramfs: add recipe

 meta/classes/image.bbclass                    |  13 ----
 meta/classes/kernel-fitimage.bbclass          |  10 +--
 meta/classes/kernel.bbclass                   |  26 +++----
 meta/recipes-kernel/linux/kernel-initramfs.bb | 100 ++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
 5 files changed, 119 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

-- 
2.7.4


