Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168A1ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 10:06:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.30.1662718004053000747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 03:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SR/sCTlS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so4090176wma.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=CsgNh+410BnTMUmPX0cgeVeIGmrsfAYPABp3tUYmYsM=;
        b=SR/sCTlSSCYoHcbZemxJgI2aCuJCKe25oZc5/Z2vUdqlF95PXSL4ekCS+N0KVmd57C
         6JR04Th+fKNyS091mm7NgnrJgSbfxqzLGDF1cJA2tTY4s49iJAjsuDhILzMErTGI1ECJ
         ztLWbsb9Zb+k4cvwkcH29tKmMvOZjLP0T7G+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=CsgNh+410BnTMUmPX0cgeVeIGmrsfAYPABp3tUYmYsM=;
        b=ZZdJ8QW7vS9N745bA+lKYTvT3cA8abtE9A30Kjs5T3ANAxtW3l8C49Ksi7JFcsxOtC
         iM/oBY4+r6zhQxSnHD6FovcTViNBPYyNC/h7HdIkt45U+QqpJOFQe16w4ZEFJrTNW1dW
         +WA7uHpVhsROxoLYhcVDxXHy2tK+ghcTYLF9Bd1TzAIrmk8WBQ0YcTkarR/5IRHf9r9q
         b1VdJQe/uitKG7pOMw228btCz1Ssa+Guqac5VTy5/Qp1HApL5v1edY/MCzdJ5oUAlVRv
         LVx/e95mJ8U3mC8jqSB7EQ4L+ZyAmX/68IGKNKOYZml8UBSkGkFwPTLXoiELV5QtDSfB
         hweA==
X-Gm-Message-State: ACgBeo1X3M9Jd5ZSHugEglW9IAEyt/JpMoGLY0ILnKvtu4UsvJQDDPE8
	03ysfbO9I0ZTF25yKM3IQHaq2Q==
X-Google-Smtp-Source: 
 AA6agR43UkxnT3PL95udQXrNtjryVJNVOtdGhQbgoZiPU8pai3B46mgBqHugo0s59ZyWKoT/ATkYCw==
X-Received: by 2002:a05:600c:3585:b0:3a5:e7f5:3b54 with SMTP id
 p5-20020a05600c358500b003a5e7f53b54mr4971882wmq.166.1662718002321;
        Fri, 09 Sep 2022 03:06:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992?
 ([2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992])
        by smtp.gmail.com with ESMTPSA id
 k9-20020a7bc409000000b003ab1a870daasm212791wmi.5.2022.09.09.03.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:06:41 -0700 (PDT)
Message-ID: 
 <ef71d578266a177d13a4050cd2c66cc3f24c728e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 1/3] oe-setup-builddir: Correct when
 validation of the templates dir is run
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Sep 2022 11:06:39 +0100
In-Reply-To: 
 <PR2PR09MB3100250136C482D677A711ADA8439@PR2PR09MB3100.eurprd09.prod.outlook.com>
References: 
	<PR2PR09MB310090AC0EFFE5E72CC30942A8439@PR2PR09MB3100.eurprd09.prod.outlook.com>
	 <6a3b182c1f737086fbf398bcf191865c00a4fe10.camel@linuxfoundation.org>
	 <PR2PR09MB3100250136C482D677A711ADA8439@PR2PR09MB3100.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 10:06:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170481

On Fri, 2022-09-09 at 11:27 +0200, Konrad Weihmann wrote:
>=20
> On 09.09.22 11:09, Richard Purdie wrote:
> > On Fri, 2022-09-09 at 10:42 +0200, Konrad Weihmann wrote:
> > > A general remark from my side about this patch is that this limitatio=
n
> > > isn't mentioned in the documentation at all [1].
> > > I would have been in favor of just dropping this piece of code, esp a=
s
> > > the check wasn't run for years now - but here we are with another
> > > undocumented and breaking change (at least for me, as the template co=
nfs
> > > in my projects weren't located under templates, until everything fell
> > > apart in CI over night)
> >=20
> > The tone of what you've written here isn't great but let me comment.
>=20
> Sorry about the tone - I was a little frustrated about this.
> I fully understand that there will be breaking changes, esp. if they are=
=20
> justified - I'm just questioning that this here in the case.
> The migration path should have been to drop the code piece and let users=
=20
> freely decide where to place those template configs (basically keeping=
=20
> the existing behavior and having an easy migration path).

I guess enforcing a location was probably my fault. The reason I'm keen
to have a known location is for discoverability. We need better tools
around setup and configuration but tools work best with known layouts
rather than making guesses.=C2=A0I think that this is a small step towards
solving a much bigger problem but we have to start somewhere. I'm sorry
you disagree. You are effectively advocating for don't change anything
though (and would later then be unhappy new tooling didn't work with
your templates). If we did that it would likely lead to people
advocating for more complex guessing about layouts which in my
experience is error prone.

> > The project can and will make changes and try to improve, it has to.
> > Some of these changes will break things. We usually try our best to
> > minimise disruption but change is what happens on the development
> > branch. We usually do a reasonable job of documenting things as part of
> > the release notes and the migration guide but this isn't in a release
> > yet.
>=20
> But what I actually wanted to highlight, is that this is simple=20
> undocumented as of now - so my expectation would have been, if there's=
=20
> new limitation then it should be accompanied by a patch to the=20
> documentation, otherwise there will be a gap.
> And the documentation improved quite a lot over the past 2 years, so I=
=20
> would want to keep this quality as high a possible.

I believe the documentation is known about and coming, there were
emails on the docs list about it already. Ideally we'd require all
changes to arrive with the documentation complete. The barriers to
making *any* breaking change are already at the point where many
developers run away screaming with the levels of issues they face and
are asked to resolve. I personally often don't do things either just
due to these kinds of issues too. I'm reluctant to put further
obstacles in the way.

It should be clear I do hugely value documentation btw. I have strongly
supported maintaining and developing our docs, I just have to take a
pragmatic view over how changes merge.

>  From my perspective it's super hard to train my developers to a master=
=20
> first approach, but not having proper documentation what they have to be=
=20
> aware of. And I'm sure it's not the expectation of the project to have=
=20
> users grep through the fairly huge code base and git history to find out=
=20
> why all of a sudden a known good behavior changes.

To find out what changed you had to look at the changelog of the last
few changes on master as presumably you build on a semi regular (and
known basis). We do require good commit messages and there was
information in there about this. I therefore don't agree you had to
grep through a large codebase, you could knew where this change came
from and how to find out more information.

> We (as in my devs and me in the several projects) could stay on LTS or=
=20
> what ever release version is out there, but that would clearly miss my=
=20
> goal of bringing in more contributors to the project, which is currently=
=20
> already hard enough.

I do appreciate the help with that.

> > We do have LTS branches and we are not in the habit of pushing breaking
> > changes to those.
> >=20
> > For reference, I would ideally love to have a team of engineers I could
> > work with to make sure all changes had strong migration code and
> > nothing every broke. We have to manage with what we have.
>=20
> To me that sounds like a selftest tbh - from my perspective it should=20
> have been caught in the existing CI before hitting master

The existing CI initially failed with some of the changes. The changes
were revised, some new tests were even added. The changes passed before
they merged.
>=20

Cheers,

Richard

