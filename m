Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id D310677BF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:57:06 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id t68so6254893iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fYWcvYg2UUMhI9QFSAREiimcN4cWVohipNOx4kjGyYY=;
	b=IVTmOQLP9t1AKXF0bnPf7e46RuUu6QmcfbiRyzZtFzKPgS7+RqekZPpS5VlrUWiFUE
	jVjQsAp3vOK20d2DUMH0xmCnfSMzbIBxkNZnP0mgGxuYWfOWZiU7fSg32xux1l4QCif5
	VQF7kgAfnp3eQ/rsQ/qWuH4A+dhjtXriUDwcuqpuiNVHqBniT/v5VoRQcanlYUP4mauQ
	Jp4hb6xKpf9iWqzocsXF29tV40+r/LNwhIW1njP//huCsqBvmJxgiprNaOZP8tavoiRc
	0SS71rq5z8daVWsqQ6SNtN9v1uGitf6F4KyBgjmfq4ipybBme5on+bhg+h4h+TiTI7tb
	hbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fYWcvYg2UUMhI9QFSAREiimcN4cWVohipNOx4kjGyYY=;
	b=MM1nrnJVnbaBMWcfgRqTiOrnYE/cxWrl5/YfrHY3z8UtePKpCm6IwXhP96zbvtqPxe
	myqpLh12LoQHzwoiDToOgx90nnxxEI+1LKvVZpBuOnkNNpEqMpK5P0R9lCj1WZZ/wozh
	3OpIygofbSfXZepXEfd5UO8YdyyQ1LdXjptjjlLn7KIlmgVLR1f1noYY64G5lkHYup4r
	M9AYeyjAoqmhwH1QMlaMK2YAKDRTUo6pr/XQ+3G/XtnTp6yEXipudYn2n5NweObDdi+2
	mWwmYqb/C4RzNp1onOdEGTI7+Xc3GZMOGDqFNJu14WGi2s8plxgiU8SGID0to5Du+YWi
	Clew==
X-Gm-Message-State: AN3rC/5/kqyZ2UFIGL8I6eqC7X4UkBnKNZOzIsURkEoRhSjucXXq0gReVY8KA42y3uoqkoD3
X-Received: by 10.36.23.84 with SMTP id 81mr15864623ith.14.1491922627506;
	Tue, 11 Apr 2017 07:57:07 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 71sm8025298iof.29.2017.04.11.07.57.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 07:57:06 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:56:53 +0200
Message-Id: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3 0/8] yocto-compat-layer: bitbake-diffsigs support + per machine checks + OE-core fixes
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
X-List-Received-Date: Tue, 11 Apr 2017 14:57:07 -0000

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

Patrick Ohly (8):
  go-cross: avoid libgcc dependency
  gdb-cross: avoid tune specific paths
  -cross recipes: ignore TARGET_ARCH sstate hash
  yocto-compat-layer: include bitbake-diffsigs output
  yocto-compat-layer: also determine tune flags for each task
  yocto-compat-layer: add --additional-layers
  yocto-compat-layer: test signature differences when setting MACHINE
  yocto-compat-layer: better handling of per-machine world build breakage

 meta/recipes-devtools/binutils/binutils-cross.inc |   3 +-
 meta/recipes-devtools/gcc/gcc-cross.inc           |   3 +-
 meta/recipes-devtools/gdb/gdb-cross.inc           |   5 +-
 meta/recipes-devtools/go/go-cross.inc             |   7 +-
 scripts/lib/compatlayer/__init__.py               |  32 +-
 scripts/lib/compatlayer/cases/bsp.py              | 204 ++++++++++++++-
 scripts/lib/compatlayer/cases/common.py           |  16 +-
 scripts/yocto-compat-layer.py                     |  29 +-
 8 files changed, 288 insertions(+), 11 deletions(-)

base-commit: ec2931852b2a097c9c8cb0d7288f5ca1d79f401c
-- 
git-series 0.9.1

