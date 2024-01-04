Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29ACAC47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 09:50:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.50785.1704361844872661673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 01:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hp7uhI+t;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41A96FF817;
	Thu,  4 Jan 2024 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704361842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D3Zm+UOb3Aq5XMKA6T+ElyJj0DuIjJGIghOwJo/Hl5M=;
	b=hp7uhI+tuhQgoO9c8g+FTH1+DB4/WRyly0VfZJO6G+Jx9P/11XaDcZRxEdjSRdCh7tU/8U
	lYZZne4gSYPunmOwxVrODixfDOgnVvjYzGjZxVfUZ9fNzJyhbn9w925/mk6WWBVzPG+9N5
	xm/noJTa7gX3sQRZaRu7VuOU6f8YXeoa3qWuHFBRnLDQqr4n3VqtMyF03s1ICdiHkb6fJ0
	TKzvanQb85AgshC1pbddG17DQmPQ+NZEFbe7Vwu7AQ6zhpCaKFyBUMKtao3edw3l49c5rR
	odVsZSsTv4h1sNoM9vGy7UAkUV5epfMORkAcXM5rX7hASNZxBzZ2EwHa0RvUQQ==
Date: Thu, 4 Jan 2024 10:50:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: enrico.scholz@sigma-chemnitz.de,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] tcp-wrappers: drop libnsl2 build dependency
Message-ID: <20240104095041045d1e5f@mail.local>
References: <20240103115944.446914-1-enrico.scholz@sigma-chemnitz.de>
 <17A71BE8B9FB3913.10454@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17A71BE8B9FB3913.10454@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 09:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193311

Please disregard this, I meant to reply to another one ;)

On 04/01/2024 10:47:47+0100, Alexandre Belloni via lists.openembedded.org wrote:
> Hello,
> 
> Your patch has a declared charset of 'y' which is not a thing and git am
> fails with:
> 
> error: cannot convert from y to UTF-8
> fatal: could not parse patch
> 
> You got the following prompt:
> 
> The following files are 8bit, but do not declare a Content-Transfer-Encoding.
> something.patch
> Which 8bit encoding should I declare [UTF-8]?
> 
> At that point, you pressed y but you should simply press enter. Please
> resend.
> 
> 
> On 03/01/2024 12:59:44+0100, Enrico Scholz via lists.openembedded.org wrote:
> > From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > 
> > The only libnsl2 function which is used by tcp-wrappers is
> > 'yp_get_default_domain()'.  When USE_GETDOMAIN is set, this is
> > implemented as a simple wrapper around getdomainname() so that libnsl2
> > is not used at all.
> > 
> > We added a patch which does '#include <rpcsvc/ypclnt.h>' to avoid
> > implicit forward declaration.  By conditionalizing this, the libnsl2
> > dependency can be dropped completely.
> > 
> > Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > ---
> >  ...0001-Fix-implicit-function-declaration-warnings.patch | 9 +++++++--
> >  meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb   | 2 --
> >  2 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
> > index ec793ac8ffed..474703885d9b 100644
> > --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
> > +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
> > @@ -20,11 +20,16 @@ diff --git a/hosts_access.c b/hosts_access.c
> >  index 0133e5e..58697ea 100644
> >  --- a/hosts_access.c
> >  +++ b/hosts_access.c
> > -@@ -33,6 +33,7 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
> > +@@ -33,6 +33,12 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
> >   #endif
> >   #include <netinet/in.h>
> >   #include <arpa/inet.h>
> > -+#include <rpcsvc/ypclnt.h>
> > ++#ifdef USE_GETDOMAIN
> > ++/* defined in workarounds.c */
> > ++extern int     yp_get_default_domain(char **ptr);
> > ++#else
> > ++#  include <rpcsvc/ypclnt.h>
> > ++#endif	/* USE_GETDOMAIN */
> >   #include <stdio.h>
> >   #include <stdlib.h>
> >   #include <syslog.h>
> > diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> > index c655da1199e7..bcd1d6f7929e 100644
> > --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> > +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> > @@ -7,8 +7,6 @@ SECTION = "console/network"
> >  LICENSE = "BSD-1-Clause"
> >  LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
> >  
> > -DEPENDS += "libnsl2"
> > -
> >  PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev ${PN} ${PN}-doc"
> >  FILES:libwrap = "${base_libdir}/lib*${SOLIBS}"
> >  FILES:libwrap-doc = "${mandir}/man3 ${mandir}/man5"
> > -- 
> > 2.43.0
> > 
> 
> > 
> > 
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193309): https://lists.openembedded.org/g/openembedded-core/message/193309
> Mute This Topic: https://lists.openembedded.org/mt/103500355/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

