Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614C6C433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 13:17:27 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.33880.1639315039631394262
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 05:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:45826 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mwOj7-00022T-E0
	for openembedded-core@lists.openembedded.org; Sun, 12 Dec 2021 08:17:18 -0500
Date: Sun, 12 Dec 2021 08:17:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] when a systemd service is not listed in
 "SYSTEMD_PACKAGES"
In-Reply-To: <16C003B026AB8955.32732@lists.openembedded.org>
Message-ID: <63c0619d-fdc3-1e63-7761-b6684ae8807c@crashcourse.ca>
References: <16C003B026AB8955.32732@lists.openembedded.org>
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
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 13:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159583

On Sun, 12 Dec 2021, Robert P. J. Day wrote:

>
>   was writing up a wiki page for colleagues at my current gig about
> the proper definition of systemd services, and noticed the following
> oddity(?).
>
>   in current poky master branch, openssh recipe, SRC_URI includes the
> following two lines:
>
>   file://sshd@.service \
>   file://sshdgenkeys.service \
>
> fair enough, two systemd services. however, further down the recipe
> file, only one of them is included in:
>
>   SYSTEMD_PACKAGES = "${PN}-sshd"
>   SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
>
> so what happened to the service sshdgenkeys? ah, if one looks in the
> files being installed by openssh for that string:
>
> $ grep sshdgenkeys *
> sshd@.service:After=sshdgenkeys.service
> sshd.socket:Wants=sshdgenkeys.service
> $
>
>   so i am *assuming* that even though sshdgenkeys is an actual systemd
> service, it will only be invoked via the sshd service or socket units,
> and therefore does not need to be included in SYSTEMD_PACKAGES.
>
>   is that the right interpretation? or am i missing something?

  never mind, i think i see what i misunderstood.

rday

