Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id C0DF3766E9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 15:40:58 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so87966615igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ZFQ4j0kTk52NsPE+0W6Y2Oc8JEgAsatVsQiNFq1X2ts=;
	b=EWbBKNB/NUqCky9sa748Yd7O9QMnFAYteVcyTacBdpBtr7Jo566gVV5v9D1k09H/qL
	1cVd6XFlIj/JSJ0ZByo8y1/SDDT+bg6413u46Ys+VtBrnXxj92vJKhlfaCAUgKnxSdk+
	2YxPsJvN45VTXFJncAaXYZlDEZaaPyQbknLiwtR4f7osHCFGs0OFz1ViJwvQv3S0V49q
	i3vol9YDRtaMRhshbribGtZ9U1Grgi2J+JzerNE4kx/tYnTNGoA5t97gAfHwpv7NGme3
	iHOzkdHt9M/fdJ50ejT0zDHISkeK8AOedGiKmY03nuKvP4/SK0CjFSEfdcMg+7A+xeAw
	5Hew==
X-Received: by 10.50.43.193 with SMTP id y1mr17285491igl.38.1444146058597;
	Tue, 06 Oct 2015 08:40:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Tue, 6 Oct 2015 08:40:38 -0700 (PDT)
In-Reply-To: <5613C4B4.9000908@topic.nl>
References: <56124413.7020901@topic.nl>
	<1444040307.5118.13.camel@linuxfoundation.org>
	<561263C5.2050606@topic.nl>
	<1444051353.5118.20.camel@linuxfoundation.org>
	<5613C4B4.9000908@topic.nl>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 6 Oct 2015 08:40:38 -0700
X-Google-Sender-Auth: pVHtoqSwXZN6Luh7jKT2lustyg0
Message-ID: <CABcZAN=HYhqJ6HdKA1q6FS03BvekKTB48o8QVZxbfAgc6fEdEw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to find out why my do_compile depends on $MACHINE
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
X-List-Received-Date: Tue, 06 Oct 2015 15:41:01 -0000
Content-Type: multipart/alternative; boundary=089e0111d1bed39e0805217174a3

--089e0111d1bed39e0805217174a3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2015 at 5:55 AM, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> On 05-10-15 15:22, Richard Purdie wrote:
>
>> On Mon, 2015-10-05 at 13:49 +0200, Mike Looijmans wrote:
>>
>>> =EF=BB=BFOn 05-10-15 12:18, Richard Purdie wrote:
>>>
>>>> On Mon, 2015-10-05 at 11:34 +0200, Mike Looijmans wrote:
>>>>
>>> ...
>
>> For the bigger picture:
>>>
>>> If I have a recipe that says:
>>>
>>> X =3D "x"
>>>
>>> And I refactor it a bit to read:
>>>
>>> Y =3D "x"
>>> X =3D "${Y}"
>>>
>>> What is the logic behind having to rebuild the package now? Why does th=
e
>>> 'source' of the contents matter to the hash? It won't generate differen=
t
>>> output, regardless whether X is 'calculated' or just 'constant'.
>>>
>>> In particular, I've noticed this happening when switching between
>>> AUTOREV and
>>> a fixed revision in a recipe.
>>>
>>
>> This is simply just the way the system is designed. It checksums the
>> intermediate steps as well as the endpoints. I guess in the above
>> example the system might do "export Y" for example.
>>
>
> In that case, "Y" would end up in the package's sstate hash, and hence it
> would rebuild when Y changes.
>
> I have a workaround now, multiple workarounds actually, but I'm trying to
> understand why the system would be designed this way. Currently I'm tempt=
ed
> to splatter X[vardepvalue]=3D"${X}" all over the place just to get rid of
> this annoying behaviour.
>
> There are alternative ways to do things but its simply not the way
>> things were implemented. If you do need to collapse the dependency
>> chain, you can use vardepvalue which was added for that reason. There
>> are only a small number of places you really need to do that.
>>
>
> Lets make things more concrete. My distro.conf now reads:
>
> FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
>
> Say I want to build packages with varying optimization levels. I consider
> myself pretty smart, so in this distro.conf file, I change that line to:
>
> OPT_LEVEL ?=3D "-O2"
> FULL_OPTIMIZATION =3D "${OPT_LEVEL} -pipe ${DEBUG_FLAGS}"
>
> So now I can replace the optimization level of some packages by simply
> changing the OPT_LEVEL variable.
>
> Nice, but this will trigger a rebuild of ALL packages, event though the
> build flags did not change at all!
>
> I can't think of any reason why this would be desirable. Why is it
> designed this way?


This behavior has bugged me for quite a while, I'd love to see this change
in the long term, assuming Richard isn't opposed to it. We should care
about the results, not how we got there, generally.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0111d1bed39e0805217174a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Oct 6, 2015 at 5:55 AM, Mike Looijmans <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic=
.nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On 05-10-15 15:22, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, 2015-10-05 at 13:49 +0200, Mike Looijmans wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=EF=BB=BFOn 05-10-15 12:18, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, 2015-10-05 at 11:34 +0200, Mike Looijmans wrote:<br>
</blockquote></blockquote></blockquote></span>
...<span class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
For the bigger picture:<br>
<br>
If I have a recipe that says:<br>
<br>
X =3D &quot;x&quot;<br>
<br>
And I refactor it a bit to read:<br>
<br>
Y =3D &quot;x&quot;<br>
X =3D &quot;${Y}&quot;<br>
<br>
What is the logic behind having to rebuild the package now? Why does the<br=
>
&#39;source&#39; of the contents matter to the hash? It won&#39;t generate =
different<br>
output, regardless whether X is &#39;calculated&#39; or just &#39;constant&=
#39;.<br>
<br>
In particular, I&#39;ve noticed this happening when switching between AUTOR=
EV and<br>
a fixed revision in a recipe.<br>
</blockquote>
<br>
This is simply just the way the system is designed. It checksums the<br>
intermediate steps as well as the endpoints. I guess in the above<br>
example the system might do &quot;export Y&quot; for example.<br>
</blockquote>
<br></span>
In that case, &quot;Y&quot; would end up in the package&#39;s sstate hash, =
and hence it would rebuild when Y changes.<br>
<br>
I have a workaround now, multiple workarounds actually, but I&#39;m trying =
to understand why the system would be designed this way. Currently I&#39;m =
tempted to splatter X[vardepvalue]=3D&quot;${X}&quot; all over the place ju=
st to get rid of this annoying behaviour.<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
There are alternative ways to do things but its simply not the way<br>
things were implemented. If you do need to collapse the dependency<br>
chain, you can use vardepvalue which was added for that reason. There<br>
are only a small number of places you really need to do that.<br>
</blockquote>
<br></span>
Lets make things more concrete. My distro.conf now reads:<br>
<br>
FULL_OPTIMIZATION =3D &quot;-O2 -pipe ${DEBUG_FLAGS}&quot;<br>
<br>
Say I want to build packages with varying optimization levels. I consider m=
yself pretty smart, so in this distro.conf file, I change that line to:<br>
<br>
OPT_LEVEL ?=3D &quot;-O2&quot;<br>
FULL_OPTIMIZATION =3D &quot;${OPT_LEVEL} -pipe ${DEBUG_FLAGS}&quot;<br>
<br>
So now I can replace the optimization level of some packages by simply chan=
ging the OPT_LEVEL variable.<br>
<br>
Nice, but this will trigger a rebuild of ALL packages, event though the bui=
ld flags did not change at all!<br>
<br>
I can&#39;t think of any reason why this would be desirable. Why is it desi=
gned this way?</blockquote></div><br>This behavior has bugged me for quite =
a while, I&#39;d love to see this change in the long term, assuming Richard=
 isn&#39;t opposed to it. We should care about the results, not how we got =
there, generally.<br>-- <br><div class=3D"gmail_signature">Christopher Lars=
on<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZa=
urus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</di=
v>
</div></div>

--089e0111d1bed39e0805217174a3--
