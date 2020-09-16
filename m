Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.348.1600269558929704672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 08:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uNNrOPbH;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id i26so10858702ejb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v7TXcNtBL4UaH4bBQ7eudfIYZRXWCMcAqzrNqCARnDQ=;
        b=uNNrOPbHhBlpitFrlOeZ34KLYqADi++7Uv4FaGEXhYvYDUlems152ymX9V7n39quI7
         T49fTzlqTGiHXnh4gTQvlarrU2xC8Jmd3Rxh7slEW26gBll6BJGlfsvOuP+j1mRicqT8
         9jxJw5lMBq+YMyJ4qC9RoPC3mEAXmkhh0byZEbSeNPjEmODKMipTwTgbGHWXh1hR1LSL
         Nf60VNShR529Jeexmv/i+L5LU6sBkd6qplNOkUr73n3YIzBO45kVyyqBo/R0dkuTUhsA
         IZHvLK/+s4958omNsn3mSR5pcu4fpKR4/GIgXcEGct3Ld9ELG0JsXulDlUkO5VOghBql
         vEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v7TXcNtBL4UaH4bBQ7eudfIYZRXWCMcAqzrNqCARnDQ=;
        b=CsnfnFJENlztkVyvB0WwOSl4IglbxpITjKRo4ay3FhkKsPnPkgZ/dpA9zx5xKak0DQ
         SA5Syb33oIqzU+0D1efqIzUWvZX7PM5lxXg5yi8YyDC1IMj66kwjkcMgs7FZHWsj85zq
         uIHtTKpLgOUW5UvifWIuAEV32L5/OOYLNrUeS7F2lgaWTWOHMGw5nY4fr4zZR7r3VPWi
         qUVxI+DJFOPv4840Nao43In+UFn90hREGC+34f9pbKz0/ylAXDKyj7HGFnDknTHs2XgT
         nojU/oh8rIqJWriYThICx/qSKVYlgTsvUAH3yhm1hvOEEHGqHuUPJeIVEukjlD6OeODI
         Vkvg==
X-Gm-Message-State: AOAM530XXSLJijV3ChK4LZTgxXX1dTrlDZfPav9oQPDlqXShRfBFOgqQ
	/6GmfOlPQhSadbtx/AVCI9bfku3UDDWNrUKDjMM=
X-Google-Smtp-Source: ABdhPJzlo9Jzt17vtYt9YLdTfNsjBZRYtDB3163r6S0GBIFA0YK+ZaSiHNkqyuKqGfsKJDpsVNDTPbkldSMghD0Ibfw=
X-Received: by 2002:a17:906:4a81:: with SMTP id x1mr22353813eju.541.1600269557376;
 Wed, 16 Sep 2020 08:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <163546AAA353972B.19281@lists.openembedded.org>
In-Reply-To: <163546AAA353972B.19281@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 16 Sep 2020 17:19:06 +0200
Message-ID: <CA+chaQeXy89kD99L4FMhoEcRNYz2vgzUggF___4GkfUSVckCZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: use ${TCMODE}-${TCLIBC} directory for CACHE
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000832c9c05af6fca8d"

--000000000000832c9c05af6fca8d
Content-Type: text/plain; charset="UTF-8"

This is something I was sitting on for long time, because last time it was
too late to get it merged in 3.1 and then I forgot to send it when master
got open for 3.2 changes :/. And now I'm again a bit late for 3.2..

Here are some more details from #yocto IRC channel log from 2020-03-09

22:02 < JaMa> RP: memory check for you, it's about commit from 2011/2009 :)
do you know why we have 2 different CACHE settings in default setup?
22:02 < JaMa> meta/conf/bitbake.conf:CACHE = "${TMPDIR}/cache${@['', '/' +
str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d,
1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d,
1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
22:02 < JaMa> meta/conf/distro/defaultsetup.conf:CACHE =
"${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' +
str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d,
1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d,
1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
22:03 < JaMa> 2nd was introduced in 2011 with
http://git.openembedded.org/openembedded-core/commit/?id=c0a148077ae27a1ef57c55ac22953c68d001af57
22:03 < JaMa> any objection to update the 1st one and drop 2nd?
22:04 < JaMa> 2009 was last "functional" change in the 1st one (other than
getVar API change updates later twice)
http://git.openembedded.org/openembedded-core/commit/?id=1d4f93e8f63395220da652bae055acde11544577
22:04 < RP> JaMa: presumably its because TCMODE and TCLIBC are nodistro
specific
22:05 < RP> JaMa: we've had wider adoption of that convention since
22:05 < RP> JaMa: if someone had a summy nodistro conf file, it would break
with TCMODE/TCLIBC not in bitbake.conf
22:06 < RP> JaMa: no object to simplifying this though
22:06 < RP> s/summy/dummy/
22:06 < JaMa> ok, will do that in 3.2
22:07 < JaMa> TCLIBC is used in quite a few places now, TCMODE only in
meta/conf/local.conf.sample.extended + defaultsetup.conf
22:07 < RP> JaMa: right, TCLIBC is pretty much required now

On Wed, Sep 16, 2020 at 3:30 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> * move TCMODE and TCLIBC from defaultsetup.conf to bitbake.conf
> * set CACHE as it was in defaultsetup.conf and drop it from
> defaultsetup.conf
> * most if not all DISTROs are now including defaultsetup.conf and
>   TCLIBC is pretty much expected to be always set correctly, e.g.:
>   meta/recipes-core/systemd/systemd_243.2.bb:    if d.getVar('TCLIBC') ==
> "musl":
>   meta/recipes-devtools/gcc/gcc-runtime.inc:        if [ "${TCLIBC}" !=
> "glibc" ]; then
>   meta/recipes-devtools/gcc/libgcc.inc:     if [ "${TCLIBC}" != "glibc" ];
> then
>   meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb:
> ENV_NAME="${DISTRO}-${TCLIBC}-${SDK_ARCH}-@TARGET_PREFIX
> @${DISTRO_VERSION}.tar.gz"
>   meta/recipes-devtools/valgrind/valgrind_3.15.0.bb:RRECOMMENDS_${PN} +=
> "${TCLIBC}-dbg"
>   meta/recipes-kernel/linux/kernel-devsrc.bb:RDEPENDS_${PN} = "bc python3
> flex bison ${TCLIBC}-utils"
>
>   meta/classes/buildhistory.bbclass:BUILDHISTORY_DIR_IMAGE =
> "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
>   meta/classes/cross-canadian.bbclass:    if d.getVar("TCLIBC") in [
> 'baremetal', 'newlib' ]:
>   meta/classes/kernel.bbclass:    tclibc = d.getVar('TCLIBC')
>   meta/classes/toaster.bbclass:    BUILDHISTORY_DIR_IMAGE_BASE =
> e.data.expand("%s/images/${MACHINE_ARCH}/${TCLIBC}/"% BUILDHISTORY_DIR)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf             | 5 ++++-
>  meta/conf/distro/defaultsetup.conf | 5 -----
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5d994f067d..a318d1ca58 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -357,8 +357,11 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt'
> if oe.types.boolean(d.getVar
>  # General work and output directories for the build system.
>  ##################################################################
>
> +TCMODE ?= "default"
> +TCLIBC ?= "glibc"
>  TMPDIR ?= "${TOPDIR}/tmp"
> -CACHE = "${TMPDIR}/cache${@['', '/' +
> str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' +
> str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
> +
> +CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' +
> str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' +
> str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
>  # The persistent cache should be shared by all builds
>  PERSISTENT_DIR = "${TOPDIR}/cache"
>  LOG_DIR = "${TMPDIR}/log"
> diff --git a/meta/conf/distro/defaultsetup.conf
> b/meta/conf/distro/defaultsetup.conf
> index 66fd246526..b36a4ffffe 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -3,10 +3,7 @@ include conf/distro/include/default-versions.inc
>  include conf/distro/include/default-distrovars.inc
>  include conf/distro/include/maintainers.inc
>
> -TCMODE ?= "default"
>  require conf/distro/include/tcmode-${TCMODE}.inc
> -
> -TCLIBC ?= "glibc"
>  require conf/distro/include/tclibc-${TCLIBC}.inc
>
>  require conf/distro/include/uninative-flags.inc
> @@ -15,8 +12,6 @@ require conf/distro/include/uninative-flags.inc
>  TCLIBCAPPEND ?= "-${TCLIBC}"
>  TMPDIR .= "${TCLIBCAPPEND}"
>
> -CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' +
> str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' +
> str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
> -
>  USER_CLASSES ?= ""
>  PACKAGE_CLASSES ?= "package_ipk"
>  INHERIT_BLACKLIST = "blacklist"
> --
> 2.25.1
>
>
> 
>
>

--000000000000832c9c05af6fca8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is something I was sitting on for long time, because =
last time it was too late to get it merged in 3.1 and then I forgot to send=
 it when master got open for 3.2 changes :/. And now I&#39;m again a bit la=
te for 3.2..<div><br></div><div>Here are some more details from #yocto IRC =
channel log from=C2=A02020-03-09</div><div><br></div><div>22:02 &lt; JaMa&g=
t; RP: memory check for you, it&#39;s about commit from 2011/2009 :) do you=
 know why we have 2 different CACHE settings in default setup?<br>22:02 &lt=
; JaMa&gt; meta/conf/bitbake.conf:CACHE =3D &quot;${TMPDIR}/cache${@[&#39;&=
#39;, &#39;/&#39; + str(bb.data.getVar(&#39;MACHINE&#39;, d, 1))][bool(bb.d=
ata.getVar(&#39;MACHINE&#39;, d, 1))]}${@[&#39;&#39;, &#39;/&#39; + str(bb.=
data.getVar(&#39;SDKMACHINE&#39;, d, 1))][bool(bb.data.getVar(&#39;SDKMACHI=
NE&#39;, d, 1))]}&quot;<br>22:02 &lt; JaMa&gt; meta/conf/distro/defaultsetu=
p.conf:CACHE =3D &quot;${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@[&#39;&#39;, &=
#39;/&#39; + str(bb.data.getVar(&#39;MACHINE&#39;, d, 1))][bool(bb.data.get=
Var(&#39;MACHINE&#39;, d, 1))]}${@[&#39;&#39;, &#39;/&#39; + str(bb.data.ge=
tVar(&#39;SDKMACHINE&#39;, d, 1))][bool(bb.data.getVar(&#39;SDKMACHINE&#39;=
, d, 1))]}&quot;<br>22:03 &lt; JaMa&gt; 2nd was introduced in 2011 with <a =
href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3Dc0a14807=
7ae27a1ef57c55ac22953c68d001af57">http://git.openembedded.org/openembedded-=
core/commit/?id=3Dc0a148077ae27a1ef57c55ac22953c68d001af57</a><br>22:03 &lt=
; JaMa&gt; any objection to update the 1st one and drop 2nd?<br>22:04 &lt; =
JaMa&gt; 2009 was last &quot;functional&quot; change in the 1st one (other =
than getVar API change updates later twice) <a href=3D"http://git.openembed=
ded.org/openembedded-core/commit/?id=3D1d4f93e8f63395220da652bae055acde1154=
4577">http://git.openembedded.org/openembedded-core/commit/?id=3D1d4f93e8f6=
3395220da652bae055acde11544577</a><br>22:04 &lt; RP&gt; JaMa: presumably it=
s because TCMODE and TCLIBC are nodistro specific<br>22:05 &lt; RP&gt; JaMa=
: we&#39;ve had wider adoption of that convention since<br>22:05 &lt; RP&gt=
; JaMa: if someone had a summy nodistro conf file, it would break with TCMO=
DE/TCLIBC not in bitbake.conf<br>22:06 &lt; RP&gt; JaMa: no object to simpl=
ifying this though<br>22:06 &lt; RP&gt; s/summy/dummy/<br>22:06 &lt; JaMa&g=
t; ok, will do that in 3.2<br>22:07 &lt; JaMa&gt; TCLIBC is used in quite a=
 few places now, TCMODE only in meta/conf/local.conf.sample.extended + defa=
ultsetup.conf<br>22:07 &lt; RP&gt; JaMa: right, TCLIBC is pretty much requi=
red now<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Sep 16, 2020 at 3:30 PM Martin Jansa via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Martin.J=
ansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">* move TCMODE and TCLIBC from defaultsetup.conf to bitbake.=
conf<br>
* set CACHE as it was in defaultsetup.conf and drop it from defaultsetup.c=
onf<br>
* most if not all DISTROs are now including defaultsetup.conf and<br>
=C2=A0 TCLIBC is pretty much expected to be always set correctly, e.g.:<br=
>
=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_243.2.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_243.2.bb</a>:=C2=A0 =C2=A0 if d.=
getVar(&#39;TCLIBC&#39;) =3D=3D &quot;musl&quot;:<br>
=C2=A0 meta/recipes-devtools/gcc/gcc-runtime.inc:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if [ &quot;${TCLIBC}&quot; !=3D &quot;glibc&quot; ]; then<br>
=C2=A0 meta/recipes-devtools/gcc/libgcc.inc:=C2=A0 =C2=A0 =C2=A0if [ &quot=
;${TCLIBC}&quot; !=3D &quot;glibc&quot; ]; then<br>
=C2=A0 meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1=
.bb:ENV_NAME=3D&quot;${DISTRO}-${TCLIBC}-${SDK_ARCH}-@TARGET_PREFIX@${DISTR=
O_VERSION}.tar.gz&quot;<br>
=C2=A0 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb:RRECOMMENDS_${PN}=
 +=3D &quot;${TCLIBC}-dbg&quot;<br>
=C2=A0 meta/recipes-kernel/linux/kernel-devsrc.bb:RDEPENDS_${PN} =3D &quot=
;bc python3 flex bison ${TCLIBC}-utils&quot;<br>
<br>
=C2=A0 meta/classes/buildhistory.bbclass:BUILDHISTORY_DIR_IMAGE =3D &quot;=
${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}&quot=
;<br>
=C2=A0 meta/classes/cross-canadian.bbclass:=C2=A0 =C2=A0 if d.getVar(&quot=
;TCLIBC&quot;) in [ &#39;baremetal&#39;, &#39;newlib&#39; ]:<br>
=C2=A0 meta/classes/kernel.bbclass:=C2=A0 =C2=A0 tclibc =3D d.getVar(&#39;=
TCLIBC&#39;)<br>
=C2=A0 meta/classes/toaster.bbclass:=C2=A0 =C2=A0 BUILDHISTORY_DIR_IMAGE_B=
ASE =3D e.data.expand(&quot;%s/images/${MACHINE_ARCH}/${TCLIBC}/&quot;% BUI=
LDHISTORY_DIR)<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 5 ++++-<br>
=C2=A0meta/conf/distro/defaultsetup.conf | 5 -----<br>
=C2=A02 files changed, 4 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 5d994f067d..a318d1ca58 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -357,8 +357,11 @@ FILESYSTEM_PERMS_TABLES ?=3D &quot;${@&#39;files/fs-p=
erms.txt&#39; if oe.types.boolean(d.getVar<br>
=C2=A0# General work and output directories for the build system.<br>
=C2=A0##################################################################<b=
r>
<br>
+TCMODE ?=3D &quot;default&quot;<br>
+TCLIBC ?=3D &quot;glibc&quot;<br>
=C2=A0TMPDIR ?=3D &quot;${TOPDIR}/tmp&quot;<br>
-CACHE =3D &quot;${TMPDIR}/cache${@[&#39;&#39;, &#39;/&#39; + str(d.getVar=
(&#39;MACHINE&#39;))][bool(d.getVar(&#39;MACHINE&#39;))]}${@[&#39;&#39;, &#=
39;/&#39; + str(d.getVar(&#39;SDKMACHINE&#39;))][bool(d.getVar(&#39;SDKMACH=
INE&#39;))]}&quot;<br>
+<br>
+CACHE =3D &quot;${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@[&#39;&#39;, &#39;/=
&#39; + str(d.getVar(&#39;MACHINE&#39;))][bool(d.getVar(&#39;MACHINE&#39;))=
]}${@[&#39;&#39;, &#39;/&#39; + str(d.getVar(&#39;SDKMACHINE&#39;))][bool(d=
.getVar(&#39;SDKMACHINE&#39;))]}&quot;<br>
=C2=A0# The persistent cache should be shared by all builds<br>
=C2=A0PERSISTENT_DIR =3D &quot;${TOPDIR}/cache&quot;<br>
=C2=A0LOG_DIR =3D &quot;${TMPDIR}/log&quot;<br>
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/default=
setup.conf<br>
index 66fd246526..b36a4ffffe 100644<br>
--- a/meta/conf/distro/defaultsetup.conf<br>
+++ b/meta/conf/distro/defaultsetup.conf<br>
@@ -3,10 +3,7 @@ include conf/distro/include/default-versions.inc<br>
=C2=A0include conf/distro/include/default-distrovars.inc<br>
=C2=A0include conf/distro/include/maintainers.inc<br>
<br>
-TCMODE ?=3D &quot;default&quot;<br>
=C2=A0require conf/distro/include/tcmode-${TCMODE}.inc<br>
-<br>
-TCLIBC ?=3D &quot;glibc&quot;<br>
=C2=A0require conf/distro/include/tclibc-${TCLIBC}.inc<br>
<br>
=C2=A0require conf/distro/include/uninative-flags.inc<br>
@@ -15,8 +12,6 @@ require conf/distro/include/uninative-flags.inc<br>
=C2=A0TCLIBCAPPEND ?=3D &quot;-${TCLIBC}&quot;<br>
=C2=A0TMPDIR .=3D &quot;${TCLIBCAPPEND}&quot;<br>
<br>
-CACHE =3D &quot;${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@[&#39;&#39;, &#39;/=
&#39; + str(d.getVar(&#39;MACHINE&#39;))][bool(d.getVar(&#39;MACHINE&#39;))=
]}${@[&#39;&#39;, &#39;/&#39; + str(d.getVar(&#39;SDKMACHINE&#39;))][bool(d=
.getVar(&#39;SDKMACHINE&#39;))]}&quot;<br>
-<br>
=C2=A0USER_CLASSES ?=3D &quot;&quot;<br>
=C2=A0PACKAGE_CLASSES ?=3D &quot;package_ipk&quot;<br>
=C2=A0INHERIT_BLACKLIST =3D &quot;blacklist&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000832c9c05af6fca8d--
