Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 253B66C3B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 06:57:13 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q7so2800534pfh.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 23:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iBAMGTNF/lvafEjbjRtrhdF8BcZM1xgbK0dtgPx4tXs=;
	b=vTvoPXy0FhPK/aGtEKP0dacAtxHJUAVZigBJpWHGjSreQKp9aDYZWaABX8QaEf6fie
	Y40IiNK/XlwAAu43dWVk6OmWaRXDdWYgLrX6/SJZFedf59CmK5rzgPdn0VF8aLw3x1z8
	I6wUkV7/Bva0Fu8LJfrViekvRc4ZT6TyAWxLZYN4S0CYDdIDScongzw9tLRaDrGHA7lr
	/lmVJXw5IkRiOJgHe9Eid5WDGoYTcTMnnDTXu7+USzbDVT4ooTiQh71qCIS4uXl0RIrO
	g2jWI2J2tQ0J8frkYbfif/f8o2mzURf+4QqwM9hW1E535Xwbh676Yzu2PAll9y14nWER
	Wkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iBAMGTNF/lvafEjbjRtrhdF8BcZM1xgbK0dtgPx4tXs=;
	b=D+TRjiLxnGvYXlW/dMb34KD5k5QAot5Y2nbCJ94MRkPmU9ZHKVk95+W01063UhCl6P
	AcOzB5k39w9uNRZqU+nBfN2ouKZZjgoiFUj1BLlpFjnAgelQNxlns7NHO9H+MsmBZhSP
	USMOwo6crlfDUtP3Zlmu4vRkjCX8r1swPr0CyzIhs6QNRYIS/iC4T7ZEs8W9xSYnUz7N
	Nh0Niqviib0WKaf6Yo16OLbkBVJiYJtaeTopoqNLaK7Rird9H0kTJdTn2zheIM3//r6K
	feW0OMiBoyCVuy+m7EQ96S3AnIos1pZxbij42VQ4lN3zukPWa7yKfV5Nw0LHHty5WYet
	eXAA==
X-Gm-Message-State: APjAAAWAcRNjEsvvj0lx6J5XZ4Qwv1gnl8bivbYs+Fm/MJRGtMTURL+f
	9XV+xH0TWts4w4+101FqeJiTQ6bBFlY=
X-Google-Smtp-Source: APXvYqx6ejGuJWVioz87K3H4CR72L2rWUBP7dRJgwHw3q3rtuJKnHNahkDVyN+A3ca33d46bF8K6XQ==
X-Received: by 2002:a62:1603:: with SMTP id 3mr8172078pfw.0.1569394633642;
	Tue, 24 Sep 2019 23:57:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	t13sm4151620pfe.69.2019.09.24.23.57.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 23:57:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 23:57:04 -0700
Message-Id: <20190925065704.1794628-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] musl: Fix riscv64 CAS functions
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
X-List-Received-Date: Wed, 25 Sep 2019 06:57:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...and-specifiers-in-the-riscv64-CAS-ro.patch | 55 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch

diff --git a/meta/recipes-core/musl/musl/0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch b/meta/recipes-core/musl/musl/0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch
new file mode 100644
index 0000000000..09b71cb299
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch
@@ -0,0 +1,55 @@
+From 59f2954fcaacd9426827c69a729e2647cb9977e5 Mon Sep 17 00:00:00 2001
+From: Palmer Dabbelt <palmer@sifive.com>
+Date: Tue, 24 Sep 2019 20:30:15 -0700
+Subject: [PATCH] correct the operand specifiers in the riscv64 CAS routines
+
+The operand sepcifiers in a_cas and a_casp for riscv64 were incorrect:
+there's a backwards branch in the routine, so despite tmp being written
+at the end of the assembly fragment it cannot be allocated in one of the
+input registers because the input values may be needed for another trip
+around the loop.
+
+For code that follows the guarnteed forward progress requirements, he
+backwards branch is rarely taken: SiFive's hardware only fails a store
+conditional on execptional cases (ie, instruction cache misses inside
+the loop), and until recently a bug in QEMU allowed back-to-back
+store conditionals to succeed.  The bug has been fixed in the latest
+QEMU release, but it turns out that the fix caused this latent bug in
+musl to manifest.
+
+Full disclosure: I haven't actually even compiled musl.  I just guessed
+this would fix a bug introducted by the new QEMU behavior, Alistair
+(CC'd) actually checked it fixes the problem.  The rest is just
+conjecture.
+
+Upstream-Status: Submitted
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/riscv64/atomic_arch.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/riscv64/atomic_arch.h b/arch/riscv64/atomic_arch.h
+index c9765342..41ad4d04 100644
+--- a/arch/riscv64/atomic_arch.h
++++ b/arch/riscv64/atomic_arch.h
+@@ -14,7 +14,7 @@ static inline int a_cas(volatile int *p, int t, int s)
+ 		"	sc.w.aqrl %1, %4, (%2)\n"
+ 		"	bnez %1, 1b\n"
+ 		"1:"
+-		: "=&r"(old), "=r"(tmp)
++		: "=&r"(old), "=&r"(tmp)
+ 		: "r"(p), "r"(t), "r"(s)
+ 		: "memory");
+ 	return old;
+@@ -31,7 +31,7 @@ static inline void *a_cas_p(volatile void *p, void *t, void *s)
+ 		"	sc.d.aqrl %1, %4, (%2)\n"
+ 		"	bnez %1, 1b\n"
+ 		"1:"
+-		: "=&r"(old), "=r"(tmp)
++		: "=&r"(old), "=&r"(tmp)
+ 		: "r"(p), "r"(t), "r"(s)
+ 		: "memory");
+ 	return old;
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 87453be07f..335d53d42f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-correct-the-operand-specifiers-in-the-riscv64-CAS-ro.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.23.0


