Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC905C46CA0
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 18:24:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.76900.1701714262019082269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 10:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B291E1650;
	Mon,  4 Dec 2023 10:25:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F4403F5A1;
	Mon,  4 Dec 2023 10:24:21 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 0/3] Move parselog ignores from code to data
Date: Mon,  4 Dec 2023 18:24:16 +0000
Message-Id: <20231204182419.2455488-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 18:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191764

From: Ross Burton <ross.burton@arm.com>

Hi,

This series changes the parselogs runtime QA test so that the list of war=
nings
to ignore is not embedded in a huge dictionary but instead read at test t=
ime
from text files in the layers. The generic ignores remain in oe-core, but
ignores that are specific to e.g. genericx86-64 can be moved to meta-yoct=
o-bsp.

This ultimately allows BSPs that are not in in oe-core/meta-yocto-bsp to =
use
parselogs without having to add their ignore lists into core.

The final patch in this series is for meta-poky, but as they need to be a=
pplied
in unison I thought it best to post them together. There will also need t=
o be a
follow-up patch for meta-intel, which I have queued locally.

Ross

Ross Burton (3):
  oeqa/runtime/parselogs: load ignores from disk
  oeqa/runtime/parselogs: migrate ignores
  meta-yocto-bsp/oeqa/parselogs: add BSP-specific ignores

 .../parselogs-ignores-beaglebone-yocto.txt    |   4 +
 .../cases/parselogs-ignores-genericx86-64.txt |   7 +
 .../cases/parselogs-ignores-common.txt        |  59 +++++
 .../cases/parselogs-ignores-mipsarch.txt      |   2 +
 .../cases/parselogs-ignores-qemuall.txt       |  27 +++
 .../cases/parselogs-ignores-qemuarm64.txt     |   6 +
 .../cases/parselogs-ignores-qemuarmv5.txt     |  15 ++
 .../cases/parselogs-ignores-qemuppc.txt       |   6 +
 .../cases/parselogs-ignores-qemuppc64.txt     |   4 +
 .../cases/parselogs-ignores-qemux86.txt       |   2 +
 .../runtime/cases/parselogs-ignores-x86.txt   |  10 +
 .../cases/parselogs-ignores-x86_64.txt        |   1 +
 meta/lib/oeqa/runtime/cases/parselogs.py      | 214 +++---------------
 13 files changed, 175 insertions(+), 182 deletions(-)
 create mode 100644 meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignor=
es-beaglebone-yocto.txt
 create mode 100644 meta-yocto-bsp/lib/oeqa/runtime/cases/parselogs-ignor=
es-genericx86-64.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-common.=
txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarc=
h.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall=
.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm=
64.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm=
v5.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc=
.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc=
64.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemux86=
.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-x86.txt
 create mode 120000 meta/lib/oeqa/runtime/cases/parselogs-ignores-x86_64.=
txt

--=20
2.34.1


