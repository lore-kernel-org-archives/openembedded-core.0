Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7D68971647
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 14:58:51 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gi9so8510605lab.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Oct 2014 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=rfXCP8VZ0thwXk1PGdC5ZmXgvG/PKWOH4mUOi1r0EHg=;
	b=grcDXza3G+TgXmC2yWuNP4ZzlvXYrEPE89VJqlnuw0yN/JozG8w80lJlMGcd0TsCH+
	jl8HK4aY4yhxyAFeHO54j0lYNeoUynmJZS6qFlj+RCBJYqc61u2awBg38LK3OUxM3X5T
	ymWgEDaduy5kFBfMrm7cizBpRuyfiTJLiSCA9AdNt/NEzgO7MpFm9b9NfDFeM2AyaQah
	vghLgv5HS6VBdlNjez9r6pa36F4XKareGzBR99HovugGH8Se4sFFSAilWE9bVlW6nEgb
	2f9Obr/AXsKUqCG0ZapOyeLCCh+U7JfkwxydeVT0OYzDVTw9uVqBgI7hwGn03fStRgz6
	hDkA==
X-Received: by 10.152.7.208 with SMTP id l16mr11874398laa.48.1412780332365;
	Wed, 08 Oct 2014 07:58:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.97.200 with HTTP; Wed, 8 Oct 2014 07:58:32 -0700 (PDT)
In-Reply-To: <1409221634.29296.134.camel@ted>
References: <1409221634.29296.134.camel@ted>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 8 Oct 2014 07:58:32 -0700
X-Google-Sender-Auth: Mq0IusJ_uvb7inEVA_FTC-WYYqo
Message-ID: <CABcZANnQcD806smudrSi0B9ZUMDRFHxNvvaweHj6xt7s5Cnm2A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] uninative: Add uninative - a way of reusing native/cross over multiple distros
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
X-List-Received-Date: Wed, 08 Oct 2014 14:59:00 -0000
Content-Type: multipart/alternative; boundary=001a11c329eadb3dfc0504ea8d43

--001a11c329eadb3dfc0504ea8d43
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 28, 2014 at 3:27 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> These patches illustrate a new idea, a way of allowing a single set of
> cross/native sstate to work over multiple distros, even old ones.
>
> The assumption is that our own C library is basically up to date. We build
> and share a small tarball (~2MB) of a prebuilt copy of this along with a
> patchelf binary (which sadly is C++ based so libstdc++ is in there). This
> tarball can be generated from our usual SDK generation process through
> the supplied recipe, uninative-tarball.
>
> At the start of the build, if its not been extracted into the sysroot, this
> tarball is extracted there and configured for the specified path.
>
> When we install binaries from a "uninative" sstate feed, we change the
> dynamic loader to point at this dynamic loader and C librbary. This works
> exactly the same way as our relocatable SDK does. The only real difference
> is a switch to use patchelf, so even if the interpreter section is too
> small,
> it can still adjust the binary.
>
> Right now the patch is a working proof of concept. If you build the tarball
> and place it at the head of the tree (in COREBASE), you can run a build
> from
> sstate and successfully build packages and construct images.
>
> There is some cleanup needed, its hardcoded for x86_64 right now, its
> trivial
> to add 32 bit support too. The tarball isn't fetched right now, there is
> just a
> harcoded path assumption and there is no error handling. I haven't figured
> out the best delivery mechanism for that yet. BuildStarted is probably not
> the right event to hook on either.
>
> I did want to send this out and illustrate how with a small change, we
> might
> make the native/cross sstate much more reusable and hence improve the
> accessibility
> of lower overhead builds. With this change, its possible the Yocto Project
> may
> be able to support a configured sstate mirror out the box. This also has
> positive implications for our developer workflow/SDK improvements.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

Hey Richard,

This looks extremely promising. I tried using it, however, and ran into all
manner of problems. The first one is relatively easy to resolve, and I have
a local patch which seems to do so (though I then run into different build
failures): binaries which are built and then run, before any relocation
patchelf bits are run (e.g. autoconf ./conftest), can fail miserably due to
the mismatch between the libc they linked against in the sysroot and the
host dynamic linker, unless you add
-Wl,--dynamic-linker=${UNINATIVE_LOADER} or so to BUILD_LDFLAGS.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c329eadb3dfc0504ea8d43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Aug 28, 2014 at 3:27 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":hz" class=3D"a3s" style=3D"overflow:hidden">These patch=
es illustrate a new idea, a way of allowing a single set of<br>
cross/native sstate to work over multiple distros, even old ones.<br>
<br>
The assumption is that our own C library is basically up to date. We build<=
br>
and share a small tarball (~2MB) of a prebuilt copy of this along with a<br=
>
patchelf binary (which sadly is C++ based so libstdc++ is in there). This<b=
r>
tarball can be generated from our usual SDK generation process through<br>
the supplied recipe, uninative-tarball.<br>
<br>
At the start of the build, if its not been extracted into the sysroot, this=
<br>
tarball is extracted there and configured for the specified path.<br>
<br>
When we install binaries from a &quot;uninative&quot; sstate feed, we chang=
e the<br>
dynamic loader to point at this dynamic loader and C librbary. This works<b=
r>
exactly the same way as our relocatable SDK does. The only real difference<=
br>
is a switch to use patchelf, so even if the interpreter section is too smal=
l,<br>
it can still adjust the binary.<br>
<br>
Right now the patch is a working proof of concept. If you build the tarball=
<br>
and place it at the head of the tree (in COREBASE), you can run a build fro=
m<br>
sstate and successfully build packages and construct images.<br>
<br>
There is some cleanup needed, its hardcoded for x86_64 right now, its trivi=
al<br>
to add 32 bit support too. The tarball isn&#39;t fetched right now, there i=
s just a<br>
harcoded path assumption and there is no error handling. I haven&#39;t figu=
red<br>
out the best delivery mechanism for that yet. BuildStarted is probably not<=
br>
the right event to hook on either.<br>
<br>
I did want to send this out and illustrate how with a small change, we migh=
t<br>
make the native/cross sstate much more reusable and hence improve the acces=
sibility<br>
of lower overhead builds. With this change, its possible the Yocto Project =
may<br>
be able to support a configured sstate mirror out the box. This also has<br=
>
positive implications for our developer workflow/SDK improvements.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;</div></blockquote><=
/div><br>Hey Richard,</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">This looks extremely promising. I tried using it, however,=
 and ran into all manner of problems. The first one is relatively easy to r=
esolve, and I have a local patch which seems to do so (though I then run in=
to different build failures): binaries which are built and then run, before=
 any relocation patchelf bits are run (e.g. autoconf ./conftest), can fail =
miserably due to the mismatch between the libc they linked against in the s=
ysroot and the host dynamic linker, unless you add -Wl,--dynamic-linker=3D$=
{UNINATIVE_LOADER} or so to BUILD_LDFLAGS.<br>-- <br>Christopher Larson<br>=
clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a11c329eadb3dfc0504ea8d43--
