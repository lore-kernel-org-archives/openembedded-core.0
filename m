Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 29CA674197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 17:05:04 +0000 (UTC)
Received: by iods203 with SMTP id s203so165517065iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 10:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/17pzLxH9w/kUyZLmXlToIq6A1HdG+j26EJt4In81vA=;
	b=elNe92KvMTlra0jv3xmEIJZ86RlP8LWlbswU4AcUJ76zdjI0VjHSZZuwkx+HmmA49e
	K9aK12HEU7mSOGg0oTGRwlcHAORz0eV7/Yt4FrRv+FOx1dmmX9Ta8e6pHGKgtwEeNI2p
	Z0fdvgoxkybgV4X3/TmhPN64SWJuMhPYsILD9JH/LNYSzhyjH0dZbnHfx9R4wJiBJ1mq
	rmyUKoNp3UR5Z8+x6S6oYPtJ6mHpAuHV8aCg7TnFuLQ63BnPnzdRuB0uEgI8N0J2qiXx
	9jsD/m9/lwaIX3/y33H88/ISdiWE0dqI9wSt2hLxcU+ISa5RHXefVI9e4MX/ZyL3535x
	M9fA==
X-Gm-Message-State: ALoCoQlytT+F0WCY1a7c3QVt7bQ0zWT8dIodS1icV+D3KI7h4kajTFhRwJzqTiAtv4L2EpC5stKF
MIME-Version: 1.0
X-Received: by 10.107.8.20 with SMTP id 20mr11289851ioi.94.1441040704475; Mon,
	31 Aug 2015 10:05:04 -0700 (PDT)
Received: by 10.107.39.84 with HTTP; Mon, 31 Aug 2015 10:05:04 -0700 (PDT)
In-Reply-To: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 31 Aug 2015 18:05:04 +0100
Message-ID: <CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Aug 2015 17:05:07 -0000
Content-Type: text/plain; charset=UTF-8

On 30 August 2015 at 17:31, Khem Raj <raj.khem@gmail.com> wrote:
> There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf
> exception, there is no other occurance of GPL-3.0 use, lets mark the
> licence correctly.

Unless the macro is actually shipped with any of the packages, I don't
think we actually need to do this. Generally, LICENSE should be the
intersection of all LICENSE_${PN}*.

I think the correct fix here is actually:

LICENSE = "GPLv2+ & PD"
LICENSE_${PN} = "GPLv2+"
LICENSE_${PN}-dev = "GPLv2+"
LICENSE_${PN}-staticdev = "GPLv2+"
LICENSE_${PN}-doc = "GPLv2+"
LICENSE_${PN}-dbg = "GPLv2+"
LICENSE_${PN}-locale = "GPLv2+"
LICENSE_liblzma = "PD"



>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/xz/xz_5.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/xz/xz_5.2.1.bb b/meta/recipes-extended/xz/xz_5.2.1.bb
> index e0ae48f..cf7fba6 100644
> --- a/meta/recipes-extended/xz/xz_5.2.1.bb
> +++ b/meta/recipes-extended/xz/xz_5.2.1.bb
> @@ -6,7 +6,7 @@ SECTION = "base"
>  # which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
>  # and the LGPL bits are under lib/, which appears to be used for libgnu, which
>  # appears to be used for DOS builds. So we're left with GPLv2+ and PD.
> -LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+ & PD"
> +LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
>  LICENSE_${PN} = "GPLv2+"
>  LICENSE_${PN}-dev = "GPLv2+"
>  LICENSE_${PN}-staticdev = "GPLv2+"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

