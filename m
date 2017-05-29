Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 741D27809E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 15:32:45 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id k91so42853531ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=475mlScWGopPxfs1e4BN0UeL3D8usDyM0uS9SErGzVU=;
	b=z8vrUwgle78K+2h5AgONX1BWn7WYnrq9icPBS4kbOnMvuXpnTHVqLJvayKny4ZsSbg
	CEApCO47QN+dnJ251HExPeZEZWS9NtPWHNa7JP+y9ygzozUMePQWDn9BwRxjnb0Z34Yj
	zbWflDtbgqRYFsGlabyK6rzzEaeylGYxA9TL4m9nRaTpDw5vQPvYr2+/sro4EHT4eNqg
	3mrqbCDIfk39K0j3xtTzRfMzKOJJ1Jn/W4OoBZClasaRVpO9/E/qFDJZrTMU8pT0fUxR
	hfW1jcFrRjAZ8esQFZIYYlH24vI1uOwtR2wOqFK7w5D4s6BjPLYsDk72hLiyQiezHJG4
	pqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=475mlScWGopPxfs1e4BN0UeL3D8usDyM0uS9SErGzVU=;
	b=nnv7eeYlmXBpXfpCjSDT6GAkY2T6WnfD+1suzsLRKyWsbYEXjhQG24gTfvlq/JpGfK
	4Y9XS9VIhYipg7ddt8xubOoGQWhQ3Vb+pi0fi7TQOUZH039u+KhYGGctmaouv0He+yBi
	k9pYHlTP3ZqsypFYtybNDr1EG/7SLWfYjYnh4Y0a4Q5DrI8odn5qXMqnbkIYxtqQIMQT
	k7BsvuTw+CAB5CxUTC+ggKC9nZ1gp7fe4oqk/CFk4j2z9wIaA36w64popselaxRikNJk
	8WIQNMgD8mw0zcT5GWAt6X9AhW2UtEoDUECEavOAAByxVQg44Neayvj5dl3RtQuIr2w5
	LBiw==
X-Gm-Message-State: AODbwcDR2jnkRITnQeOBmPmJSN814CIYDS5bkePpUeUq07/1tMy6NxHV
	afaPWa0+9ClF6fD85Us=
X-Received: by 10.107.145.11 with SMTP id t11mr15769050iod.129.1496071966999; 
	Mon, 29 May 2017 08:32:46 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	r82sm4232600iod.45.2017.05.29.08.32.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 08:32:45 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 17:32:34 +0200
Message-Id: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/6] yocto-compat-layer.py: various enhancements
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
X-List-Received-Date: Mon, 29 May 2017 15:32:47 -0000

While enhancing the layer structure in intel-iot-refkit I ran into
various cases where enhancements to the tool were
necessary. intel-iot-refkit now has oe-selftests that check all layers
using this tool. In addition, the signature checking utility code is
imported into a custom test that also covers a refkit specific case
(including refkit-config.inc must not change signatures).

Patrick Ohly (6):
  yocto-compat-layer.py: avoid adding layers more than once
  yocto-compat-layer.py: tolerate broken world builds during signature diff
  yocto-compat-layer.py: apply test_signatures to all layers
  yocto-compat-layer.py: add test_world
  yocto-compat-layer.py: allow README with suffix
  yocto-compat-layer.py: make signature check code reusable

 scripts/lib/compatlayer/__init__.py     | 90 +++++++++++++++++++++++++-
 scripts/lib/compatlayer/cases/common.py | 91 ++++++--------------------
 2 files changed, 111 insertions(+), 70 deletions(-)

base-commit: 598e5da5a2af2bd93ad890687dd32009e348fc85
-- 
git-series 0.9.1

