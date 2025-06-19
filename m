Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A56C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 11:21:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.12416.1750332072011278229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 04:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O5c0sZZf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a54690d369so702672f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750332070; x=1750936870; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un/4KuJXR8Ag5YNVt/5rxmgor2yyMjqe529DikXoUBU=;
        b=O5c0sZZfY57kf4lg/3SzAR6fpOl3zztVSpJ/aJbwHbGnt3YtdrfVBHm51D841GzgiY
         FluY1MzE5rPdSiQgJ8sEIi2kikTYQnTC+rtVbSAQ4N738h/jodpcPLMS4l8ApkhIM4uH
         i0+r3JNhq5XpX8ASL7deRcs1ZtcbOiuMexLFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332070; x=1750936870;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=un/4KuJXR8Ag5YNVt/5rxmgor2yyMjqe529DikXoUBU=;
        b=WST6n/0kxIm6Kbm9AszUlb0wBEpFL3cGiqDhxRZGxXQCy2vh2Lg39s6No/9/KTe5Jt
         KT/yIQhlUS1nuRf3JvewyJSzjKi9n7P/Kq7KsS4ALPMeoZV19Mxf8QRmdcapTsg3i2xK
         TOm37H8ITQAvn3v/fHiCLQw1jJfyFuNiq0E88UpuxT4O9jlODXRbGxV8urNdAeIMBB0I
         gij9rlmSHRHvpfcy1S727eTQ3OZtvBVuGowIjrzrmPyOguisD4hW6Fuea1ZgklEtYsS+
         JE8MPUgAkAJ69aSKw73HmuDPGnGNnxMj4wlibp18MXbpkXVo6WgwWi3/MWSyYlbsdsfZ
         lkag==
X-Forwarded-Encrypted: i=1; AJvYcCUhfekUOQhldiwIqMwLld2l3SEJm86xl8lt2AT1uYA9lzdTdpq8fU+bF4s307T4lGEUE6OiwxRtVZ+0ruIuYCFe7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxT/V/C1Ma5cXr7rhCmndF/LVro6Ef2+EQqCRt596dk0yYL7iUP
	u14xPKCNYn7zQjQzpzyyo2pg9u4ODMfV+sb0ibeW3qACOAjjq+lePbvO/Vvu+y9i1Bk=
X-Gm-Gg: ASbGncuhXEFZ/5qsIdBGhuQ+L+ydohrU2KeWmZpDNWKtf+avq6n+UENNzsuIJrgS6Vz
	r4/qz7ZC7y/jb3yC9TVE+bC0fZQy/IcuI3e5qAJyl8IvBb87XzwZD3xDwnEjfLUhnLSzkjdivSY
	/dKRsptKzttHI0vUOADbojdqHHJOwJFEnWFUy4PI9EHDoo+fIILYr2sVIlRFjdoThAlaxd9Hf2V
	NB+xJGbiKOYX/60bi7OlfzRSo939LVEOBDl+N6JRYFw+puyqfYo9tPh0PKlXxHiusEZ7t/jtiCO
	EmALnvYUo3GseVcI3K/nxHx1+x4ZC9maKdm5lcYJ1GV5D75bi8cMQxOHmdi/uCNETumpsJ+GwL4
	kxes76tKDyn1QcnKImlq/IWKslFJCA1y11RLn7pvFu0WGuCWx4lM=
X-Google-Smtp-Source: AGHT+IHYCJLXJ0SUZx/8LtiVU/u5YUqLoH/f9+JOgY25nTNrIh93gAei/2pd/jgaKM486CdVvMinjQ==
X-Received: by 2002:a5d:6f11:0:b0:3a5:2599:4183 with SMTP id ffacd0b85a97d-3a57237de5bmr16160311f8f.25.1750332070167;
        Thu, 19 Jun 2025 04:21:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3cd0:8416:eb6b:7b5e? ([2001:8b0:aba:5f3c:3cd0:8416:eb6b:7b5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm19523496f8f.15.2025.06.19.04.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:21:09 -0700 (PDT)
Message-ID: <dcf64e281e9fd6a81d3e3ec9fc7088c1cd09d06c.camel@linuxfoundation.org>
Subject: Re: [OE-core] perf: nativesdk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: andrej.v@skyrain.eu, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2025 12:21:08 +0100
In-Reply-To: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 11:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219068

On Thu, 2025-06-19 at 09:53 +0200, Andrej Valek via lists.openembedded.org =
wrote:
> I know, that what I'm doing is not fully supported way, but... . I=20
> wanted to build the perf for target device (aarch64), record the data
> and analyze them on the host. So I extended the recipe by adding=20
> BBCLASSEXTEND =3D "native nativesdk".
>=20
> After that I have compilation failure do to missing manifest.
>=20
> ERROR: nativesdk-perf-1.0-r0 do_configure: The sstate manifest for task=
=20
> 'linux-libc-headers:populate_sysroot' (multilib variant '') could not be=
=20
> found.
> The pkgarchs considered were: machineA, cortexa53, cortexa53, cortexa53,=
=20
> armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
> But none of these manifests exists:
> /home/build/tmp/sstate-control/manifest-machineA-linux-libc-headers.popul=
ate_sysroot
> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.popu=
late_sysroot
> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.popu=
late_sysroot
> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.popu=
late_sysroot
> /home/build/tmp/sstate-control/manifest-armv8a-crc-linux-libc-headers.pop=
ulate_sysroot
> /home/build/tmp/sstate-control/manifest-armv8a-linux-libc-headers.populat=
e_sysroot
> /home/build/tmp/sstate-control/manifest-aarch64-linux-libc-headers.popula=
te_sysroot
> /home/build/tmp/sstate-control/manifest-allarch-linux-libc-headers.popula=
te_sysroot
> /home/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-linux-lib=
c-headers.populate_sysroot
>=20
> The "linux-libc-headers" dependency is coming from "gcc-cross-aarch64".
>=20
> EXTRADEPENDS =3D ""
> DEPENDS =3D "virtual/${TARGET_PREFIX}binutils ${EXTRADEPENDS} ${NATIVEDEP=
S}"
> PROVIDES =3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
> python () {
> =C2=A0=C2=A0=C2=A0=C2=A0 if d.getVar("TARGET_OS").startswith("linux"):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("EXTRADEPENDS",=
 "linux-libc-headers")
> }
>=20
> This function adds the dependency without respecting any=20
> native/nativesdk variant.
>=20
> I know touching the "PACKAGE_EXTRA_ARCHS" or removing this function=20
> above it's not right way to fix it.
>=20
> How to deal with something like that?

Ignoring this is all a bad idea, something which is nativesdk should be
using gcc-crosssdk, not gcc-cross. gcc-cross quite correctly depends on
linux-libc-headers, gcc-crosssdk will depend on nativesdk-linux-libc-
headers.

Cheers,

Richard

