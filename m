Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD084C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 07:06:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.6925.1749711987133208724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 00:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ayeh4nem;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4533027c0ceso908525e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 00:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749711985; x=1750316785; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VNIh0/LcHpyzYTyjBGdzPBSqHLD3FuZr8rDZYsqMNFM=;
        b=ayeh4nem2ibVdAlmMyPEm9EiL5/WMyGwefvb+6ioFXXNgSyoE8buAygABI5joMUuCn
         fLpr//WYXFTX84u+0ml0zIRum8iH51fssYVi9Z+dXWa2TYFksVaAEhlwFtuO/1urOnkx
         +dXvFzsZjcqr9g70+Z8y9j6skVgXRmyir0iiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711985; x=1750316785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNIh0/LcHpyzYTyjBGdzPBSqHLD3FuZr8rDZYsqMNFM=;
        b=DFcu7iiMRPd9M9wIpyDl/INl8qosEvEAzJJCM/Z0hsacQVFCFuq/ZfVTdB0mU3VnFj
         dNInCEHGEv4F8GU6/W55dP0hHB2MiWM5Psj0QpwJXqOJg6KBnpJHfyXUmNopUdL5gCvL
         /e1FsznhZka0hCbic+iy3WVd6z0xRoD+cSu2teN6HQkNzeR+VDfp7dZf8qp+j+/WpVL+
         KwI9VTA4iNHNCDTBXXmNpWoM78hNWTF45Vvi3CJeZUZl/SxkRR7MKJ2ccx187BAiuvS/
         vIZeBGsEOBBZlUbjHjbazrzaCtkDzHpYcep1Tsw9TwhgO1ZyoHO8ThPNMv54vAHlq9c6
         5Eyg==
X-Gm-Message-State: AOJu0Yx8TwIqn/hYYUs3FIaqzD66erpNAoRgZIFKUi0X9TjMct3Sh3fu
	QcDaJvuVNq0/1bxF4SGvuUMr/u/fecqzT9mcDluRV1qbkejiU4VtUFJW1ihU/+4zzMD30tQfbc8
	XqIzNp8dpj+xzSFGAbNyx5mR9nnfGzcquxrxvXNlaNA==
X-Gm-Gg: ASbGncsV/RD8sD+sMFWoyfDXP0tMNEVd+KBGTvDijgFZzUf83cFL0Kg20Jz5L90w1AM
	sXexJeXk+4x+pRgCygJMLeo5nSa/N/8gdzRYe67mnU//DtrJzL2khNwPROHM/5YmxS3Ejdkx2eL
	xFYTO7zmakpsZ5CCuZL12reh2QNagDVrbY1g5x3VwAF0RA4UcKjy0fbwaSgXRj34XSBHZNLzt8Q
	QiH
X-Google-Smtp-Source: AGHT+IEKvOyARgylKVbwpNUUtWlImlgbz2ENp/VIlD0n6U0s8KcgKzH5zt1TxaWwJounz9kKF2fm3BDaIYDC6jCpi7Y=
X-Received: by 2002:a05:600c:8b27:b0:442:d9fb:d9f1 with SMTP id
 5b1f17b1804b1-4532b89b6afmr25136855e9.4.1749711985445; Thu, 12 Jun 2025
 00:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250612042855.1377855-1-archana.polampalli@windriver.com>
In-Reply-To: <20250612042855.1377855-1-archana.polampalli@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 12 Jun 2025 09:05:58 +0200
X-Gm-Features: AX0GCFuwduUefS2TFQ2AEnSEw7eE9XNedUCSos4C2HsAjKfYF1yomsBSciy2Cyg
Message-ID: <CAMSfU+4P_LQ41=9HfZJ6Wtt_5cOwDFMZ5iC7ZkP0m-BkX22aMw@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] python3-cryptography: fix
 IndentationError caused by CVE-2024-26130 fix
To: archana.polampalli@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a1e9b06375a916e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 07:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218484

--0000000000005a1e9b06375a916e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 12 juin 2025 =C3=A0 06:29, Polampalli, Archana via lists.openembedd=
ed.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> fixes:
>
>    File
> "/usr/lib/python3-cryptography/ptest/tests/hazmat/primitives/test_pkcs12.=
py",
> line 28
>        @pytest.mark.supported(
>    IndentationError: unexpected indent
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
>

Hello,

Shouldn't we fix CVE-2024-26130.patch instead of carrying this new patch?

Thanks!


> ---
>  ...st_pkcs12.py-correct-the-Indentation.patch | 60 +++++++++++++++++++
>  .../python/python3-cryptography_36.0.2.bb     |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-cor=
rect-the-Indentation.patch
>
> diff --git
> a/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-c=
orrect-the-Indentation.patch
> b/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-c=
orrect-the-Indentation.patch
> new file mode 100644
> index 0000000000..09e540c887
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-c=
orrect-the-Indentation.patch
> @@ -0,0 +1,60 @@
> +From b737b6609cd6394c895258e0ae9b341650747918 Mon Sep 17 00:00:00 2001
> +From: Archana Polampalli <archana.polampalli@windriver.com>
> +Date: Tue, 10 Jun 2025 11:52:53 +0530
> +Subject: [PATCH] test_pkcs12.py: correct the Indentation
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + tests/hazmat/primitives/test_pkcs12.py | 34 +++++++++++++-------------
> + 1 file changed, 17 insertions(+), 17 deletions(-)
> +
> +diff --git a/tests/hazmat/primitives/test_pkcs12.py
> b/tests/hazmat/primitives/test_pkcs12.py
> +index 8af4c93..1084038 100644
> +--- a/tests/hazmat/primitives/test_pkcs12.py
> ++++ b/tests/hazmat/primitives/test_pkcs12.py
> +@@ -25,23 +25,23 @@ from ...doubles import DummyKeySerializationEncrypti=
on
> + from ...utils import load_vectors_from_file
> +
> +
> +-   @pytest.mark.supported(
> +-       only_if=3Dlambda backend:
> backend._lib.Cryptography_HAS_PKCS12_SET_MAC,
> +-       skip_message=3D"Requires OpenSSL with PKCS12_set_mac",
> +-   )
> +-   def test_set_mac_key_certificate_mismatch(self, backend):
> +-       cacert, _ =3D _load_ca(backend)
> +-       key =3D ec.generate_private_key(ec.SECP256R1())
> +-       encryption =3D (
> +-           serialization.PrivateFormat.PKCS12.encryption_builder()
> +-           .hmac_hash(hashes.SHA256())
> +-           .build(b"password")
> +-       )
> +-
> +-       with pytest.raises(ValueError):
> +-           serialize_key_and_certificates(
> +-               b"name", key, cacert, [], encryption
> +-           )
> ++    @pytest.mark.supported(
> ++        only_if=3Dlambda backend:
> backend._lib.Cryptography_HAS_PKCS12_SET_MAC,
> ++        skip_message=3D"Requires OpenSSL with PKCS12_set_mac",
> ++    )
> ++    def test_set_mac_key_certificate_mismatch(self, backend):
> ++        cacert, _ =3D _load_ca(backend)
> ++        key =3D ec.generate_private_key(ec.SECP256R1())
> ++        encryption =3D (
> ++            serialization.PrivateFormat.PKCS12.encryption_builder()
> ++            .hmac_hash(hashes.SHA256())
> ++            .build(b"password")
> ++        )
> ++
> ++        with pytest.raises(ValueError):
> ++            serialize_key_and_certificates(
> ++                b"name", key, cacert, [], encryption
> ++            )
> +
> + @pytest.mark.skip_fips(
> +     reason=3D"PKCS12 unsupported in FIPS mode. So much bad crypto in it=
."
> +--
> +2.40.0
> +
> diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> index 83381f225c..173e47b463 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> @@ -20,6 +20,7 @@ SRC_URI +=3D " \
>      file://CVE-2023-23931.patch \
>      file://CVE-2023-49083.patch \
>      file://CVE-2024-26130.patch \
> +    file://0001-test_pkcs12.py-correct-the-Indentation.patch \
>  "
>
>  inherit pypi python_setuptools3_rust
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218475):
> https://lists.openembedded.org/g/openembedded-core/message/218475
> Mute This Topic: https://lists.openembedded.org/mt/113601601/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000005a1e9b06375a916e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 12=
 juin 2025 =C3=A0=C2=A006:29, Polampalli, Archana via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;archana.polampalli=3D<a=
 href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.o=
penembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Archana Polampalli &lt;<a href=3D"mailto:=
archana.polampalli@windriver.com" target=3D"_blank">archana.polampalli@wind=
river.com</a>&gt;<br>
<br>
fixes:<br>
<br>
=C2=A0 =C2=A0File &quot;/usr/lib/python3-cryptography/ptest/tests/hazmat/pr=
imitives/test_pkcs12.py&quot;, line 28<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0@pytest.mark.supported(<br>
=C2=A0 =C2=A0IndentationError: unexpected indent<br>
<br>
Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@=
windriver.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<b=
r></blockquote><div><br></div><div>Hello,</div><div><br></div><div>Shouldn&=
#39;t we fix=C2=A0CVE-2024-26130.patch instead of carrying this new patch?<=
/div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0...st_pkcs12.py-correct-the-Indentation.patch | 60 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-cryptography_36.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-cryptography_36.0.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 61 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-cryptography/=
0001-test_pkcs12.py-correct-the-Indentation.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-test_pk=
cs12.py-correct-the-Indentation.patch b/meta/recipes-devtools/python/python=
3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch<br>
new file mode 100644<br>
index 0000000000..09e540c887<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py=
-correct-the-Indentation.patch<br>
@@ -0,0 +1,60 @@<br>
+From b737b6609cd6394c895258e0ae9b341650747918 Mon Sep 17 00:00:00 2001<br>
+From: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@windrive=
r.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<br>
+Date: Tue, 10 Jun 2025 11:52:53 +0530<br>
+Subject: [PATCH] test_pkcs12.py: correct the Indentation<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli=
@windriver.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<=
br>
+---<br>
+ tests/hazmat/primitives/test_pkcs12.py | 34 +++++++++++++-------------<br=
>
+ 1 file changed, 17 insertions(+), 17 deletions(-)<br>
+<br>
+diff --git a/tests/hazmat/primitives/test_pkcs12.py b/tests/hazmat/primiti=
ves/test_pkcs12.py<br>
+index 8af4c93..1084038 100644<br>
+--- a/tests/hazmat/primitives/test_pkcs12.py<br>
++++ b/tests/hazmat/primitives/test_pkcs12.py<br>
+@@ -25,23 +25,23 @@ from ...doubles import DummyKeySerializationEncryption=
<br>
+ from ...utils import load_vectors_from_file<br>
+ <br>
+ <br>
+-=C2=A0 =C2=A0@pytest.mark.supported(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0only_if=3Dlambda backend: backend._lib.Cryptog=
raphy_HAS_PKCS12_SET_MAC,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0skip_message=3D&quot;Requires OpenSSL with PKC=
S12_set_mac&quot;,<br>
+-=C2=A0 =C2=A0)<br>
+-=C2=A0 =C2=A0def test_set_mac_key_certificate_mismatch(self, backend):<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0cacert, _ =3D _load_ca(backend)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0key =3D ec.generate_private_key(ec.SECP256R1()=
)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0encryption =3D (<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serialization.PrivateFormat.PKCS=
12.encryption_builder()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hmac_hash(hashes.SHA256())<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.build(b&quot;password&quot;)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0with pytest.raises(ValueError):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serialize_key_and_certificates(<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b&quot;name&quot;,=
 key, cacert, [], encryption<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
++=C2=A0 =C2=A0 @pytest.mark.supported(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 only_if=3Dlambda backend: backend._lib.Crypto=
graphy_HAS_PKCS12_SET_MAC,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_message=3D&quot;Requires OpenSSL with PK=
CS12_set_mac&quot;,<br>
++=C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 def test_set_mac_key_certificate_mismatch(self, backend):<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cacert, _ =3D _load_ca(backend)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D ec.generate_private_key(ec.SECP256R1(=
))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 encryption =3D (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serialization.PrivateFormat.PKC=
S12.encryption_builder()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hmac_hash(hashes.SHA256())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .build(b&quot;password&quot;)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 with pytest.raises(ValueError):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serialize_key_and_certificates(=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b&quot;name&quot;=
, key, cacert, [], encryption<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+ <br>
+ @pytest.mark.skip_fips(<br>
+=C2=A0 =C2=A0 =C2=A0reason=3D&quot;PKCS12 unsupported in FIPS mode. So muc=
h bad crypto in it.&quot;<br>
+-- <br>
+2.40.0<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy_36.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_=
36.0.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-cryp=
tography_36.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograp=
hy_36.0.2.bb</a><br>
index 83381f225c..173e47b463 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_3=
6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.2.=
bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_3=
6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.2.=
bb</a><br>
@@ -20,6 +20,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-23931.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-49083.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2024-26130.patch \<br>
+=C2=A0 =C2=A0 file://0001-test_pkcs12.py-correct-the-Indentation.patch \<b=
r>
=C2=A0&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools3_rust<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#218475): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/218475" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/218475</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113601601/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113601601/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005a1e9b06375a916e--

