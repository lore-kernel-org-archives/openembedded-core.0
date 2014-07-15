Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id B634F60030;
	Tue, 15 Jul 2014 20:14:16 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id hn18so64778igb.4
	for <multiple recipients>; Tue, 15 Jul 2014 13:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cNUiJ+0QE87p6gX01zRiQGURiyT15wBRAL3TB5o/xzw=;
	b=OjWZbM3uODMhbdFI5UgWaxqtlXp+wuGqvxzsJd6OhARYw33ktqnJCRcMXXSNbGMT7L
	EI1cRtcBWOg5PKLKkM1Jcve0ElNyP6wtPQAelYdXl9K0bC+fF/vOoarQ65rci5EZCw8+
	1aQObP7UbyjoK9VAxrdPqk3ii+kB+IOkiGlw25NZUjvIP/czQCeoeqcSzn9MraJY0ZvH
	oq51kX+MLZWn682ngfU5Xaz0koht6oZxVYQx8FI5FEh/BmPdAX0lfs6ee7R1WKZGqEC1
	RRsHGTsjGFDvJwNNmETyKHUIZOwYe+XQg6dFPNfvVp2sH7ghbYOV28aD2lg3bULtf/x6
	oXtg==
MIME-Version: 1.0
X-Received: by 10.50.13.102 with SMTP id g6mr9859703igc.20.1405455257513; Tue,
	15 Jul 2014 13:14:17 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Tue, 15 Jul 2014 13:14:17 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Tue, 15 Jul 2014 13:14:17 -0700 (PDT)
In-Reply-To: <406153008dc78f4e3198c012f2db98fcac09b5c1.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
	<406153008dc78f4e3198c012f2db98fcac09b5c1.1405440532.git.ross.burton@intel.com>
Date: Tue, 15 Jul 2014 13:14:17 -0700
Message-ID: <CAMKF1sptj_ctzUmMSxm+6VW5LYG8xCm26b3_j4=8GMMS1HPr8w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 7/7] autoconf: remove automake patch enforcing --foreign
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
X-List-Received-Date: Tue, 15 Jul 2014 20:14:25 -0000
Content-Type: multipart/alternative; boundary=089e013c66d65f376104fe410d23

--089e013c66d65f376104fe410d23
Content-Type: text/plain; charset=UTF-8

On Jul 15, 2014 9:20 AM, "Ross Burton" <ross.burton@intel.com> wrote:
>
> Since 2004 we've been carrying a patch[1] make autoreconf pass --foreign
to
> automake.  Presumably at the time this was due to many upstreams using
> hand-coded bootstrap scripts that passed --foreign manually, but we were
using
> autoreconf.  These days many projects have added foreign to
AM_INIT_AUTOMAKE and
> use autoreconf directly, so this patch isn't as critical as it used to be.

can it be somehow made such that it can be passed via option flags so we
dont have to patch the packages not using above automake macro
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> [1] oe-classic 2ab2a92eadaf2f80410d8746099f8a9b1b81ff91
> ---
>  .../autoconf/autoconf/autoreconf-foreign.patch            |   13
-------------
>  meta/recipes-devtools/autoconf/autoconf_2.69.bb           |    1 -
>  2 files changed, 14 deletions(-)
>  delete mode 100644
meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
>
> diff --git
a/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
b/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
> deleted file mode 100644
> index 88f7501..0000000
> --- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Upstream-Status: Pending
> -
> ---- autoconf-2.59/bin/autoreconf.in~autoreconf-foreign 2004-05-09
20:55:06.000000000 -0400
> -+++ autoconf-2.59/bin/autoreconf.in    2004-05-09 20:55:55.000000000
-0400
> -@@ -184,6 +184,8 @@
> -
> -   $aclocal_supports_force = `$aclocal --help` =~ /--force/;
> -
> -+  $automake   .= ' --foreign';
> -+
> -   # Dispatch autoreconf's option to the tools.
> -   # --include;
> -   $autoconf   .= join (' --include=', '', @include);
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
> index 5c652d4..6614a7b 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>  SRC_URI += "file://autoreconf-include.patch \
>             file://check-automake-cross-warning.patch \
>             file://autoreconf-exclude.patch \
> -           file://autoreconf-foreign.patch \
>             file://autoreconf-gnuconfigize.patch \
>              file://config_site.patch \
>              file://remove-usr-local-lib-from-m4.patch \
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--089e013c66d65f376104fe410d23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 15, 2014 9:20 AM, &quot;Ross Burton&quot; &lt;<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Since 2004 we&#39;ve been carrying a patch[1] make autoreconf pass --f=
oreign to<br>
&gt; automake. =C2=A0Presumably at the time this was due to many upstreams =
using<br>
&gt; hand-coded bootstrap scripts that passed --foreign manually, but we we=
re using<br>
&gt; autoreconf. =C2=A0These days many projects have added foreign to AM_IN=
IT_AUTOMAKE and<br>
&gt; use autoreconf directly, so this patch isn&#39;t as critical as it use=
d to be.</p>
<p dir=3D"ltr"> can it be somehow made such that it can be passed via optio=
n flags so we dont have to patch the packages not using above automake macr=
o<br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
&gt;<br>
&gt; [1] oe-classic 2ab2a92eadaf2f80410d8746099f8a9b1b81ff91<br>
&gt; ---<br>
&gt; =C2=A0.../autoconf/autoconf/autoreconf-foreign.patch =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 13 -------------<br>
&gt; =C2=A0meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.69.b=
b">autoconf_2.69.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01=
 -<br>
&gt; =C2=A02 files changed, 14 deletions(-)<br>
&gt; =C2=A0delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autor=
econf-foreign.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreig=
n.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch<=
br>
&gt; deleted file mode 100644<br>
&gt; index 88f7501..0000000<br>
&gt; --- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch=
<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,13 +0,0 @@<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; ---- autoconf-2.59/bin/<a href=3D"http://autoreconf.in">autoreconf.in<=
/a>~autoreconf-foreign 2004-05-09 20:55:06.000000000 -0400<br>
&gt; -+++ autoconf-2.59/bin/<a href=3D"http://autoreconf.in">autoreconf.in<=
/a> =C2=A0 =C2=A02004-05-09 20:55:55.000000000 -0400<br>
&gt; -@@ -184,6 +184,8 @@<br>
&gt; -<br>
&gt; - =C2=A0 $aclocal_supports_force =3D `$aclocal --help` =3D~ /--force/;=
<br>
&gt; -<br>
&gt; -+ =C2=A0$automake =C2=A0 .=3D &#39; --foreign&#39;;<br>
&gt; -+<br>
&gt; - =C2=A0 # Dispatch autoreconf&#39;s option to the tools.<br>
&gt; - =C2=A0 # --include;<br>
&gt; - =C2=A0 $autoconf =C2=A0 .=3D join (&#39; --include=3D&#39;, &#39;&#3=
9;, @include);<br>
&gt; diff --git a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf=
_2.69.bb">autoconf_2.69.bb</a> b/meta/recipes-devtools/autoconf/<a href=3D"=
http://autoconf_2.69.bb">autoconf_2.69.bb</a><br>
&gt; index 5c652d4..6614a7b 100644<br>
&gt; --- a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.69.b=
b">autoconf_2.69.bb</a><br>
&gt; +++ b/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.69.b=
b">autoconf_2.69.bb</a><br>
&gt; @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D7514=
19260aa954499f7abaabaa882bbe \<br>
&gt; =C2=A0SRC_URI +=3D &quot;file://autoreconf-include.patch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check-automake-cross-=
warning.patch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autoreconf-exclude.pa=
tch \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autoreconf-foreign.patch \=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autoreconf-gnuconfigi=
ze.patch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://config_site.pat=
ch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://remove-usr-loca=
l-lib-from-m4.patch \<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-devel mailing list<br>
&gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembed=
ded-devel@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-devel">http://lists.openembedded.org/mailman/listinfo/openembedded-devel</=
a><br>
</p>

--089e013c66d65f376104fe410d23--
