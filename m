Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.5717.1590067485203338775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 06:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SeLb31py;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k13so6679745wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=QqMMddLkT/hGHj7g5n0sYckm0U8kJG7CYe4BnFDvRDQ=;
        b=SeLb31pyCDaaHeO9RWGZ4X+4Ct7Jm0erNeX0gYOJRrfKcU9c4l8sMYf39X/r8fANxP
         M4xh9l4HMa1gkxHPgAw8HUW4eC3wj5Mq8JTkbtHOzrC8lWtbePVnt4ykpWBOT6NcFAiU
         grd8FHIT2B0yK7MAejzGem3F3QOIRQHBDCUrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QqMMddLkT/hGHj7g5n0sYckm0U8kJG7CYe4BnFDvRDQ=;
        b=aCeUL/jR2hV+3vuS1NZ8wEvnX2Y4vLzYKNkxEcV3aM3SvkPJfvCe2uAOF6vCXDsKkp
         DPgCSTO/yTpm3pa7ie2B90MHzzXvT7Zpn93ZpwsKiIIctKGHkyD0yczY0I9qB8LXq6Fm
         7MnF8Uw/Sp/NpTYgko6cKaWSMb1jhaxNX3QD9ycfy4HHyd8mPftcD8rr2QuDt1x/3qVe
         wAfjCXXN/7j2e+0woozy9+DA5COyQ3/HM0m/psOOkFv4CWwkjFW+Qnac3EOGUq85hAcf
         96tGgWIwu1paLQkRLp5NGwxpAH4QcEDjMezjFhx3Snh/hlFuThCZPrWuriLkJlye8Q+D
         ruBw==
X-Gm-Message-State: AOAM533dHKXOZdgX7j6lSlqW7AN2f4gAMS+89x/jepl6HP9MiDGe5LZp
	m7sXtDWM1N6ZZihJl5UKkiJyEg==
X-Google-Smtp-Source: ABdhPJyW9vNRC0y13hIFhWnpcWUMnqh/QVi70IePGkMwObylvHqRStBhLQZuYQipp1s9/4RtsRsNeQ==
X-Received: by 2002:adf:9507:: with SMTP id 7mr4396182wrs.63.1590067483793;
        Thu, 21 May 2020 06:24:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u65sm6522863wmg.8.2020.05.21.06.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 06:24:42 -0700 (PDT)
Message-ID: <7a02c0387c1d4f12c9e72189c1a6260a85191fca.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2020 14:24:40 +0100
In-Reply-To: <AM7PR05MB68818CD461CF14303C8BCA71A8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: 
	<AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
	 <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
	 <AM7PR05MB68818CD461CF14303C8BCA71A8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-20 at 22:17 +0200, Konrad Weihmann wrote:
> On a second thought it should be bb.error not bb.fatal - are all
> okay with fixing just this one for now?

I think the problem here is specific to the way parallelism is done
with oe.utils.multiprocess_launch.

A quick grep shows a few users:

meta/classes/package.bbclass:        results = oe.utils.multiprocess_launch(oe.package.is_elf, checkelflinks.values(), d)
meta/classes/package.bbclass:        results = oe.utils.multiprocess_launch(oe.package.is_elf, checkelf.keys(), d)
meta/classes/package.bbclass:        results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
meta/classes/package.bbclass:                results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, debugstaticdir, debugstaticlibdir, debugstaticappend, debugsrcdir, d))
meta/classes/package.bbclass:        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
meta/classes/package.bbclass:        oe.utils.multiprocess_launch(inject_minidebuginfo, list(elffiles), d,
meta/classes/package.bbclass:    processed = oe.utils.multiprocess_launch(oe.package.filedeprunner, pkglist, d)
meta/classes/package.bbclass:            results = oe.utils.multiprocess_launch(linux_so, linuxlist, d, extraargs=(pkg, pkgver, d))
meta/classes/package_ipk.bbclass:    oe.utils.multiprocess_launch(ipk_write_pkg, packages.split(), d, extraargs=(d,))
meta/classes/package_deb.bbclass:    oe.utils.multiprocess_launch(deb_write_pkg, packages.split(), d, extraargs=(d,))

and I think any subprocess usage within any of these functions is at
risk from this issue.

Is there some way we could add a fix to oe.utils.multiprocess_launch()
?

Cheers,

Richard

