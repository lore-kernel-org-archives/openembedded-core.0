Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16285.1794916926597225262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=dm3hZv+t;
 spf=pass (domain: geanix.com, ip: 185.70.43.172, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794916924; x=1795176124;
	bh=9oaOOJp1O3aVeUaTQQL5ALQPeLRBANOi1oVexcrSEsM=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dm3hZv+tCUjMvbWlMCUoKByRa53Jy2WFk02VgZ9j9IuITstMhAMb4OYTG15x5J1pt
	 GTe7RRnlduz/ZMhgw71sgLSWC6LGC7yuGWqNdvgI3MJF0HwMjA8b8MazLq3+fygtIn
	 Dm1HS0Twz13hMIp8Xp8bsgf4PB/dgqGNQCNiaZ+KIly0HCPTZ0ERkcfYG3B2bs7h5i
	 HJrDwaa05nc7EGNwvQmEO5EjjTzbbg/oX5PdJ46tmkCIiSuoq6U7U1C+zd6uqkOK/s
	 Q6DPPOoN/Nq6E1yv80TIJhXvjxhTlRfTWdJaKOW+1y3Q8YOkSbmSwpumPS9p2VYGvm
	 i8ZOoWf21ug8A==
X-Pm-Submission-Id: 4jTNd64tHtz1DDLT
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH v2 0/3] license_image: don't apply INCOMPATIBLE_LICENSE to SDK host tools
Date: Tue, 17 Nov 2026 13:01:52 +0100
Message-ID: <20261117120155.3986876-1-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250433
Content-Type: text/plain; charset="utf-8"

do_populate_sdk checks nativesdk and cross-canadian packages against the
image's INCOMPATIBLE_LICENSE, so e.g. INCOMPATIBLE_LICENSE =3D "GPL-3.0*"
fails on nativesdk-autoconf, even though these recipes are exempt from
INCOMPATIBLE_LICENSE at parse time. This series applies the same
exemption when writing the image/SDK license manifest.

Changes in v2:
- Split v1 patch 1 into a patch that factors out
  incompatible_license_check_needed() and a patch that uses it in
  write_license_files()
- Replace the new IncompatibleLicensePerImageSDKTests from v1 patch 2
  with running do_populate_sdk in NoGPL3InImagesTests.test_core_image_min=
imal

v1:
https://lore.kernel.org/openembedded-core/20261113101537.3586467-1-sean@g=
eanix.com/
https://lore.kernel.org/openembedded-core/20261113101537.3586467-2-sean@g=
eanix.com/

Sean Nyekjaer (3):
  lib/oe/license: factor out incompatible_license_check_needed()
  license_image: don't apply INCOMPATIBLE_LICENSE to SDK host tools
  oeqa/selftest/incompatible_lic: build the SDK in NoGPL3
    core-image-minimal test

 meta/classes-recipe/license_image.bbclass     | 13 +++++++---
 meta/lib/oe/license.py                        | 25 +++++++++++--------
 .../oeqa/selftest/cases/incompatible_lic.py   |  4 ++-
 3 files changed, 28 insertions(+), 14 deletions(-)

--=20
2.56.0

