Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E476CCA47F
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 01:41:33 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.17179.1657676490656566044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 18:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=kO/Gv5QU;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 1E115204DE86; Tue, 12 Jul 2022 18:41:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1E115204DE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657676490;
	bh=SJ+6hmdJL9LuSHOWB5xutk7mP/WJhlJW7MgpjyGZUb4=;
	h=From:To:Subject:Date:From;
	b=kO/Gv5QUfvq0i+4tXwU5Z1LAS74I7OlXwaA+wtpIt1UjkKWtUtvwVeUXiq8giGfux
	 15hIaWtnmtRjAFj/2PfigVS5EWzVoeF3LOK2NVuzlWPD2jZ2iPFA12PqCPW34hgc6c
	 tsfCA0iEVPrquve/ChHbJN1xHkPPcFb/zx/vW/ys=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/3] devtool fixes
Date: Tue, 12 Jul 2022 18:41:22 -0700
Message-Id: <cover.1657676159.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 01:41:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167951

A few fixes for devtool, mostly relating to recipes that fetch from git
where S points to a subdirectory of the repo.

Changes since v1:
* Fixed erroneous addition of a separator when not needed (which broke
  one of the other devtool tests)
* Fixed missing separator before patchdir= when updating original recipe
* Added extra logic to the test to ensure we can update the original
  recipe properly (as well creating a bbappend that was already in the
  test).
* Rebased and dropped pn- overrides fix since that has just been merged.


The following changes since commit db22dbc1f66d2f76dab719597986cfd96cf18d71:

  linux-yocto/5.10: fix build_OID_registry/conmakehash buildpaths warning (2022-07-12 23:56:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool37-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool37-oe

Paul Eggleton (3):
  patch: handle if S points to a subdirectory of a git repo
  devtool: finish: handle patching when S points to subdir of a git repo
  oe-selftest: devtool: test modify git recipe building from a subdir

 meta/lib/oe/patch.py                    |   8 +--
 meta/lib/oe/recipeutils.py              |   9 ++-
 meta/lib/oeqa/selftest/cases/devtool.py | 114 +++++++++++++++++++++++++++-----
 scripts/lib/devtool/standard.py         |  25 +++++--
 4 files changed, 127 insertions(+), 29 deletions(-)

-- 
1.8.3.1


