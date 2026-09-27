Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5829CA5FA4
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 17:45:19 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41620.1790531113092115079
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 10:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=a3CdlOLw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202609271745095c2d5ff213000207eb-qajygn@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202609271745095c2d5ff213000207eb
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 19:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UYMK4uTtH4Ci9fnYpfWLnh8/DQDBqGGa4TtnWtnqeso=;
 b=a3CdlOLwfvEzcGFQZ4KgKbHh9x0qZDDDhEbK3SWSEBbefo3q1cbLLYBZq9nt6BEc6si8aR
 pb8buzt5karg3DtFHsMwNxtQKvh2wCFipq52g0hfSzzbfMsQ/nptXfw422SDr1IrHJB3qiun
 1U5rpo2SnQJpSBGhz+7o5o65ykJnqIYLviAg+x7ex0iQWPal8xmWHzHMZWchUku7amouWxlf
 Vk14klVIoeHfZOZt2BOABlCzEmnJiInhZ8QZNK6fF1W0DvNnR55f8UPmwkt/E6Xn1UTCjLnN
 zA69xJ/tmbU6GvnP13ZQajV+EhaiAOAflZiSMqIcuonZzfbn5ubG2nJQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/5] devtool ide-sdk: support --modified and --shared modes
Date: Sun, 27 Sep 2026 19:44:48 +0200
Message-ID: <20260927174506.652690-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 17:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246701

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Support the use of --mode modified and --mode shared modes together.
This allows users to work on certain recipes in a modified environment while
still benefiting from a shared sysroot for other recipes.
Additionally, it supports NFS exports in the shared mode. Having a rootfs-dbg
is also an enabler for configuring debugger support with IDE plugins for the
shared environment.

Adrian Freihofer (5):
  devtool: ide-sdk: support shared recipe IDE hooks
  devtool: ide-sdk: initialize shared images for IDE plugins
  devtool: ide-sdk: support NFS exports in shared mode
  devtool: ide-sdk: allow combining shared and modified modes
  oe-selftest: devtool ide-sdk: cover modified + shared + NFS

 meta/lib/oeqa/selftest/cases/devtool.py     | 16 +++-
 scripts/lib/devtool/ide_plugins/__init__.py | 12 +++
 scripts/lib/devtool/ide_sdk.py              | 85 ++++++++++++++-------
 3 files changed, 82 insertions(+), 31 deletions(-)

-- 
2.55.0


