Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF73E751D2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 00:44:12 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i4-v6so717349pgq.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 17:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eBDZP/fOEGP8889b6CWNwYyqfU2UTXYWHMTssvD67lU=;
	b=SiTIWAvaBKIdlJ2ijIW+4663sd+8bZfl1PeBTOvGaftJpVCLyDE/O7CLtVAHNZG/bF
	IrgeLZMXb3NhbS0bDi0lhBoB9BzaDveNGE0G3/W7yRWbGZGo2HWk9jtZ3SgfIit2W0WH
	IZYYS7mnQYIDQFl7ISmUX1/8bURZ021OeIN57Com6Q5ngIijm++2+wf91jKSZhg7ffcC
	VKbTHNTn54hbdo3x9CJ7+M1td+q9svmQKI7ltBx+4votNL7zdZwiF5rNXA95+X1YrC0P
	3JtFbYXPNeFV0i7iQh/RDzP5vuuq/9JboalxF0e2EpWDzU84bJUpJnIYED6pTFjuzDTB
	MmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eBDZP/fOEGP8889b6CWNwYyqfU2UTXYWHMTssvD67lU=;
	b=F2G9T/8Wso7ecm2wFEoG08m+mzFKfRaAdhKGql8r4zWSnAn6wr8zcRyuGZ9IlgQhvL
	v4MHmhx2pB74SETD6x3t8EVXNj0kYPkM75LB+wyzwRtMr+yfDHzFKingzorCAbu9rrpU
	ElkELdh88IDVIe2e1nnQpgSCJk1PglOkZILLSn6RbiY39T31OoB2Ys7qfdxzXq0Mgf4l
	L6h3vYYBuh2ethgJz8EpZZXf2Sa4zfTTVz67mk6Qrr+xxSBkiGjvYXQywxNQ0akGmEmp
	7Tjp1Eb8zDH6GnyIxkdXCnt56shmKKDKs/7nveVqHXcPguqplJx88oLEql+qb+4HpEDW
	M2gQ==
X-Gm-Message-State: ABuFfojOC+Iw37BCFyk7Al/bzYSWndAKa2rBknarsyqaHUyqgqdTNCmF
	Ile3nRyvWGjamJ6oTTXBmJM7YlLx
X-Google-Smtp-Source: ACcGV63aodJIIElPrsUobVvc1oLLb3FjR30V8o+7Gkx0mqyssp2F+BM6ZjgN1C1wJAbKb1RU81OKJg==
X-Received: by 2002:a65:664e:: with SMTP id
	z14-v6mr16077392pgv.347.1538527453691; 
	Tue, 02 Oct 2018 17:44:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	j15-v6sm21652391pfn.52.2018.10.02.17.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 17:44:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2018 17:44:05 -0700
Message-Id: <20181003004405.34524-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH V3] mesa: Disable asm on musl
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
X-List-Received-Date: Wed, 03 Oct 2018 00:44:13 -0000
Content-Transfer-Encoding: 8bit

Musl started blocking dlopen of libs with initial-exec references into
dynamic TLS area, via

https://github.com/kraj/musl/commit/5c2f46a214fceeee3c3e41700c51415e0a4f1acd

prior to that commit, musl was loading it and silently letting
subsequent TLS accesses via the miscompiled code clobber memory that
didn't belong to them

This was wrong behavior and it relied on additional space reserved by
libc in TLS space to adjust fo such broken libs, but it also fails
with glibc if the reserved space was already used up

Right fix is that  mesa should be patched to remove all the
initial-exec hacks and use real TLS, and -mtls-dialect=gnu2 (TLSDESC)
should be used on archs it's supported on (i386, x86_64, and aarch64)
to make up for the lost performance, but mesa hardcodes the initial-exec,
so there must be a reason that probably is better known to mesa devs.

but we 'fixed' it for musl by adding --disable-glx-tls for mesa in OE,
which uses pthread_getspecific instead and makes is lot slower.

this caused additional problems with security flags on, it get textrels
in .text segment. Therefore this is 'second fix' to get us through this
warning.

Cause is some unknown part of mesa's x86 assembly code is broken by
readonly text segments

[ YOCTO #12918 ]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V3: Disable asm just on x86, since it works well elsewhere

 meta/recipes-graphics/mesa/mesa.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8d0e2cb67c..0dfdfbd5b4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -108,6 +108,8 @@ PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
 EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
 EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
+EXTRA_OECONF_append_libc-musl_x86 = " --disable-asm"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
-- 
2.19.0


