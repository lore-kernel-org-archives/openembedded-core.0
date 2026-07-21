Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AF3C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 07:22:09 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17314.1784618525025711078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 00:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O98M4pDk;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81ed2a00f12so84775547b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 00:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784618524; cv=none;
        d=google.com; s=arc-20260327;
        b=gqsxYYWfrKjhGjRgBc16FJZ3FPf/c7ip3Z+5vqNs2RqKOskuK4t5bP969BupjRNDgC
         rEnyezGG46vDf2vUjXxQCtn2HUGNRrwknjrZbyTeMJWXo8xUr27RSgT5jFusby3xOWv4
         ef4qytYLjWEsOFLurY0uw/FLOdLSm+h6LWAFjWC5zOuv4o4myUAcPAnQueuzDpP164Fd
         wjSMWDR8Y4/WgiPJ0RCQBhqhX2M1P5CnFUNxbZncii3tXWCRiYfv16rQjSr/hwsW0xJF
         WaeSyCQ64QRrHjnpOAj4qqbZXzakB5OCKVLnBXZm4gwrxoFCq4fNyj9AacEeL+IxVHf+
         2mCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zxr5Gdm23lRUaU4y6VNl10qvacPMCBhMmls5BiyINPk=;
        fh=Oyp0vZkthY33qxuTu49euvFnXWw2uEogdk3yUFh22TY=;
        b=TTCOmYF3oM06UIQgxXPjCimez8zkxhBqGJVmNIBBv0qEvPrPLvetBWzK+MCEvdsRba
         lzg5q3J3nZrRbz78FcH5zNKwyDKdV1iitVZVzGsTVEB3VnQrxZHLs5YRCP7un/hlnnsz
         l5S0sFOMPRC9TbbA0eGw94Sw1o1sfGOTCWZ5qkG0NlNJxTHm5nXgoASkzQ21A2LPXD4d
         Lvnnf2+4oIkF9t5rRzsD/5auM/KAwsHTKu6FK8G+66u8C4j0pAM0tIFciBSXzbBKYJB9
         HzEhklaqav/YwEeLfru6Y5IyndMNtpIBh22CHoNp5xYirzzwkUOAZG3HscHDemAyCbDP
         CycQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784618524; x=1785223324; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zxr5Gdm23lRUaU4y6VNl10qvacPMCBhMmls5BiyINPk=;
        b=O98M4pDkYUcOC43EV/hm4b22N4hmhbqMOc29vYSsPTpq314FKfO17P/Y8jzv3muqZ/
         O87JPtNka5VeiGkIron4sgxo0WG/fca9ZYYqrShoGST8srczBXyrtBMTj0GtflCU5Dvm
         EgA/R7c1tYLLsn6YuoaAuU+VULUVqHEQX55q8DfjcfZRnXIp4VfRK9hpC4SF1WL8SH0L
         3YrK8aW6qMaW1CWd+NG+qwRXn1AW2h/JO3j8fcOdCNlEvPjWaeDfC73Z0zoC9gAwUSg+
         2peV6zUKQQAd3cjCGRStc6Erv4KlCR6CI0H56y3jhInh6bHBFZkM7M9i/zC0baZbJjB5
         MRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784618524; x=1785223324;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zxr5Gdm23lRUaU4y6VNl10qvacPMCBhMmls5BiyINPk=;
        b=YaO52iQv5ek0p+uaA5hP3QF+qHCoPzL0Z9X2d4DmGuo4hpGJchF5TzC45JDULvsYAK
         wLydpvAA2StYfk6YSBSmBMkTg1L9qGqORdws9vvUiBO5sRjemOG3PBWuCrJ44EWYAlap
         x6SEcRSdVdcTmYJV327OebPeaZ9fkopcLnzamqKP6ZKEOO+iMQCBj9O/5hO2Xi5wka16
         a3m/zaK8SJFXVsIMia8gaDodMGztsjM61HNpqcqgLS2lcsiWETyMbB2E21Eke+tjJEGw
         NTM1GiT+xYkAV3FT9PuiRQbBh18Ji41z53XzBeMJfQmIhBTczl1hyvT4UrQKBVj/n+bh
         gqYg==
X-Gm-Message-State: AOJu0YxjjWc94ve9bXFcpvd67uQhBf7cNkp2qQAHwtG6NEXWfrJoh/CE
	ETOXZ/xQ6ZATCVcMHB9lTjmQHrcJtBr24oUFzWw6Mdi7v+RVrYegXHEohpONE8RBfYUqqNas+ZZ
	0EpDnQaVyk54F/EFlhshd6/uimd0Yujk=
X-Gm-Gg: AR+sD10MAReRbTUQld7kTArpLR8DpTjvAhOw7Cm4shDg3GwbNSYyNlpBszv7+nr6pfm
	dHMmZE5CRo73AF6zhBADyqGKAQxwQpIxtF7KUe/6meJUn/p4jHFZ8eEGmSpF8nhPVPHR+uxw3FC
	1M9lGplOgeGIHmjzfl7kbHVuJiI0753TQMwCSVVzwcBsSjEO8xM9KPcWk9KbofZO3Aapmh46Aa3
	/7KcH0It1RrL0fudFCyPqTP8U2abAzVamhTf9ODPgfppjtaojn4f0+SokUAmOlWgBU5ikCTxxyf
	ZwhLGp6nVvA4MJshd4OeykrRVdFx/47Zog1lVvMpzdVPjuZWDRC8fviUFDTkuRxUNZPHGdSaB1D
	Z+1skR5V53Xxf+OWisApO0J7KI1vxcaeM4vVQatS25qlvrj2UwAzNLs4p1AM=
X-Received: by 2002:a05:690c:6b86:b0:81e:eed3:a406 with SMTP id
 00721157ae682-81ef270b0bamr57857967b3.18.1784618524057; Tue, 21 Jul 2026
 00:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260720053526.1992240-1-khem.raj@oss.qualcomm.com> <DK41JOAOYZH7.1CPT2EN28HTX7@bootlin.com>
In-Reply-To: <DK41JOAOYZH7.1CPT2EN28HTX7@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jul 2026 00:21:36 -0700
X-Gm-Features: AUfX_mxW2tbahGPYWZRoicrfYMfvbh6sOV6eWzRFIfk_cp9cWHJEMEbefDSVJyM
Message-ID: <CAMKF1srZf_7W74C80pZf+u07rxC+FmsLs2EX_QiysTQ4z-pmiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libpsl: upgrade 0.22.0 -> 0.23.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000002fa700065719e1db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241509

--0000000000002fa700065719e1db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 11:38=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Mon Jul 20, 2026 at 7:35 AM CEST, Khem Raj via lists.openembedded.org
> wrote:
> > License-Update: copyright notice reworded, MIT terms unchanged
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
>
> Hi Khem,
>
> Thanks for the upgrade.
>
> We do have new QA issues:
> ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File
> /usr/src/debug/libpsl/0.23.0/src/suffixes_dafsa.h in package libpsl-src
> contains reference to TMPDIR [buildpaths]
> ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File
> /usr/src/debug/libpsl/0.23.0/src/suffixes_dafsa.h in package libpsl-src
> contains a reference to the build host HOME directory. If upstream
> hardcodes a directory path that matches your home, you can set
> OEQA_BUILDPATHS_SKIP =3D "/srv/pokybuild" in the recipe. [buildpaths]
> ERROR: libpsl-0.23.0-r0 do_package_qa: Fatal QA errors were found, failin=
g
> task.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4184
>
>
Yeah, saw that on AB earlier, sent a patch to fix it just now. Please take
that as well.


> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000002fa700065719e1db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 20,=
 2026 at 11:38=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathi=
eu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Jul 2=
0, 2026 at 7:35 AM CEST, Khem Raj via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; License-Update: copyright notice reworded, MIT terms unchanged<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
Thanks for the upgrade.<br>
<br>
We do have new QA issues:<br>
ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File /usr/src/debug/libpsl=
/0.23.0/src/suffixes_dafsa.h in package libpsl-src contains reference to TM=
PDIR [buildpaths]<br>
ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File /usr/src/debug/libpsl=
/0.23.0/src/suffixes_dafsa.h in package libpsl-src contains a reference to =
the build host HOME directory. If upstream hardcodes a directory path that =
matches your home, you can set OEQA_BUILDPATHS_SKIP =3D &quot;/srv/pokybuil=
d&quot; in the recipe. [buildpaths]<br>
ERROR: libpsl-0.23.0-r0 do_package_qa: Fatal QA errors were found, failing =
task.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/build=
s/4184" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/4/builds/4184</a><br>
<br></blockquote><div><br></div><div>Yeah, saw that on AB earlier, sent a p=
atch to fix it just now. Please take that as well.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000002fa700065719e1db--

