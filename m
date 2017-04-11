Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9775B77CEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:38:51 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l7so12806014ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1NJHxDxHD9ZdlpXiMLTHxRh9+VeEYpRXkwWmgeeKGSk=;
	b=vAcQq2/3zdM6zKthavECkmMfCGcUk9sDZCV/EDEZeAkfz0t3jT9u7Zby2aIHuQbxbM
	EkO5ghOBO4/xYQeDhVkKdI0yJbJ1V/3ec4oJMOU81w0N0HZYlS9C0nNFAlJhe9SJ8rrD
	BoxQCkjHo6W5tWgQmPWQcdZtZ7BlvuWGDExIYHr8jTclGkUAvE8galyqm/jmHV8YkIlw
	Eo+nOY0Lq7B5wTTiUI79OzfVW+MIhARO9q93e9JtG6wETj1lW2AMtx0aBQ1YtBYuHXdc
	vb5PyNJ1P+nXogofB3xwzWa3ZbmGqEvu24rYo/jYtkDO0CS3Ldm9Nh0nyJin8G6WYgEz
	hyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1NJHxDxHD9ZdlpXiMLTHxRh9+VeEYpRXkwWmgeeKGSk=;
	b=Cm2KE086MxYzbH2nzoA4JY0UA9MmT17BMNX53VT7cQvJhLcCzabrbcjSqb1+gY9AkP
	r1dICgd2sCXO2t3cN6U3IWoRyJ5G0WxbLbYR4k/HDIgdvoaE22DFT9/oqOmpGkw7K44m
	jfBXbKdokqczm54dXhWVkdl13FMKxyL6jD9Yd9Ekfj0bdyfOISCdndJUQSv8jxtIO5m7
	CSnoN1kCli1G3aDpR1e5OYET0yRTpHu0s1w8rrusOUkmUBZqhQuNhkIPHuOO+pMaWque
	BlWIHx1/ZFj1oHOjQDq2iWo2ODYPcBEzu5a8xzKK2FwED9nqcXmFJL2n/yPQ7W12gRkI
	RRJA==
X-Gm-Message-State: AN3rC/623zNUAPftUC9NdsoZ6cCvXtPUcWyfGIxp/le/YGVhbCQY7++LB/Tgy7jOzfgyOhK1
X-Received: by 10.107.178.129 with SMTP id b123mr21453901iof.50.1491935932513; 
	Tue, 11 Apr 2017 11:38:52 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162]) by smtp.gmail.com with ESMTPSA id
	m63sm8260499ioa.15.2017.04.11.11.38.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 11:38:51 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 20:38:35 +0200
Message-Id: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v4 0/8] yocto-compat-layer: bitbake-diffsigs support + per machine checks + OE-core fixes
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
X-List-Received-Date: Tue, 11 Apr 2017 18:38:51 -0000

Manually calling bitbake-diffsigs is cumbersome and doesn't work in a CI
environment, so now the test itself does it for test_signatures.

Regarding the BSP example that I ended up using: it actually was one
of the better BSP layers and only had one problem in a "bitbake world"
build instead of several as in other BSP layers.

All pre-requisites in bitbake and OE-core are merged and no further
work is planned, so this patch series could be merged now after
reviewing the changes.

The OE-core fixes are included here because they were developed in
parallel to enhancing the tool which found them. They probably should
be merged sooner.

V2: - use self.fail() instead of self.assertTrue(False, ...)
    - test_machine_signatures check (work in progress)
V3: - rebased onto master where some yocto-compat-layer enhancements were already merged
    - added OE-core fixes for issues found by the per-machine signature comparison
    - finished test_machine_signatures (shorter output, explanations
      on how to run bitbake-diffsigs, end report with one bitbake-diffsigs invocation)
    - allow "bitbake -S none world" to fail during test_machine_signatures,
      report such failures in a separate test_machine_world
V4: - avoid DEPENDS_remove for go-cross
    - commit message spelling fixes

Patrick Ohly (8):
  go-cross: avoid libgcc dependency
  gdb-cross: avoid tune specific paths
  recipes/*-cross recipes: ignore TARGET_ARCH sstate hash
  yocto-compat-layer: include bitbake-diffsigs output
  yocto-compat-layer: also determine tune flags for each task
  yocto-compat-layer: add --additional-layers
  yocto-compat-layer: test signature differences when setting MACHINE
  yocto-compat-layer: better handling of per-machine world build breakage

 meta/recipes-devtools/binutils/binutils-cross.inc |   3 +-
 meta/recipes-devtools/gcc/gcc-cross.inc           |   3 +-
 meta/recipes-devtools/gdb/gdb-cross.inc           |   5 +-
 meta/recipes-devtools/go/go-cross.inc             |   3 +-
 meta/recipes-devtools/go/go.inc                   |  11 +-
 scripts/lib/compatlayer/__init__.py               |  32 +-
 scripts/lib/compatlayer/cases/bsp.py              | 204 ++++++++++++++-
 scripts/lib/compatlayer/cases/common.py           |  16 +-
 scripts/yocto-compat-layer.py                     |  29 +-
 9 files changed, 293 insertions(+), 13 deletions(-)

base-commit: ec2931852b2a097c9c8cb0d7288f5ca1d79f401c
-- 
git-series 0.9.1

