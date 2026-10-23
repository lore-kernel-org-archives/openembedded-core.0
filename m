Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3818.1792750955215457504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=sE3AWfCK;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 543D91650;
	Fri, 23 Oct 2026 03:22:31 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED2333F7B4;
	Fri, 23 Oct 2026 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792750954; bh=9zk3AA9d96rgmlIzsUtUXY+9oxNGwVqZqN1kO2icPAw=;
	h=From:To:Cc:Subject:Date:From;
	b=sE3AWfCKFB+vAyBdbXvlRf18pRaq746gWTRwSagOEywaJo12lmkL7UjWkhWPm5xIE
	 EZ+vb8V9ZJbUPP/Jo8zI0G0yMyY4Cx7hrfpzJZwXWUf79IAkQEAAoGfMu02b1qOgZH
	 bRJ9d29r0PpXtgc16hdct2OSixG+WvgTLb1QgARY=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 0/5] devtool: Support multiconfig workflows and fix kernel extraction
Date: Fri, 23 Oct 2026 11:22:10 +0100
Message-ID: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248498
Content-Type: text/plain; charset="utf-8"

This series adds multiconfig support to devtool workflows,
isolates workspace changes between configurations, and fixes
kernel configure failure handling and source revision baselines.

It also adds selftests for multiconfig workflows and isolation.

This series addresses [YOCTO #13933].

Anusmita Dutta Mazumder (5):
  devtool: Support multiconfig recipe workflows
  devtool: Check kernel configure result
  devtool: Isolate multiconfig workspace entries
  devtool: Record kernel baseline after revision validation
  oe-selftest: devtool: Add multiconfig workflow tests

 meta/classes/devtool-source.bbclass     |   3 +-
 meta/lib/oeqa/selftest/cases/devtool.py | 133 ++++++++++++++++++++++++
 scripts/devtool                         |  24 ++++-
 scripts/lib/devtool/__init__.py         |   8 +-
 scripts/lib/devtool/standard.py         |  88 ++++++++++++----
 5 files changed, 230 insertions(+), 26 deletions(-)


base-commit: ae5cafacec8e99c5a27fa5b3b378eefc595910ef
