Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF1BC433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:21:59 +0000 (UTC)
Subject: Re: [PATCH] sstate: Consider .lock suffix for when loading sstate
 file from mirror
To: openembedded-core@lists.openembedded.org
From: "Manuel Leonhardt" <mleonhardt@arri.de>
X-Originating-Location: Munich, Bavaria, DE (88.217.121.203)
X-Originating-Platform: Mac Firefox 93
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Nov 2021 04:21:57 -0700
References: 
 <f01b1089e6b6b00b9721a14358b9de7e2ae96b12.camel@linuxfoundation.org>
In-Reply-To: 
 <f01b1089e6b6b00b9721a14358b9de7e2ae96b12.camel@linuxfoundation.org>
Message-ID: <27626.1635765717822776754@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="08Hd8pSDWyur8Bg4ICkv"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 11:21:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157703

--08Hd8pSDWyur8Bg4ICkv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2021 at 12:19 PM, Richard Purdie wrote:

>=20
> On Mon, 2021-11-01 at 04:09 -0700, Manuel Leonhardt wrote:
>=20
>> On Mon, Nov 1, 2021 at 11:52 AM, Richard Purdie wrote:
>>=20
>>> On Mon, 2021-11-01 at 03:47 -0700, Manuel Leonhardt wrote:
>>>=20
>>>> I submitted a patch to fix bb.utils.lockfile to at least break the loo=
p
>>>> and
>>>> fail
>>>> when a too long filename is passed with
>>>> https://lists.openembedded.org/g/bitbake-devel/message/12850
>>>>=20
>>>> Nevertheless, you have a good point here: Fixing the code that constru=
cts
>>>> the
>>>> filename of the lock files would be the better solution. For the sstat=
e
>>>> files
>>>> only lockfiles of .siginfo files can overlap, because the filename of =
the
>>>> actual
>>>> sstate file is already 8 characters shorter than 255 characters. I hav=
e
>>>> one
>>>> though on that:
>>>>=20
>>>> From what I have seen, the filename of lockfiles is mostly constructed=
 by
>>>> appending ".lock" without any further check. Truncating the filename o=
f
>>>> the
>>>> lockfile inside bb.utils.lockfile could be confusing however, since th=
e
>>>> function
>>>> would not use the filename that is was explicitly passed. Hence, I gue=
ss
>>>> bb.utils.lockfile should fail when a too long filename was passed, and=
 the
>>>>=20
>>>> function building the lockfile's filename should ensure to keep it
>>>> limited;
>>>> that's bb.fetch2.FetchData.__init__ then if I'm not mistaken. Would yo=
u
>>>> agree?
>>>> Or would you say, changing the filename inside bb.utils.lockfile is ok=
, as
>>>>=20
>>>> long
>>>> as the function is working?
>>>>=20
>>>> The drive-by fix I made with using limit instead of 254 when shortenin=
g
>>>> the
>>>> filename is still correct and necessary, right?
>>>=20
>>> I think we just let lockfile truncate the filename if necessary since t=
his
>>>=20
>>> could
>>> affect other users of the funciton too.
>>>=20
>>> Looking at the code you changed with the limit value it isn't correct
>>> since
>>> extension is already accounted for in avail (although I agree that code=
 is
>>>=20
>>> confusing and I had to think twice about it).
>>>=20
>>> Cheers,
>>>=20
>>> Richard
>>=20
>> Ok, I'll submit a new patch.
>>=20
>> For the limit value, my guess was that when always using 254 the reserve=
d
>> characters for siginfo are not taken into account when siginfo=3DFalse. =
For
>> shorter filenames it's ensured that the siginfo file is always the sstat=
e
>> file's
>> name plus ".siginfo". With longer filenames it's possible that the
>> basename of
>> both files is different. This comes unhandy when working with the files
>> outside
>> of bitbake, e.g. running maintenance tasks on the sstate mirror server,
>> e.g.
>> copy sstate files and ensure their respective .siginfo file is also
>> copied.
>=20
> That is reasonable, the commit message just needs to say that is why it i=
s
> being
> changed in that case.
>=20
> Cheers,
>=20
> Richard

Thanks. You ware totally right, I missed that in the commit message. I'll s=
ubmit a new patch for that as well.

Best,

Manuel

--08Hd8pSDWyur8Bg4ICkv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2021 at 12:19 PM, Richard Purdie wrote:<br />
<blockquote>On Mon, 2021-11-01 at 04:09 -0700, Manuel Leonhardt wrote:<br /=
>
<blockquote>On Mon, Nov 1, 2021 at 11:52 AM, Richard Purdie wrote:<br />
<blockquote>On Mon, 2021-11-01 at 03:47 -0700, Manuel Leonhardt wrote:<br /=
>
<blockquote>I submitted a patch to fix bb.utils.lockfile to at least break =
the loop<br />and<br />fail<br />when a too long filename is passed with<br=
 /><a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/12850"=
 target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/bitbak=
e-devel/message/12850</a><br /><br />Nevertheless, you have a good point he=
re: Fixing the code that constructs<br />the<br />filename of the lock file=
s would be the better solution. For the sstate<br />files<br />only lockfil=
es of .siginfo files can overlap, because the filename of the<br />actual<b=
r />sstate file is already 8 characters shorter than 255 characters. I have=
<br />one<br />though on that:<br /><br />From what I have seen, the filena=
me of lockfiles is mostly constructed by<br />appending ".lock" without any=
 further check. Truncating the filename of<br />the<br />lockfile inside bb=
.utils.lockfile could be confusing however, since the<br />function<br />wo=
uld not use the filename that is was explicitly passed. Hence, I guess<br /=
>bb.utils.lockfile should fail when a too long filename was passed, and the=
<br />function building the lockfile's filename should ensure to keep it<br=
 />limited;<br />that's bb.fetch2.FetchData.__init__ then if I'm not mistak=
en. Would you<br />agree?<br />Or would you say, changing the filename insi=
de bb.utils.lockfile is ok, as<br />long<br />as the function is working?<b=
r /><br />The drive-by fix I made with using limit instead of 254 when shor=
tening<br />the<br />filename is still correct and necessary, right?</block=
quote>
I think we just let lockfile truncate the filename if necessary since this<=
br />could<br />affect other users of the funciton too.&nbsp;<br /><br />Lo=
oking at the code you changed with the limit value it isn't correct since<b=
r />extension is already accounted for in avail (although I agree that code=
 is<br />confusing and I had to think twice about it).<br /><br />Cheers,<b=
r /><br />Richard</blockquote>
Ok, I'll submit a new patch.<br /><br />For the limit value, my guess was t=
hat when always using 254 the reserved<br />characters for siginfo are not =
taken into account when siginfo=3DFalse. For<br />shorter filenames it's en=
sured that the siginfo file is always the sstate<br />file's<br />name plus=
 ".siginfo". With longer filenames it's possible that the basename of<br />=
both files is different. This comes unhandy when working with the files<br =
/>outside<br />of bitbake, e.g. running maintenance tasks on the sstate mir=
ror server, e.g.<br />copy sstate files and ensure their respective .siginf=
o file is also copied.</blockquote>
That is reasonable, the commit message just needs to say that is why it is =
being<br />changed in that case.<br /><br />Cheers,<br /><br />Richard</blo=
ckquote>
Thanks. You ware totally right, I missed that in the commit message. I'll s=
ubmit a new patch for that as well.<br /><br />Best,<br /><br />Manuel

--08Hd8pSDWyur8Bg4ICkv--

