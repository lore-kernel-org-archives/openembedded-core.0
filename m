Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B36C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:39:32 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.24915.1639481971349116524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 03:39:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:58262 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mx69Z-0002S6-MX
	for openembedded-core@lists.openembedded.org; Tue, 14 Dec 2021 06:39:29 -0500
Date: Tue, 14 Dec 2021 06:39:27 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: ROOTFS_POSTPROCESS_COMMAND versus do_install_append() and using
 ${D}?
Message-ID: <a3f88955-541b-7aef-d3b6-b5de28cfa83@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 11:39:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159685


  i've run across a moderately curious example of doing rootfs-wide
tweaking in an odd way.

  my understanding is that, after i've created my basic image rootfs,
i can define that image's ROOTFS_POSTPROCESS_COMMAND variable, and do
all sorts of rootfs-wide adjustments relative to ${IMAGE_ROOTFS},
which could include running chown, chmod, setcap, and so on and so on,
tweaking clearly spread over various installed package contents.

  what i'm looking at now does it in a more curious way. there is a
catch-all recipe file (call it "catchall.bb") which lists, as its
DEPENDS list, *all* of the recipes that make up the image, which means
that building catchall.bb builds and populates an image directory with
the combination of all those other recipes, after which it defines
both pkg_postinst_${PN} *and* do_install_append(), both of which run
around and make changes relative to ${D}, given that the image
directory for that recipe effectively contains, well, everything that
will go into the rootfs.

  at the moment, it works, but in a perfect world, i'd refactor all
that stuff and sprinkle it among the respective recipes that that
content relates to. however, just to get this going, my initial
reaction is to take that tweaking, adjust it to refer, not to ${D},
but to ${IMAGE_ROOTFS}, and move it all into
ROOTFS_POSTPROCESS_COMMAND. theoretically, would that be effectively
equivalent?

  i realize there might be some messing around but, in the big
picture, should it have the same effect?

rday

