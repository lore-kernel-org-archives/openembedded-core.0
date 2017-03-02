Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 09E467760D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:54:28 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id s67so9859682pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+n/k4f/AdGNeEXQFYOE2GxTQ30j1+NB0vxKnIqQze5o=;
	b=jVHdtNkvidiG+BPlsj0rxsqK/LyER/qe18v38WG20GRDwCvpKn3L2nx6o6WswDI8gV
	z6zerSXSiUUDnQCPRe9I9wuDwYi9Z4qCPkwT3NSEiDHYCLvTzctFERk+zp1wqY8KjhS1
	69+iLv2BrHfEgo0BdT1gAbjAi4ibskZisGYmehKd4t3kw6WLKQiZsqA/4nmBRpFJJE8p
	NVEyqycoCR/5URavHzI4o7nLpUB7q9QM9abwr4xhmsHCTmghzrjeSCCD5rKr3gaZhESk
	vgQUgxJ3M8z5Hm7IUW55s0pR18R6cCqJclqH2bxymETulee513MHrcBy+m+OjIgOORA7
	8T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+n/k4f/AdGNeEXQFYOE2GxTQ30j1+NB0vxKnIqQze5o=;
	b=pjWTqECBWJRa6JpkM3K52xJMpt6qP8bxy1rophiTkZF32/HG/G3iX3RlCQnfD2zwm7
	cdExO7jtxI+TMT6uslowBI2L8ZPe1XkZPKpnDcl51yLxJovkiD31ZFIlm4VljeElvPmw
	i6ggSCKZ0w9RHOJAg7N248Du+zHO9JT27nj6LWinafqurM1WeUlcQHcqu9oIMzoK8XcV
	6ZPiIl9v1oCFy88J1YB1VEvVSPWJYcM/sF8MxwP+3vyC+1vp18xegIiX67idbSxzbKO+
	lYnljZOZMlaQ2JZkuQMV950F7aYNeCWsa+26xycTPKXK4smGyfGVn7VxNzKkqgao1Hii
	eTDQ==
X-Gm-Message-State: AMke39nu9VuOQOvCJCxaVoPRism5wxHt3QSpScx6skobYnj4DtumsWfmC98nEN+uiBhkwA==
X-Received: by 10.84.149.168 with SMTP id m37mr19703051pla.97.1488473670230;
	Thu, 02 Mar 2017 08:54:30 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	h14sm18333894pgn.41.2017.03.02.08.54.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Mar 2017 08:54:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Mar 2017 08:54:16 -0800
Message-Id: <20170302165416.8502-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] kernel-arch: Lock the toolchain to use gcc compiler
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
X-List-Received-Date: Thu, 02 Mar 2017 16:54:30 -0000

kernel and external modules are still using gcc to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index e09cdc4184..04c49b9d24 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -57,4 +57,5 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+TOOLCHAIN = "gcc"
 
-- 
2.12.0


