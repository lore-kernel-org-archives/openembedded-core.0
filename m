Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92B4C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 13:18:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.12331.1753190300076480089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 06:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PoyYMJtH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2524086f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753190298; x=1753795098; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4NQBNlVyzX+pPV9PEIQQH0n04O0CXb7fzney4oDAdc=;
        b=PoyYMJtHfgFl0rdBxcY02RLFwGOLBhQWAfXS1NU5hWXnoMBBPmfw1hmyo7iBZmQxuL
         wvXR1iyWs4uECqrQ7F2TK3ljKSRwou1FalJ4uQ9hiqpefkMjiOgIQ78SChK5j5j7Rmt0
         9otzDb7jBwL8clKSp+g0WfBhd8aH/1ZHq4GM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753190298; x=1753795098;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4NQBNlVyzX+pPV9PEIQQH0n04O0CXb7fzney4oDAdc=;
        b=CfXOt6QXzYolI2Ui9EtOZjQbVo6dC3+p4yXGMkMH7d3lfze2y4kFw83kWYPJCODNJq
         YFAjdfAonigUS4IvY+zmk5GKv5rX72wpGS5yDRYvGVFgSzBuO/ZLNdCfdgk9THgy6IoY
         1ogr0/J1FcJPLLMpJg0jCgRavlT3Jv4khgd/UkmMK3V4u6E+cUHtMZuRAsrlBrbbg/Ju
         7kXU5+5T4BijTyCpH6OyouuSkfXsRIsSmlF3L8vGseJkoXI93mqnmkmQadBMJhLA162W
         Jnyr+peYzFinlD8OODGt9QucV2KSf8tgqicLQRbugJCK1fk8tZRg6RQr3It/tzupIGV7
         Z+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS6AAgxE2D/cx+UwHVms2JT6Z4AQvx3I8cahWAE/7QS/Kd6Kh2cF6DVL+gci5eiL0uV6REVP63+EaK/rv8XxC+dQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxkWaNj/4S01apZQ87BrXEdnyd0fE88ueDCmrS3P03FpTmiuuNG
	bf/hkqiFHRs3d1JJ2Dd6D2kpnLqE7mPyv25uNOV6LwNd1YHe0ASOERkemTrOd0pAlzc=
X-Gm-Gg: ASbGncvSgUaCyALb3jdsalHhLGQEWEQ7VOctv2PYgprBvYzKJAAvcjniX0Pc31gVR8n
	MNDJonJ6kKY8gRHvkMNQqnF0O0DrmoKAbFjd5MuoVT1eRaVC2XZuCmf/IZY9SYD70qBOUsxwW9Y
	7oL/2UAWZ2/1qNdtblo9aDIf9E2pAcuZz/fceNhaLE2e6padX0vTSi0yZptvhjid9W/f5NOQ5sq
	adYGzaO3ryDahKNi7chXT8sI7S81Ml+qZUkpgN+E0ywuYo1QTe1fxZdFsF8pub5n6zx5wI6k91k
	mvcXGAlT/8Yl0anok/6XIsjcjtPonwU0vbU7sHkdEF1TBGEurjInnDkElYHZWbQJgSYrUD1xNj3
	z1S/ehi+N4lvRZX9Tl14DMUOVViF3RNcphfjHlCXcEgz5+RLrNlhQLXr7bO5fiPNurTgotJVezf
	ZH+jdmm0M8
X-Google-Smtp-Source: AGHT+IETFFFU//9r7+v8I38KvpJl04BbsX9TTx2OvOa/H+ktilwTBou1TKxJKliyaucIwgmrZzvqCg==
X-Received: by 2002:a05:6000:460a:b0:3b5:dc04:3f59 with SMTP id ffacd0b85a97d-3b613e97badmr14444899f8f.37.1753190298156;
        Tue, 22 Jul 2025 06:18:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d90:ed57:78f:a937? ([2001:8b0:aba:5f3c:7d90:ed57:78f:a937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2c013sm13457370f8f.33.2025.07.22.06.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:18:17 -0700 (PDT)
Message-ID: <65edbfaaa12089b5483042867d663fb46e488b82.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] libxml2: upgrade 2.14.3 -> 2.14.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2025 14:18:16 +0100
In-Reply-To: <20250721082103.2262095-4-hongxu.jia@windriver.com>
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
	 <20250721082103.2262095-4-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 13:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220746

On Mon, 2025-07-21 at 16:21 +0800, hongxu via lists.openembedded.org wrote:
> diff --git a/meta/recipes-core/libxml/libxml2_2.14.3.bb b/meta/recipes-co=
re/libxml/libxml2_2.14.5.bb
> similarity index 97%
> rename from meta/recipes-core/libxml/libxml2_2.14.3.bb
> rename to meta/recipes-core/libxml/libxml2_2.14.5.bb
> index 4baab59186e..52b2040122b 100644
> --- a/meta/recipes-core/libxml/libxml2_2.14.3.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.14.5.bb
> @@ -21,7 +21,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/CVE-2025-6021.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> -SRC_URI[archive.sha256sum] =3D "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d8=
4ac5d3c7ccbd9344d8cc6833"
> +SRC_URI[archive.sha256sum] =3D "24175ec30a97cfa86bdf9befb7ccf4613f8f4b27=
13c5103e0dd0bc9c711a2773"
> =C2=A0SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8=
d83e69a2be4722379f08702ea7273"
> =C2=A0
> =C2=A0# Disputed as a security issue, but fixed in d39f780
>=20

$ wget https://download.gnome.org/sources//libxml2/2.14/libxml2-2.14.5.tar.=
xz
$ sha256sum libxml2-2.14.5.tar.xz=20
03d006f3537616833c16c53addcdc32a0eb20e55443cba4038307e3fa7d8d44b  libxml2-2=
.14.5.tar.xz

which would match the failure on:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2060

Any idea what happened here?

Cheers,

Richard


