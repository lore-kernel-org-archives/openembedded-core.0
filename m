Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02A6F55123
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 14:16:38 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35821.1775398590206795382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 07:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RKdC5RKI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c11eba219so352580566b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775398588; x=1776003388; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sVGa6lTU6Ka3KumDDijAwZi6GBXzBJmg5WsB5QeuQ+E=;
        b=RKdC5RKIp7WVn4NvvgFFNKPKcm+gf0VuSNhHZ4I2TkRPuAq3o4kvciA19gn6lHVsVO
         TCBnpy/Bcwq5zDWvO0oNDmvyc0bRa57jcxdK0/9ZsbV2qEbJqbwkSSsVQXqpZDcsh7z0
         vztGhe2ztRnCZwaaKa/BrooIcSidLlKT2O5rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775398588; x=1776003388;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVGa6lTU6Ka3KumDDijAwZi6GBXzBJmg5WsB5QeuQ+E=;
        b=Vf8eedQcAtfKyCn34Sr6SBa0RdAk+0IbJSf34qeLqGyKFgjo67wrnV0Avk14nai0L6
         WLUoA8tgn3n40EwiNv3jjGKmzG0SdASzUD0L2ycqlvg4CcLWZ5P5QFHEM1cRXLjsODEq
         W4FSGmRxtlkckSFzSEmjjFNa4o2fwBPj93UaeVOpaLekYRzIJFrvK62NF8i/xYyBUSYA
         cU26y/fwRSZT8F14KrTVt1xitFrqXOeNE+oi5UcXKO6WhMycHsIHLdZVD/+rFtSiq0sV
         8LUTgkqibjN/c1qo2xTjhAQGkQ82VwMAN1t18K/+mY/nsq68zgct2/0AqUQdejHGMth8
         wYLg==
X-Gm-Message-State: AOJu0Yzsbi05vEFj597ln+UlGQspVTvQPfh8JhCXP+gtXJNS+hnmvjJL
	wV9k0LeZ+aj4nHf0EbmLF8JPwPZ7FHnEoh/6x6kwzRJJRIaBWUJT6iG/RQeFSUQHsJc=
X-Gm-Gg: AeBDies+jM8Ox2zLohNXAJjyi6M1x7kV3+L18PvdMTwdXFLwcpIPcAECeT0FHwqDoqV
	AGGXWKmW1B8Jj++PUIE4/QE4JuU5FZKgdBEExMa7p4rAvq8DwkoN1fk9ujEQysJToZq5m98Q6Ro
	tzkRx+acvpGDA5b5HAXI+qHCYIYqE5eJDGoldWJnTt4PpO49dxF4afkDv/oPlBdYhnf7AcgAYbI
	9k0rUVfPA3qzzN0hPOoPoRmvxGlWCClipuiYDx74bO90DoRn5OHHyt4nRZlzStViCl0xTGiACF7
	EnIk5HOHETRrG1XjTVGCUzbny3XDHqxbpgsI18E2LN9aZbhoIVLFx1uu9QULU0Qwvfe7ZaLfMI2
	FSwrAT2i8Z3vZOeVLrNWEthY1ztRF1yYNjFngl5oMp7+e6JVjezT702gufYrw3bXNsfcAKF2oLW
	NjbAnbF1VeDjr7IhwRImjvBFa06cV0oh83Qr04X7GY/DFE/wiH3KWfKTZZcapQngeyeEqHD2Qq/
	JSV3ePbPjhN8VLQ
X-Received: by 2002:a17:906:478e:b0:b9c:69df:4d99 with SMTP id a640c23a62f3a-b9c69df604emr440033966b.46.1775398588426;
        Sun, 05 Apr 2026 07:16:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc? ([2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028995sm389733166b.57.2026.04.05.07.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:16:27 -0700 (PDT)
Message-ID: <93d79b4fb9c40165dedc93dc988d55c26e54ab7a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mark Hatle <mark.hatle@kernel.crashing.org>
Date: Sun, 05 Apr 2026 15:16:26 +0100
In-Reply-To: <adJPst82O73CdC9P@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
	 <20260403183541.2631883-5-twoerner@gmail.com>
	 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
	 <adA94CgwRzIvBl1R@localhost.localdomain>
	 <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
	 <adEyY7c8FLpJPNkc@localhost.localdomain>
	 <f366155401c254d33792e00d0f6b60b81ed34d8b.camel@linuxfoundation.org>
	 <adF2qsDHX3SzWqzy@localhost.localdomain>
	 <889c5788a6c49ddf77b22859b7d82014c75ecb98.camel@linuxfoundation.org>
	 <adJPst82O73CdC9P@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234630

On Sun, 2026-04-05 at 08:04 -0400, Trevor Woerner wrote:
> On Sun 2026-04-05 @ 10:17:40 AM, Richard Purdie wrote:
> > On Sat, 2026-04-04 at 16:38 -0400, Trevor Woerner wrote:
> > > On Sat 2026-04-04 @ 07:36:05 PM, Richard Purdie wrote:
> > > > On Sat, 2026-04-04 at 11:46 -0400, Trevor Woerner wrote:
> > > > > On Sat 2026-04-04 @ 08:27:13 AM, Richard Purdie wrote:
> > > > >=20
> > > > > I'm only guessing here, but it looks like someone wrote "wic crea=
te" to
> > > > > run two different ways: with the wks file specified with or witho=
ut the
> > > > > ".wks" extension.
> > > > >=20
> > > > > If ".wks" is not given (e.g. "wic create directdisk-gpt ...", whi=
ch is
> > > > > what occurs in the oe-selftest tests, i.e. when wic is run indepe=
ndently
> > > > > without being part of a bitbake build) then wic invokes its own s=
earch
> > > > > algorithm to try to find the wks file using BBLAYERS and script_d=
ir. In
> > > > > this case the wks file is specified without the ".wks" and no pat=
h
> > > > > information is given on the cmdline. It is up to wic to find the =
actual
> > > > > wks file itself.
> > > > >=20
> > > > > If the ".wks" is included (which is what happens when wic is call=
ed as
> > > > > part of a bitbake build and therefore the image_types_wic.bbclass=
 is
> > > > > used) then the class adds the ".wks" at the end, and also gives w=
ic the
> > > > > path to the wks file which it finds using WKS_SEARCH_PATH which i=
s based
> > > > > on BBPATH and COREBASE.
> > > > >=20
> > > > > Assuming the persona of someone who wants to use this new, indepe=
ndent
> > > > > wic tool, and who knows nothing about The Yocto Project or bitbak=
e, I
> > > > > think having wic look in "magical" places for the wks file would =
be hard
> > > > > to understand and surprising. As an independent tool I think the =
user
> > > > > should provide the path to the actual wks file (with the ".wks"
> > > > > extension) and if that file can't be found as specified on the cm=
dline,
> > > > > wic should simply fail with an error.
> > > > >=20
> > > > > As part of making wic an independent tool, I think wic's code to =
search
> > > > > for a wks file if the ".wks" is not provided should be removed. T=
his
> > > > > means that, as part of the transition, I would have to modify eac=
h "wic
> > > > > create" test in oe-core's oe-selftests. I'm fine with that. That =
could
> > > > > be done cleanly if I write a little function to find the wks file=
 in
> > > > > the wic.py oe-selftest itself using the same logic as is used in =
the
> > > > > image_types_wic.bbclass.
> > > > >=20
> > > > > To summarize: in my opinion, wic shouldn't have search logic. Fro=
m wic's
> > > > > point of view the wks file should be specified on the cmdline in =
a way
> > > > > that wic will find the file the user wants to use (or not find it=
).
> > > > > The oe-selftests should be updated to use the same search logic f=
rom
> > > > > the image_types_wic.bbclass so that when it invokes "wic create" =
it is
> > > > > providing wic with the path to a wks file that has a ".wks" exten=
sion
> > > > > (which is how bitbake invokes wic) instead of specifying a bare w=
ks file
> > > > > and hoping wic will find it.
> > > > >=20
> > > > > I'm happy to add "files/wic" as another location for
> > > > > image_types_wic.bbclass to search for wks files.
> > > >=20
> > > > I guess the first question is are we going to take this for wrynose=
 or
> > > > not? I'm not particularly happy with the files a top level wic
> > > > directory, I think it needs to be meta/files/wic. To make that work=
, we
> > > > need to tweak the search paths in wic and in image_types_wic.bbclas=
s.
> > > > If we can resolve that issue, we're probably good to move forward w=
ith
> > > > merging.
> > > >=20
> > > > I agree that the search path logic should be tidied up. Whether you=
 can
> > > > provide a search path to wic or whether that has to be done in meta=
data
> > > > is an open question. I do see your perspective, equally, if you are
> > > > using wic within OE, having some search knowledge may be ok. I woul=
d
> > > > want to see it basically using files/wic from BBPATH=C2=A0 with eve=
rything
> > > > else removed. There is a question of how you warn users about old
> > > > paths. This piece is too late for the release though.
> > > >=20
> > > > So I'd propose we add files/wic to the search path, move the files
> > > > there and that lets us at least get some of the changes into the
> > > > release?
> > >=20
> > > Sounds perfect, thanks!
> >=20
> > Since we're running out of time and I really don't want to have to
> > think about this too much more/again, I've:
> >=20
> > * written a patch to add files/wic as a search path in wic
> > * written a patch to add files/wic as a search path in the class
> > * dropped wic and the canned-wks paths in wic
> > * dropped wic and the canned-wks paths in the class
> > * converted wic to use BBPATH instead of BBLAYERS
> > * added a sanity test to detect the old paths and error
> > * pushed a contrib/rpurdie branch into the wic repo with the patches
> >=20
> > This is going to mean people have to update layers to use "files/wic"
> > but we can clearly tell people they need to do it. If we went with
> > either of the other locations and changed BBLAYERS -> BBPATH, there
> > could be corner cases we miss in the detection.
> >=20
> > Autobuilder testing shows this will break a few layers but it is a
> > clear error which people can easily fix.
> >=20
> > How does that look to people?
>=20
> Sounds great to me!
>=20
> Presumably we will move the contrib/rpurdie branch to master in
> git.yoctoproject.org/wic and the SRC_URI of the wic recipe in oe-core
> will need a tweak before making it official?

I pushed onto a contrib branch so we can make a decision on this.
Assuming we go ahead, we'd merge the patches to master, the update the
recipe accordingly.

Cheers,

Richard

