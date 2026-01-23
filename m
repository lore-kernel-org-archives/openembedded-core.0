Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA60D7788C
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.124.1769187773842498868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vAb9maon;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-432d2c96215so2123177f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769187772; cv=none;
        d=google.com; s=arc-20240605;
        b=dncIbYpTDire2kyl4mOvv3pQtMGMFtQAjDqvFz8yoGQtHyaQQLoX+8rfAFqEboAhOI
         JYJLmlNBZdnpeXNPRsNPuxVPVNoy8mbi8UTb3Nz2V2BtXd8uT8tV3mCDKCngfpC0mOqK
         tRyuankDKP+wqVNmEpmQ6VTP9gsO9VPTcrtB1K64kaSNZr/Gl3ejrps/gEZ69AcS8x2n
         Q+0To90qQdXWwp13kMQlBXw9JRRoiv5c4GMcjw1EVC5qXyUPKDzIQCbj4ev3UKt83PTO
         hopYFrPilMTOUME2G2q83wbr+a9E4O/EKr42s6Ws1uhBl1PSO7biXjTimBTeqLPPvGVu
         2ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MTbxNLyK7y7I8cV7AGFWfK5uUXKYsjfEq5Z2vJYcUs0=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=GC347srJHiFUM074xXwcITIDoFX9I/8ybgB5+8N3As3olRFmPHjJiGJLJIEQTYOOF6
         hgTwfwbPL3IcZJx/+O7IqoHxXyX+LNhibGvr2PjIcZ1+7wvI7kL2P2hx8gBKlHzaUQmw
         L50IJG/BQFs6r+MLf6VPMnlRkv1AXRgBEWBnXcWHRetlgZVFwBKYETsghwYExmbr34Nm
         u4lxYKPfVbYnBsjdUuQIBA4CfGQKgozCHt47Xje51AKZfPaqZNjTBhs95g6tsjt3g+Gj
         /sOgDfgsXhYRVhMg69yxbihJzMTp3GMCbPrQ7bNoxCkC3cxb09BTqlWU8PcY7WbrU3/a
         Ofkg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769187772; x=1769792572; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MTbxNLyK7y7I8cV7AGFWfK5uUXKYsjfEq5Z2vJYcUs0=;
        b=vAb9maonFoT3fnpF/8t70qQMbFvLx4FiJyH4AgVwc0gaNCBPfuQnMMts0z57OVQPHY
         jbviynNjmwIYCx8TeGRduCkmfS5Uam1Aay7Z9N2WK5WciRDo8aTRdLzxazlQhVCEC/gp
         5MX52mzUmU8Va8MDdyNAbTcAAHuCcuzd8s3TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187772; x=1769792572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTbxNLyK7y7I8cV7AGFWfK5uUXKYsjfEq5Z2vJYcUs0=;
        b=c+6HKdGXTGIYdmd6L4/0VmgGzN2dIwEGRArusadys9oCPqXhZ6lM7s2ySKSbKeFOQT
         ZTqklA56HhSpYV/Xxw8kvux1tJSTptutRdkUBihsiOiU2W1si1qnFqcq5HDo9lA1dld8
         ZKf2+JJuisAyN/J2V757U6fU5z3BcrbbtvaunPSNzKdIUO174OMEmQ4tPvEFDveBfTWT
         oVfGCXnauHe6GGMfXzh+WI1gznxVTfpTvT0i45qosH/wCitNhvjZNOCEuheCioSLva3/
         Dx61voQdmR0+Ghyjzn+aUpLYRgKTMoWaX5nmBtYX4qj9lA9D1FnO/YP7gP0P3Pooyj5D
         g7+Q==
X-Gm-Message-State: AOJu0YxVG62Y7VEjuZkz4Z7iseo/eBIV78oJlx28w6tB8ytB2MlfW0cs
	QfD3gOthKAwBzO1qHLY33zM2AxW9c/NG73LKPiU4CSIhiIWSV4b/J8MYPKw2IarOJU0WPciEBSK
	+JPwch/YOhtJPDRLD+mJMaI+F+tzA2MisGv0z7iyqmw==
X-Gm-Gg: AZuq6aKOwzN3uJHU2q813pTF2BV+/HEjHqWntMbf7pqubOShr16/+St5pFLoBx3NzPt
	dS/FWOoAP8TY2dO9PVzVrn6acrKGZGzGTAX3Hn7DIHoJUdazloopUZbTBGCJwplTgXBuqkn2VnB
	dCnjteu465YyZQ5oHJZcqQ2rFT01aYg3HWe1PeX9TDIhdQ5I0BRVgeRBnzdzyePYKQE8224dUSx
	MMYvhG7Vsp6cmL8ur8gp2E8j+PKEFm3+7XJErHwG8sWxUPhli5vU0k1Rnr+pRvcp1HyrrZf2OFI
	rk0SBiy/jP3Zo74qgm8Qmxtuq+QdzlHOtbrLI70=
X-Received: by 2002:a5d:64e5:0:b0:432:84f9:8bea with SMTP id
 ffacd0b85a97d-435b162001amr6218567f8f.51.1769187772109; Fri, 23 Jan 2026
 09:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20260123123336.41126-1-peter.marko@siemens.com>
In-Reply-To: <20260123123336.41126-1-peter.marko@siemens.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 23 Jan 2026 18:02:26 +0100
X-Gm-Features: AZwV_Qi8ubLIoibXrB7NTFKXcHFbRXhjyjUBN7iugqj0jGk_2Q49IFTp6bVSKnI
Message-ID: <CAMSfU+7FpuEruzCELf=PGAmGgEzWYf_WBnU2goHdsPSsSkDcVg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6 -> 3.5.4
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b2a9c70649112077"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229900

--000000000000b2a9c70649112077
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 janv. 2026 =C3=A0 13:33, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :

> Intention of this RFC is to run full autobuilder job matrix to see if
> there are any failures not detected by my local testsuite.
>

I created a poky branch with this patch :
https://git.yoctoproject.org/poky-contrib/log/?h=3Dycongal/scarthgap/openss=
l_3.5_upgrade
(above my -nut branch to decrease the probability of an unrelated AB-INT
failure)

I've started the build :
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118


> Topic for discussion is especially what should be the final form of this
> upgrade as some users may want to stay on openssl 3.2.x originally
> shipped with Yocto 5.0 Scarthgap.
> Current form was chosen to easily review recipe/patch differences.
> Is it fine to overwrite or do we need to keep both version and make one
> the default and other optional? Which would be tested on AB?
>
> Peter Marko (1):
>   openssl: upgrade 3.2.6 -> 3.5.4
>
>  .../openssl/files/environment.d-openssl.sh    |  9 ++-
>  ...ke-history-reporting-when-test-fails.patch | 19 +++--
>  ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
>  ...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---
>  .../0001-extend-check_cwm-test-timeout.patch  | 32 ++++++++
>  .../openssl/openssl/CVE-2024-41996.patch      | 44 -----------
>  .../{openssl_3.2.6.bb =3D> openssl_3.5.4.bb}    | 76 +++++++++++++------
>  7 files changed, 116 insertions(+), 94 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-time=
out.patch
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.2.6.bb =3D>
> openssl_3.5.4.bb} (75%)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229884):
> https://lists.openembedded.org/g/openembedded-core/message/229884
> Mute This Topic: https://lists.openembedded.org/mt/117416674/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000b2a9c70649112077
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23 janv. 2026 =C3=A0=C2=A013:33,=
 Peter Marko via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedd=
ed.org">siemens.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Intention of this RF=
C is to run full autobuilder job matrix to see if<br>
there are any failures not detected by my local testsuite.<br></blockquote>=
<div><br></div><div>I created a poky branch with this patch :=C2=A0<a href=
=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dycongal/scarthgap/op=
enssl_3.5_upgrade">https://git.yoctoproject.org/poky-contrib/log/?h=3Dycong=
al/scarthgap/openssl_3.5_upgrade</a></div><div>(above my -nut branch to dec=
rease the probability of an unrelated AB-INT failure)</div><div><br></div><=
div>I&#39;ve started the build : <a href=3D"https://autobuilder.yoctoprojec=
t.org/valkyrie/?#/builders/29/builds/3118">https://autobuilder.yoctoproject=
.org/valkyrie/?#/builders/29/builds/3118</a></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
Topic for discussion is especially what should be the final form of this<br=
>
upgrade as some users may want to stay on openssl 3.2.x originally<br>
shipped with Yocto 5.0 Scarthgap.<br>
Current form was chosen to easily review recipe/patch differences.<br>
Is it fine to overwrite or do we need to keep both version and make one<br>
the default and other optional? Which would be tested on AB?<br>
<br>
Peter Marko (1):<br>
=C2=A0 openssl: upgrade 3.2.6 -&gt; 3.5.4<br>
<br>
=C2=A0.../openssl/files/<a href=3D"http://environment.d-openssl.sh" rel=3D"=
noreferrer" target=3D"_blank">environment.d-openssl.sh</a>=C2=A0 =C2=A0 |=
=C2=A0 9 ++-<br>
=C2=A0...ke-history-reporting-when-test-fails.patch | 19 +++--<br>
=C2=A0...1-Configure-do-not-tweak-mips-cflags.patch |=C2=A0 4 +-<br>
=C2=A0...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---<br>
=C2=A0.../0001-extend-check_cwm-test-timeout.patch=C2=A0 | 32 ++++++++<br>
=C2=A0.../openssl/openssl/CVE-2024-41996.patch=C2=A0 =C2=A0 =C2=A0 | 44 ---=
--------<br>
=C2=A0.../{<a href=3D"http://openssl_3.2.6.bb" rel=3D"noreferrer" target=3D=
"_blank">openssl_3.2.6.bb</a> =3D&gt; <a href=3D"http://openssl_3.5.4.bb" r=
el=3D"noreferrer" target=3D"_blank">openssl_3.5.4.bb</a>}=C2=A0 =C2=A0 | 76=
 +++++++++++++------<br>
=C2=A07 files changed, 116 insertions(+), 94 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-ext=
end-check_cwm-test-timeout.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024=
-41996.patch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.2.6.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.2.6.bb</a> =3D&gt; =
<a href=3D"http://openssl_3.5.4.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssl_3.5.4.bb</a>} (75%)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229884): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229884" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229884</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117416674/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117416674/4316185</a><br>
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

--000000000000b2a9c70649112077--

