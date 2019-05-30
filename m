Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id ED74D7E3BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 22:09:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 16so416652wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bjGNauMsygAYKSOMGYHjFLkmvTcCzOzGv4Go0P+wr6w=;
	b=FFCxp2/DHajcmFnpJPW13tK2nKSW6B9mmIQsjobbfiHDsbI8mnNNFcmWUCOQhyka8j
	IC8rl1AEH2wUpdFH0JPVIV9fQ6F172HRsfL6xTG8DgG8WUtj7j5sUnXY2ULPE+VB5cdW
	sBefWEwCIpTrJgXXLuc/G/qp1ijQTqSI1WVrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bjGNauMsygAYKSOMGYHjFLkmvTcCzOzGv4Go0P+wr6w=;
	b=nvW6skLzb3SJEtbIE39/HHkTH7qNzvxmOcqVq6zp3+N1ulzi4ZwOmyQcMn7qCyQhqI
	dztjcAx8bTB5pXdVHXHbFhUrPhRKLGs0kfbPY+jpmsHLKmb1lazVpzGRN0OlEDuqPgxb
	kThTeTMltMxoO+HfBJ6YZNExyaSKTlPUoqz/DjBirOHuOp3voYnUCKf6OtiNerlRjPXw
	dCnfQo3W+RFj9bhIaLK2rXWfWoPBejNd0bS8AhjcOKFMuCqtcho1fgGULrMm5g2ZxhBd
	sF8DFUHLWDYdc0m5SbQpqbd37GYg68pDaFiuuUt/ID+bJH+7OLafaYXcIFAZEiy9hVel
	NyoQ==
X-Gm-Message-State: APjAAAWFfAUH+4xLCq+rpBimN6fH6Tqtj0z3+ZAaeIMrLR3Idro6fptd
	GbfHC+9covje8bl/HYdZdLQ27xBuWt8=
X-Google-Smtp-Source: APXvYqwiaR1Gn+yLdeuhAEu0RpUDrjvSmHWYaYaFBPmCIXsTCwS94NSyCohRur6UMansxp8D0Tgdpg==
X-Received: by 2002:a1c:ce:: with SMTP id 197mr3555831wma.48.1559254198384;
	Thu, 30 May 2019 15:09:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h21sm3663855wmb.47.2019.05.30.15.09.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 15:09:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 23:09:55 +0100
Message-Id: <20190530220956.27209-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] qemuarm64: Add QB_CPU_KVM to allow kvm acceleration
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
X-List-Received-Date: Thu, 30 May 2019 22:09:58 -0000
Content-Transfer-Encoding: 8bit

This allows kvm acceleration on arm systems that support it. "host" is the
best option I can find right now to attempt to use the acceleration. It
potentially might not be correct but arm systems are sensitive to the
correct values and I don't want to encode the autobuilders CPU type here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/qemuarm64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 5c8aac1511a..353ac927d94 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -14,6 +14,7 @@ QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
+QB_CPU_KVM = "-cpu host"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-- 
2.20.1


