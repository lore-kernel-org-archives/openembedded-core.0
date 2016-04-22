Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 999B0608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 00:27:25 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id f89so82051626ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 17:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=TG5VIVJap/eSY30t5usg/V1Js92RSq9hvGJ6zvRPZQo=;
	b=1gP7zBTsnTuy2lJg3FqOiWdYTzieFQ7mYeSiVedi8GtL5opl81Tbbe5vd82sSSIas6
	IGpX0uvesGtbppTzrFfbVjfhS+RNHQA1kq8rQ8298/i5pwpQbumekpr16X1d/BA/7wVx
	mzyJ13eO65auV17VwHZoBzDgkezIF5794yzt8pAETJ5odaKPyhZT59C+GUU/30zI7LR0
	wUgf8UuKyqdnjqrWs6gVRwEmjC7Pw0ngev+YDI8W/2j7OyF84XwwnBtE2Srt8DwnRCqW
	ILP4QfNGrT1TUd0oktayE9jeM9wPoda3jvuMqQXtbw3LikCZN++67S1ooDWpZi1b3zZ6
	TDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=TG5VIVJap/eSY30t5usg/V1Js92RSq9hvGJ6zvRPZQo=;
	b=UgJXK1xJp056cdoUEgomHt8WUFTfQE6T8RWcc93J2k5S8BOagEPdGY91srAsAs1vWs
	aRyX3qbH2dB9kaMJF93QUc2HlVZ5PXHERES7y6pKc2FHJt5FdyQLungy287UMVrPhInX
	JiQExrDW8vHFDfVpo7gVE83KJXr8xXhdLAosPxKlp4OT+rkUXRtOHA4o2EzEUO+221/V
	IBu8RNwmnUe2ZiDf6xWHF+5CWTLPDrOXpSOkvtoKVsSsBd6vG6U2LIuIsGtwQ10UHChW
	MRSrCJFTA6Y684M8RfPx+FgTHSNuJEXBCGzrlD54MZibafgLMhnT0u/CeIY/Pg7E44Fm
	Dl2w==
X-Gm-Message-State: AOPr4FXUqctrccrIxp78yqso53vKN2Qou4f3oTHN9z6QYIgeVZS3uBsT9EHC2sdmMqiidk9qS3VJgUvec0Q0Tg==
X-Received: by 10.107.15.159 with SMTP id 31mr19660045iop.3.1461284845989;
	Thu, 21 Apr 2016 17:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20160422000519.GR16135@denix.org>
In-Reply-To: <20160422000519.GR16135@denix.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 22 Apr 2016 00:27:16 +0000
Message-ID: <CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: mesa, libgbm and weston
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
X-List-Received-Date: Fri, 22 Apr 2016 00:27:25 -0000
Content-Type: multipart/alternative; boundary=001a113ee868293479053107e407

--001a113ee868293479053107e407
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 21, 2016 at 5:06 PM Denys Dmytriyenko <denis@denix.org> wrote:

> All,
>
> I've been meaning to ask this for quite some time. It appears that Weston's
> DRM compositor enabled with "kms" PACKAGECONFIG doesn't really need the
> entire
> mesa, but it only needs libgbm. Now, mesa in OE-Core provides libgbm as
> one of
> its packages, hence virtual/mesa is added in DEPENDS for kms:
>
> PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm
> udev virtual/mesa mtdev"
>
> On TI platforms with SGX GPU we have GLES/EGL stack (provided by
> proprietary
> blobs, yeah) and a separate libgbm, based on Rob Clark's
> https://github.com/robclark/libgbm
> Since that is enough to run Weston on our platforms, I've been carrying
> this
> bbappend for long time:
>
> PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm
> udev libgbm mtdev"
>
> It's been working fine for long time, but people keep on asking questions
> and
> require cleaner solution, since bbappend in a separate layer is somewhat
> confusing. Now, the question is what is a proper solution here:
>
> 1. Change weston recipe in oe-core to depend on libgbm instead of
> virtual/mesa
> assuming that it is provided by mesa recipe and it works for other
> platforms.
>

I'd say this, either libgbm or virtual/libgbm.

2. Change our libgbm recipe to declare that it PROVIDES virtual/mesa,
> although
> it looks like a hack and is somewhat reverse...
>

I think the libgbm recipe would basically be lying if you do that, that
doesn't sound ideal.

--001a113ee868293479053107e407
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Apr 21, 2016 at 5:06 PM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@den=
ix.org">denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">All,<br>
<br>
I&#39;ve been meaning to ask this for quite some time. It appears that West=
on&#39;s<br>
DRM compositor enabled with &quot;kms&quot; PACKAGECONFIG doesn&#39;t reall=
y need the entire<br>
mesa, but it only needs libgbm. Now, mesa in OE-Core provides libgbm as one=
 of<br>
its packages, hence virtual/mesa is added in DEPENDS for kms:<br>
<br>
PACKAGECONFIG[kms] =3D &quot;--enable-drm-compositor,--disable-drm-composit=
or,drm udev virtual/mesa mtdev&quot;<br>
<br>
On TI platforms with SGX GPU we have GLES/EGL stack (provided by proprietar=
y<br>
blobs, yeah) and a separate libgbm, based on Rob Clark&#39;s <a href=3D"htt=
ps://github.com/robclark/libgbm" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/robclark/libgbm</a><br>
Since that is enough to run Weston on our platforms, I&#39;ve been carrying=
 this<br>
bbappend for long time:<br>
<br>
PACKAGECONFIG[kms] =3D &quot;--enable-drm-compositor,--disable-drm-composit=
or,drm udev libgbm mtdev&quot;<br>
<br>
It&#39;s been working fine for long time, but people keep on asking questio=
ns and<br>
require cleaner solution, since bbappend in a separate layer is somewhat<br=
>
confusing. Now, the question is what is a proper solution here:<br>
<br>
1. Change weston recipe in oe-core to depend on libgbm instead of virtual/m=
esa<br>
assuming that it is provided by mesa recipe and it works for other platform=
s.<br></blockquote><div><br></div><div>I&#39;d say this, either libgbm or v=
irtual/libgbm.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
2. Change our libgbm recipe to declare that it PROVIDES virtual/mesa, altho=
ugh<br>
it looks like a hack and is somewhat reverse...<br></blockquote><div><br></=
div><div>I think the libgbm recipe would basically be lying if you do that,=
 that doesn&#39;t sound ideal.=C2=A0</div></div></div>

--001a113ee868293479053107e407--
