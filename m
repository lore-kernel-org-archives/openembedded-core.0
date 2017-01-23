Return-Path: <mario@parenteses.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 74DF173D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:37:42 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 1E1DD45A37;
	Mon, 23 Jan 2017 15:37:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
	(amavisd-new, port 10030)
	with ESMTP id S4qU2QqOwBEU; Mon, 23 Jan 2017 15:37:38 +0100 (CET)
From: Mario Domenech Goulart <mario@parenteses.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1485174363-32506-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1485174952.30673.15.camel@linuxfoundation.org>
	<87r33u3pfi.fsf@parenteses.org>
	<1485176748.30673.16.camel@linuxfoundation.org>
Date: Mon, 23 Jan 2017 15:37:37 +0100
In-Reply-To: <1485176748.30673.16.camel@linuxfoundation.org> (Richard Purdie's
	message of "Mon, 23 Jan 2017 13:05:48 +0000")
Message-ID: <87mveh4zbi.fsf@parenteses.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: Guard against interrupted compiles
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
X-List-Received-Date: Mon, 23 Jan 2017 14:37:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Jan 2017 13:05:48 +0000 Richard Purdie <richard.purdie@linuxfoun=
dation.org> wrote:

> On Mon, 2017-01-23 at 13:56 +0100, Mario Domenech Goulart wrote:
>>=20
>> On Mon, 23 Jan 2017 12:35:52 +0000 Richard Purdie <richard.purdie@linuxf=
oundation.org> wrote:
>>
>> > On Mon, 2017-01-23 at 12:26 +0000, Richard Purdie wrote:
>> > >=20
>> > > diff --git a/meta/recipes-core/busybox/busybox.inc
>> > > b/meta/recipes-
>> > > core/busybox/busybox.inc
>> > > index 1f4a48c..f247e8d 100644
>> > > --- a/meta/recipes-core/busybox/busybox.inc
>> > > +++ b/meta/recipes-core/busybox/busybox.inc
>> > > @@ -141,6 +141,10 @@ do_compile() {
>> > > =C2=A0	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> > > =C2=A0	if [ "${BUSYBOX_SPLIT_SUID}" =3D "1" -a x`grep
>> > > "CONFIG_FEATURE_INDIVIDUAL=3Dy" .config` =3D x ]; then
>> > > =C2=A0	# split the .config into two parts, and make two busybox
>> > > binaries
>> > > +		if [ -e .config.org ]; then
>> > > +			# Need to guard again an interrupted
>> > > do_compile - restore any backup
>> > > +			cp .config.orig .config
>> > > +		fi
>> > I have fixed the typo...
>> Wouldn't it be better to have something like
>>=20
>> =C2=A0=C2=A0=C2=A0cp .config.orig .config || true
>>=20
>> instead, to prevent race conditions?
>
> Prevent which race condition? I'd hope at this point we're the only
> thing touching the .config file?

Yeah, I hope so.

I mean, the "if exists(file){ do_something_with(file) }" idiom is
intrinsically subject to race conditions (time of check to time of use).
If we can [easily] avoid them, why not?

All the best.
Mario
--=20
http://parenteses.org/mario

