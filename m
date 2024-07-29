Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6464DC3DA64
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 00:23:10 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.46073.1722212581337256106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 17:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=oDUKkR8/;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 6A40B20B7165; Sun, 28 Jul 2024 17:23:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6A40B20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1722212580;
	bh=DVuIAF0KEi95/rvoTmkEUPMnE3rKQcOJ1L1B/pbFjX8=;
	h=From:To:Subject:Date:From;
	b=oDUKkR8/j1rvW6daJGpH2+AyEky9ApZbNVHhhjKB7+g0i70FY0wMEMa5ACQtsIEEk
	 cVtBlr20Se49h2sSKR7TfFW/sfXvgx0WETYq63hSsm9U3sc1999Wk2QqapaWWH9+pY
	 jDkR5mAFkGeddHtthhZA9ZHexJR9/tRn0ijs4RH8=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] classes: add new retain class for retaining build results
Date: Sun, 28 Jul 2024 17:22:42 -0700
Message-Id: <cover.1722211934.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 00:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202573

Add a fairly simple class to tar up the work directory on task failure
to a configurable location - useful when the build environment is
ephemeral (e.g. an autobuilder/build pipeline). The directories that
are retained can be configured, and you can also choose to save
directories on every build as well if desired.

[This is a significant reworking of a prototype I sent as an RFC back
in 2020 (AKA "workdir_save"). Changes since then include deferring
tarball creation until the end, more config flexibility, and the
addition of test cases.]


The following changes since commit 662396533177b72cc1d83e95841b27f7e42dcb20:

  create-spdx-3.0/populate_sdk_base: Add SDK_CLASSES inherit mechanism to fix tarball SPDX manifests (2024-07-26 12:26:24 +0100)

are available in the git repository at:

  https://git.yoctoproject.org/poky-contrib paule/retain
  https://git.yoctoproject.org/poky-contrib/log/?h=paule/retain

(should have been openembedded-core-contrib I know, but for some reason
I wasn't able to push there.)

Paul Eggleton (1):
  classes: add new retain class for retaining build results

 meta/classes-global/retain.bbclass     | 162 ++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/retain.py | 219 +++++++++++++++++++++++++++++++++
 2 files changed, 381 insertions(+)
 create mode 100644 meta/classes-global/retain.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/retain.py

-- 
1.8.3.1


