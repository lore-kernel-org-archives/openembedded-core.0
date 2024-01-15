Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A8CC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 16:31:27 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.86356.1705336278326845633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 08:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.37] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 40FGVHEb026100
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 10:31:17 -0600
Message-ID: <568f6686-51c8-49c5-b4e5-2dafbf3f6f1e@kernel.crashing.org>
Date: Mon, 15 Jan 2024 10:31:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
 <17AA7149AA53F0BC.13033@lists.openembedded.org>
 <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
 <af6662addc22623e6b10e24a62b7a0c39c749ed7.camel@iris-sensing.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <af6662addc22623e6b10e24a62b7a0c39c749ed7.camel@iris-sensing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 40FGVHEb026100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 16:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193686



On 1/15/24 7:50 AM, Jasper Orschulko via lists.openembedded.org wrote:
> Hi Alex,
>=20
>> Okay, I've read the README file in that repo, and if i understood it
>> right, the process is:
>> - run fossology
>> - have a human inspect the output, and correct it on a file by file
>> basis (tremendous waste of time and limited developer resources even
>> when done the 'open source way' if you ask me but whatevs)
>> - place the corrected output into the above repository
>=20
> Correct.
>=20
>> Do you really really need the 'human corrected' part of all this?
>=20
> Unfortunately we do need the "human corrected" part (I wish we
> wouldn't). We have industry customers (and in turn our legal
> department) that demand a license compliance report and clearing on a
> "per-file" basis. Currently available scanning tools are unfortunately
> way to unreliable for usage without any human interaction (believe me,
> we tried).
>=20
> Will this be stupid amount of work? Yes. Is this compliance obligations
> gone mad? IMO, absolutely yes.
>=20
> But unfortunately this seems to be the way the industry is heading. We
> as a supplier company are getting more and more requests of this sort
> from our clients (big players in the public transport and automotive
> industry) who won't "play" with us unless these obligations are
> fulfilled. I've also heared similar stories from other companies.
> (That's what you get when you let company lawyers go wild =F0=9F=98=89=EF=
=B8=8F)
>=20
> So I'm not happy with the situation but doing the best I can, given the
> requirements. In our case that means sharing our license clearings
> (which we have to do in any case) with the open source community, in
> the hope that other companies have similar challenges and that we can
> get some crowd-sourcing going.
>=20
>> It will never possibly cover all of the packages you need to ship and
>> match all their versions.
>=20
> So what we are currently striving for is covering all target relevant
> packages (aka without any special suffixes) of a "basic linux build"
> (aka image-core-minimal) for LTS releases (starting with kirkstone).
> Additionally, meta-ossselot will have logic for re-use of other package
> versions (so does osselot as a whole), limiting curation to the diff.
> I also have some ideas on dealing with openembedded patches added to
> point releases (currently another pain point).

One note, when I worked on this a few years ago (pre-2020) each source fi=
le was=20
correlated to an entry in our SPDX database.  The licenses were manually=20
reviewed and that was all attached to a file's hash.

This way it didn't matter if you were looking at an upstream tarball, an=20
upstream git repository, or any other mode of getting the source code.

Tracking was effectively "human reviewed" SPDX was compared against the p=
atched=20
file manifest.  Any sources that didn't match the checksum were flagged f=
or=20
review.  A master database of checksums were also available to see if the=
 file=20
was duplicated in other repositories as well.  This also allowed comparis=
on of=20
license/copyright and possibly patent data between different projects.  (=
and=20
ALSO allowed exceptions for generated m4, configure.in, etc files!)

This manual review work absolutely needs to be done for some parts of the=
 world=20
and some company requirements... but be careful not to make the work so c=
omplex=20
it can't be completed.

--Mark

> Best,
> Jasper
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193674): https://lists.openembedded.org/g/openembed=
ded-core/message/193674
> Mute This Topic: https://lists.openembedded.org/mt/103730186/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

