Received: from mail-lb0-f181.google.com ([209.85.217.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1U0eyc-0002IJ-CN
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 22:13:50 +0100
Received: by mail-lb0-f181.google.com with SMTP id gm6so2639433lbb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 12:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=ZQCjHV4vEOoSbpKraRtIlxIkaQ5JXqmJyUpsJx8O4Io=;
	b=QtLqGCRIJ8VRpJyKiQu5+pDmBqfzOW2UL//t09JW/8Hr8zX7FkpSliJn9zjeA/ua4d
	I3ND6sD5yxDn3zHVn1d/iDEQ7blzYsmdqLBYKp0JOwqI2h+oMWjwuVzWSkkiVlkyVsBu
	vjekHBPLzWGSSJi2cyGYmudtAS4YoC5IEjgTTzlQW5HtG8T4Tfz3fpmFlIilaP25J+ls
	yOg+0HgD3xkeDVT2u4bt0/lGi3LcAb3si2z+3Oh2tgd5N86uLTNWqUMNqYyMkn/x66hg
	dq83wzk0iAVhc5sH7lGJnmVvMNN51M4uPweUxW3BkHtZrykbNAopLsnv5ADGTbUunT70
	DWbQ==
X-Received: by 10.112.30.104 with SMTP id r8mr2491367lbh.82.1359579488397;
	Wed, 30 Jan 2013 12:58:08 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 30 Jan 2013 12:57:48 -0800 (PST)
In-Reply-To: <3C2BEFD8-C67F-4356-9518-5E91D1B975D4@3gfp.com>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
	<20130129112406.GK16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301301520430.3650@oneiric>
	<CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
	<CABcZAN=urVqvHFj_EkRXfkDUpbNb51Lr7taPWiPYXqqU__Cigw@mail.gmail.com>
	<3C2BEFD8-C67F-4356-9518-5E91D1B975D4@3gfp.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 30 Jan 2013 13:57:48 -0700
X-Google-Sender-Auth: 1uMeGLHQCRxwTM1PLFQiGWNXJTA
Message-ID: <CABcZANnVrSxSvK2zS+MHGYGr3u3nFr7r8x4VgaFiioG6GxuaKA@mail.gmail.com>
To: Harvey Chapman <hchapman-oecore@3gfp.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 21:13:50 -0000
Content-Type: multipart/alternative; boundary=f46d04016b39732ba104d487c4ca

--f46d04016b39732ba104d487c4ca
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 30, 2013 at 1:49 PM, Harvey Chapman <hchapman-oecore@3gfp.com>wrote:

> On Jan 30, 2013, at 3:34 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> On Wed, Jan 30, 2013 at 1:34 PM, Chris Larson <clarson@kergoth.com> wrote:
>
>>
>> It's worth bringing up the SRCREV_POLICY variable, which lets you control
>> how bitbake handles caching of srcrevs. By default, it figures it needs to
>> get the mapping every time (value == clear, or unset), which can make sense
>> in certain cases. But you can tell it to go ahead and use the values it has
>> cached from a previous run, as well (value == cache). This can be useful if
>> you know you're moving into an offline state and want to prepare for it
>> above and beyond the -c fetchall.
>
>
> Erm, s/SRCREV_POLICY/BB_SRCREV_POLICY/
>
>
> So, should BB_NO_NETWORK=1 automatically set BB_SRCREV_POLICY=cache
> because the former implies the latter?
>

The latter only works if you've already done a build in that tmpdir and
therefore got the cache prepopulated. So no, it should only be enabled
explicitly, indicating the user has at least considered the implications.
-- 
Christopher Larson

--f46d04016b39732ba104d487c4ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 30, 2013 at 1:49 PM, Harvey Chapman <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:hchapman-oecore@3gfp.com" target=3D"_blank">hchapman-oecore@3g=
fp.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><div>On Jan 30, 2013, at 3=
:34 PM, Chris Larson &lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_=
blank">clarson@kergoth.com</a>&gt; wrote:</div>

<br></div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><div class=3D"im">On Wed, Jan 30, 2013 at 1=
:34 PM, Chris Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergot=
h.com" target=3D"_blank">clarson@kergoth.com</a>&gt;</span> wrote:</div>

<div class=3D"im"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div><div><div class=3D"gmail_quote"><br=
></div>

</div></div>It&#39;s worth bringing up the SRCREV_POLICY variable, which le=
ts you control how bitbake handles caching of srcrevs. By default, it figur=
es it needs to get the mapping every time (value =3D=3D clear, or unset), w=
hich can make sense in certain cases. But you can tell it to go ahead and u=
se the values it has cached from a previous run, as well (value =3D=3D cach=
e). This can be useful if you know you&#39;re moving into an offline state =
and want to prepare for it above and beyond the -c fetchall.</blockquote>



</div></div><br>Erm, s/SRCREV_POLICY/BB_SRCREV_POLICY/<br></div></div></blo=
ckquote><div><br></div><div>So, should BB_NO_NETWORK=3D1 automatically set =
BB_SRCREV_POLICY=3Dcache because the former implies the latter?</div></bloc=
kquote>

</div><br>The latter only works if you&#39;ve already done a build in that =
tmpdir and therefore got the cache prepopulated. So no, it should only be e=
nabled explicitly, indicating the user has at least considered the implicat=
ions.<br>

-- <br>Christopher Larson</div></div>

--f46d04016b39732ba104d487c4ca--
