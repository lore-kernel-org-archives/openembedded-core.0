Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 83A1A77BE9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 14:49:08 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id k91so42268100ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 07:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=K/V+9u6arN7sN8RWa5hg4zV/ZbyolNaNujYotD9Vp+k=;
	b=UyShTw6MSWuHk0cNsnZrfHby+1y1ACuS43YPc8ZMtTBMKGsgAULg0DeZtFskMI5kvq
	QRuTj9jP4ztxK/rwCBfa4ZjdbR0pbw6vULkE3nIq4vFxZX3xDKNt8tE4TBMLAd7RRBQa
	LafSWJO8dRmlro9UQTBY/WIJ7oBBu/hdpSeRZRTXE/Jf2mbg2K0wpaZ0pmaSyY5z65jW
	DN7UmslLjMnaLE4NtP6LIdxTVr0Ew1/lRyA1Z7rFXGsDNUW+ZK+QU6gFLRKPLxNoOKgC
	1iX69LLIJo+vKz6hCmWH65mzui9i623GDN6TBGiTSwp2e3qK7EzY/VoxevNgF4QsM6nW
	RHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K/V+9u6arN7sN8RWa5hg4zV/ZbyolNaNujYotD9Vp+k=;
	b=F8aRAby0quK/1brVHeSQXO4at0goAb9SjkiyOcbyxcQ7YzHMesRNAqw044j4e1oNRI
	8hOdxy0Abjf8qVSslnQ0wdFUR0oFn/bG/ulxmBl6D2+AkLqBGeuRocbn9smBd9Fvn5K4
	0lbI0I2Mgn577KyBPTzhpQ7e2BiRVUt6WsUprpAQdfq/oS1xzIpiJZznRAPTHZvPpiOh
	vkW1KBeqsU/mUT2UaDKUk62ZFXGcjW/GSQAGPXMI091VW05nj0KLvEUOmPVnrf4CT2NP
	ejPqN570LZvfjV7Q8chDnCQOJkc9/A9rsFQBu7Xi0j7zG7VZISx0cgtf75jzQTJGR1Yb
	MApw==
X-Gm-Message-State: AODbwcCliINsz91qVfmN2UsSTXSK6lAb86aNo2cfLqE9MTELNlep0Oq2
	/W0+U5FWYQzXErX+/5k=
X-Received: by 10.107.15.19 with SMTP id x19mr13850117ioi.214.1496069349089;
	Mon, 29 May 2017 07:49:09 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	i28sm4239431ioo.54.2017.05.29.07.49.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 07:49:07 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 16:49:02 +0200
Message-Id: <cover.6a3be6133a9172fdd3e435528c8d98c4be1d9dd1.1496069310.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/1] bblayers sanity: bblayers.conf.sample specific update code
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
X-List-Received-Date: Mon, 29 May 2017 14:49:09 -0000

In an experimental branch of refkit I bumped LCONF_VERSION from 4 to 5
and ran into the problem mentioned in the commit message: instead of
raising an error as before, the code (incorrectly) claimed to have
updated the bblayers.conf file.

Perhaps refkit should have started with LCONF_VERSION as in the
current OE-core bblayers.conf.sample file to avoid being affected by
this - too late for that now, though.

As an ugly workaround I'm currently jumping from 4 to 8 directly,
which produces some extra (and wrong) output about "automatically
updated" before finally raising the expected error (twice, for some
reasons).

I'm not sure how this code was meant to work for different distros
based on OE-core. Depending on when a distro forked from OE-core and
how it continued with numbering its bblayers.conf.sample file, there
must have been such conflicts already before.

Note that I have only checked that the code gets called when placed in
the expected location, and the code itself was copied verbatim. As it
refers to ancient changes, I've not actually tried to set up a build
dir where that upgrade path is necessary. Perhaps the code could even
be removed entirely?

Patrick Ohly (1):
  bblayers sanity: bblayers.conf.sample specific update code

 meta/classes/sanity.bbclass               | 121 ++++-------------------
 meta/conf/lib/bblayers_update/__init__.py | 104 ++++++++++++++++++++-
 2 files changed, 130 insertions(+), 95 deletions(-)
 create mode 100644 meta/conf/lib/bblayers_update/__init__.py

base-commit: ccf630e78aad488da7b80f2981037d3d0559cfad
-- 
git-series 0.9.1

