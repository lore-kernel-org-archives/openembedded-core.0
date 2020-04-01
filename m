Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9242.1585753103282708478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 07:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeov-00011f-IQ; Wed, 01 Apr 2020 16:58:21 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeou-0003Fr-Q4; Wed, 01 Apr 2020 16:58:20 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH 0/5] fix populate_sdk for package_deb
Date: Wed,  1 Apr 2020 16:58:00 +0200
Message-Id: <20200401145805.6936-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

This series fixes bugs in lib/oe/package_manager which are triggered
when using populate_sdk in a distro using PACKAGE_CLASSES = "package_ipk".

The main issue is that apt install will try to remove already installed
packages which conflict against those requested in the current install
step. Is is triggered here by the coreutils conflict in
target-sdk-provides-dummy, which provides perl (amongst others).
As apt and dpkg depend on perl, this causes apt to try to remove itself,
failing at the essential package check. As this happens during the
complementary package installation, which is allowed to fail with a
warning, this leads to an SDK which is missing the -dev/-dbg packages.

This issue also affects zeus, so I'd be grateful if they could be
applied there as well, to avoid having to maintain a modified OE-core
locally. I've tested them on master and zeus.

Jan Luebbe (5):
  lib/oe/package_manager: make sure to not remove packages in apt
    install
  lib/oe/package_manager: fix handling of last package
  lib/oe/package_manager: collect provided package names when using debs
  lib/oe/package_manager: avoid installing provided packages via apt
  lib/oe/package_manager: don't try to rm /var/lib/opkg

 meta/lib/oe/package_manager.py | 37 +++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 14 deletions(-)

-- 
2.26.0.rc2

