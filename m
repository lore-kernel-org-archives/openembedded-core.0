Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57106C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 09:57:20 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.42110.1674122230803765781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 01:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KD4wQSBF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so832297wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 01:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yRf2H4AGmJGTyKUdiE4mljvw1i9M6R42iEcyxZg31vQ=;
        b=KD4wQSBFePnKdAwzSHIcfQzZLtSy3QMregYGwNTauTvfmKIUqYV2yaFbTMRmvcbO6g
         kRUzAP9YBl8/5JYalPe17VphnD6i/eU6OgT7YFiL68S1SCUja67Qekp974ZN30zPhUGd
         G1rJtVn9vz5Nb8JyIr5rShjI4uiuzRMG1AtTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRf2H4AGmJGTyKUdiE4mljvw1i9M6R42iEcyxZg31vQ=;
        b=Q06UPTlr9JYCkIxe42jjHGz/6iEemJtHhMXs4U0qIx2kJ8PfxlX9O7qLCpZ5q9zUhL
         ONoFBNMt0nAOHY+eRZLx+OW9M0zfF+dXIP7gZNl+5pA34wTqGDqtmC3jxj3A7IKoK7dJ
         Bg7KpmZa3iUTFnMu91l+aocAlispH2+l/NME8EUkeKC5fCnnwpH48sWp4D436oaUpsZA
         CY3d4N482tUayc6Jk+fd/ggOgmfMtojq61cgUGCd+2yY86Vzibcn2ZYFhVZFIODUBPab
         7Xpg1Hs9w8wT0JHhz3hB2AVeSEj926DOYQBVVe2qvdlVP7LiLGcjQEkVnL+UXHwrTrEw
         vHSg==
X-Gm-Message-State: AFqh2krd8ZchRawkp7uBQRRLDb/+htNsSVmp6+gxQO+y7ULYNou7CMNf
	Dexq5WPXq3rPP3uBrfv/kNk/ow==
X-Google-Smtp-Source: AMrXdXskwrp7YEoBISTWf9kMM4Ihlm37s07uaP2F9xhSoj4ykEa2esBrfHIg56iDXsH1RoV8aSxWOQ==
X-Received: by 2002:a05:600c:1d10:b0:3d3:58d1:2588 with SMTP id l16-20020a05600c1d1000b003d358d12588mr5687943wms.41.1674122229080;
        Thu, 19 Jan 2023 01:57:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbd2:83db:332a:f7e3? ([2001:8b0:aba:5f3c:bbd2:83db:332a:f7e3])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b003d9de0c39fasm5618480wmq.36.2023.01.19.01.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 01:57:08 -0800 (PST)
Message-ID: <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Jan-Simon
 =?ISO-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>, Anuj Mittal
 <anuj.mittal@intel.com>, Scott Murray <scott.murray@konsulko.com>,  Bruce
 Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2023 09:57:07 +0000
In-Reply-To: <20230119102423.3493565d@booty>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
	 <20230119102423.3493565d@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176133

Hi Anuj/Bruce/Jan-Simon/Scott,

Please see the links below. This patch, pending for master triggers a
few warnings in a few layers as there are a handful of patches with no
Upstream-Status present in them.

I know this kind of thing is annoying but it is probably worth starting
to give the wider community the hint that they should document this,
and if they do document it, it might remind them to try and submit them
too. You're not the target audience but as layers being tested on the
autobuilder you get to lead by example! :)

If anyone doesn't want to tweak things to fix this, we can disable the
warnings for that specific test but I would prefer not to, I think this
is the right thing to encourage. The numbers of issues are low and
easily avoided one way or another.

On Thu, 2023-01-19 at 10:24 +0100, Luca Ceresoli wrote:
> On Wed, 18 Jan 2023 14:22:19 +0000
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
>=20
> > Currently, whilst patch errors or warnings are shown, the errors don't =
stop builds.
> > The configuration isn't very configurable from WARN_QA and ERROR_QA eit=
her.
> >=20
> > This patch:
> >  * Uses the standard mechanisms to handle the patch fuzz warnings/error=
s
> >  * Makes Upstream-Status checking configurable from WARN/ERROR_QA
> >  * Allows that checking to be used with non-core layers
> >  * Makes patch-fuzz an error by default
> >  * Enables warnings for missing Upstream-Status in non-core layer patch=
es by default
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes-global/insane.bbclass | 27 ++++++++++++++++++---------
> >  1 file changed, 18 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/i=
nsane.bbclass
> > index ada8a7ef4e4..e1295f85392 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -29,11 +29,12 @@
> >  WARN_QA ?=3D " libdir xorg-driver-abi buildpaths \
> >              textrel incompatible-license files-invalid \
> >              infodir build-deps src-uri-bad symlink-to-sysroot multilib=
 \
> > -            invalid-packageconfig host-user-contaminated uppercase-pn =
patch-fuzz \
> > +            invalid-packageconfig host-user-contaminated uppercase-pn =
\
> >              mime mime-xdg unlisted-pkg-lics unhandled-features-check \
> >              missing-update-alternatives native-last missing-ptest \
> >              license-exists license-no-generic license-syntax license-f=
ormat \
> >              license-incompatible license-file-missing obsolete-license=
 \
> > +            patch-status-noncore \
>=20
> AB testing with this patch applied revealed a few Upstream-Status
> warnings:
>=20
> - 5 in meta-agl-core:
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/2272=
/steps/13/logs/stdio
>=20
> - 3 in meta-intel:
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/3968=
/steps/13/logs/stdio
>=20
> Jan-Simon, Anuj, can you look at those patches and maybe fix the Upstream=
-Status?
>=20
> Richard, this patch didn't trigger any problems in my test branch. Now
> I'm going to remove it from my testing branch in order to avoid
> warnings on issues we already know, unless you prefer me too keep it
> and ignore the above mentioned warnings until they are fixed in the
> respective layers.

There are also some in meta-virt:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1168/ste=
ps/13/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1168/ste=
ps/21/logs/warnings

Cheers,

Richard




