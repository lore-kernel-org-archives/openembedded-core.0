Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899E1C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:09:10 +0000 (UTC)
Subject: Re: [PATCH] sstate: Consider .lock suffix for when loading sstate
 file from mirror
To: openembedded-core@lists.openembedded.org
From: "Manuel Leonhardt" <mleonhardt@arri.de>
X-Originating-Location: Munich, Bavaria, DE (88.217.121.203)
X-Originating-Platform: Mac Firefox 93
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Nov 2021 04:09:10 -0700
References: 
 <10b07ed7a89e0dca23bee2c13c6dbcaa9a146597.camel@linuxfoundation.org>
In-Reply-To: 
 <10b07ed7a89e0dca23bee2c13c6dbcaa9a146597.camel@linuxfoundation.org>
Message-ID: <29558.1635764950231112583@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="L31vlrTH0zXwNwRy6sbm"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 11:09:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157701

--L31vlrTH0zXwNwRy6sbm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2021 at 11:52 AM, Richard Purdie wrote:

>=20
> On Mon, 2021-11-01 at 03:47 -0700, Manuel Leonhardt wrote:
>=20
>> I submitted a patch to fix bb.utils.lockfile to at least break the loop
>> and
>> fail
>> when a too long filename is passed with
>> https://lists.openembedded.org/g/bitbake-devel/message/12850
>>=20
>> Nevertheless, you have a good point here: Fixing the code that construct=
s
>> the
>> filename of the lock files would be the better solution. For the sstate
>> files
>> only lockfiles of .siginfo files can overlap, because the filename of th=
e
>> actual
>> sstate file is already 8 characters shorter than 255 characters. I have
>> one
>> though on that:
>>=20
>> From what I have seen, the filename of lockfiles is mostly constructed b=
y
>> appending ".lock" without any further check. Truncating the filename of
>> the
>> lockfile inside bb.utils.lockfile could be confusing however, since the
>> function
>> would not use the filename that is was explicitly passed. Hence, I guess
>> bb.utils.lockfile should fail when a too long filename was passed, and t=
he
>>=20
>> function building the lockfile's filename should ensure to keep it
>> limited;
>> that's bb.fetch2.FetchData.__init__ then if I'm not mistaken. Would you
>> agree?
>> Or would you say, changing the filename inside bb.utils.lockfile is ok, =
as
>>=20
>> long
>> as the function is working?
>>=20
>> The drive-by fix I made with using limit instead of 254 when shortening
>> the
>> filename is still correct and necessary, right?
>=20
> I think we just let lockfile truncate the filename if necessary since thi=
s
> could
> affect other users of the funciton too.
>=20
> Looking at the code you changed with the limit value it isn't correct
> since
> extension is already accounted for in avail (although I agree that code i=
s
>=20
> confusing and I had to think twice about it).
>=20
> Cheers,
>=20
> Richard

Ok, I'll submit a new patch.

For the limit value, my guess was that when always using 254 the reserved c=
haracters for siginfo are not taken into account when siginfo=3DFalse. For =
shorter filenames it's ensured that the siginfo file is always the sstate f=
ile's name plus ".siginfo". With longer filenames it's possible that the ba=
sename of both files is different. This comes unhandy when working with the=
 files outside of bitbake, e.g. running maintenance tasks on the sstate mir=
ror server, e.g. copy sstate files and ensure their respective .siginfo fil=
e is also copied.

--L31vlrTH0zXwNwRy6sbm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2021 at 11:52 AM, Richard Purdie wrote:<br />
<blockquote>On Mon, 2021-11-01 at 03:47 -0700, Manuel Leonhardt wrote:<br /=
>
<blockquote>I submitted a patch to fix bb.utils.lockfile to at least break =
the loop and<br />fail<br />when a too long filename is passed with<br /><a=
 href=3D"https://lists.openembedded.org/g/bitbake-devel/message/12850" targ=
et=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/bitbake-dev=
el/message/12850</a><br /><br />Nevertheless, you have a good point here: F=
ixing the code that constructs the<br />filename of the lock files would be=
 the better solution. For the sstate files<br />only lockfiles of .siginfo =
files can overlap, because the filename of the<br />actual<br />sstate file=
 is already 8 characters shorter than 255 characters. I have one<br />thoug=
h on that:<br /><br />From what I have seen, the filename of lockfiles is m=
ostly constructed by<br />appending ".lock" without any further check. Trun=
cating the filename of the<br />lockfile inside bb.utils.lockfile could be =
confusing however, since the<br />function<br />would not use the filename =
that is was explicitly passed. Hence, I guess<br />bb.utils.lockfile should=
 fail when a too long filename was passed, and the<br />function building t=
he lockfile's filename should ensure to keep it limited;<br />that's bb.fet=
ch2.FetchData.__init__ then if I'm not mistaken. Would you agree?<br />Or w=
ould you say, changing the filename inside bb.utils.lockfile is ok, as<br /=
>long<br />as the function is working?<br /><br />The drive-by fix I made w=
ith using limit instead of 254 when shortening the<br />filename is still c=
orrect and necessary, right?</blockquote>
I think we just let lockfile truncate the filename if necessary since this =
could<br />affect other users of the funciton too.&nbsp;<br /><br />Looking=
 at the code you changed with the limit value it isn't correct since<br />e=
xtension is already accounted for in avail (although I agree that code is<b=
r />confusing and I had to think twice about it).<br /><br />Cheers,<br /><=
br />Richard</blockquote>
Ok, I'll submit a new patch.<br /><br />For the limit value, my guess was t=
hat when always using 254 the reserved characters for siginfo are not taken=
 into account when siginfo=3DFalse. For shorter filenames it's ensured that=
 the siginfo file is always the sstate file's name plus ".siginfo". With lo=
nger filenames it's possible that the basename of both files is different. =
This comes unhandy when working with the files outside of bitbake, e.g. run=
ning maintenance tasks on the sstate mirror server, e.g. copy sstate files =
and ensure their respective .siginfo file is also copied.

--L31vlrTH0zXwNwRy6sbm--

