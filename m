Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF8AC88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 11:46:04 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18332.1789386356924373859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 04:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=Uj6Dgdrc;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=AxgNMKp+;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789386354;
	bh=vxb8P0Pc//rxdwMQnsUig4n1OSHFWtzOmR71HlA9rX8=;
	h=From:To:Cc:Subject:Date:From;
	b=Uj6DgdrcSLYS1Rr7M5ody2HK7Mwvt4tFAPKWwt0fMXWvIWtAIoNuFMf2rMdk3HR11
	 OdbrMVa0saFwsOAc7SoKCpnAzy84w9xH3iSkKCkzJ9ubGwqJooLfsMHSjs4TO6zi9Y
	 IaNM0MIGOHTJPKbbRk0B1FwpPPPSebbYqEEA6TS58J9qBodp2+7w8Arcs8qVwOEl2G
	 WDc8/e/VkHHeY5/VPCu0s4BD/2Qs3fMHbym6RiTWRK/xbwztaT3p8VFp4TLdoXRI+t
	 FagueUxBHrul0BV2OGREc7GRJeFW+3tw1wygyxWmOkO32YSJiRM8N/WE1sjX0edYSx
	 7UA4ynsuEO2sw==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 0BB8C5FA92
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 13:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789386353;
	bh=vxb8P0Pc//rxdwMQnsUig4n1OSHFWtzOmR71HlA9rX8=;
	h=From:To:Cc:Subject:Date:From;
	b=AxgNMKp+JW7FuqV8KAKFyfne39Zpqyzkl9nCdaB0LEyUpjNZLzvw1GkvwHSVFfZhu
	 TEDGtSin7g1CC1Ixd1X4wxqYdPi3N0LWeoG96kcaNlWfu8dxuneJh1gYNwKyJAGXLg
	 4Fl9nXNriATg8TTlezTTBCYTMkBlp9u6CZHIoJ0wfB3+JLFEWR4Vzj8/X4fJByj2kK
	 OW5JE99ucHSma8/aLaquQlJBH3i2DOBs/kKVl0PCLZSbDvUlNSEw9Jt67/F96Xh/je
	 6mMGJhVmWc/tCvHZIFUbAa74GhjcXwX+ZKXQ+wRjUutdiPU17fqjRN9BuVeeGdL9sT
	 JJ2t3Qxw102LA==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id EB5E05F82B
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 13:45:53 +0200 (CEST)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH 0/2] Add meta layer information to spdx
Date: Mon, 14 Sep 2026 13:44:19 +0200
Message-ID: <20260914114526.2646773-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 11:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245763

Hello,

as discussed before here
https://lists.openembedded.org/g/openembedded-core/message/226131
and here
https://lists.openembedded.org/g/openembedded-core/message/225774

it would be good to include information about the layers used in a build =
in the
generated spdx documents.

My primary goal is to track where all the configuration files added via f=
ile
protocol in `SRC_URI` originate from, but the approach could be extended =
to
track recipes, classes, machine config etc.

These patches are meant as a basis to discuss the approach and should be
considered draft status.

The approach is to generate a `layers.spdx.json` on each build invocation
that lists each layer used in the build as a `softwarePackage` with versi=
on
and source information as well as - if can be reasonably deducted - the
downloadLocation. Each source file added via file protocol is then linked=
 to the
containing meta layer via a `contains` relationship.

Open Questions:
- is the overall architecture reasonable/correct?
- referring to layers is inconsistent across tooling. E.g. the core layer=
 is
  either named `core` as defined by `BBFILE_COLLECTIONS` or `meta` as tha=
t is
  the layer directory in the openembedded-core repository.
  I chose the latter since that is what the utility function
  `oe.buildcfg.get_layer_revisions` returns. The package URL (PURL)
  implementation uses the other naming scheme though. Any thoughts on whi=
ch
  should be chosen and why?
- I do not understand the alias linking yet. With the current implementat=
ion
  I see many hash mismatches like
  WARNING: gcc-runtime-15.3.0-r0 do_create_spdx: Element http://spdx.org/=
spdxdocs/layers-7ad0d8d7-57f9-5c3c-9411-49227dd50610/layers/layer/meta
    has alias http://spdx.org/spdxdocs/UNIHASH-7ad0d8d7-57f9-5c3c-9411-49=
227dd50610/UNIHASH/layer/meta, but it should have prefix
    http://spdxdocs.org/openembedded-alias/by-doc-hash/e80f1d61f4749e663e=
80a4dfb25ebb1127b5f50600d3065de7ed91030942a1ef/

I've currently got some time available to work on this to get a proper so=
lution
integrated into openembedded-core.

Best Wishes
Daniel Wagenknecht=20



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


