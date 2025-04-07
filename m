Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A544BC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 08:00:57 +0000 (UTC)
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
 by mx.groups.io with SMTP id smtpd.web11.41191.1744012847772226099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 01:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=WA/nXxc2;
 spf=pass (domain: geanix.com, ip: 109.224.244.21, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1744012845; x=1744272045;
	bh=tLKYCXYNbINLrrV1lbFX6PqI8pIv+S52cSIShO7YjAs=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=WA/nXxc2iqwjXGO4Q4g4jA+Sx9wQSEayLAlMx/Cc38WGwnu7V0Wd47RDdps3AeM2p
	 rJ1sI4rVx+vzuKmmqjHFC9BAAWiowOyCSG5U/mTDIVA11AHslvUloIHgO6cyRqXLss
	 mJqbMutrTK6kUf8o5TryPhaxSGxXAK7MuVegVDjMH1Mt2hz53TusbtytAs/oIGsOVq
	 79XSaRrY43TESGXBS0m8S8A6VeSaGWVfEDX6R1uHuthgPUe6VijpdsVdFB+TJjwdFi
	 HHZ1vP+arokaFdwqWUTDhIgIA0hJCzOQigIl8PXwQCuss6W9/MbpO5wnotsvFhmpfY
	 eP2J14rZmqRmA==
Date: Mon, 07 Apr 2025 08:00:39 +0000
To: openembedded-core@lists.openembedded.org
From: Sean Nyekjaer <sean@geanix.com>
Subject: rm_work and populate_sdk
Message-ID: <geg2j2asa3pqdjo5ah5lpwhh4elgn7djjcdsjm3gfl3olhqtnp@kvdobzw2dmwu>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 39a60dd55b826654f9f1069c72d224626080acc2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 08:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214401

Hi all,

I have enabled rm_work and when building an image it works as I would
expect.
But when running populate_sdk for that image, it doesn't look like it's
running the rm_work task and the disk usage increases.

I have tried adding [0] to my image recipe, and it makes a significant
difference in disk usage.

Some numbers for reference::
With sstate and without [0]:
26G     build/
With sstate and with [0]:
18G     build/
Without sstate and without [0]:
120G    build/
Without sstate and with [0]:
29G     build/

Br,
/Sean

[0]:
addtask do_populate_sdk_and_rmwork after do_populate_sdk
do_populate_sdk_and_rmwork[recrdeptask] =3D "do_rm_work"


