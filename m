Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BF7C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 07:49:13 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.6481.1705564145087719399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 23:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ArpsId88;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd8bd6ce1bso77809351fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 23:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705564143; x=1706168943; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oF3VnrFNRlYfvDW3W/Nc6uah2s8ucWTLW7cr78vDPrM=;
        b=ArpsId88/60BvDPPEaIMf5VYg9Xp9Kf114jJpnxUlY7BicO3d7PHEbi24/iM9/7EoF
         C1zT3Ti3PtZxaLdfCqz4wOMoNq4R3JDHAssw0ptNdpdmRPgoRu2SBQwqRDjxe+FoOJ8v
         pQwevonTqLfaX8sy8eCsbGTvUB/J+x6nUobqDJb0eztASuRs0yYNPBARiJW52+kY6FWo
         Gf1tChJRZTFD0i2WJrHYL2iFZGAL/aCpE+TQKASYtCYIpe6ev8nTPG5MwQzzyWI44nLb
         KSUtASc5ppSfAzm5vEAssCbkFzsh+mmdnoVPpuCW3nxtQIj1K4Rl3+YP2Tv7Zf+oimOR
         bSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705564143; x=1706168943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oF3VnrFNRlYfvDW3W/Nc6uah2s8ucWTLW7cr78vDPrM=;
        b=JQhQrP3cL0P7u3zrhjT/56uGmh9pxQ19a+kR2l8rMBCHcebUSfJnAVky4mFYrHDMZ1
         jT+wXcKpz9Femo/NOaE9kSgR4FTeu24nXF8582yXZp1Obf5apW67AEwjGmyEdla5HEgt
         3M89rWCb7WuMqt6V6HiYs9Lamcc+VV0Wvc8ZmwefWQs1n6sNs9lGR2NDboB+0b+/jsUo
         RLxNOmPcYTNy+JjmmLeQQDStLuqEI6qmWJOgCCtNarspkn4VjzCA8yfaa6SE3FB7x+bf
         mKXAGDI8D2EuDVerfHcpxgY/HJ3SsAJ+840NBAx9m+Um+mifAxd8+bGIi+Kg09uYzEb6
         0d8w==
X-Gm-Message-State: AOJu0Yx++S/prDkI/2N5mQxXm22IAokdTAiBiFOfh2JAlcMIsoxrm6LG
	Km0RQAOMG6JXhpddLbJkUfuHD0OYJTWO06Q8VI+erZXwMMXaOONfgXxpgUCxSr3f4dvumkS1IAZ
	UfTFqIxq0Py+K6wkp2+qHZeHlFQ7XlqrW+EM=
X-Google-Smtp-Source: AGHT+IEm9lVMWJUJWgWmXhqZsCL6N3Yu8v3qs48/UeYOZ/o0LUSzA+f/e6dfp+URn6lFcIQFT7Jgf8fRTtO9fRAHC/k=
X-Received: by 2002:a2e:9b4c:0:b0:2cd:70e9:3327 with SMTP id
 o12-20020a2e9b4c000000b002cd70e93327mr159096ljj.76.1705564142762; Wed, 17 Jan
 2024 23:49:02 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_CPwSSG1G95gGkaS72komPiXgZ8M=kDLJu_r2JW2M8dA@mail.gmail.com>
 <13946.1705531444990133170@lists.openembedded.org>
In-Reply-To: <13946.1705531444990133170@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Jan 2024 08:48:51 +0100
Message-ID: <CANNYZj9pTPpz1Lr7y1gdjhAXuMvWtx+L9XWX7j3HZfqwO4-z-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] perl: Add option to prevent
 COMPLEMENTARY_GLOB from ignoring perl-modules
To: william.lyu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 07:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193965

How are you making the list? I think this might be somewhat sped up,
if you first grep
${WORKDIR}/packages-split/openssl-ptest/usr/lib/openssl/ptest/test/
(and util/perl/OpenSSL/ as well) for "^use " and transform the output
lines into 'perl-module-something'. Then try it on the target in qemu
to see whether something is missing.

Alex

On Wed, 17 Jan 2024 at 23:44, Lyu, William via lists.openembedded.org
<william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> I have iteratively added the following 45 modules, and I still not at the=
 point of covering all perl-module-* dependencies for openssl-test. Should =
I continue on with this effort? Using "perl-module-force-all" is a lot more=
 convenient without conflicting with any existing usage of "perl-modules" -=
 even including the ones that depends on "perl-modules" having the property=
 of being a soft dependency ("perl-modules" RRECOMMENDS all of its packages=
).
>
> William
>
> List of perl-module-* I have iteratively added up to this point:
>
> perl-module-base
> perl-module-carp
> perl-module-config
> perl-module-constant
> perl-module-cwd
> perl-module-data-dumper
> perl-module-digest-sha
> perl-module-encode
> perl-module-errno
> perl-module-exporter
> perl-module-fcntl
> perl-module-feature
> perl-module-file-basename
> perl-module-file-compare
> perl-module-file-copy
> perl-module-file-glob
> perl-module-filehandle
> perl-module-file-path
> perl-module-file-spec
> perl-module-file-spec-functions
> perl-module-file-temp
> perl-module-findbin
> perl-module-getopt-long
> perl-module-getopt-std
> perl-module-io-select
> perl-module-io-socket
> perl-module-ipc-cmd
> perl-module-ipc-open2
> perl-module-lib
> perl-module-list-util
> perl-module-math-bigint
> perl-module-mime-base64
> perl-module-parent
> perl-module-pod-html
> perl-module-pod-usage
> perl-module-posix
> perl-module-scalar-util
> perl-module-storable
> perl-module-strict
> perl-module-test-harness
> perl-module-test-more
> perl-module-time-local
> perl-module-utf8
> perl-module-vars
> perl-module-warnings
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193949): https://lists.openembedded.org/g/openembedde=
d-core/message/193949
> Mute This Topic: https://lists.openembedded.org/mt/103766391/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

