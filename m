Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE11C87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 11:34:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.17208.1753443292808009528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 04:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=eudwPOAq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FKg0LpzI0FE9GW2NYDtk4jiGHEzJfKbpG4bE6dKzqhw=; b=eudwPOAq5higMkbDPsN1w1TN/h
	7ljQCXYr3tVFL2YY538G0ACG7AmWMwPZbxbZy3ae5KgqrjfQ1p4wz9P5DjnkuYK0lca2rAoJSvo1n
	u15n1RXnOub7IoXxZRWYd79jRdIOxtT6BpXSuoM++5Q3IzFuDxsgd9f6IjyTKdFBJUCdleJw2tzkb
	6ndiCY2kcUr1uwBm1iezC50MWDTj1JEZaKu01bM4uSD+4HQaWc63Cdo773Ag1cArPxumLRk0MiGwF
	b8lLSbf63+F6EEV7rGDDnRYUtqV4piTlKIxUf8JeK4ge2fHrlzI8+EY+MqKFNaRH3/r94R1ldljSO
	q/FuXD3A==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:55166 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ufGhM-00000000zPQ-0sUL
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jul 2025 07:34:50 -0400
Date: Fri, 25 Jul 2025 07:34:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why is task "clean" defined in utility-tasks.bbclass?
Message-ID: <3bebdd04-7011-ff9c-d5ec-7dbeb7d5e22b@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220907


  just noticed the oddity(?) that, while base.bbclass defines the
standard cleaning tasks "cleansstate" and "cleanall", "cleansstate" is
defined as being added after "do_clean", which is defined in
utility-tasks.bbclass and must be inherited by base.bbclass.

  this seems slightly backwards -- that something in the fundamental
base class file is defined in terms of something in a utility class
that must first be inherited.

rday

