Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id DAFC178082
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:05:12 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id c201so40455473ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ylWbS1J1PvgFC5QG7+ppx3PhtCUT0rt8b6EYsjyEn1w=;
	b=EZb9ZzvTPY5sUmXK9RuLsswPq9wijRrVrKvenAODAHn0aH2OFyx2mjkofqqLAzvj0g
	HuLvHVIOwzRGHWcoeyAP7mcfU0oFsuowFM480nqZrovLbbTbgUc3UgOtVLJv0b0wmfHJ
	/gBnLD64F87bgphDP9kofvIZBdmQLU1dsOtVOR+jgcZEv1uAwj1+zfs1jeevuEgwPl24
	BT2YkgvyIKq4LUBeh7tQPtxGU7fQ7mmtWVnc6NWaqjAUY8aGZqUeUXCEvxT1ADYjy0im
	20i67NyeAXraI147Ja4liSyhKOI88VD3BnuvkA6GaquxHlle/ALJ9XD7FNXFezoGpc2I
	whIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ylWbS1J1PvgFC5QG7+ppx3PhtCUT0rt8b6EYsjyEn1w=;
	b=gZZqF/9iZvl46y5F2+Si6GqemGud/kJB4wrsML9qOCDlWdWEWd6X7RwzunTo/qSNJS
	DKNZh1sDDa44MUvB+X5nTR46AO6/ixgD4JMQSW89TTfuyZmVDHgyHMUhik+6pN6kF6+H
	XfXlTDSPo2zDNIGO7Rdkpt09mWJ9PSWugcMq2BIozcDXXfETB4pgtOQGtJdXhAEaDUFJ
	zKKZp4a8c7PeQPVWywH1RlLw3InB+ZY5J0nEX8IQx84W+fcLgaADa5rNMZwCpcvyOWAt
	C3BClD72fARbyqru0w11YGP9qA2hOSW4qz4XsytSyDrcY3iAxVAWvye3m1Esgo1wgeo6
	8XfA==
X-Gm-Message-State: AKS2vOzLeDqxa733wWolzMAfL79kGq2p95n7yij1MUPDhg2r72kS94hy
	s0ZrCRANO2mWGGqmLMw=
X-Received: by 10.107.27.134 with SMTP id b128mr7795048iob.175.1498223113185; 
	Fri, 23 Jun 2017 06:05:13 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DF06.dip0.t-ipconnect.de.
	[93.232.223.6]) by smtp.gmail.com with ESMTPSA id
	a191sm2966083ioe.1.2017.06.23.06.05.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jun 2017 06:05:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 15:05:01 +0200
Message-Id: <cover.15cc4e9137e8e3a07cae0cf09e9e2f2e4bcefa56.1498223057.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Fri, 23 Jun 2017 13:05:13 -0000

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

Patrick Ohly (2):
  commands.py: live output logging + result.error encoding fix
  runcmd.py: unit testing for runCmd()

 meta/lib/oeqa/selftest/cases/runcmd.py | 117 ++++++++++++++++++++++++++-
 meta/lib/oeqa/utils/commands.py        | 103 ++++++++++++++++++-----
 2 files changed, 199 insertions(+), 21 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/runcmd.py

base-commit: 1d9a88f635549e68562de681e297b9270ad02d4e
-- 
git-series 0.9.1

