Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4335.1793966117993250321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 03:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=cAXT4lpE;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1793966107;
	bh=EnjDGnSCKkWgBO1aGxvlnQW4posy/eWjQ6zxu+FRoRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cAXT4lpEbq/Pe6zYsAcF2Tvv61w6XHCuFfh9JLx1Lx30hOLn9TjpdrEXUTR/2Oe9T
	 6ypZEPxLY52jos2cYb3uncNzwfKwO0WeYlrHhPIKVYKIdjoJQBRLnfZ+Kafuh7IgJw
	 P39S45y0+YZdsq0Ux2YneRIJBe0KSX0xmGo3CwDW0DMEk0T5vA23ffrMXGs3nHwPo6
	 SmHMBmFV3F+ts2YovDh11ikTLahiKquhMkskU/rcD38n4tyWHqdzQRsdJytCqjgCYv
	 T2EDkA0aTeSortYUi6+hB5AFmXAihqrRmkRmxL5ZI/JnvJtv0ZEOm/ttO/7+H/3W//
	 4essiTmaktC/g==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 2024D5F8CF
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:55:07 +0100 (CET)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [DRAFT PATCH v3 0/2] Add meta layer information to spdx
Date: Fri,  6 Nov 2026 12:54:53 +0100
Message-ID: <20261106115455.4141199-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915130509.2184318-1-dwagenknecht@emlix.com>
References: <20260915130509.2184318-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at mx1.emlix.com
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 11:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249634
Content-Type: text/plain; charset="utf-8"

v3 of the patch series looking for feedback on the overall architecture. =
I
worked out the problem in alias linking, so a major blocker is out of the=
 way.

Please continue to consider this as a draft for discussion only!

During discussion on IRC some questions were raised especially regarding =
the
interaction with sstate caching.
The layer information is only part of `create_spdx`, not `create_recipe_s=
pdx`.
It is thus only added to the final image spdx documents, not to the indiv=
idual
recipe or packagage spdx document. Images and their spdx documents are al=
ways
rebuild, so with this approach no additional rebuilds occur even if a lay=
ers
revision changes.

My still open questions are:
* is the overall architecture reasonable/correct?
* referring to layers is inconsistent across tooling. E.g. the core layer=
 is
  either named `core` as defined by `BBFILE_COLLECTIONS` or `meta` as tha=
t is
  the layer directory in the openembedded-core repository.
  I chose the latter since that is what the utility function
  `oe.buildcfg.get_layer_revisions` returns. The package URL (PURL)
  implementation uses the other naming scheme though. Any thoughts on whi=
ch
  should be chosen and why?=20

v3:
* rebase onto current master branch
* fixed the alias linking

v2:
* fix build failures on clean build (layers.spdx.json created before bitb=
ake.spdx.json)
* rebase onto current master branch
* remove commented out parts for overwriting the layer commit id

Daniel Wagenknecht (2):
  spdx: add entries for meta-layers
  spdx: link files to the meta-layer providing them

 meta/classes/create-spdx-3.0.bbclass |   1 +
 meta/classes/spdx-common.bbclass     |   3 +
 meta/lib/oe/sbom30.py                |  12 +++
 meta/lib/oe/spdx30_tasks.py          | 118 ++++++++++++++++++++++++++-
 4 files changed, 130 insertions(+), 4 deletions(-)

--=20
2.54.0

