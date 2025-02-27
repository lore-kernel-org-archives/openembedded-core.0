Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EFFC19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 23:38:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.4333.1740699527363587379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 15:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XTe+bB/Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394036c0efso9912475e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740699526; x=1741304326; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD9+M+bpODWJBZajQfh8oX06NeW5CdoVj5kzjejFxSo=;
        b=XTe+bB/ZQFlnxndiVNv67FWSL5fYZfpW0BiOJI7DFlr/8/0mfWGG/WFVvojl9VcY7J
         ODQSWSXQaSbLMam1h2Jj3JN94we6/AWR62AKH2msEuqMfXGke+bn9iDIooEhXthUBPWw
         Ez2BUTUocWTi41SmJ2ib/zyEMAJgUn4rZWmME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740699526; x=1741304326;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nD9+M+bpODWJBZajQfh8oX06NeW5CdoVj5kzjejFxSo=;
        b=bg+OBZxOs1NsNg73LxaYRbQagmm3Wvg9DojPw6LloinHAanuWiqFgTFB9aFJCLz7YX
         mprNdqp+JrmfIvlanI/DNkINkFHGipI+JqqYmkgINOCSbzwFxAemj5C1MgeHTLV1DQD2
         Kv1FpE6Y1GIU2WrO2xXIU6nda2tVkD/LmVfPntB52VKJcws8e1C3iMZUhH98eQ1ZF8Ek
         sWLQDf53RbJqMA/Zo08zNTd1W+Re529WD7+qRAHug/SkuTnlVAYggwrI/cM2HU50ikmT
         qFPdDts+a2Jrmn22cpGJGADAo+x9ZsEbCURSd5ONGJvPl6JGYylYYSgHI/H/4C48cN7T
         0Prw==
X-Forwarded-Encrypted: i=1; AJvYcCVnse0UnmzeL1w6Ci9qu7nwC3RxD4CLaBSwAbkKWL3vmXcK8HNbWfdz+FD2Lzd8bqxz+VqTpmQxhNqky+vEvGG7jw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwaHmmEzd48yFkmXsnTOMTZxGMFx80p4aHvmLw56mzCWdQIbsR0
	tuQ6EBIMhQ1gOJTIyxqCVgLIrQpEc5pSkWNaWthR2/kzMtXz0rTG9NAkzP3FmyU=
X-Gm-Gg: ASbGncvqaQ6whUBIsDuIg4Zh3fqvbNA2JgGT0/GvGinu8H0KNsDLa3ITeKT3FbCinKe
	0Er9wZhIo0u/99meSWny2lAnpAYwEMzECGY06dQKdrYs38zUQCPklomLYac7TzWmULnJilvZj+d
	T3igKak3LtGQKGMROOlFITbZ5ujKZt6Mw7rZFTltg61uxI+lVASPr3d11THUq2GjTvA4JaLEm35
	rIBEIaZ78/MI2kUE9M4hfEH0rnmVV32Bxzi/DtxUavKc59f/Dqh2JmY6M/rwWOlCl6vJeeMtuj7
	dbdbI77c/rdJDXemqpBOp6b3IOwBPf58A+sHjzE/50bVlG7RclHzwl7Ydd3PpKwcXilCWtHu1so
	R9al62G2gyl4KctY=
X-Google-Smtp-Source: AGHT+IH3Cib3KLxJWVadIU0ptUWpBozr4ZGjQAnEshCq0GeEv8yZQja8EAm2jF5txs0sX4p9pjM+aw==
X-Received: by 2002:a05:6000:18a6:b0:38d:e15e:17e9 with SMTP id ffacd0b85a97d-390eca48424mr1045049f8f.35.1740699525774;
        Thu, 27 Feb 2025 15:38:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:26a3:608b:106c:59dc? ([2001:8b0:aba:5f3c:26a3:608b:106c:59dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d6dbsm3386240f8f.82.2025.02.27.15.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:38:45 -0800 (PST)
Message-ID: <dceb0f9c296697e602130580eb4d07ae6f3a3d9c.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] xserver-xorg: upgrade 21.1.15 -> 21.1.16
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vanusuri@mvista.com, openembedded-core@lists.openembedded.org, Ross
 Burton	 <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>
Date: Thu, 27 Feb 2025 23:38:44 +0000
In-Reply-To: <20250227042032.10655-1-vanusuri@mvista.com>
References: <20250227042032.10655-1-vanusuri@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 23:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212044

On Thu, 2025-02-27 at 09:50 +0530, Vijay Anusuri via lists.openembedded.org=
 wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Includes security fix
>=20
> =C2=A0 * CVE-2025-26594
> =C2=A0 * CVE-2025-26595
> =C2=A0 * CVE-2025-26596
> =C2=A0 * CVE-2025-26597
> =C2=A0 * CVE-2025-26598
> =C2=A0 * CVE-2025-26599
> =C2=A0 * CVE-2025-26600
> =C2=A0 * CVE-2025-26601
>=20
> Ref: https://lists.x.org/archives/xorg-announce/2025-February/003584.html
> =C2=A0=C2=A0=C2=A0=C2=A0 https://lists.x.org/archives/xorg-announce/2025-=
February/003585.html
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
> =C2=A0.../{xserver-xorg_21.1.15.bb =3D> xserver-xorg_21.1.16.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.15.bb =
=3D> xserver-xorg_21.1.16.bb} (92%)
>=20

This seems to break qemuarm at runtime:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/1085/ste=
ps/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1077
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/1075

Cheers,

Richard


