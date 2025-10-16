Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9C8CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 06:31:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2156.1760596280965399426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 23:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OjpJgnT1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so3375875e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760596279; x=1761201079; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F8qeW2bd6VGbPVM7oW2fELEhtz6kBP+QtzETdMBnUi0=;
        b=OjpJgnT1Qhiydn8mBYI6ZWr1o9E4Y89sxRVsvnCRkTWI1FmHAmfTwxptlYhsRrhm5p
         zIoddhnnjdKfkIcPOm/TFzAgyN1qFHgCcNM/0bPb1e0pSNefSxBr3bXNOKzrHXwouaA8
         9F2e376+/T4zD0k9Ioywm85/a1/axN2tpM+Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760596279; x=1761201079;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8qeW2bd6VGbPVM7oW2fELEhtz6kBP+QtzETdMBnUi0=;
        b=cOiJzL0L5ioPpl06zvgOYF/tE/qjkyM6X/O9avFz2LPg8u2P2RrXeEqOkTanXSK8f4
         B0ANG+TaZww6UthVcjFnO96KjFf0a9aIwdXJcpF6b5o4hkZN7HqgnKS+RmJiFZ1cnUMa
         yFDuOD9ENWHzEc4n6tPIxL3axmMQIqHWzEtyNg8xvRzBgwOxD0p8M38NG9M4j7gaUalg
         if4jXY+Uu4cr+rOqfXHDZuUM/9eIt/hcJv+nFumjmw7sPh5iQYr8bglZGvE7qG3kSHTN
         vkVkMNrDx6x3waX+sRSrehI4lNuBTMKQu4n0PTcyjgeqCVZxaFpDT5nAK0Hb2X3cU98t
         6jyg==
X-Forwarded-Encrypted: i=1; AJvYcCVLljbFIxFNMmH5JyffIHRHWJMWXPNY7fzqLWsIpO/74H5QwZh0rpqJ4f0oFn14CovLqAfsgltKHUvEwoGuXKkgwQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxqOtoXcJ3DRpt1atzW3SvRTA5Z3tpyNYD+uxQ+hhHkIusN3XL8
	LGsyAlxJzhidvMx1lK91F5RPLtzM+ZA06ooePvJS/XZFjraGqo9/3abBY0vT/wzicw/AytpnDrl
	VQeLn
X-Gm-Gg: ASbGncsQpN5c67SxgUHAtxN0fpwOwqLMgGIZYbibDrfxG5wduXP5vpPBGuOz5WVHnCo
	6HX1BE8poyWOBTq7jMfz8w0Tcw96HyW7vBopBqfRbBKEpukixQnP9T/8bw/k1ZfgNaajGnRc5/G
	VtGc2+ryH6Htei0E1zBFD1PROM/6obbkwppfbbYsS9cL24rempK+KWUFrt3ae/tevWZCuEh+dEb
	SSnDe5LYjQp3inJYf0Kym7K2cGWNv7H7sNeRoasN1HRKIvVSzLguJa01tg7Fp0VNtvwHBcxCy7D
	HRWUTGUB9wBKJoeupoOq2zKmAq72wXXoG96WyMunXc3yyqHpgJpNACd6SlYVB+AB4t50+x9XUb+
	//yJ+m2c/tP8ZqcZQ9Nn0bwNjtxshbmpwkvOAZfa2yAX+gFW5iH5ht134tO5oTd8ATL7M1mL6We
	rfIdF7QPxDURKV4qM28MDpsJSDVDaQkYxSCXhU68jP4m3xtb/Lf/JXSgLKxWwGQo9tu6SttksHs
	yY=
X-Google-Smtp-Source: AGHT+IFg7EppGZu6NZlp+/YKsSUfk40ON6PCENmiwUwmFPWXC+F+fH91s4e77RZ1539/e3jxPOswnA==
X-Received: by 2002:a05:600c:64c3:b0:46f:d682:2cb0 with SMTP id 5b1f17b1804b1-46fd6822fa2mr71196445e9.21.1760596278807;
        Wed, 15 Oct 2025 23:31:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c57:ae18:7f42:815d? ([2001:8b0:aba:5f3c:5c57:ae18:7f42:815d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1024sm32448276f8f.42.2025.10.15.23.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 23:31:17 -0700 (PDT)
Message-ID: <ffa8ec8ffcc9262c7e2f01a27de5bf37cefb71c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V5 1/3] rust: Increase QEMU size to 1024 MB
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Thu, 16 Oct 2025 07:31:16 +0100
In-Reply-To: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 06:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224947

On Wed, 2025-10-15 at 02:59 -0700, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Rightnow rust depends on llvm instead of rust-llvm
>=20
> Setup in rust-llvm
> CFLAGS:remove =3D "-g"
> CXXFLAGS:remove =3D "-g"
>=20
> Setup in llvm
> DEBUG_LEVELFLAG =3D "-g1"
>=20
> As a result, the stage1 compiler crate binaries include debug symbols,
> increasing their size. These binaries are used to run tests inside QEMU.
> To accommodate this, increase the QEMU RAM allocation to 1024 MB.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/rust.py | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
> index 95859a9eef..06acf53e9a 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -102,8 +102,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 testargs =3D=C2=A0 exclu=
de_fail_tests + " --no-doc --no-fail-fast --bless"
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # wrap the execution wit=
h a qemu instance.
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Tests are run with 512 task=
s in parallel to execute all tests very quickly
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with runqemu("core-image-mini=
mal", runqemuparams =3D "nographic", qemuparams =3D "-m 512") as qemu:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Set QEMU RAM to 1024MB to s=
upport running unit tests for the compiler crate, including larger
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # test cases and parallel exe=
cution in the test environment.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with runqemu("core-image-mini=
mal", runqemuparams =3D "nographic", qemuparams =3D "-m 1024") as qemu:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# Copy remote-test-server to image through scp
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
host_sys =3D get_bb_var("RUST_BUILD_SYS", "rust")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D"root")

This failed in testing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/2522

I suspect some qemu platforms don't allow changing the memory size so easil=
y?

Cheers,

Richard



