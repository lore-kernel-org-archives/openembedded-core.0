Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1F87472F94
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 07:31:21 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id i203so2190285ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5iwaw4ypzg3L8ZpNIH/0FqK8O+3nCzZhnyHF+opkWeE=;
	b=oM4MBOt0oSVFdPwAdMOridGam7OT9YECfoH6tLNdXuwREVwGMjudC2Updb/gD8UzPN
	fww/0ORKtyoEkBWY03lCUeCs48eBnbDwxOEzhmXX2/FceoC5jktSq8ZoiD8ihkfbJpCG
	PQxNxy1BHRBrIruZZaP0dp/tBoxbz2GLsx6uzlu79ShAGtsnN4rnpNs1raOcS3yvj2xd
	MJuz2XRUrrUWzl4k9GyTBcoAh9RfgdIx96wOiXtTk8x3PHFYjVRbLMfEOGnWMmTB6fIQ
	ipLh6VkFN4lDvVJC4Px5cE1kHQ4tS7JF2v69Aqw6MWJSq4rB2tXFTp+bG6JtOR4lrJAQ
	Y+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5iwaw4ypzg3L8ZpNIH/0FqK8O+3nCzZhnyHF+opkWeE=;
	b=qVoopE3Emn+1A3SUozmePJkVEqoHBp91weEZdXPhGY4ksvR3W+a0e0wy3KjR/TA3aW
	URfCIvPBjC40+NcWyJfiQKH+dLb+CUIhefxl/DGr1T9Q+6Gja+crAVch+MteIMRs4xSC
	nuf51YkHRqawIAqaA/yqRjRL+g3/zXiln0EohIa6Ko1MuWjbTf+XDLnoafB98NbxncT7
	8Vqf+NANlJ7rM5pThb4DUcOtYBMdbEtXI0mShwH8Tw21MjJqDz52Gd8NdZp6fFqVsrC8
	K3YEC43hBcT/4Tf7K5JKJZQiHb99EHeRQJsyLaBbhZC60XWiwwjgMr3UdcM54j1NGFDB
	OKiQ==
X-Gm-Message-State: AFeK/H1AlSiQJKRqgDXkxwH5urs5TWdaW8veJr+6a8wGBrA3q1dpLvtq9pNSBE4AvFfz8ejdX0tzL0+OQTJoL+gv
X-Received: by 10.13.233.66 with SMTP id s63mr19633668ywe.315.1491377482861;
	Wed, 05 Apr 2017 00:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Wed, 5 Apr 2017 00:30:52 -0700 (PDT)
In-Reply-To: <20170123135916.4618-1-freesilicon@gmail.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 5 Apr 2017 10:30:52 +0300
Message-ID: <CAHiDW_GH-WhDow0+nP-JnTq1kUKqfBmtS__BuqfUSuroNvsawg@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Wed, 05 Apr 2017 07:31:22 -0000
Content-Type: multipart/alternative; boundary=94eb2c064a1017a5d3054c66612e

--94eb2c064a1017a5d3054c66612e
Content-Type: text/plain; charset=UTF-8

On 23 January 2017 at 15:59, David Vincent <freesilicon@gmail.com> wrote:

> Symlinking the openssl configuration file at install time results in
> errors when overriding it using an external package which also provides
> openssl-conf. This should be done as a postinstall task for such
> packages.
>

This apparently breaks key generation with openssl-native because the file
doesn't exist.

I can fix it by adding one more complication to the recipe (will send a
patch) but I don't think the current solution is all that great: I've been
looking at this patch for a while now and still don't really understand why
it is needed and how these different packages interact. I'm sure it makes
sense when you look at the other recipe but ... isn't it a bad sign that
that context seems to be needed?

Jussi


> Signed-off-by: David Vincent <freesilicon@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc
> b/meta/recipes-connectivity/openssl/openssl.inc
> index 5cca019e1d..696b564cdd 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -201,7 +201,6 @@ do_install () {
>            ${D}${sysconfdir}/ssl/
>         ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
>         ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
> -       ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
>  }
>
>  do_install_ptest () {
> @@ -245,4 +244,16 @@ do_install_append_class-native() {
>             OPENSSL_ENGINES=${libdir}/ssl/engines
>  }
>
> +pkg_postinst_openssl-conf () {
> +#!/bin/sh
> +if [ -e $D${libdir}/ssl/openssl.cnf ]; then
> +       rm -f $D${libdir}/ssl/openssl.cnf
> +fi
> +
> +# If openssl-conf is installed before openssl, we must ensure that the
> symlink
> +# destination exists
> +mkdir -p $D${libdir}/ssl/
> +ln -s ${sysconfdir}/ssl/openssl.cnf $D${libdir}/ssl/openssl.cnf
> +}
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c064a1017a5d3054c66612e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 January 2017 at 15:59, David Vincent <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:freesilicon@gmail.com" target=3D"_blank">freesilicon@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Symlinking the openssl conf=
iguration file at install time results in<br>
errors when overriding it using an external package which also provides<br>
openssl-conf. This should be done as a postinstall task for such<br>
packages.<br></blockquote><div><br></div><div>This apparently breaks key ge=
neration with openssl-native because the file doesn&#39;t exist.=C2=A0</div=
><div><br></div><div>I can fix it by adding one more complication to the re=
cipe (will send a patch) but I don&#39;t think the current solution is all =
that great: I&#39;ve been looking at this patch for a while now and still d=
on&#39;t really understand why it is needed and how these different package=
s interact. I&#39;m sure it makes sense when you look at the other recipe b=
ut ... isn&#39;t it a bad sign that that context seems to be needed?</div><=
div><br></div><div>Jussi</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
Signed-off-by: David Vincent &lt;<a href=3D"mailto:freesilicon@gmail.com">f=
reesilicon@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/<wbr>openssl/openssl.inc | 13 ++++++++++++-=
<br>
=C2=A01 file changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/openssl.inc b/meta/reci=
pes-connectivity/<wbr>openssl/openssl.inc<br>
index 5cca019e1d..696b564cdd 100644<br>
--- a/meta/recipes-connectivity/<wbr>openssl/openssl.inc<br>
+++ b/meta/recipes-connectivity/<wbr>openssl/openssl.inc<br>
@@ -201,7 +201,6 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${sysconfdir}/ssl/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ss=
l/certs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/=
ssl/private<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libd=
ir}/ssl/openssl.cnf<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest () {<br>
@@ -245,4 +244,16 @@ do_install_append_class-<wbr>native() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPENSSL_ENGINES=3D${libdir}/ssl/<=
wbr>engines<br>
=C2=A0}<br>
<br>
+pkg_postinst_openssl-conf () {<br>
+#!/bin/sh<br>
+if [ -e $D${libdir}/ssl/openssl.cnf ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $D${libdir}/ssl/openssl.cnf<br>
+fi<br>
+<br>
+# If openssl-conf is installed before openssl, we must ensure that the sym=
link<br>
+# destination exists<br>
+mkdir -p $D${libdir}/ssl/<br>
+ln -s ${sysconfdir}/ssl/openssl.cnf $D${libdir}/ssl/openssl.cnf<br>
+}<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c064a1017a5d3054c66612e--
