Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 18FE677AF0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 16:38:25 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id t68so19343956iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=PpeZ7znKoUec3OL9G1mpErfKgoAHKrYZ8HKRI3Fs74c=;
	b=PZQ0JIb+oK0J1rFobzblEsnEgYHctLLRtU0NIhsw27AY5Ve8aPxuVyeyWztdi4tDgc
	U+u0yFH4ElSAWIq2j2BYxUTdEIcy0ela2H4CPxIsEPvTJRH4CduJDEuQF9PgSZ/fwLG2
	ikzWB7jjWaJ5hKgdKFN2bgEPgMS4BFfF5CbGkICPWglUJONZ4lENrZenU1+NPfJLeHuf
	QznlUzQuIeLsYC+JFwXg0eGAuHYYFzPiqFH79i9owhGSUi1n4N6Ow5mQ0SrlyvejWb6w
	VETA2ACqAQFziXS6musppnI28x9rNP7RSoydx9ddhTQHpJdPuw4jCGuRVUjDC03Ixl8+
	O1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PpeZ7znKoUec3OL9G1mpErfKgoAHKrYZ8HKRI3Fs74c=;
	b=oYGEk1UsQgGLxVc+Nh1lIBB/S7/ywPY5bKNZg2HaJydu40mwKx3aR1u3CdGZbAaKgj
	vIRBRCz2Ul+fxV9za3yubOooECXJbTQAhdZYmOMnDcHhgrsDwzaA1u3PBshh6fE0sRLA
	u7IgSHavbhuFCd53vqmYFJaaelg/SF0ck4+1S7iOc4WpY2iBqj7fZB6l77Qf6n+wGeH5
	dTOK4rleuMkn5yQGg94g4Gx3NbSyL4RsHsHWxdYYo7yPjiW4EHJB1h/muBIVZk3TyEbh
	GpMVstGIpSb617OnunHBlnZs0cKV7jzTPFKroBM+6rz1nGwSzb6I6cSNw+k/y67CVhxg
	N6uA==
X-Gm-Message-State: AFeK/H37TOiWMGa2TCHNw9kNh0/NJ+0oVEV31TWRejKnm73Tl4SlS2G9Cc417V15NxIqSARn
X-Received: by 10.107.197.129 with SMTP id v123mr46280975iof.175.1491583106155;
	Fri, 07 Apr 2017 09:38:26 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EAD9.dip0.t-ipconnect.de.
	[93.232.234.217]) by smtp.gmail.com with ESMTPSA id
	n10sm11907916itg.8.2017.04.07.09.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 09:38:24 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 18:38:15 +0200
Message-Id: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/5] [RFC] yocto-compat-layer: various enhancements + bitbake-diffsigs support
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
X-List-Received-Date: Fri, 07 Apr 2017 16:38:26 -0000

I started applying yocto-compat-layer to some real BSP layers and ran
into some usability issues with the tool.

I also didn't want to do the root cause analysis manually, so I
automated the dependency analysis and the running of
bitbake-diffsigs.

This patch series is based on Mark's "yocto-compat-layer.py updates"
series. The last commit depends on Paul's "bitbake-diffsigs: add an
option to find and compare specific signatures" patch from
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=paule/sigstuff&id=5bb69edfb4bbaa7373061daeb4f233a7e2f43a43

Regarding the BSP example that I ended up using: it actually was one
of the better BSP layers and only had one problem in a "bitbake world"
build instead of several as in other BSP layers. Nevertheless I
obscured the name to protect the (not so) guilty in the commit
messages ;-}

The two changes that show up in test_signatures look harmless at first
glance, but probably would need to be done differently to avoid a
false positive when doing the signature check.

V2: - use self.fail() instead of self.assertTrue(False, ...)
    - test_machine_signatures check (work in progress)

Patrick Ohly (5):
  yocto-compat-layer: fix also other command invocations
  yocto-compat-layer: limit report of signature changes
  yocto-compat-layer: include bitbake-diffsigs output
  yocto-compat-layer: also determine tune flags for each task
  yocto-compat-layer: test signature differences when setting MACHINE

 scripts/lib/compatlayer/__init__.py     | 71 ++++++++++++++++++---
 scripts/lib/compatlayer/cases/bsp.py    | 54 +++++++++++++++-
 scripts/lib/compatlayer/cases/common.py | 89 ++++++++++++++++----------
 scripts/yocto-compat-layer.py           | 22 +++++-
 4 files changed, 189 insertions(+), 47 deletions(-)

base-commit: 719f6ff68135dc2ad143c8572c8321974f6a3357
-- 
git-series 0.9.1

