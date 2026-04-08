Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F203D1073CBC
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:33:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.106482.1775655193210480675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 06:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CgOiSG3U;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=88JXT5NvH0t5gewdhEOaFBMxbEBa94+V3JsbQwREx98=; b=CgOiSG3UcN3OPyTfuNR6GStpu+
	CGEki7sei4TWoJpBRmMSkuoyy6gGMUvw8davBFngmOCzCGgchL/Yt8xgVG4pHMB2UL2KchlXySwXR
	8lEleJgqz88JareeHj3coVCBzKCypZGOuKwt6lYnK3L9xgv+0vcHubhrQnxVmj3b+zKeVIz7ghVQ4
	HqD3Q7D4RRE95KXL7ujsVbdtL3pSwwELVaM8mvl0OH02JNfZbzgeg9k4yV4/ihaMiMPHy9jj32CwK
	sfKKT3XeXTB+R6zp9mRFvAii1pd9o9yDlpogehqIgNy5hh42cJcEPtOP9MbqNymkGKgxKzKs1iJBp
	PjAjCrzg==;
Received: from [147.129.179.166] (port=48354 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wAT1q-00000001lTM-1BHR
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Apr 2026 09:33:11 -0400
Date: Wed, 8 Apr 2026 09:34:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why would ASSUME_PROVIDED recipes be built anyway?
Message-ID: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234839


  puzzled by something i just noticed ... the documentation for
"ASSUME_PROVIDED":"

https://docs.yoctoproject.org/ref-manual/variables.html#term-ASSUME_PROVIDED

clearly suggests that these represent recipes that would not be built
as they are already on the host, the example given there is
"git-native".

  however, in a walnascar-based build i just built, native recipes
that were listed in ASSUME_PROVIDED were built anyway, even though
they are clearly on my Debian 13 host, "git-native" among them. in
fact, a number of recipes i checked appear to all have been built from
scratch, despite being listed in ASSUME_PROVIDED.

  as a test, if i then tried to "cleanall" such a recipe, i got the
perfectly reasonable:


$ bitbake -c cleanall git-native
... snip ...
WARNING: Explicit target "git-native" is in ASSUME_PROVIDED, ignoring


is there some reason that something listed in ASSUME_PROVIDED will be
fetched and built anyway? is it a version thing?

rday


