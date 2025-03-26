Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BC5C36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 18:55:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.31021.1743015333628474174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 11:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c9iARSLg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so1464595e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743015332; x=1743620132; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eiSVDL/Uh33xnhJXasrYTY10iOMBmZfyA+yA77lX5ZA=;
        b=c9iARSLg5paC7twmS/a7i0ZxLTnIhsA3E/5tfSmQ1wFVioUbZB5pqufnX9oW6myHms
         qsPs0k4Y/WCURQd3f1X3Kg28IFpKqW2Nixx5Gj+jbnESy7mI/oG/YZ/ZHgkV/qWquv/2
         v8TTSZMvTidH27RD5KEJXnP6bk6UnUK8tBNbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743015332; x=1743620132;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eiSVDL/Uh33xnhJXasrYTY10iOMBmZfyA+yA77lX5ZA=;
        b=qVSQFLBBMprg3SAqqFlzIy6AVaMLQzXf9Ninyr6AJeikp73mnJy/4NE+K+fOzKKkU1
         gPZIpHWQ5SxIHMpm87OFuuSYaNDZdL9LKgH7CgOk6QfGaP4sxku0fLdXm3SofuHpqQi6
         Okf1sGz7dgcrW24Bi4GyRFD2SrxVlBQtsXfhFaozknZ6nSKKfqTBLJ4cBLK3TbTQ9P9H
         VswgsWSUonRhdI+ixWYVfsHTzaHk1WXiCFUGnKZzka/DMkczty0Ar1MU8r1Bs6sTNCul
         GMGgJODlF2LFpQ0SRFVaFbcE0Lu9kPYvpjRK8Q4YRPGk4yeCZcNRNnJWBl0iYkixeSY8
         XNQg==
X-Forwarded-Encrypted: i=1; AJvYcCUSEQ/kWvPDTtXhZ/TStySfmPJsgSl4LKbVKOJpm1mrYIF+D1ry3OJA/Rvw6SWi4iWutT9xdBdG+baEeoPT7aFwwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+clnKjlomtg+ZUJQVICbNiItmwscrUIA+Cm/qBDzJZj4v0nVm
	GZyrcnkW5JNmF7igVYUY2upJAy3gKFzF0y7ejbtDE2ieb7dN6k686egzwKu8D0w=
X-Gm-Gg: ASbGncuttFhDsVHFD9kKkIfFr/5jMNph0rEa5Oux4AuySERg5E7gq3/RlA60A+lEulG
	C2N6Ss5RRTFXJFWbtLlBnU+Gi3a3GwxgGQBbTjilcQSNMZz0TVU+zVCIqR5yNkPmb3iCy37fS0R
	3Xry6Vsk1ZOy6tKZkPr9+G94g9r4hQ4jUqbx7egEOxS3KnoUoZa9OiRpeNsW6H7obv4UZ56GJuL
	tdASF9nD5c0lzBNlBYDlMG9wl/rNb5dGBMJrvXTe0HKPN6EWBytXTrXGJ0u73roYyQKtdBxAXTk
	SqIVs8CQIhh1NuEHE3DuGc3rFvDAfWOVmA052KMUJ8X0Laa0OBpIC/KlRGPg5xSq5NQ+ITrXBQW
	O/Aw/LV8kzpZpsLplpb4kQRcuIVxWtix9ww==
X-Google-Smtp-Source: AGHT+IEFh8JJ6R1q6W8POOE7m/cr8i8Tg8N4Os8uvnTqWEMncW+0DaSF1ZIExQHBBI1JJqrr5eUoew==
X-Received: by 2002:a05:600c:1d1b:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-43d84f9a35emr5762665e9.11.1743015331951;
        Wed, 26 Mar 2025 11:55:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fab8:513e:e094:22ef? ([2001:8b0:aba:5f3c:fab8:513e:e094:22ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b55cdsm17720635f8f.52.2025.03.26.11.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 11:55:31 -0700 (PDT)
Message-ID: <296b0e95be234db91dfaa8164e45d035973aa459.camel@linuxfoundation.org>
Subject: Re: [scarthgap] recipe's sysroot misconfiguration in multilib
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Mar 2025 18:55:30 +0000
In-Reply-To: <5be84788-6fa5-453c-83bc-d547246dc037@bootlin.com>
References: <5be84788-6fa5-453c-83bc-d547246dc037@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 18:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213657

On Wed, 2025-03-26 at 19:47 +0100, Joao Marcos Costa wrote:
> I have been trying to set up a multilib environment to generate=20
> libraries built with Control Flow Integrity support. The gcc toolchain=
=20
> is already patched to support this custom multilib ABI, and it is indeed=
=20
> capable of generating binaries with the CFI flags.
>=20
> I am, however, facing this strange issue where a header is not found in=
=20
> the multilib recipe-sysroot (i.e., libcfi-recipe-sysroot) of a given=20
> package (e.g., zstd), and do_compile task fails:
>=20
> libcfi-zstd/1.5.5/libcfi-recipe-sysroot/usr/include/c++/13.2.0/cstdint:38=
:10:=20
> fatal error: bits/c++config.h: No such file or directory
> > =C2=A0=C2=A0 38 | #include <bits/c++config.h>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make: *** [Makefile:248: Options.o] Error 1
>=20
> The strange part is the header is there:
> libcfi-recipe-sysroot/usr/include/c++/13.2.0/riscv64-freedomusdkmllibcfi-=
linux/bits/c++config.h
>=20
> Another strange aspect in this very same context is: the=20
> recipe-sysroot-native seems misconfigured and incomplete. For reference,=
=20
> let me use libcfi-zstd/zstd again:
>=20
> zstd/1.5.5$ ls recipe-sysroot-native/sysroot-providers/ -l | wc -l
> 66
> zstd/1.5.5$ du -sh recipe-sysroot-native/
> 457M	recipe-sysroot-native/
>=20
> libcfi-zstd/1.5.5$ ls recipe-sysroot-native/sysroot-providers/ -l | wc -l
> 27
> libcfi-zstd/1.5.5$ du -sh recipe-sysroot-native/
> 194M	recipe-sysroot-native/
>=20
> Unless I'm missing something, shouldn't I have roughly the same values he=
re?
>=20
> Besides my TUNE_*, DEFAULTTUNE, BASE_LIB values set up, I also added
> 'GCCMULTILIB =3D "--enable-multilib"' to gcc-cross.inc, to enable multili=
b=20
> for the cross toolchain. Could I be missing something, maybe with
> recipes-devtools/gcc/gcc-multilib-config.inc?

I'm finding it odd that you have to add --enable-multilib since in
general with gcc-cross, we use separate cross toolchains for each
multilib. This kind of implies you're configuring the setup differently
to how the system would expect.

The recipe-sysroot-native/installeddeps/ directory will show you what
is installed in each and might help narrow down the size difference.

Cheers,

Richard

