Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C98660BC4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:21 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gv17so1975716pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gdQxIRqlJ0oBcNzpj3ZNE2pJE7sXyd21bsknmO6XaPU=;
	b=AAt869FQfd4BEJHo9Ak1M7Wf5r2jCC1dQ45kAf20va7w+jTbd2Xtx8auEzIUH2H9XK
	9BdLZcuu40wycq6aBjeFg+61bkxMD40CKducy+W5G70bTMSOIpFsTqBv8yUeqxYwq/uD
	vIbLEePh3xkN9LS68qjcz2oOvaCfvHtvjHbBWjLW2FDQvq+swaZIkx6NPZEAIzpHqhhv
	DxWRWuc8KFwSz8U3uUQSm5wqeP0mJUKUnBvj3OikY7t6dsegBKesaqQ+qULcmhl8AJP9
	EtPTylPkH6HoegVT1+MWkeYrmNB1oWVCfJ8s/KDLQXWGNOivHN0nOvlHN+bCa6xCRhvY
	k5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gdQxIRqlJ0oBcNzpj3ZNE2pJE7sXyd21bsknmO6XaPU=;
	b=Q95ko63mSsCwlPUHNnDnho47QLohVvasMZfIc9tGesDGOTOb8SJ7UGAB2Ljfs4czXK
	DVbbFYy6dXLJ+PWaQakRyFli26L6+2MBja70EtfO5F1sqlHxUwRy4YLwuGXZGNp0oX/n
	/6TZHX4EWL1q8ltw8/H3KmEaTsrLND20xstES1V8NDCnXtv5zVBCYCVuiAscR3WUKeXx
	9MphhG+EiyKHFSLAn+k5hP/SKF/8sYZqvuuTui8gCX5B1BKD2j8+g1++D8MI2CFj6Lfr
	NH9ez3+0RBugkLdzkKgGTu9mQFAx8D1yq0g+PzNWHxq64i5Vbk1XE6xQgLuxUGZ+7gwf
	iJKg==
X-Gm-Message-State: APjAAAX/gJmbUfFCDuAFxVz7rLez+J26nNFGEV7VZ6fsM7I2wjADXl3J
	sdU+WR2nRiFpKOPew5cQOmI4j0IqDdc=
X-Google-Smtp-Source: APXvYqxOOsaUY2gw9jNP53qryJWAuWnSuCu9j3dC/rJXvT680+h+olMJJfxzFXNQU4ufFjuCMNefdA==
X-Received: by 2002:a17:90a:be06:: with SMTP id
	a6mr3379274pjs.73.1581575901425; 
	Wed, 12 Feb 2020 22:38:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	k63sm1170302pjb.10.2020.02.12.22.38.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:15 -0800
Message-Id: <4b64efecf0750245cd0bb42d2864533688d8530f.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] qemuarm: Disable highmem when QB_MACHINE is virt
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:21 -0000
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


