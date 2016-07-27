Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 67139606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 03:02:40 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id y195so4619061iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 20:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=/SBkaEl0tfV5Q8WKnlI8+5mcqs5DkouMawzx/BQ0aU8=;
	b=Am3V7L0kn/UsVGAdgFO2d4AFp4a14wjswApyTR1iZBYjL6uD3cu3X5VFthM97D/A5i
	y8tk1C4/92VTZ43wbs960gxJ5A2JpXJ5iHDXybxgm0OepnPB5t84icGEp5yPJpBO4D0M
	t/wyjV1CMpqTsMPuXXeQy3iIBrL5mkYt5IaCpHyR087O1zZxw9qwVGhf8qBkHBpXHlCH
	p347MhzxGc9kO5N6yiY3LQuJIFheDX1UDB5jSrm+KVBVQs5+fHs1+6b4MBc+ppc+31G9
	5i4KGQ2bah5rJ4esyTq2mYOVKev3rj5w9hxsY0JeYvbv3W5TDa/jbqedXYxSFu6bBZvr
	BqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=/SBkaEl0tfV5Q8WKnlI8+5mcqs5DkouMawzx/BQ0aU8=;
	b=S1NNUw4DDoPZa+bOlXEe3rPEqjpjJAawv2HFC0+ljQQe04i4Ykk54TQiX843CVs8fM
	LDrNIwwIeqtSniT6bXzig/y4mNAvlxF/p/MBbeS4s8eAZA296X0HzlLotFzvlPWB+AZA
	raic0c/cixvOdE9mqtXKruC+tKDjOzOVA6q8hAKzLBB+IjnxmDeZrSETLryvO7Yp7iEw
	vXpxaBI9a55L0BbYjGvkiEcWEVMT2qgiA/nomkSrGmR6LakRXtSvJ66HzdTGp+QWIuiq
	/8FPIavItuAgN8UQvG759j0F8C+tKTR6Q+Q1l21ZsL65SjAJYMQjhzzSzkF8wLgL8DTU
	aaIg==
X-Gm-Message-State: AEkoouss2tyGKLduwDIbZkNyCOGSwJ12kvmVZJgAZWAgkclqhPwzvYtwre5gxS+mPYHfUVRmEoOsYrCftSZbMQ==
X-Received: by 10.107.131.170 with SMTP id n42mr30188715ioi.126.1469588560934; 
	Tue, 26 Jul 2016 20:02:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.21.197 with HTTP; Tue, 26 Jul 2016 20:02:21 -0700 (PDT)
In-Reply-To: <1469197500.23580.64.camel@linuxfoundation.org>
References: <1469197500.23580.64.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 26 Jul 2016 20:02:21 -0700
X-Google-Sender-Auth: DFiMAk0qMoPGaXP5LEr7fxya6_E
Message-ID: <CABcZANn61HMx3ttOZpY9tVHHLgV1yA+Vx_JhyUudEEkScPONGQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: Add mechanism to extend QA machine information from BSP layer
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
X-List-Received-Date: Wed, 27 Jul 2016 03:02:41 -0000
Content-Type: multipart/alternative; boundary=001a113ecb0624038a0538954041

--001a113ecb0624038a0538954041
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 22, 2016 at 7:25 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> In order to add a new architecture or sub-architecture to OE, you currently
> need to tweak the table in insane.bbclass. This adds a mechanism so this
> can be done from a BSP layer. It needs a function definition which needs
> a class file but can then be done with something like:
>
> def my_testfunc(machdata, d):
>     machdata["testmachine"] = {
>                         "test64":       ( 8,     0,    0,          False,
>        32),
>                         "testel":     ( 8,     0,    0,          True,
>       32),
>                       }
>     return machdata
>
> PACKAGEQA_EXTRA_MACHDEFFUNCS = "my_testfunc"
>
> [YOCTO #8554]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 9b2337c..98381c2 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -54,8 +54,8 @@ UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls
> --disable-nls --disable-silent-rule
>  # feel free to add and correct.
>  #
>  #           TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little
> Endian, 32bit?
> -def package_qa_get_machine_dict():
> -    return {
> +def package_qa_get_machine_dict(d):
> +    machdata = {
>              "darwin9" : {
>                          "arm" :       (40,     0,    0,          True,
>       32),
>                        },
> @@ -168,6 +168,16 @@ def package_qa_get_machine_dict():
>                        },
>          }
>
> +    # Add in any extra user supplied data which may come from a BSP
> layer, removing the
> +    # need to always change this class directly
> +    extra_machdata = (d.getVar("PACKAGEQA_EXTRA_MACHDEFFUNCS", True) or
> "").split()
> +    for m in extra_machdata:
> +        call = m + "(machdata, d)"
> +        locs = { "machdata" : machdata, "d" : d}
> +        machdata = bb.utils.better_eval(call, locs)
>

Out of curiosity, why pass in the dict and have it modify and return it,
when it could just return a new dict that you add to machdata with
machdata.update()?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ecb0624038a0538954041
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 22, 2016 at 7:25 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":lb" class=3D"a3s aXjCH m15612ff545c4334f">In order to a=
dd a new architecture or sub-architecture to OE, you currently<br>
need to tweak the table in insane.<span class=3D"il">bbclass</span>. This a=
dds a mechanism so this<br>
can be done from a BSP layer. It needs a function definition which needs<br=
>
a <span class=3D"il">class</span> file but can then be done with something =
like:<br>
<br>
def my_testfunc(machdata, d):<br>
=C2=A0 =C2=A0 machdata[&quot;testmachine&quot;] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;test64&quot;:=C2=A0 =C2=A0 =C2=A0 =C2=A0( 8,=C2=A0 =C2=A0 =
=C2=A00,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 False,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A032),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;testel&quot;:=C2=A0 =C2=A0 =C2=A0( 8,=C2=A0 =C2=A0 =C2=A00=
,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 True,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 32),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
=C2=A0 =C2=A0 return machdata<br>
<br>
PACKAGEQA_EXTRA_MACHDEFFUNCS =3D &quot;my_testfunc&quot;<br>
<br>
[YOCTO #8554]<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
diff --git a/meta/classes/insane.<span class=3D"il">bbclass</span> b/meta/c=
lasses/insane.<span class=3D"il">bbclass</span><br>
index 9b2337c..98381c2 100644<br>
--- a/meta/classes/insane.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/insane.<span class=3D"il">bbclass</span><br>
@@ -54,8 +54,8 @@ UNKNOWN_CONFIGURE_WHITELIST ?=3D &quot;--enable-nls --dis=
able-nls --disable-silent-rule<br>
=C2=A0# feel free to add and correct.<br>
=C2=A0#<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_OS=C2=A0 TARGET_ARCH=
=C2=A0 =C2=A0MACHINE, OSABI, ABIVERSION, Little Endian, 32bit?<br>
-def package_qa_get_machine_dict():<br>
-=C2=A0 =C2=A0 return {<br>
+def package_qa_get_machine_dict(d):<br>
+=C2=A0 =C2=A0 machdata =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;darwin9&quot; : {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;arm&quot; :=C2=A0 =C2=A0 =C2=A0 =C2=A0(40,=C2=A0 =C2=
=A0 =C2=A00,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 True,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 32),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0},<br>
@@ -168,6 +168,16 @@ def package_qa_get_machine_dict():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 # Add in any extra user supplied data which may come from a =
BSP layer, removing the<br>
+=C2=A0 =C2=A0 # need to always change this <span class=3D"il">class</span>=
 directly<br>
+=C2=A0 =C2=A0 extra_machdata =3D (d.getVar(&quot;PACKAGEQA_EXTRA_MACHDEFFU=
NCS&quot;, True) or &quot;&quot;).split()<br>
+=C2=A0 =C2=A0 for m in extra_machdata:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call =3D m + &quot;(machdata, d)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 locs =3D { &quot;machdata&quot; : machdata, &q=
uot;d&quot; : d}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 machdata =3D <span class=3D"il">bb</span>.util=
s.better_eval(call, locs)</div></blockquote></div><br>Out of curiosity, why=
 pass in the dict and have it modify and return it, when it could just retu=
rn a new dict that you add to machdata with machdata.update()?<br>-- <br><d=
iv class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher=
 Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphic=
s</div>
</div></div>

--001a113ecb0624038a0538954041--
