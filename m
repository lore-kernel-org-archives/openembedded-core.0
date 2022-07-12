Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D4FC3F2D4
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 04:07:07 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.5206.1657598821372301840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 21:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=N7hikvSD;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BA590204CB5B; Mon, 11 Jul 2022 21:07:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BA590204CB5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657598820;
	bh=iNtsZ8CD5W2XMsDLzB+BirLbXeu+KgqDnz2reHMWkeY=;
	h=From:To:Subject:Date:From;
	b=N7hikvSD6Ng5b7LuhVNPralB+JVuAz7oGF7j5g+MpGkUQs+1VrIk3chrnfW6+NFAa
	 54eeQCSQw+ubmYVz6K9/bNH2AcOlqgi/67b/CIxrBxXEyLJJd7e1N9tM+43AChtjF2
	 mI2V5uGVTPpxCzfZNjNv6aGwcY9KLGX/Sq+bd000=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] devtool fixes
Date: Mon, 11 Jul 2022 21:06:53 -0700
Message-Id: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 04:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167889

A few fixes for devtool, mostly relating to recipes that fetch from git
where S points to a subdirectory of the repo.

Note: I wasn't 100% sure if it was appropriate to be referencing WORKDIR
in patch.py; let me know if I should try to rework that.


The following changes since commit db28cd0e1540e44db963108430205c8c0c817774:

  gperf: Switch to upstream patch (2022-07-09 20:58:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool37-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool37-oe

Paul Eggleton (4):
  patch: handle if S points to a subdirectory of a git repo
  devtool: finish: handle patching when S points to subdir of a git repo
  devtool: ignore pn- overrides when determining SRC_URI overrides
  oe-selftest: devtool: test modify git recipe building from a subdir

 meta/lib/oe/patch.py                    |  8 +++---
 meta/lib/oe/recipeutils.py              |  9 ++++--
 meta/lib/oeqa/selftest/cases/devtool.py | 51 +++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py         | 29 ++++++++++++++-----
 4 files changed, 84 insertions(+), 13 deletions(-)

-- 
1.8.3.1


