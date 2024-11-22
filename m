Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E25EE69185
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 17:02:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.29681.1732294935025852996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 09:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XLUkJFIt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431ac30d379so20944675e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 09:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732294933; x=1732899733; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsZV7oWRhf9ufTAPQmr626G+llk5Y3yrO79RqWSRfzE=;
        b=XLUkJFItmJdBTe0ldhfrHfo/cDNVHtUU6+lM+CLy1HjKWxzwhrtQWO9YAjqsVIYBUG
         16ntuysCXHGS0YQBg4WskHtzTESXnuPJR3UmMcoLW5t5G+QabLCtC5Nhsab3JpS9umJT
         5t1B0dEzMwt2+iJYzfm6RzfM0AZXx2Sz4syLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294933; x=1732899733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LsZV7oWRhf9ufTAPQmr626G+llk5Y3yrO79RqWSRfzE=;
        b=ZKsaSqpztUYhEQIojWX9MGCcMwf+n3VIY88sUS3Zpy1ibPNC2I5VIF+zujwKbmXo2Q
         WyWr5vyThhYrGoHOG2SpFLwW5Qxuuszf0hU09azTl/XQyB9zf6gd2VkLFAUsa1pyMRIi
         hekD/pxKchn+qWu7vMbzUGEHoOaDfKn6BeoFdPnTRGa6EPXc/msWCb7U1h+g/sw6Q+1B
         MODamAgqfqym3tEwOemcH352Xl/jBe9Vr1PUz+yzEPVluwonzokCAZtgfPcmJiPdhIAe
         1pmxBxH6PjqcyChMQ5kD/DgWTpKOlIvzLWO0OvjtDY43TzLX1UwvFov7FDiG21c5KF2P
         m89A==
X-Forwarded-Encrypted: i=1; AJvYcCWmbVVaYocbF/xIhOLj6XUJ+37LGQQjXYGoBUK7nsVTlO9xDESa6MvUJ/Swn3X+k1G1f0H4/AUWnNEdrOYuyBrEoA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyukbeQXzZvKHwWhGn1mgArSlnV0Rh2jb6Upqit2PrkvrQyfdWc
	OEpK7rgERLgOwOJXMNsy865bnfazfoemSEB+OB4Bo+ce2tvUK+kro0x5H6AurLk=
X-Gm-Gg: ASbGnctOMsXGr/BrTheZauSGDFkJw/zodAb9jGu7HQxo4SXM5keyrahgwBTsLVdcAQV
	XnKNjpbrf+bJpMD+WyTs6/AxBrAYOiR7uBwek0gtIHD6nbvVRjxTk7IszQAoEdeLnx1LaHkBfUR
	ydZf+47Uomj1e8y/NFF/8kvKSLSc9f4xv36AsCFKbo7APxAl+V+WVGY+PDXiniqjARTp3gJkuQn
	VdVyGPr1IDJJw5BesVsHxfXz6QDf9Ur0sC181kZultDGgaXY1I1wi+7h7IeVaeJShQ5WqC/0jWT
	SfUJA78solgtSTRLvrz17i7BF/Smi0Zo9Ih9Ux4=
X-Google-Smtp-Source: AGHT+IEbqlPSQG4J+Uft7dXs1OWxAgmq5VIvKudxy55JrGAeMj/7X/EyERN8hIezIRDKGi/HkVE5Yw==
X-Received: by 2002:a05:600c:1f88:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-433ce49112fmr28468485e9.23.1732294932843;
        Fri, 22 Nov 2024 09:02:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2? ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde98b5bsm33397845e9.44.2024.11.22.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:02:12 -0800 (PST)
Message-ID: <5dee23092f00a4607ae0ce0b50f23fdd4798d0d4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] Added a new cargo-online bbclass for
 recipes requiring remote crates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: karem.ibrahim46@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2024 17:02:11 +0000
In-Reply-To: <20241122133140.1627-2-karem.ibrahim46@gmail.com>
References: <20241122133140.1627-1-karem.ibrahim46@gmail.com>
	 <20241122133140.1627-2-karem.ibrahim46@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 17:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207642

On Fri, 2024-11-22 at 15:31 +0200, Kareem Ibrahim via lists.openembedded.or=
g wrote:
> - This change was intended to abstract user from having to set compile ne=
twork flag to get remote crates
> - as network access was disabled by default in kirkstone version
> - I faced an do_compile error with bitbaking Qualcomm qcrosvm under yocto=
 kirkstone with message "Could not resolve host: github.com"
> - And after some hours of debugging I noticed that cargo inherited by rec=
ipe needs remote crates during do_compile of the cargo.bbclass
> - It was fixed by adding line do_compile[network] =3D "1" to the recipe
> - So I found it more convenient, since cargo build usually need network a=
ccess, to abstract users from these details of cargo.bbclass do_compile
>=20
> Signed-off-by: Kareem Ibrahim <karem.ibrahim46@gmail.com>
> ---
> =C2=A0meta/classes/cargo-online.bbclass | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
> =C2=A0create mode 100644 meta/classes/cargo-online.bbclass
>=20
> diff --git a/meta/classes/cargo-online.bbclass b/meta/classes/cargo-onlin=
e.bbclass
> new file mode 100644
> index 0000000000..175c94e09d
> --- /dev/null
> +++ b/meta/classes/cargo-online.bbclass
> @@ -0,0 +1,7 @@
> +# This bbclass is added to abstract recipes writers from
> +# having to set do_compile network flag to 1
> +# if his cargo package need external remote crates
> +# as network access was disabled by default since kirkstone version
> +
> +inherit cargo
> +do_compile[network] =3D "1"
> \ No newline at end of file
>=20

We can't take a change like this unfortunately. Fetching outside
do_fetch means DL_DIR is not populated, our source mirrors would work
and our software/license manifests are incomplete, all things which we
have people relying upon (including for legal review).

As has been mentioned, we have made changes to cargo since kirkstone to
allow all the crates to be specified in SRC_URI so I'd hope there is no
need for this change in more recent versions of the project.

Cheers,

Richard


