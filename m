Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9498B78234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 13:19:14 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id l7so43157528iof.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D971UeW2VPiIlScKZfiekfcrL6SLN7zBxmV1UeVq6mc=;
	b=FavTUQzJzYyv91y7ECH+OxO8Y9jvh0laFGGAqMILT+Tr96c3rBUUjA57tCYYFPRKUn
	wGv7OMXSfDttYSflc3niHj5krZsR+cBlA3rRqB6NNIuI7MXEj5JhIyfsRLshJkvkYS1b
	14QqbV1bXb6EiOI8AR8XG18OHof0HJUpcxHbeiYJiw2cRU/Dh8NYUc+Hodeh6AkSiR4B
	/Ri9oZv2Dq4lfF7xc6nm7YwEciK3+gl5fTvazMfjjHBSAq5RXY97cQpa5bRD6uv6tn5h
	5tCbsJoj9Isn2eNmsrRT/jYZjJ9S/JOJHv+0O7jBgskOe94Tafo0onxswqMIPHe0pWZE
	Wdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D971UeW2VPiIlScKZfiekfcrL6SLN7zBxmV1UeVq6mc=;
	b=Nb1zgXuNY285bJrs4romozha17W40mvStyW3mojaa+6MCywrrJm1a67oCQdR3MYhbd
	lAZYItFzGco1ymWGeAsR+UwufEMXAChyNmES7f1FFeVApSIOAFptxvzc1gzihpi3hxeC
	CEk0SDr7FwzdakPmCY8QXygPWQc4EkoK4QoBtcK0u3xCVQaOSI7WkwekOnklVSYdvn0o
	1gNcXTwzZrNo+1i+TpoJPw71UVrJ+d6BwgRTWA3VBrDlsgmklbXPdoooL3Qimqe1L3d2
	7q7E23U9V5QDRuJL/cYVqElH8Iz6xDAi5yv/vByfgsjnaZdNam8a4+iAFU8qbemPx5CO
	WYVw==
X-Gm-Message-State: AIVw113C305eKWpLU2+FDfnzhFBEfV1ybcJCuj57JX7B4nxbPPK8nQos
	9nws8ARmhaStoa7fDjtnPbGwjrrRu1AT
X-Received: by 10.107.132.33 with SMTP id g33mr14724933iod.300.1500902355495; 
	Mon, 24 Jul 2017 06:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 24 Jul 2017 06:18:54 -0700 (PDT)
In-Reply-To: <1500730246-25592-1-git-send-email-liu.ming50@gmail.com>
References: <1500730246-25592-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jul 2017 14:18:54 +0100
Message-ID: <CAJTo0LaGMPJj-=c7FarWJAULoCJfSjouPKNSweMAaf-g38toJg@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] tclibc-musl.inc: fix bfd "cannot make copy relocation for protected symbol" issues
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
X-List-Received-Date: Mon, 24 Jul 2017 13:19:14 -0000
Content-Type: multipart/alternative; boundary="001a113ed2e8be01d40555100f45"

--001a113ed2e8be01d40555100f45
Content-Type: text/plain; charset="UTF-8"

If we're going to silently change the linker to bfd under musl if
ld-is-gold is selected, wouldn't it be better just to throw an exception if
both musl and ld-is-gold are selected?  Better to tell the user so they can
not do that than silently ignore what they asked.

Ross

On 22 July 2017 at 14:30, <liu.ming50@gmail.com> wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> Quite a few such compiling issues were found when I was building with
> following configs:
> ...
> MACHINE = "beaglebone"
> TCLIBC = "musl"
> DISTRO_FEATURES_append = " ld-is-gold"
> ...
>
> fixed by adding bfd binding now ldflags.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/conf/distro/include/tclibc-musl.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/distro/include/tclibc-musl.inc
> b/meta/conf/distro/include/tclibc-musl.inc
> index 3d3f6ac..99d52a1 100644
> --- a/meta/conf/distro/include/tclibc-musl.inc
> +++ b/meta/conf/distro/include/tclibc-musl.inc
> @@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=
> "nativesdk-glibc"
>
>  CXXFLAGS += "-fvisibility-inlines-hidden"
>
> +# Workaround for musl libc does not support bfd lazy binding well
> +# Refer to: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679
> +LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> '-Wl,-z,relro,-z,now -fuse-ld=bfd', '', d)}"
> +
>  IMAGE_LINGUAS = ""
>
>  LIBC_DEPENDENCIES = "\
> --
> 2.7.4
>
>

--001a113ed2e8be01d40555100f45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If we&#39;re going to silently change the linker to bfd un=
der musl if ld-is-gold is selected, wouldn&#39;t it be better just to throw=
 an exception if both musl and ld-is-gold are selected?=C2=A0 Better to tel=
l the user so they can not do that than silently ignore what they asked.<di=
v><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 22 July 2017 at 14:30,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a =
href=3D"mailto:peter.x.liu@external.atlascopco.com">peter.x.liu@external.<w=
br>atlascopco.com</a>&gt;<br>
<br>
Quite a few such compiling issues were found when I was building with<br>
following configs:<br>
...<br>
MACHINE =3D &quot;beaglebone&quot;<br>
TCLIBC =3D &quot;musl&quot;<br>
DISTRO_FEATURES_append =3D &quot; ld-is-gold&quot;<br>
...<br>
<br>
fixed by adding bfd binding now ldflags.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/<wbr>tclibc-musl.inc | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/conf/distro/include/<wbr>tclibc-musl.inc b/meta/conf/dist=
ro/include/<wbr>tclibc-musl.inc<br>
index 3d3f6ac..99d52a1 100644<br>
--- a/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
+++ b/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
@@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/<wbr>nativesdk-libiconv ?=3D =
&quot;nativesdk-glibc&quot;<br>
<br>
=C2=A0CXXFLAGS +=3D &quot;-fvisibility-inlines-hidden&quot;<br>
<br>
+# Workaround for musl libc does not support bfd lazy binding well<br>
+# Refer to: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D11679" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.<wbr>org/show_bug.cgi?id=3D11679</a><br>
+LDFLAGS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;ld-is-gold&#39;, &#39;-Wl,-z,relro,-z,now -fuse-ld=3Dbfd&#39;, &#39;&#39=
;, d)}&quot;<br>
+<br>
=C2=A0IMAGE_LINGUAS =3D &quot;&quot;<br>
<br>
=C2=A0LIBC_DEPENDENCIES =3D &quot;\<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a113ed2e8be01d40555100f45--
