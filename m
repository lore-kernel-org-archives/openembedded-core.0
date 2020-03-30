Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.43127.1585538789771667242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 20:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02U3QStF024998
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 20:26:28 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 29 Mar 2020
 20:26:27 -0700
Subject: Re: [OE-core] [PATCH] Revert "ifupdown: create file interfaces if not exist"
To: Chen Qi <Qi.Chen@windriver.com>,
        <openembedded-core@lists.openembedded.org>
References: <20200330020627.5080-1-Qi.Chen@windriver.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <0de0ea16-ae5a-7612-fb8f-cca732c345bb@windriver.com>
Date: Mon, 30 Mar 2020 11:26:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330020627.5080-1-Qi.Chen@windriver.com>
Content-Type: multipart/alternative;
	boundary="------------17E835C833F5EDD097E128DD"
Content-Language: en-US

--------------17E835C833F5EDD097E128DD
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 02U3QStF024998

On 2020/3/30 =E4=B8=8A=E5=8D=8810:06, Chen Qi wrote:
> This reverts commit 4e692daf66d2c9d51d418706e20f4527505dc0bd.
>
> The patch did not take into consideration of read-only rootfs, causing
> the following regression.
>
>    ERROR "The following packages could not be configured offline and roo=
tfs is read-only: ['100-ifupdown']"
>
> The original patch was added to resolve problem running `ifup eth1' on
> a systemd based rootfs. However, when using systemd, we do not use ifup
> to manage our network interfaces.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/ifupdown/ifupdown_0.8.35.bb | 7 -------
>   1 file changed, 7 deletions(-)
>
> diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipe=
s-core/ifupdown/ifupdown_0.8.35.bb
> index a8913e6e29..53cb971d33 100644
> --- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> +++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> @@ -48,13 +48,6 @@ do_install_ptest () {
>       cp -r ${S}/tests/linux ${D}${PTEST_PATH}/tests/
>   }
>  =20
> -pkg_postinst_ontarget_${PN} () {
> -    if [ ! -f /etc/network/interfaces ]; then
> -        mkdir -p /etc/network
> -        touch /etc/network/interfaces
> -    fi
> -}
> -
>   ALTERNATIVE_PRIORITY =3D "100"
>   ALTERNATIVE_${PN} =3D "ifup ifdown"

The network configure files used by ifupdown are provided by=20
init-ifupdown by default. I once thought to make=C2=A0 ifupdown depends on=
 it.
But init-ifupdown provides a script to configure network and then will=20
need 'inherit systemd'. I once thought it is not proper to make a
sysvinit related package to inherit systemd. But if the original patch=20
causes readonly rootfs issue,=C2=A0 I'll turn to work with init-ifupdown.

Sorry for the inconvenience.

Kai



>  =20
>
>=20


--=20
Kai Kang
Wind River Linux


--------------17E835C833F5EDD097E128DD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 02U3QStF024998

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2020/3/30 =E4=B8=8A=E5=8D=8810:06, C=
hen Qi wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20200330020627.5080-1-Qi.Chen@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">This reverts commit 4e692daf6=
6d2c9d51d418706e20f4527505dc0bd.

The patch did not take into consideration of read-only rootfs, causing
the following regression.

  ERROR "The following packages could not be configured offline and rootfs=
 is read-only: ['100-ifupdown']"

The original patch was added to resolve problem running `ifup eth1' on
a systemd based rootfs. However, when using systemd, we do not use ifup
to manage our network interfaces.

Signed-off-by: Chen Qi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Q=
i.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-=
core/ifupdown/ifupdown_0.8.35.bb
index a8913e6e29..53cb971d33 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
@@ -48,13 +48,6 @@ do_install_ptest () {
     cp -r ${S}/tests/linux ${D}${PTEST_PATH}/tests/
 }
=20
-pkg_postinst_ontarget_${PN} () {
-    if [ ! -f /etc/network/interfaces ]; then
-        mkdir -p /etc/network
-        touch /etc/network/interfaces
-    fi
-}
-
 ALTERNATIVE_PRIORITY =3D "100"
 ALTERNATIVE_${PN} =3D "ifup ifdown"
</pre>
    </blockquote>
    <p>The network configure files used by ifupdown are provided by
      init-ifupdown by default. I once thought to make=C2=A0 ifupdown depe=
nds
      on it.<br>
      But init-ifupdown provides a script to configure network
      and then will need 'inherit systemd'. I once thought it is not
      proper to make a<br>
      sysvinit related package to inherit systemd.
      But if the original patch causes readonly rootfs issue,=C2=A0 I'll t=
urn
      to
      work with init-ifupdown. <br>
    </p>
    <p>Sorry for the inconvenience.</p>
    <p>Kai<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20200330020627.5080-1-Qi.Chen@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">=20
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------17E835C833F5EDD097E128DD--
