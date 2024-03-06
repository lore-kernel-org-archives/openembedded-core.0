Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCF8C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 14:11:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.12575.1709734266056205228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 06:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Kuz4qDxz;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S9vUlojrA3uhIAWCUdK2kIWeD8KEqdsRF5CF5rG44Xg=; b=Kuz4qDxzLyhjcBLeyaXiPOiGPo
	trMG68+9gNcU0Jjr6KBcAg4ML6EOPgc5+WAedWwxbYUzyK1IBQVm5QCbCIPYqDdg29PWXl49owgAX
	ELLslq0TFd3llJ05+sYekiD3ZgyRYuum/KKlyXPNFi5Dvbx/eMyVDz8wcEEL4YzT8rCLoA8cDH1x7
	uXxJ+5LQuG37hF88o+KpK1lQkXU/ZMjyKbAwFMADeDdK55hq3avP4Nx0YlPjhohcSmA0Sevb/IiNW
	a1g0tdqW+dRwuMDt4n8TjQ1jfrP5zS7mYTrf+uWpY77750cbTdUKBD0s6SdL5KJfdtDPl0odd7w2f
	RSRBUuLw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:42140 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rhrz5-003Sh3-1O
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2024 09:11:04 -0500
Date: Wed, 6 Mar 2024 09:10:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: if "bitbake-layers" HOSTTOOLS fails check, does layer fail to add?
Message-ID: <92123ee8-5896-cdf7-cb6b-4b6e754d32@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 14:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196680


  was just handed a sizable YP/WRL project and i *think* i can see
what the problem is, so i'll keep it short (he said, optimistlcally).

  the symptom is that, of the dozens of layers that should end up in
bblayers.conf (all this running on a VM in a docker container), one
layer is missing, and that's the one that defines all the distro
config files, so the eventual error is:

  DISTRO 'slartibartfast' not found ...

well, yeah, and that's pretty clearly because the corresponding layer
is, for whatever reason, not being added to bblayers.conf. so why not?

  look further into output and notice that, just above that, there is
an error that shows an essential tool cannot be found:

    ERROR: THe following required tools (as specified by HOSTTOOLS)
    cannot be found ...
        snafu

and, sure enough, the missing layer does insist in its layer.conf
that:

  HOSTTOOLS += "snafu"

so i am assuming that, because that layer was being added via
"bitbake-layers" and that layer had a HOSTTOOLS requirement that was
not satisfied, that's why the failure of the layer addition, yes?

  just to bypass this issue, is there a bitbake-layers option that
bypasses that sanity checking? i can see "-F" but that claims to
bypass recipe parse verification, which is not what this is.

  this all depends on the assumption that that failed HOSTTOOLS test
is what caused the failure of the layer addition, which cascaded down
to other errors.

rday

