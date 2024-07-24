Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4FFC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 23:39:33 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.24271.1721864364862960234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 16:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46ONdIs7026133;
	Wed, 24 Jul 2024 18:39:19 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH 0/2] SDKs w/ multilibs and spdx30 'isfile'
Date: Wed, 24 Jul 2024 18:39:16 -0500
Message-Id: <1721864358-26583-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 23:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202492

From: Mark Hatle <mark.hatle@amd.com>

This resolves problems when building an SDK that includes multilibs.
It also adds the isfile change that was previou put in for spdx 2.2.

Introduce a new multilib SSTATE_ARCHs, as an optimization this just
defaults to SSTATE_ARCHs in most cases.  If building an SDK we do
expand it with the multilibs.

Additionally fixes the issue where were a debug component may refer
to something that is not a file.  This change was already put into
the spdx 2.2 class.  See:

commit a798d00d54a1424f9972de43ff05a0ca8950d7de
Author: Mark Hatle <mark.hatle@amd.com>
Date:   Mon Jul 15 14:56:06 2024 -0500

    create-sdpx-2.2.bbclass: Switch from exists to isfile checking debugsrc
    
    While debugsrc is almost always a file (or link), there are apparently
    cases where a directory could be returned from the dwarfsrcfiles
    processing.  When this happens, the hashing fails and an error results
    when building the SPDX documents.
    
    (From OE-Core rev: 02e262c291c0b2066132b4cb2ca5fda8145284a9)
    
    Signed-off-by: Mark Hatle <mark.hatle@amd.com>
    Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


Mark Hatle (2):
  spdx30_tasks.py: switch from exists to isfile checking debugsrc
  create-spdx-*: Support multilibs via SPDX_MULTILIB_SSTATE_ARCHS

 meta/classes-recipe/populate_sdk_base.bbclass |  4 ++++
 meta/classes/create-spdx-2.2.bbclass          | 12 ++++++------
 meta/classes/create-spdx-3.0.bbclass          |  4 ++--
 meta/classes/spdx-common.bbclass              |  2 ++
 meta/lib/oe/sbom30.py                         |  2 +-
 meta/lib/oe/spdx30_tasks.py                   |  3 ++-
 6 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.34.1


