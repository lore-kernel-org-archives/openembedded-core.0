Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3227FA0A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 03:30:25 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id n96so3544395pjc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 19:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gV8We1HJpinuMn133xQ3bos0Ja/89+ofOFsDr5TFGMs=;
	b=fqVKfJKQgQ4iPIGEyOAI1tSyKGXb7Sv4R1BD4MHlyOv+cEsJ0HsdNIliMQdtoODWk4
	E731FYdboNZKknWOM0FAPxZ8gxcCpQ52KNb0vyQSjSZRHew3L3t265hA87mg7aUZBGVp
	f5ftQFWus1R6LZK/BVOKSIXwcmE18eVcarmI+SuURshrN89rCscl0/qAqC+HwATvhTrY
	o5L2mvIkDdzaUXSyS9EVSfAirawthRplypwo706SMBS5HphZU2TMn/QamUnsmU0RRg3l
	xaoWyZHx5UgF4Z/1RfnbwGxYJ/DHud0popMiy0QGlr0PWQGrYVQHSIspYuB3hXHniHpo
	oceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gV8We1HJpinuMn133xQ3bos0Ja/89+ofOFsDr5TFGMs=;
	b=V6Ts6Dx4GeqvSY1Q2biefaBEc1QElIEyVBzJyV7pygqAj/Segk0If2UGyR4kQyC4Gk
	FJ3PsKZN65PEG3N+YKljA5WljJ4+XRv/zF/GjiTpmHHGBI2R1TiP6Oc31+6HglPNBdeu
	UjKd3+X9PXKWTA1l0iLJxEIzeNkpcODyqrH7HRcFLyKlwW6f0L00Q3EqQFMxmpq+B7og
	aoLW9PpEQYz44wxQSU9aaAQbjOxMWLof+3xZ8wia5jO+ZQYeNrK6LMGFG5B6GLi0jqcK
	Uru+BukGVkE0j2BgLGoeqc200tnxiEvTg1FSIh9K3IOD75kqtVa9ZQYcJQ7CZakev/E1
	n8Eg==
X-Gm-Message-State: APjAAAWyfcrZpvglL9PG4PrDCuXnfbG0TOCUD4sss33QXnGH02tA8JcN
	YH5es8QLu43maUF6pIz6Fq0RIdbMCVg=
X-Google-Smtp-Source: APXvYqwpynV6SKDS0gG+EaPRsh5L93zrczU8oBuHCIgjOZo3U5F9qMwQR3r1lE6u4Ap9S2aV59kbXw==
X-Received: by 2002:a17:902:6ac3:: with SMTP id
	i3mr12038783plt.111.1578886225695; 
	Sun, 12 Jan 2020 19:30:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::a983])
	by smtp.gmail.com with ESMTPSA id
	b15sm11774726pft.58.2020.01.12.19.30.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 19:30:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 19:30:23 -0800
Message-Id: <20200113033023.1159190-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] qemuboot-mips: Enable cirrus VGA device
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
X-List-Received-Date: Mon, 13 Jan 2020 03:30:25 -0000
Content-Transfer-Encoding: 8bit

This helps in booting weston images ( core-image-weston ) with fbdev
backend, without this westons initialization of fbdev backend fails
because it does not get correct frame buffer settings and exits
pre-maturely

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix regression, where core-image-sato would not boot on qemumips
    after this change

 meta/conf/machine/include/qemuboot-mips.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 978820a2e0..d44b96c18c 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -5,3 +5,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
+QB_OPT_APPEND += "-device cirrus-vga"
-- 
2.24.1


