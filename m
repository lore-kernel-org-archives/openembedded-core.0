Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D212C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 16:21:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.21345.1704298912636638644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 08:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ptwMPxS6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Byeop0DXTmsDx7/I2lDNbM4nPdMV2iNDWUvFxsLzE3E=; b=ptwMPxS6NmG5TkKWCXsiBsyD1T
	SaB+7/5+uNzz8NyLcaQKKfblCJFY1sKGei0+8gfEorGRp7oG5IT/X+vJ0A4Evbpbf5QZcff4Cz3oI
	W+tlMU0xMxU4xj1Y5GvZqCp+xUTsfC3ieaPflzuaeqL1uv5JsMFo1dZXG4Ffxi46PI60EkUEIWHGd
	b/OOJWx9k0o7M2mYbZad/OlG1hobuQPOtBJQvPJoUJSYf6+Y6dkzu4xavUcutXummoTKvBrIyCjUU
	MlnV3d7YkuVALDpeDCkQHBsN4H/3OjjWCO45U58dPcV3Ug/lFx8hrchO03USH3128hRuAeKdqMLZ0
	4dobKPtw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41936 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rL404-001bBf-0p
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Jan 2024 11:21:50 -0500
Date: Wed, 3 Jan 2024 11:21:33 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: how to sneak a function into the *middle* of "prefuncs"?
Message-ID: <76b8b03d-dcaa-8dd7-6fe8-32c7bc9baf20@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 16:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193293


  no, no, hear me out ... colleague has a vendor's YP build system and
needs to -- in the middle of a bunch of a task's [prefuncs] -- sneak
in a signing step. can't be at the beginning (what to be signed not
created yet), and can't be at the end cuz by then it's too late as the
artifact has been bundled.

  first, as i read it, for a given task, all of the prefuncs are
invoked in exact L-to-R order, then the task is run, then all of the
postfuncs are done in L-to-R order. then (and only the) does the
processing move on to the next task.

  given limited freedom to change the vendor's recipes, my first
thought was to define an "intermediate" task whose only purpose was to
babysit the signing step, make the signing function either a prefunc
or postfunc of that task (should not matter which), then redefine the
preceding and subsequent tasks to split up all those functions
properly so that the signing step sits in the middle where it belongs.

  am i overthinking this? and even if the code processes a single
task's prefuncs and postfuncs in order, that's not the thing i really
want to count on.

  thoughts?

rday



