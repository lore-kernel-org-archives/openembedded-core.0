Return-Path: <charles-antoine.couret@essensium.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 47B8D6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 12:54:08 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b127so3346364wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=essensium-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=05kBV82pbA6ShbVUyxZHUyPP0J3LadiH+0Xq1R5hpho=;
	b=vd0Nqno493hH4QXYo7dmcBzpyt3AyQOBB+jWBC/JfJQFhMT35IO1dCWnu/kUnUiHGA
	AIFTq6jxKdikOnrmXavxnnfysb+EsdsMVfq22qi8DfzRROUuMaY7mz63Ivi3SVWkpZKM
	vG7S80CIQZnvKGhmrXnqBd9FPAfxq4uL9baORromFQTEvxo9L07y15VsVknLpWi/egv8
	iwjMym2+SPASAqCD9lCGmSjbDH08TOf379/KPWrG5m1DnZF6Z5YQxcDvncMjsxmA7SHd
	B3IdUbnJuX2xahY+lkjmm5snaIe7Ls6qIp+FWq2bUYfeJ05rF8JprUNiVHaBx3YzlG3c
	t1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=05kBV82pbA6ShbVUyxZHUyPP0J3LadiH+0Xq1R5hpho=;
	b=r8MpAeCl2/fjpna9olgZvM7ux3Th30uOQ0E76tL+T0U6H8pSAtzLutDQ9HwI9+G2wG
	wzyWbZFHQXyT2DV5axB3X/vTk75K6Vf76MmU7K1mbwlF9sS5yrx4/JnrcFXzs7psZpvH
	Um7uolkYZd6i7aMPCGBleBbNYql4JuMZQSVh/NFSURW19bju0eA0/WcL+qOZd0xTPUCh
	ppG9J7XSlW05hcfofd95saPLSVqHNxvw9mhID8Ypr8HnsfLuN5oqI2w8hVZ2skzfflQz
	rEpFKK/rfhSU9nDgkywOhY5xK7GdTZliNqlgVAmkiAjldeVYLDbuqw1OTBLQ5/9lFY0M
	V9FQ==
X-Gm-Message-State: ALQs6tCIma0xV8fghXSvAq2uGkrHqA/LktkkFC8iCZbwrVgOmAa60+1K
	0PNShclGhfK/V/ri0JSCKYHJf2pGFZo=
X-Google-Smtp-Source: AIpwx48av1odO8Fmko3Z02kxYRcgMtbATcOCAVDNBGQQFXN2HA8luUmdJ0bam9qMrnMXhZXniNVUYw==
X-Received: by 10.80.183.144 with SMTP id h16mr6678693ede.96.1523019249505;
	Fri, 06 Apr 2018 05:54:09 -0700 (PDT)
Received: from localhost.localdomain
	([2a02:a03f:409a:6e00:7d53:e685:9f84:3421])
	by smtp.gmail.com with ESMTPSA id k8sm3418456edn.13.2018.04.06.05.54.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 05:54:09 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 14:53:52 +0200
Message-Id: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 0/2] Split glibc and libcrypt
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
X-List-Received-Date: Fri, 06 Apr 2018 12:54:09 -0000

Fedora 28 is introducing a breaking change where glibc and libcrypt are split.
libcrypt is now provided by libxcrypt as external library. It is backwards compatible,
but not the converse.

Currently Poky could not be compiled with Fedora 28 and the official yocto-uninative.
The purpose of these changes is to split glibc and libcrypt to use libxcrypt only to generate the SDK
and the uninative tarball. With that, all distros are able to build Poky with official uninative.

The time to glibc to apply this change upstream.

Charles-Antoine Couret (2):
  glibc: split glibc and libcrypt
  perl: add patch to solve libcrypt incompatibility

 meta/recipes-core/glibc/glibc-package.inc     |   1 +
 .../0031-nativesdk-deprecate-libcrypt.patch   | 418 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb         |   1 +
 .../recipes-core/libxcrypt/libxcrypt_4.0.0.bb |  24 +
 meta/recipes-core/meta/uninative-tarball.bb   |   1 +
 .../perl/perl-native_5.24.1.bb                |   1 +
 .../perl-5.26.1-guard_old_libcrypt_fix.patch  |  27 ++
 meta/recipes-devtools/perl/perl_5.24.1.bb     |   1 +
 8 files changed, 474 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
 create mode 100644 meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
 create mode 100644 meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch

-- 
2.17.0


