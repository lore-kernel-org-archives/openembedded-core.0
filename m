Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id BA25161EB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 18:15:22 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so7553789obc.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ZJMVxOCifr3xLvDyJ4e5mZzjeQi3tYsSrv/FbBhMmRs=;
	b=Lub/j6U0RETu+7zejO/wHfxsKwRfioEnEQVAZDOtDG/xT68dUBDJ41M8fwLYUvySlX
	98UqA4/ecEGFAeKaNr7zEFgKOwSlQHVegoeIP4ODqIkbA2tmw0bT1hJx8JOFN6fljrBj
	2hGyl1YsLB2DpO4uScjnOyjbdExWlkNLbadgQsRkUOn3EEJu02aq0jQapd8oJwWTYkGe
	/cUB5HSnhMzGZ7IQMnJfDl2s9rQxoZRrx5NCAKoXUyMobRsTKoJia8QyrTdZkNjDTVDj
	jVN06QXLH/frjFYeWWUtxE4izz2U+bTxPLwsqfueJC/ayhgNP/Y4wY+LEbKTEWpKUu63
	m+OA==
X-Received: by 10.182.61.73 with SMTP id n9mr2080148obr.86.1371752123492; Thu,
	20 Jun 2013 11:15:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Thu, 20 Jun 2013 11:15:03 -0700 (PDT)
In-Reply-To: <CAP71WjyCZvkwDuCM0DGJRBaeCySZkeiuhB6GxKGRBfemjHgQRA@mail.gmail.com>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
	<CAP71WjzvRgqYtJdBVt_epRVZ5bb4aVbPiEq8z4fw-EfEsnVgGg@mail.gmail.com>
	<1402287.LPEgl0HhT9@helios>
	<CAP71WjyCZvkwDuCM0DGJRBaeCySZkeiuhB6GxKGRBfemjHgQRA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jun 2013 14:15:03 -0400
Message-ID: <CAP71Wjx-uL3CjmxtJwEhZJyDD5p5HWwEEKSEh-0h5aCmCxeGxA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQka1bjuy4x4wNi9xFLGmYtel+NEz9NE5CImsUZGiocmExbfe4GWfeXja6Ipjc5JWrs747OY
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Thu, 20 Jun 2013 18:15:22 -0000
Content-Type: multipart/alternative; boundary=e89a8f923fb60a7d8204df99eead

--e89a8f923fb60a7d8204df99eead
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 11:46 AM, Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> On Thu, Jun 20, 2013 at 11:42 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> I wasn't watching closely but my impression is there were a large number
>> of
>> changes associated with the mesa upgrade. Is the upgrade itself necessary
>> for
>> the fix?
>>
>
> no, i don't think so. I think we might be able to just update the patches
> that deal with the X11/no X11 support. but i haven't tested that yet. i
> just did a quick test by cherry picking the complete commit (e.g. mesa
> upgrade) to verify that it's actually fixing my problem. now that i know it
> does, i will try to just upgrade the patches without the mesa upgrade and
> report how it goes.


ok, i was able to backport the mesa patch from 9.1.3 to 9.0.2
(EGL-Mutate-NativeDisplayType-depending-on-config.patch) , the backport was
more or less trivial. and then i did this in dylan branch:

--- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
+++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
@@ -2,7 +2,7 @@ SRC_URI = "
ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0002-cross-compile.patch \
            file://cross-glsl.patch \
            file://dont-fail-if-libX11-isnt-installed.patch \
-           file://fix-egl-compilation-without-x11-headers.patch \
+           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            "

and it does fix the build issue i had (mesa/qt5/non X11 distro).

should that be merged into dylan (since it's merged in master already) or
do we need to wait for the 'final' patch in upstream to be ready?

thanks

--e89a8f923fb60a7d8204df99eead
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 20, 2013 at 11:46 AM, Nicolas Dechesne <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dech=
esne@linaro.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im"><div class=3D"gmail_quote">On Thu, Jun 2=
0, 2013 at 11:42 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:=
paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.=
com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"overflow:hidden">I wasn&#39;t watching close=
ly but my impression is there were a large number of<br>



changes associated with the mesa upgrade. Is the upgrade itself necessary f=
or<br>
the fix?</div></blockquote></div><br></div>no, i don&#39;t think so. I thin=
k we might be able to just update the patches that deal with the X11/no X11=
 support. but i haven&#39;t tested that yet. i just did a quick test by che=
rry picking the complete commit (e.g. mesa upgrade) to verify that it&#39;s=
 actually fixing my problem. now that i know it does, i will try to just up=
grade the patches without the mesa upgrade and report how it goes.</blockqu=
ote>

</div><br>ok, i was able to backport the mesa patch from 9.1.3 to 9.0.2 (EG=
L-Mutate-NativeDisplayType-depending-on-config.patch) , the backport was mo=
re or less trivial. and then i did this in dylan branch:</div><div class=3D=
"gmail_extra">

<br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">--- a/meta/=
recipes-graphics/mesa/mesa-9.0.2.inc</div><div class=3D"gmail_extra">+++ b/=
meta/recipes-graphics/mesa/mesa-9.0.2.inc</div><div class=3D"gmail_extra">@=
@ -2,7 +2,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pub/m=
esa/${PV}/MesaLib-${PV}.tar.bz2">ftp://ftp.freedesktop.org/pub/mesa/${PV}/M=
esaLib-${PV}.tar.bz2</a> \</div>

<div class=3D"gmail_extra">=A0 =A0 =A0 =A0 =A0 =A0 file://0002-cross-compil=
e.patch \</div><div class=3D"gmail_extra">=A0 =A0 =A0 =A0 =A0 =A0 file://cr=
oss-glsl.patch \</div><div class=3D"gmail_extra">=A0 =A0 =A0 =A0 =A0 =A0 fi=
le://dont-fail-if-libX11-isnt-installed.patch \</div>

<div class=3D"gmail_extra">- =A0 =A0 =A0 =A0 =A0 file://fix-egl-compilation=
-without-x11-headers.patch \</div><div class=3D"gmail_extra">+ =A0 =A0 =A0 =
=A0 =A0 file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \</di=
v><div class=3D"gmail_extra">

=A0 =A0 =A0 =A0 =A0 =A0 &quot;</div><div><br></div><div style>and it does f=
ix the build issue i had (mesa/qt5/non X11 distro).=A0</div><div style><br>=
</div><div style>should that be merged into dylan (since it&#39;s merged in=
 master already) or do we need to wait for the &#39;final&#39; patch in ups=
tream to be ready?</div>

<div style><br></div><div style>thanks</div><div style><br></div></div><div=
 class=3D"gmail_extra"><br></div></div>

--e89a8f923fb60a7d8204df99eead--
