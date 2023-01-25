Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDA7C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 17:36:18 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.51858.1674668176984407124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 09:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MTLzeTpn;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 700A5240007;
	Wed, 25 Jan 2023 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674668175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UMP0KZP+85O1lf8XHOUNgS85C66jYuLuwtgxA/lhh+E=;
	b=MTLzeTpnD7qh03N+adFij7qWzlfDeySaUkZMH/GlyQFwFOx7G6wmh/a/kzZ53nEhAJUtyM
	HTY6XJ08yn1QJBzfJRD15U4sUg2l5CWSuvW/9YPd1FutpUd1GPmLycnRIyvkVPLQmcCF9B
	T7OV2Of76niXHbSKnkgMvfjIE82ApX/jVPXHVBRx4KhEneYsnIjCqvmBowbLQwBwIzlPl1
	kYZCvZEXunqs1/tR4LytM+DCypZ1ILjWAOreC9bRCzO9hRqaCgvZ5fJIRvxj3KKUac9S/x
	I+RFwr5VIGfXQZMaeBT24Q164Mr4MQ96cOKA13G5iNuYXje53T2f8+LKrDUXjw==
Date: Wed, 25 Jan 2023 18:36:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] texinfo: Add missing rdep on needed
 perl-modules
Message-ID: <Y9Foj3LCJJbzCFb6@mail.local>
References: <20230125040358.3573537-1-raj.khem@gmail.com>
 <20230125040358.3573537-2-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125040358.3573537-2-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 17:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176372

Hello,

On 24/01/2023 20:03:57-0800, Khem Raj wrote:
> Fixes
> Can't locate Encode.pm in @INC (you may need to install the Encode module) (@INC contains: /usr/lib/perl5/site_perl/5.36.0/x86_64-linux /usr/lib/perl5/site_perl/5.36.0 /usr/lib/perl5/vendor_perl/5.36.0/x86_64-linux
>  /usr/lib/perl5/vendor_perl/5.36.0 /usr/lib/perl5/5.36.0/x86_64-linux /usr/lib/perl5/5.36.0) at /usr/bin/makeinfo line 29.
> 
> The slew of indirect dependencies
> 

This breaks most of the builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6618/steps/15/logs/stdio

Error: 
 Problem: package nativesdk-perl-module-locale-5.36.0-r0.x86_64_nativesdk requires nativesdk-perl-module-config, but none of the providers can be installed
  - package nativesdk-texinfo-7.0.1-r0.x86_64_nativesdk requires nativesdk-perl-module-locale, but none of the providers can be installed
  - package nativesdk-buildtools-perl-dummy-1.0-r2.buildtools_dummy_nativesdk conflicts with nativesdk-perl provided by nativesdk-perl-5.36.0-r0.x86_64_nativesdk
  - package nativesdk-buildtools-perl-dummy-1.0-r2.buildtools_dummy_nativesdk conflicts with nativesdk-perl-module-strict provided by nativesdk-perl-5.36.0-r0.x86_64_nativesdk
  - package nativesdk-buildtools-perl-dummy-1.0-r2.buildtools_dummy_nativesdk conflicts with nativesdk-perl-module-warnings provided by nativesdk-perl-5.36.0-r0.x86_64_nativesdk
  - package nativesdk-buildtools-perl-dummy-1.0-r2.buildtools_dummy_nativesdk conflicts with nativesdk-perl-module-vars provided by nativesdk-perl-5.36.0-r0.x86_64_nativesdk
  - package nativesdk-buildtools-perl-dummy-1.0-r2.buildtools_dummy_nativesdk obsoletes nativesdk-perl provided by nativesdk-perl-5.36.0-r0.x86_64_nativesdk
  - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/texinfo/texinfo_7.0.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/texinfo/texinfo_7.0.1.bb b/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
> index f0f9211594..4c8608b745 100644
> --- a/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
> @@ -76,7 +76,9 @@ FILES:info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
>                    ${mandir}/man1/infokey.1* ${mandir}/man1/install-info.1*"
>  
>  FILES:${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo"
> -RDEPENDS:${PN} = "perl"
> +RDEPENDS:${PN} = "perl perl-module-encode perl-module-encode-encoding perl-module-locale perl-module-integer \
> +                  perl-module-if perl-module-unicode-normalize perl-module-base perl-module-feature \
> +                  perl-module-perlio"
>  FILES:${PN}-doc = "${infodir}/texi* \
>                     ${datadir}/${tex_texinfo} \
>                     ${mandir}/man1 ${mandir}/man5"
> -- 
> 2.39.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176339): https://lists.openembedded.org/g/openembedded-core/message/176339
> Mute This Topic: https://lists.openembedded.org/mt/96514819/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

