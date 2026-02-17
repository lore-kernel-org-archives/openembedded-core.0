Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B767E68177
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 11:58:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10426.1771329502706915168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 03:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KxTkmY7+;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rA7s3u2kiTTX1IyXBUV62BLtZ8fxXw7upfE6N1FPZrg=; b=KxTkmY7+pTU0DFPqlCOwfVbh3f
	oL8rbW7ezb9DZw67dZG4xEQFikh943SKcv7b0PNfwgfIw4oxWdZev+bMhdE56g7y6Jq52jOVpFV9m
	5hIq4V6OwBwFcwLKWAERxy39bwQzhHQrSOzbgQ0puMqRxxhmW7q/cLR1tdTRXZhGoj26hAhWzpKkE
	GrF9krTkD1E4eSqrfC3AfwG10nR7q1d8krMY2mpCMV+/ipSUED3MW5kEZ+sgYH/3Bhwtg48apBCYz
	JO+BSvUK5uy2Pq383v1+9NY3s2pftm0BTdU8wV7Rwibwkz0e9el8J5S3GmuzMSR8rg7VvYw77MrhE
	5Ffp1tUg==;
Received: from [147.129.179.166] (port=41436 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vsJie-00000003TGR-3xLk
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Feb 2026 06:58:20 -0500
Date: Tue, 17 Feb 2026 07:00:17 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why would KERNEL_MODULE_AUTOLOAD not actually set autoloaded
 modules?
Message-ID: <81c0c11d-02e9-6e2c-94c5-6cee6336697a@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 11:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231245


  i'm working with a "walnascar" based build and the image handed to
me contains:

  KERNEL_MODULE_AUTOLOAD += " \
    8733bu \
    rpmsg_tty \
  "

  just to verify:

$ bitbake-getvar -r nexus-image KERNEL_MODULE_AUTOLOAD
... snip ...
KERNEL_MODULE_AUTOLOAD="      8733bu     rpmsg_tty "
$

  so everything looks good. i build the image and boot it on the
target and ... no autoloading, and the directory /etc/modules-load.d/
is totally empty, unlike what is explained here:

https://docs.yoctoproject.org/ref-manual/variables.html#term-KERNEL_MODULE_AUTOLOAD

  once the target boots, while those two modules are not autoloaded,
"modprobe" loads them without issue so they appear to be valid
modules.

  am i overlooking something obvious? (i checked the created tar.xz
rootfs file and that directory is empty.)

rday



