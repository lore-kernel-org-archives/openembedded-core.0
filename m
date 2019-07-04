Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 34EF47E7DE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 09:13:28 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p15so4727488eds.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8kdha3c4UXd/4rJMqd1uA/+na/7NAflt3dOqP30+3V8=;
	b=WzAgbGivH4fPDW2A0kCgbAPalM9xR/rZfa9AZrZ3w1k7Ol2thZHC1QOatfiI7PuvCk
	WhVyS0YxfdPabnK43y8Sf23WKjkUxsvFn8m5O/xS80z3j41QvWT4jadSkmHf7qm3nUBy
	ClHkG8QvayHvB/WHt24DGNUru/SEVq+E832kdfIcoLFUwrI5PTryotMQfwtYsjn+qdaD
	O42YE/eY4vXCVcg/Ht9iwR30P7qUhXgLS75AxC47fDnbAscbXdbGldlmFsF0Gvjnn2lw
	zygMxTFg6S0TZAdda0tXUOHvpQ4mUp9yIIq5p1NU2/2sGnKxRpVnuM/ce39SKfUOimPO
	xy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8kdha3c4UXd/4rJMqd1uA/+na/7NAflt3dOqP30+3V8=;
	b=tyT7wN58BhT22JzBAZjrl6r118hchnNx6Nl06vQb6JE/dKZ6ummbRoJtfva5CSsOJN
	pMhd78OSMe9JrDNi0Wj8S7o+IvlMrc+HEsEk0Osi5TUdStOUq/chtIrU5D4fD0D0WVWR
	fpXryFQUz4dcqzEEKSUihatSK9wn+Ua6CvCr2l8g2rZqD/th0rJpmLj3hvMADqsCGlOH
	0cs8kgr6cah63xq0u6xhzV1wa3Jo0kUgDlejLpHEni4YNNvxPdYpiDhZtobAtxyeaisS
	iRnbEAF94MqijywKkZThV9XcC8huKjPkrJTxLyO5sNxhBFLqcYTrKCebD4wzKp7t0Y1I
	Jh6Q==
X-Gm-Message-State: APjAAAVFVq0BpHilXn+iVNFmwwZgGmaCj53qXPJjHlXgs6WstZdcf9Rj
	3gWIUC1JttagvP6Hyi7yVxhBx82h2WBjgmfS6kY=
X-Google-Smtp-Source: APXvYqy1R6aXtx+iZThBwxi5Bsu83CShY8HqyjlJAOSZ4mmc6qTLbGDBv3K9tpZh+QmltY5W7wFqe3Kmg1X1Bw22kLg=
X-Received: by 2002:a17:906:5ac7:: with SMTP id
	x7mr27233411ejs.205.1562231608758; 
	Thu, 04 Jul 2019 02:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190702201609.78379-1-jason.wessel@windriver.com>
	<20190702201609.78379-4-jason.wessel@windriver.com>
In-Reply-To: <20190702201609.78379-4-jason.wessel@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Jul 2019 11:13:18 +0200
Message-ID: <CA+chaQdZmWmLYPLfzZ2s6ojCG1QwEGjy7O7fdpNOh2QGTE9vjA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and multilibs
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
X-List-Received-Date: Thu, 04 Jul 2019 09:13:28 -0000
Content-Type: multipart/alternative; boundary="00000000000018d775058cd764ac"

--00000000000018d775058cd764ac
Content-Type: text/plain; charset="UTF-8"

I don't see how this change (or the previous glibc-locale one) would cause
that, but since the oe-core upgrade yesterday I'm seeing following
glibc-locale.do_package failure:
http://errors.yoctoproject.org/Errors/Details/250557/

DEBUG: Executing shell function do_prep_locale_tree
tar: i18n: Cannot stat: No such file or directory
tar: Exiting with failure status due to previous errors
gzip:
TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/locale-tree//usr/share/i18n/charmaps/*gz.gz:
No such file or directory
WARNING:
TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/temp/run.do_prep_locale_tree.23303:1
exit 1 from 'gunzip $i'

anyone else seeing this?

On Tue, Jul 2, 2019 at 10:16 PM Jason Wessel <jason.wessel@windriver.com>
wrote:

> The do_stash_locale was not working consistently across the 4 build
> configurations and the multilib, usrmerge configuration would fail
> entirely with the obscure message:
>
> | DEBUG: Executing shell function do_prep_locale_tree
> | tar: i18n: Cannot stat: No such file or directory
> | tar: Exiting with failure status due to previous errors
> | gzip:
> /poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/locale-tree//usr/share/i18n/charmaps/*gz.gz:
> No such file or directory
> | WARNING:
> /poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/temp/run.do_prep_locale_tree.124690:1
> exit 1 from 'gunzip $i'
>
> Here is the 4 build configurations without the patch applied:
>
> A) x86-64 no multilibs, no usrmerge
> find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v
> nscd.service |wc -l
> 909
> B) x86-64 no multilibs, usrmerge
> find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v
> nscd.service |wc -l
> 909
> C) x86-64 multilibs, no usrmerge
> find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v
> nscd.service |wc -l
> 885
> D) x86-64 multilibs, usrmerge
> find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v
> nscd.service |wc -l
> 864
>
> The issue here is that all the moves should be processed first, then a
> copy should be made of the lib directories, but only in the case they
> are different when using the usrmerge feature.  Even though the build
> worked for the multilib configuration without usrmerge, the content
> was not the same.
>
> After applying the patch the same number of files are in all the
> configurations.  The list of files was also diffed, after normalizing
> the directory names to ensure all the correct files were copied.
>
> Ultimately there are probably additional files that should be pruned
> from what is copied to the stated_locale, but the purpose of this
> patch is make it 100% consistent between the build types and fix the
> builds.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index a1d79b3075..ff17a193c3 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -162,21 +162,28 @@ bashscripts = "mtrace sotruss xtrace"
>  do_stash_locale () {
>         dest=${LOCALESTASH}
>         install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir}
> ${dest}${datadir}
> -       if [ "${base_libdir}" != "${libdir}" ]; then
> -               cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
> -       fi
> +       # Hide away the locale data from the deployment
>         if [ -e ${D}${bindir}/localedef ]; then
>                 mv -f ${D}${bindir}/localedef ${dest}${bindir}
>         fi
>         if [ -e ${D}${libdir}/gconv ]; then
>                 mv -f ${D}${libdir}/gconv ${dest}${libdir}
>         fi
> -       if [ -e ${D}${exec_prefix}/lib ]; then
> -               cp -fpPR ${D}${exec_prefix}/lib ${dest}${exec_prefix}
> -       fi
>         if [ -e ${D}${datadir}/i18n ]; then
>                 mv ${D}${datadir}/i18n ${dest}${datadir}
>         fi
> +
> +       # Make a copy of all the libraries into the locale stash
> +       cp -fpPR ${D}${libdir}/* ${dest}${libdir}
> +       if [ "${base_libdir}" != "${libdir}" ]; then
> +               cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
> +       fi
> +       if [ -e ${D}${exec_prefix}/lib ]; then
> +               if [ ${exec_prefix}/lib != ${base_libdir} ] && [
> ${exec_prefix}/lib != ${libdir} ]; then
> +                       cp -fpPR ${D}${exec_prefix}/lib
> ${dest}${exec_prefix}
> +               fi
> +       fi
> +
>         cp -fpPR ${D}${datadir}/* ${dest}${datadir}
>         rm -rf ${D}${datadir}/locale/
>         cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000018d775058cd764ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t see how this change (or the previous glibc-loc=
ale one) would cause that, but since the oe-core upgrade yesterday I&#39;m =
seeing following glibc-locale.do_package failure:<div><a href=3D"http://err=
ors.yoctoproject.org/Errors/Details/250557/">http://errors.yoctoproject.org=
/Errors/Details/250557/</a><br></div><div><br></div><div>DEBUG: Executing s=
hell function do_prep_locale_tree<br>tar: i18n: Cannot stat: No such file o=
r directory<br>tar: Exiting with failure status due to previous errors<br>g=
zip: TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/locale-tr=
ee//usr/share/i18n/charmaps/*gz.gz: No such file or directory<br>WARNING: T=
OPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/temp/run.do_pre=
p_locale_tree.23303:1 exit 1 from &#39;gunzip $i&#39;<br></div><div><br></d=
iv><div>anyone else seeing this?</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2, 2019 at 10:16 PM Jason=
 Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.com">jason.wessel@wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The do_stash_locale was not working consistently across the 4 bu=
ild<br>
configurations and the multilib, usrmerge configuration would fail<br>
entirely with the obscure message:<br>
<br>
| DEBUG: Executing shell function do_prep_locale_tree<br>
| tar: i18n: Cannot stat: No such file or directory<br>
| tar: Exiting with failure status due to previous errors<br>
| gzip: /poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/local=
e-tree//usr/share/i18n/charmaps/*gz.gz: No such file or directory<br>
| WARNING: /poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/te=
mp/run.do_prep_locale_tree.124690:1 exit 1 from &#39;gunzip $i&#39;<br>
<br>
Here is the 4 build configurations without the patch applied:<br>
<br>
A) x86-64 no multilibs, no usrmerge<br>
find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v nscd.servic=
e |wc -l<br>
909<br>
B) x86-64 no multilibs, usrmerge<br>
find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v nscd.servic=
e |wc -l<br>
909<br>
C) x86-64 multilibs, no usrmerge<br>
find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v nscd.servic=
e |wc -l<br>
885<br>
D) x86-64 multilibs, usrmerge<br>
find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v nscd.servic=
e |wc -l<br>
864<br>
<br>
The issue here is that all the moves should be processed first, then a<br>
copy should be made of the lib directories, but only in the case they<br>
are different when using the usrmerge feature.=C2=A0 Even though the build<=
br>
worked for the multilib configuration without usrmerge, the content<br>
was not the same.<br>
<br>
After applying the patch the same number of files are in all the<br>
configurations.=C2=A0 The list of files was also diffed, after normalizing<=
br>
the directory names to ensure all the correct files were copied.<br>
<br>
Ultimately there are probably additional files that should be pruned<br>
from what is copied to the stated_locale, but the purpose of this<br>
patch is make it 100% consistent between the build types and fix the<br>
builds.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m" target=3D"_blank">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-package.inc | 19 +++++++++++++------<br=
>
=C2=A01 file changed, 13 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc<br>
index a1d79b3075..ff17a193c3 100644<br>
--- a/meta/recipes-core/glibc/glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/glibc-package.inc<br>
@@ -162,21 +162,28 @@ bashscripts =3D &quot;mtrace sotruss xtrace&quot;<br>
=C2=A0do_stash_locale () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest=3D${LOCALESTASH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${dest}${base_libdir} ${dest}${bindi=
r} ${dest}${libdir} ${dest}${datadir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${base_libdir}&quot; !=3D &quot;${li=
bdir}&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fpPR ${D}${base=
_libdir}/* ${dest}${base_libdir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Hide away the locale data from the deployment=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${bindir}/localedef ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv -f ${D}${bindir}=
/localedef ${dest}${bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${libdir}/gconv ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv -f ${D}${libdir}=
/gconv ${dest}${libdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${D}${exec_prefix}/lib ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fpPR ${D}${exec=
_prefix}/lib ${dest}${exec_prefix}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${datadir}/i18n ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${datadir}/i=
18n ${dest}${datadir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Make a copy of all the libraries into the loc=
ale stash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fpPR ${D}${libdir}/* ${dest}${libdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${base_libdir}&quot; !=3D &quot;${li=
bdir}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fpPR ${D}${base=
_libdir}/* ${dest}${base_libdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${D}${exec_prefix}/lib ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${exec_prefix}=
/lib !=3D ${base_libdir} ] &amp;&amp; [ ${exec_prefix}/lib !=3D ${libdir} ]=
; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cp -fpPR ${D}${exec_prefix}/lib ${dest}${exec_prefix}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${D}${datadir}/* ${dest}${datadir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${datadir}/locale/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${WORKDIR}/SUPPORTED ${dest}<br>
-- <br>
2.21.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000018d775058cd764ac--
