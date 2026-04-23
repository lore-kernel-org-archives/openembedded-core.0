Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85E1F99375
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:15:33 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16184.1776938966218153745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 03:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nncMaHEL;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: zizuzacker@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-605def5b80cso2011239137.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 03:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776938965; cv=none;
        d=google.com; s=arc-20240605;
        b=g2+aCux3rTuUS5lkiqH+V6xoQzAjLtaJL7DP2ou+gsAM1DZYD6Dt+w1JSvbcMkTdPQ
         M/pcX4ylJWzqwKqRgohahHK9AtjjuMykTjNwHcBZu4PC8rLhileRe7rpLqFRdcpkA+0t
         na/6yQtkjlIO/1aG0jS4CNNex1RrOV+1hWld/0eBvr2fhv88oKQDmwYRdJmhxmFuMQuO
         BqdIEXn1yAmpB+SpFMGt/2QFsfTc13ST0Yhp2KMYblSovLvIDGHZKK4/SbGbDZVPRSJZ
         Kva8F39JUZjphhtO2A3E18h9QzjEvH0Vuz9hEaAOf/MDo4xiOheylVIb1APH58JIrE0p
         xtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ArRy/7orEgAbey+pCuYkjLQYz4gKgiwlVilbW+yZdg=;
        fh=DxvV/ayjeL96z1D0SJHS+JBUj2KYDrFKFP7ux3tmPXg=;
        b=NEDxq9x2Jm2uKPB9VLH097tRJBXqshPFDbgFT9s8tWipa1xmQBG2GYka0mfjo/yK8r
         M/dmYzG0wQuqkjnBpMrV5kWRqO0RIw9cJi0CBog4037nRZ5GRSuuZQjrJDsS6nenAxiz
         6K3iXLQXbG44vKTvFX5hacj26CYU8C5mowWAVZfy8QUDNjk+pLL4WnZoMRS6TX56wQIa
         fQ8fr5tojz+Dd8RyLJRL9R9xnCVdWh0VB2fZD4mZr1qQcqUGPm+mHUJUMyOFQs/lEVwc
         1XO3T1lXL4lMYDAzfrLLEGex9na7GaztyhVZGnqsh7IKWAwcQRjib68GzyGNhxSekf/N
         i/KA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776938965; x=1777543765; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ArRy/7orEgAbey+pCuYkjLQYz4gKgiwlVilbW+yZdg=;
        b=nncMaHELU5zNOj5npgEXsO22BsBTopZTMOsBehTvznSG0VKFjylQ7oFpSVTKbcVbEM
         wgfUACLXyCUCEvOEfcprgVyE4/3ufm++uR8BEgOzmPtW6SD1xfy3EbPWgDs8ZJ+20USH
         BWUvBAPCZeW5XA2VPjh/PW274KlMdg3+9CisA5yw8YMMeF7rc6qPKS69pEIfD8bwQY8z
         o6cfIsrOtkeoB83nJ9Eafn64sMhszMPCX+wAr7D92EP9sh3CsSa2oSj6GmOAgffVfVhe
         Kj9jrUEspjnVJaClwaZYuRGnAgOE6MDLwUCb4QeD8isKV7GFxQxfcE25feJ5NjtoBleA
         5B+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938965; x=1777543765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ArRy/7orEgAbey+pCuYkjLQYz4gKgiwlVilbW+yZdg=;
        b=AIkAGLhl2X2OyHlMiArFvY8RjM4CtIaUaULu+pRXNDWAJLoOx7tB3hWCXOvDu1gelb
         ibIZLgPqXrtHRObfXB4rFpPQgT/AonqQ7KNNfRravokZM8ZxGmUslxUGrboZLCV2lExN
         LqZH6UualxMCQr5rMte6MvZGrHrBAB2YZywgrEydtw6H+z7zHOTAXngWoXp8fUOjHvb+
         0cPVpPkiYelRTjIXh+liQrSUMnPEA5f4yD9C1LnpoTZiUixP3sRMBdtXx5g7skAZvLb+
         1Jk7O2XJRTFrLOZL/9b93GHpHg187eNmqHyUPxR/ivHTDQdYq2e3YArrLJJUF9iG7v5P
         xIxg==
X-Gm-Message-State: AOJu0YwoiZ8YuYmmSot+jWJ91Q5PCW/TPE3diYXFegMlqzSYOH0FSoO/
	y8y3EYRaoUj0l6pe/FQvtU1njNKdb9xN0FJw1k9DIFPRcA0zu+cqabG3Q2H+E+g4GRfYyeyJNTQ
	FGwWROEkFTkzezxuxXv/2czAy+msmc+lZJmXpLAh92g==
X-Gm-Gg: AeBDies709N3NzLTUg+Zuv0IivOFI2U74r/xykOSid7iCA3jWcq5XWbtWTazc1vQv92
	kKK13k9GWBkn13AQ6LKruGhwi1jf3D9OhX1AD0WaI8y219CkkIL6rwi2qPMmHJk5gCOM6QVty/w
	OPv2E2dkdSUN92D67odqy4VhcEXftwNtDhn8GIHI91oFOk7yq58Sa+VXPhIwxwpKcrybe1AwagJ
	Cez2PnPABHGIOAOJ+22mlO6V/j5xRrwW11+Rw6EooL5wfV2ljNToBDRbBOVWFEJwYtykEBuR4P2
	AQqvnn22eOfR4UFI0g==
X-Received: by 2002:a05:6102:1484:b0:609:4db5:de7c with SMTP id
 ada2fe7eead31-616f66c4421mr12724348137.13.1776938964890; Thu, 23 Apr 2026
 03:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <DI0BXNU5HAFH.348GL3QVI6JL3@bootlin.com> <20260423100405.25255-1-zizuzacker@gmail.com>
 <20260423100405.25255-4-zizuzacker@gmail.com>
In-Reply-To: <20260423100405.25255-4-zizuzacker@gmail.com>
From: "Zk47T" <zizuzacker@gmail.com>
Date: Thu, 23 Apr 2026 17:09:13 +0700
X-Gm-Features: AQROBzAVWjtd3mTS5Nn-x_CmT2WkVFVSiOE4u082WzWPZtixARYRxsH46JUL5F0
Message-ID: <CAH9t78y4x5xbpep5VhM+wppFvaDaK1Da3fDPH1h9wTOWLcX60w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] oe-selftest: add test for useradd with only USERADD_DEPENDS
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000ca372e06501dd712"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 11:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235759

--000000000000ca372e06501dd712
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
i remove these 2 lines in poky/meta-selftest/recipes-test/selftest-users/
usegroup-deponly.bb
- S =3D "${WORKDIR}/sources"
- UNPACKDIR =3D "${S}"

My poky base on walnascar-next, it seem that the autobuilder base on newer
branch that more strict in S and UNPACKDIR variables that caused do_unpack
failed
I have just updated new patch v3 for this . Please help review it

Thank,
Nguyen Minh Tien


V=C3=A0o Th=E1=BB=A9 5, 23 thg 4, 2026 va=CC=80o lu=CC=81c 17:04 Nguyen Min=
h Tien <
zizuzacker@gmail.com> =C4=91=C3=A3 vi=E1=BA=BFt:

> Add a test case to verify that a recipe inheriting useradd with only
> USERADD_DEPENDS set (and no USERADD_PACKAGES) parses and builds
> successfully. This validates the fix in useradd.bbclass for
> [YOCTO #15863].
>
> Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/usergrouptests.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py
> b/meta/lib/oeqa/selftest/cases/usergrouptests.py
> index 3c59b0f290..69025a59aa 100644
> --- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
> +++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
> @@ -55,3 +55,9 @@ class UserGroupTests(OESelftestTestCase):
>          self.write_config("USERADD_GID_TABLES +=3D \"files/static-group\=
"")
>          self.logger.info("Rebuild with other staticids")
>          self.assertTrue(bitbake(' core-image-minimal'))
> +
> +    def test_useradd_depends_only(self):
> +        # Test that a recipe inheriting useradd with only USERADD_DEPEND=
S
> +        # (and no USERADD_PACKAGES) parses and builds successfully.
> [YOCTO #15863]
> +        self.logger.info("Building usegroup-deponly to test
> USERADD_DEPENDS only")
> +        self.assertTrue(bitbake(' usegroup-deponly'))
> --
> 2.34.1
>
>

--000000000000ca372e06501dd712
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div>i remove these 2 lines in poky/meta-selftest=
/recipes-test/selftest-users/<a href=3D"http://usegroup-deponly.bb">usegrou=
p-deponly.bb</a><div>- S =3D &quot;${WORKDIR}/sources&quot;<br>- UNPACKDIR =
=3D &quot;${S}&quot;</div></div><div><br></div><div>My poky base on walnasc=
ar-next, it seem that the autobuilder base on newer branch that more strict=
 in S and UNPACKDIR variables that caused do_unpack failed=C2=A0</div><div>=
I have just updated new patch v3 for this . Please help review it=C2=A0</di=
v><div><br></div><div>Thank,=C2=A0</div><div>Nguyen Minh Tien</div><div><br=
></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">V=C3=A0o Th=E1=BB=A9 5, 23 thg 4, 2026 va=CC=
=80o lu=CC=81c 17:04 Nguyen Minh Tien &lt;<a href=3D"mailto:zizuzacker@gmai=
l.com">zizuzacker@gmail.com</a>&gt; =C4=91=C3=A3 vi=E1=BA=BFt:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Add a test case to verify th=
at a recipe inheriting useradd with only<br>
USERADD_DEPENDS set (and no USERADD_PACKAGES) parses and builds<br>
successfully. This validates the fix in useradd.bbclass for<br>
[YOCTO #15863].<br>
<br>
Signed-off-by: Nguyen Minh Tien &lt;<a href=3D"mailto:zizuzacker@gmail.com"=
 target=3D"_blank">zizuzacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/usergrouptests.py | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa=
/selftest/cases/usergrouptests.py<br>
index 3c59b0f290..69025a59aa 100644<br>
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py<br>
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py<br>
@@ -55,3 +55,9 @@ class UserGroupTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(&quot;USERADD_GID_TABLE=
S +=3D \&quot;files/static-group\&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.logger.info" rel=
=3D"noreferrer" target=3D"_blank">self.logger.info</a>(&quot;Rebuild with o=
ther staticids&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(bitbake(&#39; core-image-=
minimal&#39;))<br>
+<br>
+=C2=A0 =C2=A0 def test_useradd_depends_only(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test that a recipe inheriting useradd with o=
nly USERADD_DEPENDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (and no USERADD_PACKAGES) parses and builds =
successfully. [YOCTO #15863]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.logger.info" rel=3D"nor=
eferrer" target=3D"_blank">self.logger.info</a>(&quot;Building usegroup-dep=
only to test USERADD_DEPENDS only&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(bitbake(&#39; usegroup-deponly=
&#39;))<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000ca372e06501dd712--

