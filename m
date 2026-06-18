Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85370CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 21:56:46 +0000 (UTC)
Subject: Re: [meta][PATCH] go-vendor.bbclass: Unpack into BP for destsuffix
To: openembedded-core@lists.openembedded.org
From: "John Ripple" <john.ripple@keysight.com>
X-Originating-Location: Colorado Springs, Colorado, US (192.25.7.194)
X-Originating-Platform: Windows Firefox 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 18 Jun 2026 14:56:42 -0700
References: <20260618213119.2495463-1-john.ripple@keysight.com> <CADkTA4MYBKZuuJ5iNHvq+SErx=mB3fz1UZq3VC1rofMemoUivw@mail.gmail.com>
In-Reply-To: <CADkTA4MYBKZuuJ5iNHvq+SErx=mB3fz1UZq3VC1rofMemoUivw@mail.gmail.com>
Message-ID: <211612.1781819802325628623@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NQNGkytiDHQEHNqRr7Lg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 21:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239111

--NQNGkytiDHQEHNqRr7Lg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> I have no particular issues with the change, but the commit log doesn't
> tell us why this is needed. Was something breaking ? is there any risk
> to the assumptions that other classes/recipes/layers may have made
> about the location of the unpacked files ?
>=20

The go-vendor class was unpacking dependencies to ${UNPACKDIR}/git
and then needed S =3D "${UNPACKDIR}/git" to find the dependencies.
Changing the S variable caused the do_qa_unpack() ( https://git.openembedde=
d.org/openembedded-core/tree/meta/classes-global/insane.bbclass#n1450 ) fro=
m insane.bbclass
to throw an error.

There shouldn't be any other assumptions from other classes/recipes/layers
that have been broken. The recipes I tested this change against used source=
s
fetched using the go_src_uri() function, regular git fetching, and local fi=
les.
There weren't any issues with moving to the go dependencies to the new
location. As far as I know nothing in openembedded-core uses the go-vendor
class making it trickier to test against a known baseline.

John

--NQNGkytiDHQEHNqRr7Lg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<blockquote>
<div class=3D"gmail_default">I have no particular issues with the change, b=
ut the commit log doesn't</div>
<div class=3D"gmail_default">tell us why this is needed. Was something brea=
king ? is there any risk</div>
<div class=3D"gmail_default">to the assumptions that other classes/recipes/=
layers may have made</div>
<div class=3D"gmail_default">about the location of the unpacked files ?</di=
v>
</blockquote>
<div class=3D"gmail_default">The go-vendor class was unpacking dependencies=
 to ${UNPACKDIR}/git</div>
<div class=3D"gmail_default">and then needed S =3D "${UNPACKDIR}/git" to fi=
nd the dependencies.&nbsp;</div>
<div class=3D"gmail_default">Changing the S variable caused the <a href=3D"=
https://git.openembedded.org/openembedded-core/tree/meta/classes-global/ins=
ane.bbclass#n1450">do_qa_unpack()</a> from insane.bbclass</div>
<div class=3D"gmail_default">to throw an error.</div>
<div class=3D"gmail_default">&nbsp;</div>
<div class=3D"gmail_default">There shouldn't be any other assumptions from =
other classes/recipes/layers</div>
<div class=3D"gmail_default">that have been broken. The recipes I tested th=
is change against used sources</div>
<div class=3D"gmail_default">fetched using the go_src_uri() function, regul=
ar git fetching, and local files.</div>
<div class=3D"gmail_default">There weren't any issues with moving to the go=
 dependencies to the new</div>
<div class=3D"gmail_default">location. As far as I know nothing in openembe=
dded-core uses the go-vendor</div>
<div class=3D"gmail_default">class making it trickier to test against a kno=
wn baseline.</div>
<div class=3D"gmail_default">&nbsp;</div>
<div class=3D"gmail_default">John</div>
</div>

--NQNGkytiDHQEHNqRr7Lg--

