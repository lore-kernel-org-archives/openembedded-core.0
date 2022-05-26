Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC11CC433FE
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 14:51:23 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.20738.1653576681167185199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 07:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.102.5]:36176 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1nuEpa-0000XB-BH
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2022 10:51:19 -0400
Date: Thu, 26 May 2022 10:51:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: what happens if an included layer contains a "conf/site.conf"
 file?
Message-ID: <c57d1851-ceac-65bb-d35a-4d9c86989ec1@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 14:51:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166183


  still trying to isolate some weirdness from this morning, but i'm
playing with a vendor's amazingly convoluted BSP which wraps a bunch
of thud-generation layers in some shell scripts.

  long story short: given some gcc-generated compiler errors, i added
a site.conf file under conf/ in the build directory, and included in
it a single CFLAGS-related no-error setting.

  suddenly, i began getting a slew of recipe parse errors from the
fetch step, complaining about failure to parse numerous SRC_URI
values, all of which started with a variable that represented the top
level URL for the source. suspecting that the variable in question was
somehow undefined, i set it explicitly in my new site.conf, which
solved *those* parse errors but displayed more based on a *different*
leading variable. so i fixed that and etc, etc, etc.

  i was baffled as to where these variables should have been set, and
how they must have been set all this time until recently, until i
tracked down an obscure layer that was being pulled in, which provided
a site.conf file that defined those variables.

  which inspires me to ask -- is there a priority to including the
file "site.conf" such that it will be pulled in from a layer unless
there's an overriding version of that file in the build directory?
i've never run across this before.

rday

