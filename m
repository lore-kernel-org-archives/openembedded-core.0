Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1156A7199B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:12:32 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id a123so34420733pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=L99bozHJmTcIPE7ZJDJYMwZRHCdQkN58fXcesAO8Nrs=;
	b=FACNElXgb4v0Ki5LbZGbKUQOOc1VWEyniEbxJ6GqX3xXhek6unDDduhnfH0PO7bzaE
	GVykLSAOqWLPW+5m/wY7dx0SnXLCZ7q66K0jij847KrbdfR8QYngjb808Xwi685GusHD
	LdP/Hux8t+e9okThF+jPOyynGrFvTGgAH6Tx6OfHEPN8uWGy9b7zZzqbO6po3EWL6R+y
	qGrkAiGTlI47J+maeX5u7SJs8nYpbwQR2r01SlS4k5G3kbQrv9APBCd3Q7ZdCAPvQMlW
	5hjzBHL6QG6VzNgtNrYHZypwuAl0brB7g/ZKKaldUQ1u4uf8Sw0vv0F+SgP3AJUwAaZO
	W4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=L99bozHJmTcIPE7ZJDJYMwZRHCdQkN58fXcesAO8Nrs=;
	b=Z2k9KdIQq16n17CFR15AA02hynWMIR2pBz9TK6C+kAslT0UWKDghAssVB2NSNEpJIn
	4MWntzZExtQRZKEOjyeim0RIgPyeTgDjJTDvWvgJgkZ0HF6597hCipiOxapd17avcO78
	vKj/zhBhVu63f5E70KYotpmWR6VVWmVjuLqNTG1Mc4zZpxSEwUhGpt7qWV4XucxuABXs
	U5kxjVkz6y8JKbvnLVfys05MrSI9c2cF8MuZTF5l6waf5t2j1bMeV2D30MyILJ4TVk9L
	qhvXwgJ8gGKUBdsKAsxAkMzhW+/CnXnbQsNeGpJookLa4FtyXVdSCuNicfafFzJXr8be
	fhqA==
X-Gm-Message-State: AMke39l2r3OGpYuKwaXp2hBMQShyAGCJTWNshOtMZILEyHYyza0kelfPuwuZc+D/p1lOKA==
X-Received: by 10.84.130.100 with SMTP id 91mr39762501plc.167.1487682754028;
	Tue, 21 Feb 2017 05:12:34 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	h17sm41183281pfh.62.2017.02.21.05.12.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:12:33 -0800 (PST)
Date: Tue, 21 Feb 2017 23:12:29 +1000
Message-Id: <20170221131229.20126-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 0/4] Make qemu.inc useful for generic use
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
X-List-Received-Date: Tue, 21 Feb 2017 13:12:33 -0000
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


Nathan Rossi (4):
  qemu: Improve and add PACKAGECONFIG options
  qemu: Consolidate EXTRA_OECONF
  qemu: Convert KVMOPTS to PACKAGECONFIG
  qemu: Move recipe version specific patches and features to recipe

 meta/recipes-devtools/qemu/qemu.inc      | 84 +++++++++++++-------------------
 meta/recipes-devtools/qemu/qemu_2.8.0.bb | 33 ++++++++++++-
 2 files changed, 65 insertions(+), 52 deletions(-)

-- 
2.11.0

