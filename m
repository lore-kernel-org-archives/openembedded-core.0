Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B57960BCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:21:57 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t6so2046920plj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gdQxIRqlJ0oBcNzpj3ZNE2pJE7sXyd21bsknmO6XaPU=;
	b=A9LO9rWlj9WczknuO4b5lKM0LANsqVQP9rdASrFPlcE1RrgE6TSUclvn96XA3V+hlu
	c6y6YPvPFCpJVVnTu0qOWcuyUg6mqQ1L79LdZGZ6Xo7JC0qPhPZAw8UTAGVHvYH8pjCl
	xwU0fizRGVa1KlFtdBSF9K8kSXu6oSb1pFC2z40gcWaj3Wavb2O62vyT/LtWkJTS9K05
	PugHbkGwT8iL0IVXjaGBPBfdVCPgMmDJj/OyHeGxY/W8Gl/WszA2ubS5eiMmq4BDP1fL
	eH+JKV6/c++tgjl7thv8VRpoDzg3BSxbm7nivq18Rfk+E+SEC8Ig1XFOwiJUMqJEtsBs
	yx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gdQxIRqlJ0oBcNzpj3ZNE2pJE7sXyd21bsknmO6XaPU=;
	b=cLnroA2corMHSjcYfJl1B+G0NLdgurv8UR89nzgujQowhURdTJXolbnJNOt+rhSaiD
	fu28OgIce5DdpX1X/vyDSqrET34PYgbll5nPbilmAin5A+POhMIONDZkcD8N9f5lacY/
	eGVu5QU/086S3X7bjMJTUMAW9a2zKaxjqv05VxRF2l4Es2WKRQdymOKx3SSco7upUocT
	OLofrAsAPnZtYbhY0LfqG6h7heDbnoC90ovVEba1r96sWyFf+9We6OqKrxYIE1Uhu7Lh
	7spNpA3h/i4A3hARbSYiEpqdnJXtFFmBGghohu3nx1DykUR4JHu55C4wmveQqxDmMti4
	nMGA==
X-Gm-Message-State: APjAAAVaOTmoXosRuxZ/Rc4GqH6z/c3y/ozg89Ps377OXaHCNbkJzmhH
	5g5pJ0K/1ibzXbFth/PCTXT68NMFzio=
X-Google-Smtp-Source: APXvYqx2B5nF1UX/yUdeWIjQkjXuuqUrr97YUASat0/n0F+cIuzxI/9PoR10QyQ+9KEpCbRbt9x21g==
X-Received: by 2002:a17:90b:289:: with SMTP id
	az9mr3736754pjb.23.1581582117627; 
	Thu, 13 Feb 2020 00:21:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.21.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:21:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:50 -0800
Message-Id: <4b64efecf0750245cd0bb42d2864533688d8530f.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] qemuarm: Disable highmem when QB_MACHINE is virt
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
X-List-Received-Date: Thu, 13 Feb 2020 08:21:57 -0000
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


