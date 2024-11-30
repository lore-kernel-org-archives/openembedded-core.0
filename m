Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78E0D735F5
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 07:59:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.130904.1732953589266529868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 23:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VRh/0uMF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e06af753so728509f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 23:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732953587; x=1733558387; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C20SNQaZIzd8tK6kNQocC03mxeZlqAhaD6CM7e8ItD8=;
        b=VRh/0uMFNOEYaSX5yR/wEFNIDnUuJRHPupiieuUvAijngM9MpmX9V8ioN52EWmUqYg
         az//phx4aO3N/FThNxaTahL2C6Y3GvY6IrZ1pnvXhDCaNA8m9IEB9vbzPYcqig9uqQ5U
         71v25Dwuyu4qjm3HURWzyUk3SxpW4ctS7AqrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732953587; x=1733558387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C20SNQaZIzd8tK6kNQocC03mxeZlqAhaD6CM7e8ItD8=;
        b=KhP/jOOmsFodXCGX87VcBjsZhoRUzkj4MjZaQFmHEMt+2hO8WBryXlguOzDhQwUnjD
         lv4Qt7eCdu/hXrE3x7yZqSyDlmpcGduH0SVecffVuFfKLNw82GSbU8IdUatbxmfkBQFR
         /Uk2Mg66ZZBpwK/y504bheXIRIUvFXYzuecmetSOkeogvaYYK96DtL53pVO1qDm8Bc/n
         QVcoL06JZquqS48aq+eUC5n7nNThlWmp1IyHX5LZbtLt7j4tIMviNr1KaA8Gz1Bx7dCs
         oDM+UtYYqpbtsGecvhMRQLgVo4CLzCtCjwYqUUhIpTIAp7ilyvDp1SeJBh6QzsS4NlMH
         nDAw==
X-Forwarded-Encrypted: i=1; AJvYcCWHrDEhikJ3rqtv3ytNaZX4+QSJw/z/NzLpAi2kYrPzafN+Igxz7Ix99CKg8/T3d3F071seqSVEAYnQa2TwZuj2Pw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzmgIbKSILNFHZHnb9U96WH1bhA2eSX+4HshfruFgNuTCD2jgeZ
	BaUBh3f9idGyCvF6CXxWpmvyOEPw6WCQzZF7BnF2C83gkbfPI34f2GQpD+tY/64=
X-Gm-Gg: ASbGncsFUoDDb+SwY014Uug1jbhl/wUlArHU6c1SKjFdIBdLDf7ll+PWxc5tFwidsGi
	K4N/Bz3PnYzMqhgRyuCbFLJVYFCZywQsgFDedrPHUmEssd/CrPXWBCzycMgTS7pq6RaL5knRb/O
	Sk6ZTVL6dbqDT6m0uf+nk4CpF1s77BGtJz7qsoQMk7ZI/xCkPhUFrrS76/z+bfMhUWG4Pl1+ufk
	wpYoNZdEd9Nioa2p6xw6cknoYrBw7Jdl/VxdGe6HAlev3/RuPqTZuK4jv8dXrRUNqvP5rX3CNVi
	L9GfRMO7KvukD5++W6iSY2XCF6Ep9+nl1Q==
X-Google-Smtp-Source: AGHT+IHmH8Ak77TYx/a3gyzVu20moW2zvn5jyEoFe6D6Naw2GOHcAbI0FBxkIljE/TpNa842pmIHaQ==
X-Received: by 2002:a05:6000:184e:b0:382:6f2:df7a with SMTP id ffacd0b85a97d-385c6ec117emr12944736f8f.34.1732953587205;
        Fri, 29 Nov 2024 23:59:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b9:609c:bea3:27d? ([2001:8b0:aba:5f3c:1b9:609c:bea3:27d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd7ff49sm6438139f8f.96.2024.11.29.23.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 23:59:45 -0800 (PST)
Message-ID: <aed2fa753aa344a75fce5a73d7e7cfa7e679a369.camel@linuxfoundation.org>
Subject: Re: [OE-core] Patchtest results for [PATCH 2/2] systemd: remove
 custom rootlibexecdir and replace with nonarch_base_libdir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, ricardo.salveti@oss.qualcomm.com
Cc: patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Date: Sat, 30 Nov 2024 07:59:44 +0000
In-Reply-To: <CAMKF1sqAQb37_SggTcKqij7Bj8NgXra_kYB4ttb5DXL3fA_szw@mail.gmail.com>
References: <20241129033654.1275825-2-ricardo.salveti@oss.qualcomm.com>
	 <01010193760741f1-9fbe5e5d-8d96-4d65-8dbf-e5163559acdc-000000@us-west-2.amazonses.com>
	 <CAA_5yov2dE2SukEA2ipVThDmMv=vFQKVPBhn=fN36nUOb-NUUA@mail.gmail.com>
	 <CAMKF1sqAQb37_SggTcKqij7Bj8NgXra_kYB4ttb5DXL3fA_szw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 07:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208036

On Fri, 2024-11-29 at 18:23 -0800, Khem Raj via lists.openembedded.org
wrote:
>=20
>=20
> On Fri, Nov 29, 2024 at 10:58=E2=80=AFAM Ricardo Salveti via
> lists.openembedded.org
> <ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> > On Fri, Nov 29, 2024 at 12:46=E2=80=AFAM
> > <patchtest@automation.yoctoproject.org> wrote:
> > >=20
> > > Thank you for your submission. Patchtest identified one
> > > or more issues with the patch. Please see the log below for
> > > more information:
> > >=20
> > > ---
> > > Testing patch /home/patchtest/share/mboxes/2-2-systemd-remove-
> > > custom-rootlibexecdir-and-replace-with-nonarch_base_libdir.patch
> > >=20
> > > FAIL: test max line length: Patch line too long (current length
> > > 224, maximum is 200)
> > > (test_metadata.TestMetadata.test_max_line_length)
> >=20
> > Caused by:
> >=20
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$INTERCEPT_DIR/=
postinst_intercept update_udev_hwdb
> > ${PKG} mlprefix=3D${MLPREFIX} binprefix=3D${MLPREFIX}
> > rootlibexecdir=3D"${rootlibexecdir}"
> > PREFERRED_PROVIDER_udev=3D"${PREFERRED_PROVIDER_udev}"
> > base_bindir=3D"${base_bindir}"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$INTERCEPT_DIR/=
postinst_intercept update_udev_hwdb
> > ${PKG} mlprefix=3D${MLPREFIX} binprefix=3D${MLPREFIX}
> > rootlibexecdir=3D"${nonarch_base_libdir}"
> > PREFERRED_PROVIDER_udev=3D"${PREFERRED_PROVIDER_udev}"
> > base_bindir=3D"${base_bindir}"
> >=20
> > Didn't want to break that line as part of the change as this is
> > basically a sed.
> >=20
> > Can break and send a v2 if needed.
> >=20
>=20
>=20
> Perhaps send a separate patch since it=E2=80=99s a formatting improvement=
=C2=A0
>=20

I think it is fine. The check is there to stop people introducing
really long lines if we can help it but this already exists and
personally, I find it hard to get worked up about line length...

Cheers,

Richard


