Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6C08E611E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:40:41 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p11so2439398plq.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sdsoq07vQYASogFZ05iL9+QbmXpOXFGp3Xt4ZIGDxv0=;
	b=dtXWgWX1hMY7RR1fnnzPVvqv6GWaBpKba5MBMQ/CGRguhTnqCtcvVxWzTwYGUv4Lew
	GSUBoAL7yG8LZaviEvw/k2m55fYzS1clovbheQ/aL9dvz5DPCFEXJFd7nRPZoQ76j3YM
	PXZ1NmyRexqHpfZQbCAYmR1wP39ZTYHQw40xgS1V0WlxdOS3O/DrJfABjULjnnit3vNZ
	9N6Oab8h0wbfJgBJb68rVT5n4QHgKKTN5jdzd7NrpuqBWLFWQc87C06aeb/YujKjh2gA
	wgQk3EOvGs91c5ky4GypRXmBoFuOcIqrEMU7KisRmP/7ulTfthyYtZc7gl8C/9CcAGwP
	6qLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sdsoq07vQYASogFZ05iL9+QbmXpOXFGp3Xt4ZIGDxv0=;
	b=LhzuFoh4lHWWIygxwXX3c1UouJr1FlaKUJvpQRo14E1CUvbj0IUdOpiLa2UkRIxnEK
	2TPYyNvcPqBghh15ryoECqZyT1P23vu2pfBOH/mnZeSEiKdrJdGy5I9tBWmRgA1pUFRT
	biYhh0gbDPfkPHoScYRbGAwZIut4VaRExWgE53d4zAH+a5/VdUncQ6Ug1VVmsfjehu35
	xmS8F7+9fdfGr0imon7eGPnxVlSBnhCJsh/gBoDxrT059u3yA7cDG3oxnKhYe0LDJdQG
	ejcUAXNYVM9sPY54gtH1OsT1ff3Ae6wXnUM13vvNXwCS34yma8USP6sQ2OrUPj2GvYyF
	KZmw==
X-Gm-Message-State: ANhLgQ3+YU4PlrLjzUesGk47nE3bNzszqfXaNz7rLJbCtiq3ZOS8bs+F
	VqphAa/EWp6++E/zl/3fEjUQfbDAqv0=
X-Google-Smtp-Source: ADFU+vs8LrSakp/48gTHF2pGF7K13v21ammyeC1KM/ffn4PXFL8uakDkPh+xZuQtTkBSDQDaLThS+A==
X-Received: by 2002:a17:90a:33c8:: with SMTP id
	n66mr3019358pjb.17.1582990842033; 
	Sat, 29 Feb 2020 07:40:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	a10sm14854727pgm.81.2020.02.29.07.40.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 07:40:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 07:40:52 -0800
Message-Id: <20200229154052.1996618-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH v2] glibc: Syscall fixes for mips/risc-v/mucroblaze
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
X-List-Received-Date: Sat, 29 Feb 2020 15:40:41 -0000
Content-Transfer-Encoding: 8bit

Should fix the mips make 4.3 issue on target

Changes in this delta

* 71f2b249a2 malloc/tst-mallocfork2: Kill lingering process for unexpected failures
* 5d31b083e4 riscv: Avoid clobbering register parameters in syscall
* f4f8843515 microblaze: Avoid clobbering register parameters in syscall
* aa638b86b2 mips: Fix argument passing for inlined syscalls on Linux [BZ #25523]
* ae1b6b13d4 mips: Use 'long int' and 'long long int' in linux syscall code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Bump SRCREV to reflect patches on 2.31

 meta/recipes-core/glibc/glibc-version.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index f489650f70..4c72eedf41 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
-PV = "2.31"
-SRCREV_glibc ?= "9ea3686266dca3f004ba874745a4087a89682617"
+PV = "2.31+git${SRCPV}"
+SRCREV_glibc ?= "71f2b249a28e17eac0e47c53af44d5c5b65101aa"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


