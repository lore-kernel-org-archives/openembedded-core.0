Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 59F1878A1F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 20:24:46 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m19so5216404pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 12:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YG4dxuvE8WLRZlGLqZ/2A2RNjiad2e+6xcN8V+81D3k=;
	b=Dc42EVjv0ATDhyNTl/V9J1zajNQ4NVbFMiqzEyCtF9Q6HGOORhfMtmoVtJHFpQ3FCP
	pSAWAEr6flzMvgMsMsphE66QZ8fssxF0c3H0pRTlAju57uPzl2dk7Xdm4E4M4+D5z8jS
	9Izc0QFbDsIi5bZ8AXFiuGS15C+cRXS9wd5GdikNYgNufyp9Mb/WymoF4zQ5+M8dJNj6
	AsWnmO5jcZjPRNIyOlklq9pTjc82Kc7u1fka72v+KzaK9CqH+YQ6ovueO1s79Rt4kmGx
	+1evHl6iiPbdy7oNAeslm2NdZNSM5+WUy506ic789kYrYj3IvMDthD+hhpu2baL07FrW
	ADpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YG4dxuvE8WLRZlGLqZ/2A2RNjiad2e+6xcN8V+81D3k=;
	b=ikvKuvrQs89dczl1qMKLzNC5jp7ffiBMr2tISqIbYD/koZEN/82HrsEU6X1El4sHnR
	+NUx8CuU1tLFIAbVc8QuaMpGJYnPyK4550aVHh9aPRVR2tgAMsRoUMl3cVBtsSYQNffJ
	y4+lmNRojzJVa7vVexWPKnNLSHT8H6/rySn/5RycKVufwf38y8cikGBQBXKLcM6vW9iR
	yDGQxp93wUzPnWkuXpJAWPLWFa/ZmCgrtQPcu/pnKM3S03LN/PHw2MuZMtFylMKaI8sp
	Dpw+LYvg/dcLE2OqQrVzKvzJJ+/wCsGoO7M9nXBQcnNfgm69UfZzQdGC3Mk1A5dIHvun
	Neow==
X-Gm-Message-State: APf1xPDWNzr0SECr5MNXzt9EAkX1jNni66NefbPYFa2wEgarYHNZNNUF
	HyglceYIiZlMh8OJwWUh1fQ+gA==
X-Google-Smtp-Source: AG47ELsH8zi8i5SlEn2ev/5fVO7B5bxS8eM0WoYcE8yFfPp+KZVMXri0F2n9QX9vjAs9U7QHxUfwWQ==
X-Received: by 10.99.122.86 with SMTP id j22mr8106217pgn.351.1520108687299;
	Sat, 03 Mar 2018 12:24:47 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	184sm17815792pfg.125.2018.03.03.12.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 12:24:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2018 12:24:39 -0800
Message-Id: <20180303202439.31188-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] glibc: Compile using thumb2 for arch > armv5 if user chooses
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
X-List-Received-Date: Sat, 03 Mar 2018 20:24:46 -0000

For arm we enforce ARM mode regardless of ARM_INSTRUCTION_SET
choice from config metadata, glibc works fine with thumb2 for
armv7+ so limit the restriction to armv5 and lower, tested on
rpi3 works equally well as arm mode glibc and sheds about 0.5MB
in size for main package alone. Other glibc build packages also
gets smaller

ARM:    2696   KiB     libc6
Thumb2: 2132   KiB     libc6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-collateral.inc | 3 ++-
 meta/recipes-core/glibc/glibc.inc            | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index de859d5ce9..aa871ac83d 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -7,7 +7,8 @@ HOMEPAGE = "http://www.gnu.org/software/libc/index.html"
 # This needs to match with glibc.inc, otherwise glibc-scripts and glibc-locale
 # will fail to find main glibc, for details see
 # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 deltask do_fetch
 deltask do_unpack
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 21bbdc2ad0..361a6fde10 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -57,7 +57,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 # This needs to match with glibc-collateral.inc, otherwise glibc-scripts and glibc-locale
 # will fail to find main glibc, for details see
 # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 # glibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
 # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
-- 
2.16.2


