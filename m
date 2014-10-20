Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 63B6360097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 20:42:58 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id v1so3971859yhn.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GcwBEVjpD7BlL55YMe8aayFnzyZC3Avsvw2kEmKxNYg=;
	b=CAxOyX8uIRSO0QpeOH3IIdDm01v3VsYXpDnZnPvryfO0IiuwJREN00VVCze/99FF7Y
	zj8p7nTvC5WjcFqne7sGUsNGWLGOIsOYWgoRfnB8B2LIEFAMBZBOvcn/gbJIP6m+1kv7
	mtppa6uUxrnqwWoNLWW0WTEKWUtD8SW0WBBFdSJ7JtvL0pMaoiZjBKXbcU5GwybDnsL/
	riyVGjTeIyaasuAq5z3HcGr0vsheIXbNtlJelc+aK9keQI6l/GCoZTTr8XZDjoBZ4hjj
	8MUpxSS4iWmYvosmwgjtkktS2xy8nmV6yozy6gV62TovHe2V4djMaq3WWgeQm1kGetHM
	O3Jg==
MIME-Version: 1.0
X-Received: by 10.221.29.134 with SMTP id ry6mr25582808vcb.26.1413837778579;
	Mon, 20 Oct 2014 13:42:58 -0700 (PDT)
Received: by 10.52.102.204 with HTTP; Mon, 20 Oct 2014 13:42:58 -0700 (PDT)
In-Reply-To: <1412697030-1033-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412697030-1033-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 20 Oct 2014 22:42:58 +0200
Message-ID: <CALbNGRSZV3a3TLNGhgte39mrPKUAD2ULEvt9heUUdUbLi6PF9g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross: build with python support
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
X-List-Received-Date: Mon, 20 Oct 2014 20:43:05 -0000
Content-Type: multipart/alternative; boundary=001a1133a0688ff9300505e0c274

--001a1133a0688ff9300505e0c274
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 7, 2014, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:
> variable contents are displayed properly when debugging qt applications
remotely
>
> see [1] for further details
>
> [1]
http://qt-project.org/doc/qtcreator-2.6/creator-debugging-helpers.html#debu=
gging-helpers-based-on-python
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross.inc | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc
b/meta/recipes-devtools/gdb/gdb-cross.inc
> index cb99b06..6e44778 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
> @@ -1,8 +1,17 @@
>  require gdb-common.inc
>
> -DEPENDS =3D "expat-native ncurses-native readline-native"
> +DEPENDS =3D "expat-native ncurses-native readline-native python-native"
>
> -EXTRA_OECONF +=3D "--without-python"
> +inherit pythonnative
> +
> +EXTRA_OECONF +=3D
"--with-python=3D${STAGING_BINDIR_NATIVE}/python-native/python"
> +
> +do_compile_prepend() {
> +    export BUILD_SYS=3D"${BUILD_SYS}"
> +    export HOST_SYS=3D"${HOST_SYS}"
> +    export STAGING_LIBDIR=3D"${STAGING_LIBDIR_NATIVE}"
> +    export STAGING_INCDIR=3D"${STAGING_INCDIR_NATIVE}"
> +}
>
>  #EXTRA_OEMAKE +=3D "LDFLAGS=3D'${BUILD_LDFLAGS}'"
>
> --
> 1.8.3.1
>
>
ping

--001a1133a0688ff9300505e0c274
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 7, 2014, Andreas M=C3=BCller &lt;<a href=3D"mailto:schn=
itzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt; wrote:<br>&g=
t; variable contents are displayed properly when debugging qt applications =
remotely<br>&gt;<br>&gt; see [1] for further details<br>&gt;<br>&gt; [1] <a=
 href=3D"http://qt-project.org/doc/qtcreator-2.6/creator-debugging-helpers.=
html#debugging-helpers-based-on-python">http://qt-project.org/doc/qtcreator=
-2.6/creator-debugging-helpers.html#debugging-helpers-based-on-python</a><b=
r>&gt;<br>&gt; Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:sch=
nitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>&gt; ---=
<br>&gt; =C2=A0meta/recipes-devtools/gdb/gdb-cross.inc | 13 +++++++++++--<b=
r>&gt; =C2=A01 file changed, 11 insertions(+), 2 deletions(-)<br>&gt;<br>&g=
t; diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devt=
ools/gdb/gdb-cross.inc<br>&gt; index cb99b06..6e44778 100644<br>&gt; --- a/=
meta/recipes-devtools/gdb/gdb-cross.inc<br>&gt; +++ b/meta/recipes-devtools=
/gdb/gdb-cross.inc<br>&gt; @@ -1,8 +1,17 @@<br>&gt; =C2=A0require gdb-commo=
n.inc<br>&gt;<br>&gt; -DEPENDS =3D &quot;expat-native ncurses-native readli=
ne-native&quot;<br>&gt; +DEPENDS =3D &quot;expat-native ncurses-native read=
line-native python-native&quot;<br>&gt;<br>&gt; -EXTRA_OECONF +=3D &quot;--=
without-python&quot;<br>&gt; +inherit pythonnative<br>&gt; +<br>&gt; +EXTRA=
_OECONF +=3D &quot;--with-python=3D${STAGING_BINDIR_NATIVE}/python-native/p=
ython&quot;<br>&gt; +<br>&gt; +do_compile_prepend() {<br>&gt; +=C2=A0 =C2=
=A0 export BUILD_SYS=3D&quot;${BUILD_SYS}&quot;<br>&gt; +=C2=A0 =C2=A0 expo=
rt HOST_SYS=3D&quot;${HOST_SYS}&quot;<br>&gt; +=C2=A0 =C2=A0 export STAGING=
_LIBDIR=3D&quot;${STAGING_LIBDIR_NATIVE}&quot;<br>&gt; +=C2=A0 =C2=A0 expor=
t STAGING_INCDIR=3D&quot;${STAGING_INCDIR_NATIVE}&quot;<br>&gt; +}<br>&gt;<=
br>&gt; =C2=A0#EXTRA_OEMAKE +=3D &quot;LDFLAGS=3D&#39;${BUILD_LDFLAGS}&#39;=
&quot;<br>&gt;<br>&gt; --<br>&gt; 1.8.3.1<br>&gt;<br>&gt;<br>ping

--001a1133a0688ff9300505e0c274--
