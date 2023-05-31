Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D49C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 15:55:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.693.1685548522812505832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 08:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qxrTkP93;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F8uj74qXA16DdvboT9OiI64UDAL25sQZ/Dirba8Xpks=; b=qxrTkP93QKUlN7robE3oZRmYCI
	PlgL9AbW5CmF2iRt0Pkl9EYUKn97czHb1WBgLzVugJs0TeJVcLvhPSBfv1B7dd5urFADZKqOkN+lo
	NzGFY2Qf2U8h6q0kDP4Ocx0X7TgRR+Pn5iszV5803JC7GT+lDq9x/7dH4IuZF2daV5FyP7TUoFx/+
	9TKKfiXrz7jT3YXOunf4KdXWjdpizFQUBVdLdSmEakROHPcbhLNWYgNKlWnuFwKuayf4bFWnA+qbj
	UEkyIQkNBg2F43tM8WqGrYi0Ij9n+YnmR/UiMSc6n5owo8d0DISVvHm2xbcx7YSozkTHuIGLvl9sJ
	4TMqzAdQ==;
Received: from bras-base-otwaon0916w-grc-52-70-26-112-58.dsl.bell.ca ([70.26.112.58]:45542 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1q4OAP-006Ws8-17
	for openembedded-core@lists.openembedded.org;
	Wed, 31 May 2023 11:55:20 -0400
Date: Wed, 31 May 2023 11:55:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is there a command to produce artifacts of a recipe and all its
 "shlibdeps" packages?
Message-ID: <3b2888f1-cd3e-3c2a-7b4b-9f3fe356b9db@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 15:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182019


  this is possibly a silly question, but i have a YP build with one
recipe (call it fubar") that has a number of DEPENDS, some of which
generate shared libs that will also be runtime dependencies for fubar
once it's installed. as i recall (and i could be wrong), the shared
lib dependencies for fubar can be seen in the eventual file
fubar/packages-split/fubar.shlibdeps.

  now i want to be able to bundle up the fubar package, walk it over,
and drop it on a compatible device where i know it should run, but
obviously i need to similarly bundle all of those shlibdeps to go with
it.

  rather than manually doing each of those shlibdeps individually, is
there some incantation such that i can create some sort of archive of
a recipe and all of its runtime dependencies so that i can just take
that entire single archive and drop it on the target device?

  i can't think of a simple way to do that, but perhaps others know
some sort of magic.

rday

