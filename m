Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBDEC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 04:10:34 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.60681.1722485427386628644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 21:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=NUDvyNhr;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BFBFF20B7165; Wed, 31 Jul 2024 21:10:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFBFF20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1722485426;
	bh=KrdyP9gDyKflN1Bm6nkPA5cFlpyg4MjRNmeMGbbqkDg=;
	h=From:To:Subject:Date:From;
	b=NUDvyNhr/OgTw7iBf4XCb3iZTNKn89mx0VY6vzVDcQTWK90NVr5nJ1Fo/lR62IUeo
	 7MsqmLNTw/whtYDsf6M/+En8QTfPRBwM+Oz4lG1l6tPc7vFMZhfjFJZaiSIMeG/lI0
	 Lf/t4uc9ffYyc1L3BP3IMO+sA4jxWS4H3ukHdqvY=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/1] classes: add new retain class for retaining build results
Date: Wed, 31 Jul 2024 21:10:21 -0700
Message-Id: <cover.1722485084.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 04:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202722

classes: add new retain class for retaining build results

Add a fairly simple class to tar up the work directory on task failure
to a configurable location - useful when the build environment is
ephemeral (e.g. an autobuilder/build pipeline). The directories that
are retained can be configured, and you can also choose to save
directories on every build as well if desired.

[This is a significant reworking of a prototype I sent as an RFC back
in 2020 (AKA "workdir_save"). Changes since then include deferring
tarball creation until the end, more config flexibility, and the
addition of test cases.]


Changes since v1:
* Use ;prefix= instead of : to specify tarball prefix, to be consistent
  with other similar usages and avoid potential confusion with overrides
* Use prefix of "workdir" for default work directory tarballs
* Fix dir name within tarball to not have .tar.gz extension
* oe-selftest: fix test_retain_misc to be deterministic (should solve
  failures seen on the autobuilder) and tweak tests for robustness in a
  few places
* oe-selftest: add detail to failure messages in test_retain_misc and
  test_retain_failure


The following changes since commit 662396533177b72cc1d83e95841b27f7e42dcb20:

  create-spdx-3.0/populate_sdk_base: Add SDK_CLASSES inherit mechanism to fix tarball SPDX manifests (2024-07-26 12:26:24 +0100)

are available in the git repository at:

  https://git.yoctoproject.org/poky-contrib paule/retain
  https://git.yoctoproject.org/poky-contrib/log/?h=paule/retain

Paul Eggleton (1):
  classes: add new retain class for retaining build results

 meta/classes-global/retain.bbclass     | 182 +++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/retain.py | 241 +++++++++++++++++++++++++++++++++
 2 files changed, 423 insertions(+)
 create mode 100644 meta/classes-global/retain.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/retain.py

-- 
1.8.3.1


