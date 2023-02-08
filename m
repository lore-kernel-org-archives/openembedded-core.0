Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F1CC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:14:04 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.3058.1675840433752364328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WhWDPOxP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202302080713501e2b890026dd2bf921-kwy0fi@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202302080713501e2b890026dd2bf921
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Feb 2023 08:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mO3GjrFU4y65iE1Qwagv9DE+7BMqma79hVf1T0IT5cs=;
 b=WhWDPOxPOw83dY1XtehRJXeybTRYWOHrkJNoUaMUrGO03uEuXMe+A0E9YFlrAj45TAf3sL
 rUelEqF6HdctdAvSrTOKdBvv1AfCwe7s+6vESoHnvE8z42ziLLArjRxah3bR8b6D9mlpMsui
 2Mj+0RC5RIWs7yOFamuR9fgmM5/Co=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 0/3] systemd: split timesync and networkd to packages
Date: Wed,  8 Feb 2023 08:12:48 +0100
Message-Id: <20230208071251.5412-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176839

Motivation for this patch series is sstate-cache reuse.

Basically we have dozen of products with several
different systemd configurations.
Problem is that there are many recipes which depend on systemd.
(or their packaging depends on it)
Especially qtwebengine which takes hours to build and created
sstate objects have several hundereds of gigabytes.

So instead of:
  PACKAGECONFIG:remove:pn-systemd = " timesyncd"
we would like to do just:
  BAD_RECOMMENDATIONS += "systemd-timesyncd"

That allows reuse of sstate-cache for such recipes because
it will build identically, just install to rootfs differently.

One alternative we considered was via systemd-conf, but binaries still
occupy space in rootfs which is not desirable for some devices:
  ln -sf /dev/null ${D}${sysconfdir}/systemd/system/systemd-timesyncd.service

Please comment if you think that we should take a different
approach which is more in line with Yocto project best practices.

Peter Marko (3):
  systemd: split timesyncd to its own package
  systemd.bbclass: add non-recursive service packaging
  systemd: split networkd to its own package

 documentation/ref-manual/variables.rst     | 10 ++++
 meta/classes-recipe/systemd.bbclass        | 15 ++---
 meta/recipes-core/systemd/systemd_252.4.bb | 64 ++++++++++++++++++++--
 3 files changed, 78 insertions(+), 11 deletions(-)

-- 
2.30.2


