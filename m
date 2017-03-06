Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id ADD616010B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:26:28 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id 25so67497796pgy.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=FIZZ9P7GQAV7cergckA27T4l4+4XWsoX1ZLqA3pIRZo=;
	b=i0nC44EDRb9rXM2Xsdraqbz9Sb2y8IqyEPCyKDpQhvmaUwI3FkGY+eka8zIxJi05qx
	nIff55d5nnWGB6zdlecR48sEGf9vEUvpoLqJXTyVSd+8l4x8jXzm9G/xPDCwUMv5SbRn
	kNgMMbubMQFkUZcp7zWnvpFC5+zLWg9UV2UBSQRgFF+MGFHNoIR6NdH7qHMaUqkF5dvV
	/N+IQ28Re4dH78+Zb7SOb6zRn1YgYwwXdw3ErlJIpiWWJuXl4UYoo5KxEWbh6OqjNvjn
	DyxuIieUDDKkNSfbKiuBIifeMj5B9UnrieOgeBQkEswdQ0M8uT5AVGHL+mgBXm5dz/tB
	fbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=FIZZ9P7GQAV7cergckA27T4l4+4XWsoX1ZLqA3pIRZo=;
	b=qTCCNrGpdO1pHWJNfYUSfMSq6W9S3sRIYliDwY9vfUfnOgTkEKeNff2L4AW5gdp8wQ
	Nf2wCjFQWbAfZoamnLnNUSZMQ0UH2H0KCRbr/kQxG41vpqpIhh/PYn1xQc0i14CtLafu
	XPP8RxK/HOZPF2bvhub5cim0/NcyckX4i4YR/Tcc9QATEAVjaVSUleQgoc8mYI2qUyPm
	SWU9R+JHQ5WVqdQnwrQ+HwxKBWcLoX0KUykp5y6DIosNsDlB4GqqHQFw6/J2kNAC8A2V
	hqySwpDoCmQ1ZwO8l8C7Y7+lhenNZpM9yRLbO/FB8yRwbFIZLBGQbK3mHHGbcAKBreuA
	Uzrw==
X-Gm-Message-State: AMke39mJ0hzqpvCdVoVd0xDapsumliyRui9TQzCRcADpIObjcvLKNk8GBOw3QT2cGge9HA==
X-Received: by 10.99.9.65 with SMTP id 62mr21328326pgj.22.1488813989619;
	Mon, 06 Mar 2017 07:26:29 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	e76sm32255616pfk.75.2017.03.06.07.26.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 07:26:28 -0800 (PST)
Date: Tue, 07 Mar 2017 01:26:20 +1000
Message-Id: <20170306152620.22194-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v3 0/4] Make qemu.inc useful for generic use
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
X-List-Received-Date: Mon, 06 Mar 2017 15:26:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series is intended to make the qemu.inc more generic and useful for
other recipes to use. This is achieved by moving version specific
patches, task steps and ptest support into the qemu_*.bb recipe,
additionally improvements are made to the PACKAGECONFIG options and
changes to the configure step are made to allow for the configuration to
be more complete as well as easier to override/modify.
---
Changes in v2:
 * Rebased on top of current master
 * Updated changes for QEMU 2.8.0 recipe
Changes in v3:
 * Rebased on top of current master


Nathan Rossi (4):
  qemu: Improve and add PACKAGECONFIG options
  qemu: Consolidate EXTRA_OECONF
  qemu: Convert KVMOPTS to PACKAGECONFIG
  qemu: Move recipe version specific patches and features to recipe

 meta/recipes-devtools/qemu/qemu.inc      | 83 +++++++++++++-------------------
 meta/recipes-devtools/qemu/qemu_2.8.0.bb | 31 +++++++++++-
 2 files changed, 64 insertions(+), 50 deletions(-)

-- 
2.11.0

