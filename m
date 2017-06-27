Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 69AF077E4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 11:03:46 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id m68so11861895ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4IJc3kClcwS1izqTY3tE9QTXw90oswtmTb4Q3JFhVV8=;
	b=kRmFCos6vCooRMvN94b/Hn71JxLS6AkZ63cIfm2beZDDnDi4Pasyorp0irGQSrmgSG
	gZf4OdieP1359o2wLHaFFoIMbPWA7u2JkFiIOVTFg6QKHmdEnLoyjrzfAJe2n6OP3iU2
	1e39ALuIaZgxnP42zAR0+UYLD/dZZ5n4BU/1djKv9sW+yp6OTK+LEIm/+uJn6rf8h2Qz
	27WaHeH7jOCDtIJw4S0QiiKKN/YLBrNHjCXjdx5d6bRMPT1GyjiZXIFQBg2ojf6WmuJ0
	zvmteuQZEW+JrDwvu2GzQTDQw02p63hXwEtaFjVvlqtzyC88VEg90uljXtEJ7vSmjP7t
	5jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4IJc3kClcwS1izqTY3tE9QTXw90oswtmTb4Q3JFhVV8=;
	b=mVnMoYsFNAPq1EieHhzMKDWDuzczo804gDUc8HnpshaH2pA+Fa1JfNzsBHgx6JiTwl
	BzCzK2+m0RyRRpl08wqP1vjRMul3rexcqWz0Hpvwt8Y0cVX615bvhO1JJSc/WQnwhlCe
	beOV8K14zT96Lz7dG1sE8vst2zl+HGBUkXwSGYSfY5fUzKbU3wW5GcT1CRUPkFlaQvQb
	dXdqXWlCLux4a/qZQA5z0mJPGYmA99H7MNhNo/lM6gh99vUQsPnsuvNt8uhC9ev41vGD
	CmCdOwUdBQqvZmJWSy7dqASVLgla6/yyd14rn5aXdU4Q9CG6XUSe+MGvOdZSlglju84C
	50dg==
X-Gm-Message-State: AKS2vOx8yEqErJqW+zte9ACKhcseAb7jbpTMbjIdSJCroWu4DiY9ORdk
	xF2+JDQtars8FslqroI=
X-Received: by 10.36.124.5 with SMTP id a5mr2520521itd.41.1498561427061;
	Tue, 27 Jun 2017 04:03:47 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	e14sm1182323itc.30.2017.06.27.04.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 04:03:45 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 13:03:39 +0200
Message-Id: <cover.6294f875f727127346587b794d369e08b84cc30e.1498561325.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.15cc4e9137e8e3a07cae0cf09e9e2f2e4bcefa56.1498223057.git-series.patrick.ohly@intel.com>
References: <cover.15cc4e9137e8e3a07cae0cf09e9e2f2e4bcefa56.1498223057.git-series.patrick.ohly@intel.com>
Subject: [PATCH 0/2] enhance and test runCmd()
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
X-List-Received-Date: Tue, 27 Jun 2017 11:03:46 -0000

This is mostly motivated by some long-running build tests triggered in
refkit where better output handling would be very desirable. I had
this idea already before Leonardo proposed to change the runCmd()
defaults, but as that's now a hot topic, it seemed like a good time to
actually implement it.

The result.error encoding fix is something that Leonardo also had in
his "[OE-core] [PATCH 2/2] selftest/cases: use stderr data when
querying for errors" patch.

Beware that this patch series conflicts with those patches because
that same code is changed and because the current default semantic
(joined stdout/stderr) gets explicitly tested.

Change in V2:
- fix race condition between "process has closed stdout/stderr" and
  "process has terminated" by calling wait() instead of poll()

Patrick Ohly (2):
  commands.py: live output logging + result.error encoding fix
  runcmd.py: unit testing for runCmd()

 meta/lib/oeqa/selftest/cases/runcmd.py | 117 ++++++++++++++++++++++++++-
 meta/lib/oeqa/utils/commands.py        | 107 +++++++++++++++++++-----
 2 files changed, 202 insertions(+), 22 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/runcmd.py

base-commit: 563cab8e823c3fde8ae4785ceaf4d68a5d3e25df
-- 
git-series 0.9.1

