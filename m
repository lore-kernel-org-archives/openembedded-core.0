Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C67E63FEE
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 18:36:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21846.1775327769149875329
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 11:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NjF4Yz0F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfa33a983so1742036f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775327767; x=1775932567; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ihsGQOf0lO8QtblklV9IAJUogEp/MsEIOB/qA1Vask4=;
        b=NjF4Yz0FQuGpvzOhvCN/cvRtkjdo3zyvxdP7nwbdMah7W7kfQ7XfdS+yqIglzqnQ2t
         5iM7WwoF7P/NrAJK0wSvyKSuSPZt/ffqYfjmE2B2vzMQ+fxwhgX6EtQYd/qU71LP3zuX
         HnuJDD3DN7C89M123GVPdZ9wss9EkG50Dwv7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775327767; x=1775932567;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihsGQOf0lO8QtblklV9IAJUogEp/MsEIOB/qA1Vask4=;
        b=OladKXnlFnqHY+0IQH/l4jIjXHlAfos4qcdcVY57/dTIzD2OcBbnXu0Bcc+jpaGg2A
         3ZKPEMcLwUfTTI3eY0vD2Vu+srTDi1WOXMMXqc3LfKO1ocW8QkYKyGFyA4NwTfQpX5xk
         G2XXUdhML9oZgTFqd52URO8uYEmkih/kdtLQlUE+Ojy0jXFbCYtcp2qtTgCQA3ZRsSK6
         5a573K+DfvykjOVJSUNn3q07Yw5pQhlVebquwxdY27zZlWgfTcWPiUml7V+PnL04kdUf
         LcYB/LZx5TwSh6V9OEUrNFUT0IFSq4XBGq0On6eTZvdb8QIxw8l2zmKVLvzWsTd+ZnuS
         aAWw==
X-Gm-Message-State: AOJu0Yx7o7cFihJJAR+IWCrrNOLxuJl1HQwJG1l2/lnOSOAulBDATQ1U
	g8UqS0SnBY3YKHLua8kgkNpoWudKbUeJ/FekOAe8CJY87Qg5QKmyESbtHrbQ5VTL0g4=
X-Gm-Gg: AeBDiesOku1PKJfYdHtajmWtCj1aD/HNGyFxkNINbAK/ISsTfTJ+vDqj4qfvXnSY65I
	Z5i78op8PcksKki7CnjEKHw2xE+aw8ktOGI5k8kj5R4J1WSfZRX8/cALSkREcoK0URmiNdUCKhb
	CrD2V2E8fr0iVqfzVM5DZMvKIKFW1DhMOBkR7ge9Dn+Ciyi4DMM8oOcrzQ4xGEMyzq7zQcRCUfm
	zex/mmZJwMxrkLbBbdMeu4Cc2ulfPD94o42aqQFlyUa3owdZXQ/LRbBHKZt9UZdpfJ8PpQJA/yw
	bagTfOCGwzBb1pcVcYAOXc9cCk3GCdWS6cGwntjQdKlngwj2F26qgALlfg8bfMlj2O035FO76ot
	cxHr1i8/gfoKZTwnNlRbuSLUVyLActppSXmXkh6xTPh11bW3D7QZdNkCdMp9qJIXHuFsACahXyA
	liPvytxayCRoqgEo4rwpT2mpgedMnfNNhGkxaKazcEhAABvRx31+PCsReSU4ypSNcxHxe/Gq6Yr
	CRC+cCIm0PWUYsD
X-Received: by 2002:a05:6000:2c0a:b0:43d:1bf6:930 with SMTP id ffacd0b85a97d-43d293060fdmr12329732f8f.47.1775327767291;
        Sat, 04 Apr 2026 11:36:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3181:d9a0:79d5:affd? ([2001:8b0:aba:5f3c:3181:d9a0:79d5:affd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm26500501f8f.21.2026.04.04.11.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 11:36:06 -0700 (PDT)
Message-ID: <f366155401c254d33792e00d0f6b60b81ed34d8b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mark Hatle <mark.hatle@kernel.crashing.org>
Date: Sat, 04 Apr 2026 19:36:05 +0100
In-Reply-To: <adEyY7c8FLpJPNkc@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
	 <20260403183541.2631883-5-twoerner@gmail.com>
	 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
	 <adA94CgwRzIvBl1R@localhost.localdomain>
	 <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
	 <adEyY7c8FLpJPNkc@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 18:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234618

On Sat, 2026-04-04 at 11:46 -0400, Trevor Woerner wrote:
> On Sat 2026-04-04 @ 08:27:13 AM, Richard Purdie wrote:
> > On Fri, 2026-04-03 at 18:23 -0400, Trevor Woerner wrote:
> > > On Fri 2026-04-03 @ 10:13:00 PM, Richard Purdie wrote:
> > > > On Fri, 2026-04-03 at 14:35 -0400, Trevor Woerner via lists.openemb=
edded.org wrote:
> > > > > When "wic create ..." is invoked with a bare *wks name (i.e. with=
out the
> > > > > `.wks` extension), wic calls engine.py:find_canned_images() to fi=
nd the
> > > > > fully qualified *wks file. This function searches every directory=
 formed by:
> > > > > =C2=A0=C2=A0=C2=A0 - permutating all BBLAYERS with `/wic`
> > > > > =C2=A0=C2=A0=C2=A0 - permutating all BBLAYERS with `/scripts/lib/=
wic/canned-wks`
> > > > > =C2=A0=C2=A0=C2=A0 - checking `<scripts_path>/lib/wic/canned-wks`
> > > > > Where `<scripts_path>` is the directory containing the wic progra=
m.
> > > >=20
> > > > It doesn't. I just looked at the code and it uses BBPATH. That can =
be
> > > > similar to BBLAYERS but it is different and the commit messages rea=
lly
> > > > should refer to BBPATH.
> > >=20
> > > In the oe-selftest wic tests, most of the "wic create ..." commands
> > > are called with bare *wks files (i.e. *wks files without the `.wks`
> > > extension). When this happens, as "wic create..." is called, it start=
s
> > > by running the code found here:
> > >=20
> > > 	https://git.openembedded.org/openembedded-core/tree/scripts/wic#n206
> > >=20
> > > which calls:
> > >=20
> > > 	https://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/=
engine.py#n46
> > >=20
> > > which follows the algorithm that I have described above.
> > >=20
> > > So for the oe-selftests to pass I wanted to move them.
> >=20
> > You are right, it is using BBLAYERS. This is very confusing since the
> > wks files are using BBPATH, which is similar but subtly different.=20
> >=20
> > Is there any reason it can't use BBPATH to match?
> >=20
> > I agree the files need to move but I'd like them to end up in
> > meta/files/wic, not meta/wic. Whilst it complicates the migration a
> > little, I think it would be best to move them once and get them into
> > the right place.
> >=20
> > The questions are then firstly, how to do that simply, then secondly,
> > how to clean up the rest of this (and when to do that).
> >=20
> > Adding files/wic into the search path is trivial. Deprecating the
> > existing search paths with appropriate warnings is a bit trickier and
> > there is the question of when we should do that, before or after the
> > current release. "after" would seem more obvious, but it will mean two
> > different behaviours before and after release and with a standalone
> > tool, this does become harder.
>=20
> I'm only guessing here, but it looks like someone wrote "wic create" to
> run two different ways: with the wks file specified with or without the
> ".wks" extension.
>=20
> If ".wks" is not given (e.g. "wic create directdisk-gpt ...", which is
> what occurs in the oe-selftest tests, i.e. when wic is run independently
> without being part of a bitbake build) then wic invokes its own search
> algorithm to try to find the wks file using BBLAYERS and script_dir. In
> this case the wks file is specified without the ".wks" and no path
> information is given on the cmdline. It is up to wic to find the actual
> wks file itself.
>=20
> If the ".wks" is included (which is what happens when wic is called as
> part of a bitbake build and therefore the image_types_wic.bbclass is
> used) then the class adds the ".wks" at the end, and also gives wic the
> path to the wks file which it finds using WKS_SEARCH_PATH which is based
> on BBPATH and COREBASE.
>=20
> Assuming the persona of someone who wants to use this new, independent
> wic tool, and who knows nothing about The Yocto Project or bitbake, I
> think having wic look in "magical" places for the wks file would be hard
> to understand and surprising. As an independent tool I think the user
> should provide the path to the actual wks file (with the ".wks"
> extension) and if that file can't be found as specified on the cmdline,
> wic should simply fail with an error.
>=20
> As part of making wic an independent tool, I think wic's code to search
> for a wks file if the ".wks" is not provided should be removed. This
> means that, as part of the transition, I would have to modify each "wic
> create" test in oe-core's oe-selftests. I'm fine with that. That could
> be done cleanly if I write a little function to find the wks file in
> the wic.py oe-selftest itself using the same logic as is used in the
> image_types_wic.bbclass.
>=20
> To summarize: in my opinion, wic shouldn't have search logic. From wic's
> point of view the wks file should be specified on the cmdline in a way
> that wic will find the file the user wants to use (or not find it).
> The oe-selftests should be updated to use the same search logic from
> the image_types_wic.bbclass so that when it invokes "wic create" it is
> providing wic with the path to a wks file that has a ".wks" extension
> (which is how bitbake invokes wic) instead of specifying a bare wks file
> and hoping wic will find it.
>=20
> I'm happy to add "files/wic" as another location for
> image_types_wic.bbclass to search for wks files.

I guess the first question is are we going to take this for wrynose or
not? I'm not particularly happy with the files a top level wic
directory, I think it needs to be meta/files/wic. To make that work, we
need to tweak the search paths in wic and in image_types_wic.bbclass.
If we can resolve that issue, we're probably good to move forward with
merging.

I agree that the search path logic should be tidied up. Whether you can
provide a search path to wic or whether that has to be done in metadata
is an open question. I do see your perspective, equally, if you are
using wic within OE, having some search knowledge may be ok. I would
want to see it basically using files/wic from BBPATH  with everything
else removed. There is a question of how you warn users about old
paths. This piece is too late for the release though.

So I'd propose we add files/wic to the search path, move the files
there and that lets us at least get some of the changes into the
release?

Cheers,

Richard


