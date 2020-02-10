Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 68DE060CEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:27:34 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z7so2953898pgk.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gdQxIRqlJ0oBcNzpj3ZNE2pJE7sXyd21bsknmO6XaPU=;
	b=oqoZzsvczv2cDxE8bYNdtQV7L6ZUZBKqn1j47H01gkHOOUp/NkfT8wVO4ksb3A1Z19
	+0FQMSRrDGf2JJ3nJ4hbjk40Clkca+CpsGRym2xQ01kBysG/ySODLUlw67uRlCaPcQ+e
	tWKsp/rNrVIaPeYgiIaMwF2N27N6YALAPh5Y6+niTEBYZpFKTOUJYqF2e2kHd3ewiTjv
	aiXUUnG9KBa1Ipvr77ZA0YHye1WKOwtazbHeFVaDbj6wtrG6XRKE590UYjqtDzK6MhiW
	eByUQUdqoHhVF5u0YNgwnYL6XMp+zceVNN1EoXipuBsn5rayluz3Us1ZHE6WJNOFJxsi
	LNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gdQxIRqlJ0oBcNzpj3ZNE2pJE7sXyd21bsknmO6XaPU=;
	b=NdanYc2EaFEB5yH0Yn1C2Xci5lyFj8iJasRdUi6U8nmzoihc7oLwC+G1iuxEdlUR6h
	Yjy3zGXla9A/6Q55EQVa9bNQ0cxnRqgHbp/mCLXap4OXej3PvkP2TiHsZ15rTKN5YEf7
	Oc1izwvE3aQY714buvPh3HcTuAmjAy8Sohl6Mip7Cp4C2v3vGJ1vfSruXTX7yGUJxpWa
	tLnBzzBMeHGGPcJnKmEV0EA6rvPG+nRruvnpK1J801WUORSxh5O7zYyAcdoISMxh8WgJ
	tMuYXoozUgEuvDEXsLzOaCCAltUIVEiZYZkI3rFX4ngUjhwAkFH7texw2/pL4s9Chi7w
	GHRA==
X-Gm-Message-State: APjAAAUW/7RdO275KEW+cUpa4ZJ/BwW/VcvRjSYKbnz2qPjmUGkHwPIg
	XQ085HPQsNp7s6E/8EvI0jcqp6EsFpk=
X-Google-Smtp-Source: APXvYqx/o5F+HAwlWruRpBjAhTL4CNC8UtgAhmqjZz5pTR0YQAHlB/zdfELAahF+4ZWhZMNpfv3Jcg==
X-Received: by 2002:a65:5281:: with SMTP id y1mr11191173pgp.327.1581294454939; 
	Sun, 09 Feb 2020 16:27:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	z64sm10407186pfz.23.2020.02.09.16.27.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:27:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Feb 2020 16:27:30 -0800
Message-Id: <20200210002730.851991-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] qemuarm: Disable highmem when QB_MACHINE is virt
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
X-List-Received-Date: Mon, 10 Feb 2020 00:27:34 -0000
Content-Transfer-Encoding: 8bit

running ptests on qemuarm returns fails since it finds errors in kernel
logs like below

***********************
Central error: [    4.338465] pci-host-generic 4010000000.pcie: ECAM ioremap failed
***********************

Since its a 32bit kernel 4010000000 address is truncated to 10000000 and ends up
in conflicts with VIRT_PCIE_MMIO, which ranges from 0x10000000 to 0x3efeffff

This is happening because the linux-yocto kernel is not compiled with
LPAE support, however, virt machine for qemuarm assumes that by default

Should LPAE be enabled by default in kernel config is a separate
question

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemuarm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 26f40b1419..367fcef019 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -11,7 +11,7 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
-QB_MACHINE = "-machine virt"
+QB_MACHINE = "-machine virt,highmem=off"
 QB_CPU = "-cpu cortex-a15"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
-- 
2.25.0


