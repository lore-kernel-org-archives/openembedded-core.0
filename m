Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 37BA86F9F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 15:15:58 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ur14so6416168igb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L7a/6IVhoj0OkZBWsanNTUadH9OQL3xMzZ5OkfphcCE=;
	b=Gn5UrkywWerSrukEI1NYatTvxJmB9Kg4TvEw+5z9ACgbyk47iqhBXlvBzmZtwQe4PN
	s2Vuya7pq9HKJoFdsBB2nH13zfpIDrkpturbg7mge6EOJXVwZYBtJYDdPmOQcaQKYrj1
	knwODO/Or1ur4nbhtdJucjCGj6Xx0aXgvkwd4cKT5VEYd47dpSdD/EYgTpn5+vUZrU+b
	WV2IMdwgJGCZAxruhw2vstjJmYRNBwJmHkKkqv3TCNiqTStWUUPn11loZ07NrC0NXp46
	OSxNmnxNJokDaBQ+BZZqMzWNSKt//N8zT/qRLfYgEoRURnv3A1esKst+00eycAKRL1Nc
	jLWQ==
MIME-Version: 1.0
X-Received: by 10.42.203.202 with SMTP id fj10mr998380icb.51.1396451759617;
	Wed, 02 Apr 2014 08:15:59 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 2 Apr 2014 08:15:59 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 2 Apr 2014 08:15:59 -0700 (PDT)
In-Reply-To: <20140402091404.GA29076@mcrowe.com>
References: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
	<1396344719.14790.94.camel@ted> <20140401101153.GA6306@mcrowe.com>
	<CAMKF1soedDRPPiJTLnqi9SjGHhLwTrZ3cMx3EJV+TXSDqabOiQ@mail.gmail.com>
	<20140402091404.GA29076@mcrowe.com>
Date: Wed, 2 Apr 2014 08:15:59 -0700
Message-ID: <CAMKF1spr2cstv0avoUsE5iT=vFw0nv=jJ9=-C+rp17LUFEm3DA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake-native: Depend on ncurses-native too
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
X-List-Received-Date: Wed, 02 Apr 2014 15:16:03 -0000
Content-Type: multipart/alternative; boundary=20cf303bf56813fe3104f610c3be

--20cf303bf56813fe3104f610c3be
Content-Type: text/plain; charset=UTF-8

-Khem
On Apr 2, 2014 2:14 AM, "Mike Crowe" <mac@mcrowe.com> wrote:

> On Tuesday 01 April 2014 at 21:59:34 -0700, Khem Raj wrote:
> > On Tue, Apr 1, 2014 at 3:11 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > > It seems to be possible to disable building the "CursesDialog"
> component to
> > > remove the need for ncurses but I couldn't immediately see how to do
> that
> > > for a bootstrap build.
> > >
> > > The non-native cmake recipe depends on ncurses even though it passes
> > > -DBUILD_CursesDialog=0.
> >
> > you need to disable it completely in CMakefile.txt, just that define
> > does not suffice you might try something like
> >
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-util/cmake/files/cmake-2.8.10-libform.patch?diff_format=f&view=markup
>
> As far as I can tell (by poisoning curses.h in the sysroot) the non-native
> cmake build does successfully avoid using curses by specifying
> -DBUILD_CursesDialog=0. I have successfully tested removing the
> ncurses dependency from the recipe too.
>
> The cmake-native bootstrap procedure means that it is not possible to get
> that parameter through to the ultimate cmake native build. So I came up
> with this patch:
>
> --- cmake-2.8.12.2/bootstrap~   2014-01-16 17:15:09.000000000 +0000
> +++ cmake-2.8.12.2/bootstrap    2014-04-01 21:27:23.841996822 +0100
> @@ -1578,6 +1578,7 @@ export MAKE
>
>  # Run bootstrap CMake to configure real CMake
>  cmake_options="-DCMAKE_BOOTSTRAP=1"
> +cmake_options="${cmake_options} -DBUILD_CursesDialog=0"
>  if [ -n "${cmake_verbose}" ]; then
>    cmake_options="${cmake_options} -DCMAKE_VERBOSE_MAKEFILE=1"
>  fi
>
> If I apply this for cmake-native then it also doesn't require curses
> (tested with the same poisoning.)
>
> The Gentoo patch may be somewhat safer in the long term because it does a
> better job of ensuring that the curses dependency can't come back with
> newer cmake versions; it is more likely that the patch would not apply or
> the link would fail.
>
> Do you prefer the one line patch above or the Gentoo one?
>
> Thanks.
>
> Mike.
>

--20cf303bf56813fe3104f610c3be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">-Khem</p>
<div class=3D"gmail_quote">On Apr 2, 2014 2:14 AM, &quot;Mike Crowe&quot; &=
lt;<a href=3D"mailto:mac@mcrowe.com">mac@mcrowe.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
On Tuesday 01 April 2014 at 21:59:34 -0700, Khem Raj wrote:<br>
&gt; On Tue, Apr 1, 2014 at 3:11 AM, Mike Crowe &lt;<a href=3D"mailto:mac@m=
crowe.com">mac@mcrowe.com</a>&gt; wrote:<br>
&gt; &gt; It seems to be possible to disable building the &quot;CursesDialo=
g&quot; component to<br>
&gt; &gt; remove the need for ncurses but I couldn&#39;t immediately see ho=
w to do that<br>
&gt; &gt; for a bootstrap build.<br>
&gt; &gt;<br>
&gt; &gt; The non-native cmake recipe depends on ncurses even though it pas=
ses<br>
&gt; &gt; -DBUILD_CursesDialog=3D0.<br>
&gt;<br>
&gt; you need to disable it completely in CMakefile.txt, just that define<b=
r>
&gt; does not suffice you might try something like<br>
&gt; <a href=3D"http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev=
-util/cmake/files/cmake-2.8.10-libform.patch?diff_format=3Df&amp;view=3Dmar=
kup" target=3D"_blank">http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-=
x86/dev-util/cmake/files/cmake-2.8.10-libform.patch?diff_format=3Df&amp;vie=
w=3Dmarkup</a><br>

<br>
As far as I can tell (by poisoning curses.h in the sysroot) the non-native<=
br>
cmake build does successfully avoid using curses by specifying<br>
-DBUILD_CursesDialog=3D0. I have successfully tested removing the<br>
ncurses dependency from the recipe too.<br>
<br>
The cmake-native bootstrap procedure means that it is not possible to get<b=
r>
that parameter through to the ultimate cmake native build. So I came up<br>
with this patch:<br>
<br>
--- cmake-2.8.12.2/bootstrap~ =C2=A0 2014-01-16 17:15:09.000000000 +0000<br=
>
+++ cmake-2.8.12.2/bootstrap =C2=A0 =C2=A02014-04-01 21:27:23.841996822 +01=
00<br>
@@ -1578,6 +1578,7 @@ export MAKE<br>
<br>
=C2=A0# Run bootstrap CMake to configure real CMake<br>
=C2=A0cmake_options=3D&quot;-DCMAKE_BOOTSTRAP=3D1&quot;<br>
+cmake_options=3D&quot;${cmake_options} -DBUILD_CursesDialog=3D0&quot;<br>
=C2=A0if [ -n &quot;${cmake_verbose}&quot; ]; then<br>
=C2=A0 =C2=A0cmake_options=3D&quot;${cmake_options} -DCMAKE_VERBOSE_MAKEFIL=
E=3D1&quot;<br>
=C2=A0fi<br>
<br>
If I apply this for cmake-native then it also doesn&#39;t require curses<br=
>
(tested with the same poisoning.)<br>
<br>
The Gentoo patch may be somewhat safer in the long term because it does a<b=
r>
better job of ensuring that the curses dependency can&#39;t come back with<=
br>
newer cmake versions; it is more likely that the patch would not apply or<b=
r>
the link would fail.<br>
<br>
Do you prefer the one line patch above or the Gentoo one?<br>
<br>
Thanks.<br>
<br>
Mike.<br>
</blockquote></div>

--20cf303bf56813fe3104f610c3be--
