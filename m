Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4D4C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 14:24:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.15455.1705415047265971184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 06:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=q92fdwLv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zu8WdBY5jbAgwH/BstFwO3d2xyCDTy9IOnrHoAQTz5g=; b=q92fdwLvW9pPL5lC1+9xAmBYSK
	Kc+JJe7pI5TlX8f6yQ2wMGil5KTGcDsrNxIaNofTw03QcCMe9cw8rU0wjiUwvI/60L4C2ODeyf+Sw
	SHI8jD8cDuSLz3010kY2Q+C571DRJUlHIhCfBdchkUvuBzVpwOVCOwHgUG3zaSurN9aK0DBK9Z6l6
	TiJ2/UqWCyvX1mutcm/1xt7zA2TWXJxhOiFynH6PzfquW6n3xB4Oh8swTuYujojXt7MoJ2k8D6gVZ
	xumpUorpauinNxRdaLDFwK8o+O4cBhfiMcYty8stiG/76VW63U547gmyS127xJ1yQIqwtO0NSAyle
	2dYRyEQw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49780 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rPkMG-00CPZ3-2n
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Jan 2024 09:24:05 -0500
Date: Tue, 16 Jan 2024 09:23:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: how badly do symlinks from within ${S} to outside ${S} mess up
 sstate?
Message-ID: <57164b82-ca31-8438-f2f0-f6dcaece8b9f@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 14:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193864


  a very weird question, to be sure, but i literally just ran across a
recipe that does the following (i will paraphrase some stuff to
protect the innocent).

  the recipe processes a bunch of XML source files, and generates from
them JSON files, so any change in any of the XML source files should
(obviously) trigger a rebuild of the recipe. and here's the problem.

  the XML files are not copied into the recipe source directory, and
are not even referenced by SRC_URI. rather, the files live in a
well-known location on the build host (placed there by a monstrous
"repo sync"), and to save time and space, the recipe just *symlinks*
from inside ${S} to the XML source files outside of ${S}, then
proceeds to process them to generate the subsequent JSON files.

  the complaint is that, when the build pipeline started taking
advantage of sstate-cache, even after some of the XML files were
changed, the recipe would not rebuild.

  once i understood what was happening, my immediate reaction was
along the lines, "well, since what is under ${S} is simply symlinks to
files *outside* of ${S} and (worse) those symlink names will never
change (all that will change is the XML files at the other end), how
is bitbake supposed to have any idea that those XML files have
changed to kick off a rebuild?"

  so my initial response was, "this does not surprise me at all," but
does my reasoning hold up? obviously, this should probably use a
combination of bin_package and externalsrc, but as it is now, is it
moderately accurate to suggest that it is those symlinks that are
preventing bitbake from understanding that anything has changed, so
that it continues to use the old sstate-cache?

rday

