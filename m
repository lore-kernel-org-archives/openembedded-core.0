Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8049474588
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 00:40:09 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y15-v6so2549086plr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 17:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eIysqE4Ib2txAf7W01WzJNvq2Inh9YBRfC7NIUWoEMc=;
	b=YGFKqC3S3z5y+hd+8HlYTnn2BSHXJpQRAyQ4yzOjkIcBb4NVLu380bO5pp1Prg7AVz
	xe7Vnekcn24h6eePrDcCaIVjx5ennc1/qS6jb/DDyIUmbbY75mCReH2jInM/MM1HNoQ+
	woqn4J3F5BRThXum3DnKS+hBXxsOT26Lz59BzufIO86DatWEHHPfsrWgCsJLqw9kKNLe
	0zLc2BuvkabALju7UIzBJePufDgWDZzYrZToKK0zpHe3ImfblPxOcErSIGluUS1UBFxW
	Gm9geqtWcLRhtpSbVMs8ybvcfYGl0ps5VnWeHKrges/aLyyAA35K+ebCDj2MUFS87sL1
	ZA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eIysqE4Ib2txAf7W01WzJNvq2Inh9YBRfC7NIUWoEMc=;
	b=OhWHUGO6J5lTYIDkCV8fTSm09UPRVXQKNFhEK/2bgIoLN/NGWwaHXQHmtyFR/J9yQT
	iOIuMmV3eGd4vvkFd4yEEt79pfyM7lCNRxAUVMKT//9nc9wh6BjziH5CQuUxDo/x90lw
	xf3EVO7Js1imgGu+uKJqvGd7Rrk7GL3Tui5EayWG8cgXJxv5bPzS39nEkhz027oNX3N8
	EofWVyZ25YgzqP6jR1G42n0K9E6xuLcmXy6idZAKQAb8Hh4cSA7OYT8Sl1r2C0OFsyoO
	2J/sAbFX1JEh9CmNC862v1t6r+6S8Hl1B1bONXdlZ4aLuhnX6jERgWIynMzpZ9h9NFu5
	D/EA==
X-Gm-Message-State: ABuFfohse86Vrp8OLvhpRS7jnvbWRtZNXZHuA/npPGPg2VRJJc3qMC/W
	qfDMVBTXe+Ji3YbTj96tflkIa26C
X-Google-Smtp-Source: ACcGV61ze3IcaZTodb/xumgo+rnZxWvWqZ+0EvfrMkm4a9DGNzyZHGQjijIDQZZL+TaF3X0OtjT7LQ==
X-Received: by 2002:a17:902:1e2:: with SMTP id
	b89-v6mr19150388plb.296.1538527209973; 
	Tue, 02 Oct 2018 17:40:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	d186-v6sm29503240pfg.173.2018.10.02.17.40.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 17:40:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2018 17:40:02 -0700
Message-Id: <20181003004002.34090-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH V2] mesa: Disable asm on musl
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
X-List-Received-Date: Wed, 03 Oct 2018 00:40:09 -0000
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
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8d0e2cb67c..e6f3712706 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -107,7 +107,7 @@ PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
 EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
-EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
+EXTRA_OECONF_append_libc-musl = " --disable-asm --disable-glx-tls"
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
-- 
2.19.0


