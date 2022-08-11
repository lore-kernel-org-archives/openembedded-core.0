Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022E1C19F2D
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 07:29:18 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.3770.1660202949542767318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 00:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.102.5]:39982 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1oM2cv-0005FR-CW
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2022 03:29:08 -0400
Date: Thu, 11 Aug 2022 03:29:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: looking for a recipe for LXD container to do OE/YP builds
Message-ID: <2ab2e5a1-7561-621-2b57-ae156ebb0d7@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 07:29:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169232


  (not so much an OE question as a build question related to the
proper design of LXD container for doing OE builds.)

  colleague asked me how to best create an LXD container based on a
specific release (ubuntu 18.04); specifically, how to use idmapped
mounts to correctly map a directory into the container so that UIDs
don't step on each other, so here's the scenario.

  * (google repo-based) YP checkout that will, in the end, apparently
generate 120BG(!!!) of output.

  * must be ubuntu 18.04 container based on versions of OE/YP layers
being checked out

the need to do this mapping is that, by default, when you shell into
the LXD container, you're running as root, which of course will not
work for running bitbake. and the tricky(?) part is that:

  1) on my ubuntu 22.04 host, my account is rpjday/1000.
  2) the non-root account created in the container is ubuntu/1000

so we already have a bit of conflict in matching UIDs attached to
different usernames.

  i'm just trying to determine the preferred way to set up /etc/subuid
and /etc/subgid and an LXC device so that i can map the entire build
directory into the container, shell into the container, do the build
there and have all the output go into the mapped directory so that it
(obviously) ends up on my host and not in the container (where there
is nowhere near 120G of space, and i don't want to resize the
container to that extent).

  thoughts? i'm about to try a few combinations and might stumble
across something that works, but if anyone else has gone through this
and has a recipe, that would be just ducky.

rday

p.s. my first guess is that it might not be an issue that there are
two different accounts with UID 1000, since ubuntu in the container
will map nicely to my own account on the host. but we'll see shortly.

