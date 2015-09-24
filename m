Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4F30173BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:50:28 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so248196567wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pyBjWPXCpK4gHUgBWxcg4Lb5kPIw/wA9imW9Ee8EOh4=;
	b=KIyHSfMq2r4Mxz4/H+LsFR+uOOiNusZCXHfp+UAy83Q86lcn3UGdgXz7egHkX+NeM1
	PjU7ThFKZFcwsAnGLDp8zKg3N33E4X6y6qWZ5e+AJMJLI72GTB4BIhEtGVHqrAaKAWTc
	P8KjN9smELYF+KF2AHByw/rKogvt8ux2wGYK6KNHVru/iDEnTvbknfBaSxXNKSK9jyb9
	Ai6HZgmL9+YaMkffvcKOKIxcjEE1FaeYrvCAhNRxOFO9JPDf7RicwMfvashTL8VPoEGe
	7n1Idbb60RQExTTlp2zKTZ6n2+mJ1EikNQraR6+CE3+Lxxu0CbF56vzOrHqJzKzXBOEO
	kRYQ==
X-Gm-Message-State: ALoCoQkRpD6m62TqrJ5aXHbDai3VMQF/sOBfgDqqTMJG5UklHxEi+svt9CBg4hjAYNrrFCZOUkz5
X-Received: by 10.180.88.164 with SMTP id bh4mr9206596wib.18.1443095428428;
	Thu, 24 Sep 2015 04:50:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Thu, 24 Sep 2015 04:49:59 -0700 (PDT)
In-Reply-To: <1443092679-216053-1-git-send-email-wenzong.fan@windriver.com>
References: <1443092679-216053-1-git-send-email-wenzong.fan@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 24 Sep 2015 14:49:59 +0300
Message-ID: <CAHiDW_FZtt9v_tGJT-m_LcEqBS-YThPTE=zoFpr=aQVt7aGPtQ@mail.gmail.com>
To: wenzong.fan@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnutls: cleanup buildpaths from gnutls.pc
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
X-List-Received-Date: Thu, 24 Sep 2015 11:50:29 -0000
Content-Type: multipart/alternative; boundary=f46d044303fc638d0d05207cd6b7

--f46d044303fc638d0d05207cd6b7
Content-Type: text/plain; charset=UTF-8

On 24 September 2015 at 14:04, <wenzong.fan@windriver.com> wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> * gnutls.pc:
>   -L/path/to/tmp/sysroots/qemux86-64/lib64 -> -L/lib64
>

I'm not seeing this problem and gnutls.pc.in file looks ok to me. Any idea
how I could reproduce this?

Jussi


Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc
> b/meta/recipes-support/gnutls/gnutls.inc
> index e9b138a..0a5e663 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -38,6 +38,11 @@ PACKAGECONFIG ??= "zlib"
>  PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
>  PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
>
> +do_install_append() {
> +       # cleanup buildpaths from gnutls.pc
> +       sed -i -e 's#${STAGING_DIR_HOST}##g'
> ${D}${libdir}/pkgconfig/gnutls.pc
> +}
> +
>  PACKAGES =+ "${PN}-openssl ${PN}-xx"
>
>  FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d044303fc638d0d05207cd6b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
4 September 2015 at 14:04,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzong=
.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">From: Wenzong Fan &lt;<a href=
=3D"mailto:wenzong.fan@windriver.com">wenzong.fan@windriver.com</a>&gt;<br>
<br>
* gnutls.pc:<br>
=C2=A0 -L/path/to/tmp/sysroots/qemux86-64/lib64 -&gt; -L/lib64<br></blockqu=
ote><div><br></div><div>I&#39;m not seeing this problem and <a href=3D"http=
://gnutls.pc.in">gnutls.pc.in</a> file looks ok to me. Any idea how I could=
 reproduce this?</div><div><br></div><div>Jussi</div><div>=C2=A0</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com"=
>wenzong.fan@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/gnutls/gnutls.inc | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/=
gnutls/gnutls.inc<br>
index e9b138a..0a5e663 100644<br>
--- a/meta/recipes-support/gnutls/gnutls.inc<br>
+++ b/meta/recipes-support/gnutls/gnutls.inc<br>
@@ -38,6 +38,11 @@ PACKAGECONFIG ??=3D &quot;zlib&quot;<br>
=C2=A0PACKAGECONFIG[tpm] =3D &quot;--with-tpm, --without-tpm, trousers&quot=
;<br>
=C2=A0PACKAGECONFIG[zlib] =3D &quot;--with-zlib, --without-zlib, zlib&quot;=
<br>
<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# cleanup buildpaths from gnutls.pc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s#${STAGING_DIR_HOST}##g&#39; ${=
D}${libdir}/pkgconfig/gnutls.pc<br>
+}<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-openssl ${PN}-xx&quot;<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${bindir}/gnutls-cli-debug&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--f46d044303fc638d0d05207cd6b7--
