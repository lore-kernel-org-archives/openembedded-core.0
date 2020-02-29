Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3B35261A26
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 19:18:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 7so3290544pgr.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 11:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lVSE0M448OJZXPxRfTdOO94purdPYyTljy3Hxcwa1eE=;
	b=HGNqH9akOi6IW4jYjP21rM5UjNH4/5tX4kvYK24xjyF1TpWPAemmYmEEXNBHt2kMBC
	3rT7O7vEBotjTUlwuGl0v0ZbwZqnAgtRQfgbTTnFJuHKK/SdKrkPcLa3qNR74Pji7eKJ
	/m76EXHYDsEQM/VfbnJA7V9xzBph3GP5FCRUmx4J1Knr9GaiSRJKnSDuG3VwERrxMjCe
	y1+SWHGncSHsk/71P/Kynjxl4sllRiN5YtoWgz/h1SrAvJixoBQvx0LAiMh2pu9Okvy3
	Y9YWIev6RyLbVrbYb7cJo6ffr7nyFcbpIsa+xmzL064RG4J+xcdGIEL8x2wuIOAz3UDe
	G74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lVSE0M448OJZXPxRfTdOO94purdPYyTljy3Hxcwa1eE=;
	b=BNOk09Ofg3dpNWkTDK201n8HhTGw9JE+dO6tzaDyPlnB80OzId+eh8rRBM9WmlQH4E
	rawNpJavcMQMveGClGUOeOkS2CrlspPAZm7HBalnqtbpdWFP3LQ+V0xIV7FNrb9MDzeL
	BsdPLdzBbrLeHPmottp3gZStwrse1/I0VEGOd1LHCuDQNfK+BqVoRXwoGbSXMaVGev7B
	p/6G9bGX7PaUwQO3nBNvrtXHr3TI2uZMc32ZOLdufEWqvQFXxIBm7zLlH4C+zv7WTcGk
	jQyVrO0QoA4Ab4pQ0IC2SUcKWxEF3gFbOHFK82UqrHTOgtcoIHUb3VW9Eh9X0vw+t5Pi
	rtGA==
X-Gm-Message-State: APjAAAWzBKDtvDuz0CeKf0kshQODDtg5X0KNLGJju82JL8w+NKsXIKGO
	K9V2F6Pg57g3yZNpyInDztk2eWIwync=
X-Google-Smtp-Source: APXvYqx+qEEJBDbbWj5m+iF3juLURZVesZzetSqHN++DwAz2IP7StQ4r76s4YBndTHMn4d0BAiYI8w==
X-Received: by 2002:a63:82c6:: with SMTP id
	w189mr10660393pgd.357.1583003910578; 
	Sat, 29 Feb 2020 11:18:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	g9sm15701358pfm.150.2020.02.29.11.18.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 11:18:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 11:18:41 -0800
Message-Id: <20200229191841.3910424-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] qemuarm64: Add -machine gic-version=3 with kvm
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
X-List-Received-Date: Sat, 29 Feb 2020 19:18:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

qemuarm64 on aarch64 host errors out when using kvm

qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
qemu-system-aarch64: failed to set irq for PMU
Aborted

machines with GICv3 that don’t support GICv2 guests you must have ‘-machine gic-version=3’ on the QEMU command line.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index ec2a887bdd..1e2d4f018d 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -13,7 +13,7 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
-QB_CPU_KVM = "-cpu host"
+QB_CPU_KVM = "-cpu host -machine gic-version=3"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-- 
2.25.1


