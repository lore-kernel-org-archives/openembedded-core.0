Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EEAC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 09:29:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.4000.1719480558816838918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 02:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dt+tveyc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38BFA60002;
	Thu, 27 Jun 2024 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719480556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXYITD7iSDyhxi9egdgcxtolR2XPoDc4AsPp9XuUjEI=;
	b=dt+tveycilaD1DYtBDMCp0MJlth7Hgk1cnmd4rFXQv5eA2A0fuiSNMz/IzdfNH7JefIwxK
	QznfBrOyG9AIJNjjW+IU1cGDESQqzwmqHjT2dkd11KWFC91vY8aqa4JCzRmfX7zlYDxJkd
	nihP2lhlXMyEXml10UjeC4vRtYyJcGSnS+EaRtuI5h31F0xEE5++KRP5MsHLl1JjwNHLvg
	MwP5xWGtQZXgKEs9oFHL0Qlc2E/vg+eR9AzMTx8oCVZwOa/Uf0dDWMsLJZLkjWMIk2kdxJ
	XMBQaKLRngC3ikPYyyX0Rr99yOF6DwzF7qxh5c83ETb1Eo1Tp7mZiFEb/8u1Bw==
Date: Thu, 27 Jun 2024 11:29:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sreejith Ravi <sreejith.ravi087@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] package.py: Add Requires.private field in
 process_pkgconfig
Message-ID: <20240627092915d7c0fb2b@mail.local>
References: <20240626140500.1857-1-sreejith.ravi087@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626140500.1857-1-sreejith.ravi087@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 09:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201198

I believe this causes the following reproducibility failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4998/steps/13/logs/stdio

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240627-3tyeozgn/packages/diff-html/



On 26/06/2024 14:05:00+0000, Sreejith Ravi wrote:
> Currently, the process_pkgconfig() only handles the "Requires" key
> field from the .pc file and ignores the "Requires.private" field while
> generating the dev dependency chain. This results in a broken dependency
> list and requires the installation of recommended packages to resolve
> the build dependencies when using the dev IPKs. This increases the
> hard disk space usage and download time and installs many unnecessary
> packages as part of the recommendations.
> 
> This patch ensures that the "Requires.private" field is also considered
> when creating the dependency list for the dev IPKs. With this, the dev
> IPK will have the proper dependencies listed, eliminating the need to
> install recommended packages to resolve the build time dependencies.
> 
> Example: usr/lib/pkgconfig/libical.pc
> ----------
> Libs: -L${libdir} -lical -licalss -licalvcal
> Libs.private: -lpthread
> Requires.private: icu-i18n
> ----------
> Depends field generated for libical-dev
> Depends: glib-2.0-dev, libical (= 3.0.7-r0)
> ------------
> 
> When trying to resolve the build time dependency with libical
> package using “-dev” ipk generated, it will throw the below error.
> -----------
> Package icu-i18n was not found in the pkg-config search path.
> Perhaps you should add the directory containing `icu-i18n.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'icu-i18n', required by 'libical', not found
> -----------
> 
> This patch will fix the broken dependency list.
> 
> -------
> libical-dev depends field generated with this patch
> Depends: glib-2.0-dev, icu-dev, libical (= 3.0.7-r0)
> -------
> 
> Other examples of packages generated with broken dev dependency.
> 
> libflac-dev : https://packages.debian.org/sid/libflac-dev
> Without patch:
> Depends: flac (= 1.3.3-r0), libflac, libflac++
> with patch:
> Depends: flac (= 1.3.3-r0), libflac, libflac++, libogg-dev
> 
> libglib2.0-dev : https://packages.debian.org/buster/libglib2.0-dev
> without patch:
> Depends: libffi-dev, libglib-2.0-0 (= 1:2.62.6-r0), libpcre-dev
> with patch:
> Depends: libffi-dev, libglib-2.0-0 (= 1:2.62.6-r0), libpcre-dev,
>          util-linux-dev, zlib-dev
> 
> Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
> ---
>  meta/lib/oe/package.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index d1303f32bf..e6b46a0dc5 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1853,7 +1853,7 @@ def process_pkgconfig(pkgfiles, d):
>                          if m:
>                              hdr = m.group(1)
>                              exp = pd.expand(m.group(2))
> -                            if hdr == 'Requires':
> +                            if hdr == 'Requires' or hdr == 'Requires.private':
>                                  pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
>                                  continue
>                          m = var_re.match(l)
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201166): https://lists.openembedded.org/g/openembedded-core/message/201166
> Mute This Topic: https://lists.openembedded.org/mt/106889869/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

