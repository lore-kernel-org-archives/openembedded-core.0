Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id ED44D77CD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 15:44:32 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id b187so36499425oif.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fw8UUW9gKiKbOvOwakMqi3imMvRwJrtJvdPnY+KiEAk=;
	b=XR+rHPFiX78lAXnlaJrPAk2Vs4bpPMbkZjIXOcD6EgamD4v8dS/8XOaw8zPQPaGkWe
	ooqFm9bKDGO+8v+tC5lOihE9JAm9Yv8phwOvOa4HvVy/WLcrqu96CW1YWao5H5ZAjsRS
	GJL3z7hLDZpecmovp7QSJdAh2zFEYNQDuGVYnXp48GSGvnAXAFIy1gITCnSfHQ2h4OOR
	9SKZi1TIU8ApmImLGf0l9BrtocAFTCwECtJxWKvxFSkUJp3G0U2wEHLWN7h9NVR9Tntr
	jAyLtncKh69J+yQMyRhsXLVeCH/544ZjQVhPF9Ds9wdq4x8CZWDNMbQJHWDdkJDQCcJy
	lVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fw8UUW9gKiKbOvOwakMqi3imMvRwJrtJvdPnY+KiEAk=;
	b=l9WeuOxhKA+M9o8OASCgquojnF07G1MtO9AyJFaWYaTp/lEOnulKjV52VHWIfBIev0
	oSs6SNkZTIgmBXhqbJ1n/froJjWY+vMP7567jz4ii0kCqDO9hnV1dkmCTU67k0Jxle+W
	ZkXnHzRjtCzApkL2TrC0wJn1ySF6nrbxa2/d4URCRr5ucCFntNJpTYDVhovCCebtpURj
	CTzFrd9Nc0nI+TYIoenwVgsTjPIqTvmZpdSU7HDLuKGqskaMYIPQd3T2mG6/FV4zgCaX
	QUf77mjQqCRQ2U8KVxvZ0X+riBHLU6Sb56JliIVyM9Ur2qGM62HccVD2GgUsN0Dedmwi
	Bb4Q==
X-Gm-Message-State: AN3rC/46OaExUnSDgF/HsSF+vng0Xjjm+mF8x4gB6gPczQeQF8Jy3YNb
	is20ffK+lQBEaaBM
X-Received: by 10.36.67.135 with SMTP id s129mr23349266itb.36.1492011873774;
	Wed, 12 Apr 2017 08:44:33 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D306.dip0.t-ipconnect.de.
	[93.232.211.6]) by smtp.gmail.com with ESMTPSA id
	b126sm9618243ioa.55.2017.04.12.08.44.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Apr 2017 08:44:32 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 17:44:24 +0200
Message-Id: <cover.7122c18ef0bab2b3b9f6f6b36f28f806943eab82.1492011846.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v5 0/2] yocto-compat-layer: per machine checks
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
X-List-Received-Date: Wed, 12 Apr 2017 15:44:33 -0000

It is important to test with real MACHINE values, otherwise changes
introduced by layers only when their machines are selected wouldn't
show up. The new test_machine_signatures and test_machine_world tests
cover two aspects of that (signature differences and world build
failures).

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
V5: - rebased after preceeding patches were merged
    - generate task list dynamically based on depgraph instead of hard-coding it

Patrick Ohly (2):
  yocto-compat-layer: test signature differences when setting MACHINE
  yocto-compat-layer: better handling of per-machine world build breakage

 scripts/lib/compatlayer/__init__.py  |  23 +++-
 scripts/lib/compatlayer/cases/bsp.py | 180 +++++++++++++++++++++++++++-
 scripts/yocto-compat-layer.py        |   3 +-
 3 files changed, 201 insertions(+), 5 deletions(-)

base-commit: e41c90b852167bbcb434da57b84280e855acae33
-- 
git-series 0.9.1

