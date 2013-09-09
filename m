Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 019B96110C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 18:20:07 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so5181858lab.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 11:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=8Sc9aMjzCfkSvVavFXHl/5QXn2Fxm5293cGnyhC+kLk=;
	b=idfq9VibyDrIOvHuBHo9pGTyNej8J5xsuhOy5tPDvT6GOk3LeCpmT14aLADrdmFt+A
	6JiK+Hc7w81zmc2kXnotU5mLisBV0sF0ccW6dIkTO8lU250KhA0XGM+G86vOSiIaHcF+
	bLrogTp2wisD1fSFXVvHEIDd6n56I1StS1jG3l5pZaLNCNoMxLM/gzimKUFbGaBDiYsj
	IvB74jyysNr2of2oLVs3QY/7A/6ghBeJo6gp1tZrYMKeOc6Qx2iOMseKH0FGwZ2N3fTh
	HrHln2eifLPU3uiTje4KwDsl4zQMNpQ0ZoFxiwnT/R3Lwa8+rqYJ1m0xslg3tkCUe0QN
	JYyA==
X-Received: by 10.152.120.5 with SMTP id ky5mr17589153lab.18.1378750808913;
	Mon, 09 Sep 2013 11:20:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Mon, 9 Sep 2013 11:19:48 -0700 (PDT)
In-Reply-To: <1378736079.3484.117.camel@ted>
References: <1378736079.3484.117.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 9 Sep 2013 11:19:48 -0700
X-Google-Sender-Auth: vh6ePyP_9VdMxXtFXgDsoH4sQvk
Message-ID: <CABcZAN=VoWArnF0-=RcYRK_6kAVaCdFLX9oMeLJvtb3Uw3AP9w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf: Stop providing ${P} and ${PF} by default
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
X-List-Received-Date: Mon, 09 Sep 2013 18:20:09 -0000
Content-Type: multipart/alternative; boundary=089e01227ca432fd5d04e5f770dc

--089e01227ca432fd5d04e5f770dc
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 9, 2013 at 7:14 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> For a long time we've provided PN-PV and PN-PV-PR by tweaking PROVIDES.
> This looks
> nice at first glance however it turns out to be a bit problematic. Taking
> make as an
> example where there are two versions, 3.81 and 3.82, what should "bitbake
> make-3.81" do?
>
> Currently it builds make-3.81 and make-3.82 and breaks in interesting
> ways. Is that
> a bitbake bug? Well, it certainly shouldn't try and run the build. Why is
> it building
> 3.82 though? Its due to finding a dependency on "make-dev" and then trying
> to figure
> out what provides it? The answer is "make" and the default version of
> "make" is 3.82.
>
> So arguably, finding "make-3.81" should infer PREFERRED_VERSION_make =
> "3.81". Doing
> so resolved the above problem since now "make" resolves to "make-3.81".
>
> So what about if we have Recipe A:
> DEPENDS = "make-3.81"
> and Recipe B:
> DEPENDS = "make-3.82"
>
> That is clearly an error, easy. So finally what about if we have Recipe A:
> DEPENDS = "make-3.81"
> and Recipe B:
> DEPENDS = "make"
>
> The first recipe infers the PREFERRED_VERSION_make = "3.81" and then
> forces that
> version on everything else. Is that desired? Probably not in most cases,
> at least not
> silently.
>
> As mitigation, we could print a WARNING about this happening. The final
> part of the problem
> is that we can ony figure this out within bitbake itself. That means we'd
> have to teach bitbake
> about the PN-PV format of PROVIDES which is breaking the separation
> between bitbake and the
> metadata. We can't win :(.
>
> Nobody that I know of is using or relying on this functionality so perhaps
> we should
> just remove it instead which is what this patch does. Opinions?
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

This sounds like a good plan to me. We never *really* supported version
specific build dependencies anyway, and using those provides just caused
problems. Better for it to go away entirely.
-- 
Christopher Larson

--089e01227ca432fd5d04e5f770dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Sep 9, 2013 at 7:14 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":fz" style=3D"overflow:hidden">Fo=
r a long time we&#39;ve provided PN-PV and PN-PV-PR by tweaking PROVIDES. T=
his looks<br>


nice at first glance however it turns out to be a bit problematic. Taking m=
ake as an<br>
example where there are two versions, 3.81 and 3.82, what should &quot;bitb=
ake make-3.81&quot; do?<br>
<br>
Currently it builds make-3.81 and make-3.82 and breaks in interesting ways.=
 Is that<br>
a bitbake bug? Well, it certainly shouldn&#39;t try and run the build. Why =
is it building<br>
3.82 though? Its due to finding a dependency on &quot;make-dev&quot; and th=
en trying to figure<br>
out what provides it? The answer is &quot;make&quot; and the default versio=
n of &quot;make&quot; is 3.82.<br>
<br>
So arguably, finding &quot;make-3.81&quot; should infer PREFERRED_VERSION_m=
ake =3D &quot;3.81&quot;. Doing<br>
so resolved the above problem since now &quot;make&quot; resolves to &quot;=
make-3.81&quot;.<br>
<br>
So what about if we have Recipe A:<br>
DEPENDS =3D &quot;make-3.81&quot;<br>
and Recipe B:<br>
DEPENDS =3D &quot;make-3.82&quot;<br>
<br>
That is clearly an error, easy. So finally what about if we have Recipe A:<=
br>
DEPENDS =3D &quot;make-3.81&quot;<br>
and Recipe B:<br>
DEPENDS =3D &quot;make&quot;<br>
<br>
The first recipe infers the PREFERRED_VERSION_make =3D &quot;3.81&quot; and=
 then forces that<br>
version on everything else. Is that desired? Probably not in most cases, at=
 least not<br>
silently.<br>
<br>
As mitigation, we could print a WARNING about this happening. The final par=
t of the problem<br>
is that we can ony figure this out within bitbake itself. That means we&#39=
;d have to teach bitbake<br>
about the PN-PV format of PROVIDES which is breaking the separation between=
 bitbake and the<br>
metadata. We can&#39;t win :(.<br>
<br>
Nobody that I know of is using or relying on this functionality so perhaps =
we should<br>
just remove it instead which is what this patch does. Opinions?<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;</div></blockquote><=
/div><br>This sounds like a good plan to me. We never *really* supported ve=
rsion specific build dependencies anyway, and using those provides just cau=
sed problems. Better for it to go away entirely.<br>

-- <br>Christopher Larson</div></div>

--089e01227ca432fd5d04e5f770dc--
