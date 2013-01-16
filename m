Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TvUpS-00053t-6Y
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:23:13 +0100
Received: by mail-ob0-f178.google.com with SMTP id eh20so1434224obb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 07:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dNelb9b6nDEkh466BZedZLDXz6tBrHYnxlME3FupOBU=;
	b=EHodS/b9PnoMxfG/csdP4f7+XFzFoD/FrMy2yrXjkFbA95Afuhf9wieff8Q7Bt4NRl
	L70iAfPN8fEbL7yu+5NYFQG32+NS/4zBWabplNhUWqF+8Yt+u9mhU415ejmwpxB8u8t4
	wgCgVL5QBSKyd+h9BxDFoYXQ/XPtK+St0Z93A2BvMJFBEZCLsshx8BFRvm38SE3JG/t+
	GpPJJTO75M6qnu94BxMU2zenvGBOshfhIYUQFMSpbYXw2q+fTJAVeBSQNMGPZhxiUouJ
	EKvsGBlGafV42R4ECEl2mdWB6KeGfsaZGMiQBRFL6PxCX5m7TmR51kNuCiEuDd3ow7E3
	1q2g==
MIME-Version: 1.0
X-Received: by 10.182.52.105 with SMTP id s9mr1095176obo.25.1358348859847;
	Wed, 16 Jan 2013 07:07:39 -0800 (PST)
Received: by 10.182.95.203 with HTTP; Wed, 16 Jan 2013 07:07:39 -0800 (PST)
In-Reply-To: <20130116150205.GE3002@jama>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
	<20130116150205.GE3002@jama>
Date: Wed, 16 Jan 2013 16:07:39 +0100
Message-ID: <CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Wed, 16 Jan 2013 15:23:13 -0000
Content-Type: multipart/alternative; boundary=14dae939942945b63e04d3693d21

--14dae939942945b63e04d3693d21
Content-Type: text/plain; charset=ISO-8859-1

2013/1/16 Martin Jansa <martin.jansa@gmail.com>

> On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDORELLI wrote:
> > Fix routine to check as and ld version check in the configure, to allow
> system
> > to correctly check for version 2.1x.
>
> Does it build with gold now?
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020310.html
>
> >
> > Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> > ---
> >  .../eglibc-2.16_fix_as_ld_ver_check.patch          |   23
> ++++++++++++++++++++
> >  meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
> >  2 files changed, 25 insertions(+), 1 deletions(-)
> >  create mode 100644
> meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch
> >
> > diff --git
> a/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch
> b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch
> > new file mode 100644
> > index 0000000..a8a2344
> > --- /dev/null
> > +++
> b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch
> > @@ -0,0 +1,23 @@
> > +Fix as and ld checking steps to allow system to correctly check 2.1x
> versions.
> > +
> > +Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> > +--- libc.orig/configure      2013-01-16 12:07:18.146902148 +0100
> > ++++ libc/configure   2013-01-16 12:08:10.598911559 +0100
> > +@@ -4757,7 +4757,7 @@ $as_echo_n "checking version of $AS... "
> > +   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.*
> \([0-9]*\.[0-9.]*\).*$/\1/p'`
> > +   case $ac_prog_version in
> > +     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
> > +-    2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
> > ++    2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
> > +        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
> > +     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
> > +
> > +@@ -4820,7 +4820,7 @@ $as_echo_n "checking version of $LD... "
> > +   ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.*
> \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
> > +   case $ac_prog_version in
> > +     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
> > +-    2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
> > ++    2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
> > +        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
> > +     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
> > +
> > diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bbb/meta/recipes-core/eglibc/
> eglibc_2.16.bb
> > index 2dcaceb..fbc1499 100644
> > --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> > +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> > @@ -33,6 +33,7 @@ SRC_URI = "
> http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21
> >             file://tzselect-sh.patch \
> >             file://tzselect-awk.patch \
> >
> file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
> > +        file://eglibc-2.16_fix_as_ld_ver_check.patch \
>
> wrong indentation
>
> >            "
> >
> >  SRC_URI[tarball.md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
> > @@ -69,7 +70,7 @@ TARGET_CPPFLAGS =
> "-I${STAGING_DIR_TARGET}${includedir}"
> >
> >  GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET
> gez_ER bn_BD te_IN es_CR.ISO-8859-1"
> >
> > -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}',
> '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> > +#FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}',
> '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>
> this does not belong here
>

Sorry, my fault! I'll fix and resend!!! :)

>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--14dae939942945b63e04d3693d21
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2013/1/16 Martin Jansa <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jan=
sa@gmail.com</a>&gt;</span><br><blockquote style=3D"margin:0px 0px 0px 0.8e=
x;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px=
;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"im">On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDOR=
ELLI wrote:<br>
&gt; Fix routine to check as and ld version check in the configure, to allo=
w system<br>
&gt; to correctly check for version 2.1x.<br>
<br>
</div>Does it build with gold now?<br>
<a href=3D"http://lists.linuxtogo.org/pipermail/openembedded-core/2012-Marc=
h/020310.html" target=3D"_blank">http://lists.linuxtogo.org/pipermail/opene=
mbedded-core/2012-March/020310.html</a><br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Giuseppe Condorelli &lt;<a href=3D"mailto:giuseppe.cond=
orelli@st.com">giuseppe.condorelli@st.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../eglibc-2.16_fix_as_ld_ver_check.patch =A0 =A0 =A0 =A0 =A0| =A0 =
23 ++++++++++++++++++++<br>
&gt; =A0meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.16.bb" target=
=3D"_blank">eglibc_2.16.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A03 +-<br>
&gt; =A02 files changed, 25 insertions(+), 1 deletions(-)<br>
&gt; =A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16=
_fix_as_ld_ver_check.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_l=
d_ver_check.patch b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as=
_ld_ver_check.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a8a2344<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_c=
heck.patch<br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +Fix as and ld checking steps to allow system to correctly check 2.1x =
versions.<br>
&gt; +<br>
&gt; +Signed-off-by: Giuseppe Condorelli &lt;<a href=3D"mailto:giuseppe.con=
dorelli@st.com">giuseppe.condorelli@st.com</a>&gt;<br>
&gt; +--- libc.orig/configure =A0 =A0 =A02013-01-16 12:07:<a href=3D"tel:18=
.146902148" value=3D"+18146902148">18.146902148</a> +0100<br>
&gt; ++++ libc/configure =A0 2013-01-16 12:08:10.598911559 +0100<br>
&gt; +@@ -4757,7 +4757,7 @@ $as_echo_n &quot;checking version of $AS... &qu=
ot;<br>
&gt; + =A0 ac_prog_version=3D`$AS --version 2&gt;&amp;1 | sed -n &#39;s/^.*=
GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p&#39;`<br>
&gt; + =A0 case $ac_prog_version in<br>
&gt; + =A0 =A0 &#39;&#39;) ac_prog_version=3D&quot;v. ?.??, bad&quot;; ac_v=
erc_fail=3Dyes;;<br>
&gt; +- =A0 =A02.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)<br>
&gt; ++ =A0 =A02.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)<br>
&gt; + =A0 =A0 =A0 =A0ac_prog_version=3D&quot;$ac_prog_version, ok&quot;; a=
c_verc_fail=3Dno;;<br>
&gt; + =A0 =A0 *) ac_prog_version=3D&quot;$ac_prog_version, bad&quot;; ac_v=
erc_fail=3Dyes;;<br>
&gt; +<br>
&gt; +@@ -4820,7 +4820,7 @@ $as_echo_n &quot;checking version of $LD... &qu=
ot;<br>
&gt; + =A0 ac_prog_version=3D`$LD --version 2&gt;&amp;1 | sed -n &#39;s/^.*=
GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p&#39;`<br>
&gt; + =A0 case $ac_prog_version in<br>
&gt; + =A0 =A0 &#39;&#39;) ac_prog_version=3D&quot;v. ?.??, bad&quot;; ac_v=
erc_fail=3Dyes;;<br>
&gt; +- =A0 =A02.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)<br>
&gt; ++ =A0 =A02.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)<br>
&gt; + =A0 =A0 =A0 =A0ac_prog_version=3D&quot;$ac_prog_version, ok&quot;; a=
c_verc_fail=3Dno;;<br>
&gt; + =A0 =A0 *) ac_prog_version=3D&quot;$ac_prog_version, bad&quot;; ac_v=
erc_fail=3Dyes;;<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.16.bb=
" target=3D"_blank">eglibc_2.16.bb</a> b/meta/recipes-core/eglibc/<a href=
=3D"http://eglibc_2.16.bb" target=3D"_blank">eglibc_2.16.bb</a><br>
&gt; index 2dcaceb..fbc1499 100644<br>
&gt; --- a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.16.bb" targe=
t=3D"_blank">eglibc_2.16.bb</a><br>
&gt; +++ b/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.16.bb" targe=
t=3D"_blank">eglibc_2.16.bb</a><br>
&gt; @@ -33,6 +33,7 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctop=
roject.org/releases/eglibc/eglibc-${PV}-svnr21" target=3D"_blank">http://do=
wnloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21</a><br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 file://tzselect-sh.patch \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 file://tzselect-awk.patch \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 file://0001-eglibc-run-libm-err-tab.pl-with-sp=
ecific-dirs-in-S.patch \<br>
&gt; + =A0 =A0 =A0 =A0file://eglibc-2.16_fix_as_ld_ver_check.patch \<br>
<br>
</div></div>wrong indentation<br>
<div class=3D"im"><br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0&quot;<br>
&gt;<br>
&gt; =A0SRC_URI[tarball.md5sum] =3D &quot;88894fa6e10e58e85fbd8134b8e486a8&=
quot;<br>
&gt; @@ -69,7 +70,7 @@ TARGET_CPPFLAGS =3D &quot;-I${STAGING_DIR_TARGET}${i=
ncludedir}&quot;<br>
&gt;<br>
&gt; =A0GLIBC_BROKEN_LOCALES =3D &quot; _ER _ET so_ET yn_ER sid_ET tr_TR mn=
_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1&quot;<br>
&gt;<br>
&gt; -FILESPATH =3D &quot;${@base_set_filespath([ &#39;${FILE_DIRNAME}/egli=
bc-${PV}&#39;, &#39;${FILE_DIRNAME}/eglibc&#39;, &#39;${FILE_DIRNAME}/files=
&#39;, &#39;${FILE_DIRNAME}&#39; ], d)}&quot;<br>
&gt; +#FILESPATH =3D &quot;${@base_set_filespath([ &#39;${FILE_DIRNAME}/egl=
ibc-${PV}&#39;, &#39;${FILE_DIRNAME}/eglibc&#39;, &#39;${FILE_DIRNAME}/file=
s&#39;, &#39;${FILE_DIRNAME}&#39; ], d)}&quot;<br>
<br>
</div>this does not belong here<br></blockquote><div>=A0</div><div>Sorry, m=
y fault! I&#39;ll=A0fix and resend!!! :)=A0</div><blockquote style=3D"margi=
n:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);bor=
der-left-width:1px;border-left-style:solid" class=3D"gmail_quote">

<br>
Cheers,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--14dae939942945b63e04d3693d21--
