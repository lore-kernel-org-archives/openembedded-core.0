Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA7AC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 19:19:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.3196.1742411991777419830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 12:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AHSHitpq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so29814115e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 12:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742411990; x=1743016790; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPU8/I5oRwX8t0fOpsvI7mrS1/UHo3WGUWbBnQX+WVQ=;
        b=AHSHitpqo97VCjWrpydJNuHLVMbPm8Lp89B2MVq7sOVJz+7RLZT9k7pdIxtpkl9DFw
         hgY8rTtGxcslHb2eWbhSwlxZnDEwMVM1u38qadq5QXl4lDf86p3ceToIcMU4iVY7xXLd
         UKY6+2kTKKFBrmioH4XpqdIHkL+sGtmmG4eTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742411990; x=1743016790;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mPU8/I5oRwX8t0fOpsvI7mrS1/UHo3WGUWbBnQX+WVQ=;
        b=PXGd1dhNAVvi/B06t8QafkvYp4Vo3e49kQDGZ2OrH0DXWePy142eq4hSbZNvkrX/LL
         h/kT5ReQ9BlO4wxfOxxts1SyPDNzWEqZo+doYkIFBWAiSQEut88X16gJRdsgiVsbD57h
         jKCER0YtvfDFhjJYTBon+bfkrYRg0TFSibdC7bhM+ZdZvFvZKjGTIyOxxAJSFrunEelZ
         lX52KCCsOOc1cwZYshqvL3Ejc/PYZu57AXCEdvjjpL1FyqIoxfF0z7e0iU9oTWWfJJL4
         Pjt6PHMLKVnt0AI7tDRwAYxlzlEum4INuAhX2+QLAln7F+6DsD7h16QdsbkFoJjPfKtJ
         pdSw==
X-Forwarded-Encrypted: i=1; AJvYcCWbw9LBk7JCuWZfreOtbgYBB3kLeIlZMOrmLvCRB1mK48HvhPLDnQDk4nc+f8qG4NCq7H9tj1ujEoXHJQUMvoVgQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDvlqzU178WjCPUo+hNQCUbgTYP13R6H4rMXsoMTBEHDoom6G1
	KOKxXI2mCuQbZd1GS9QHg0MrK1uMN2ZeWs3seTxqO182iS06VvsLp2Nbje/vH04=
X-Gm-Gg: ASbGncv7Ga9bW/ojzs9pyo28/7YoEH4NmFbzMNWPINcauEcst1ZwtodJh5ZqwzJ0zri
	t0RMangrdC0P47NPQR6V1G5qt5KCq7vDzDr5HWjmvFwijNRGKT5FA4d+gl6/28f13KcErgdfyQv
	1urxMBov9EH2pnzLCB02pTcaaN6zAUtRDXfS1YwOcdK7zP2he0Yu2iVhiRERtxNFhrJzRAGTcF7
	mk4YbUWvOHfUviyl/Oo6wR/7y7s4Mxgr2fdrIVP7qxgJd2REPvuwu6e9mrIuvwaGzfNe1tSOZsN
	x491QHkG/2LCfhAdlCRkl58bqYRPjby2jdZ4Irr3jmiVxEx57JckRy+V9kE27+k/IcVfDyiYasw
	t/1xESX0PqDIVwWM7Zfdho5xQuoXFYIQ=
X-Google-Smtp-Source: AGHT+IEnsG0LKxIqfcHdkjV8ba3bjcN7+uujT+hP+T485pDk3zaI2zKr6iZAdr1oWNFEKdr1HmgfJg==
X-Received: by 2002:a05:6000:1acc:b0:391:4bfd:6de with SMTP id ffacd0b85a97d-39973b42c2bmr4184844f8f.46.1742411990071;
        Wed, 19 Mar 2025 12:19:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dad:b471:9c34:4577? ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7e9f8asm21612092f8f.81.2025.03.19.12.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 12:19:49 -0700 (PDT)
Message-ID: <edf8bfba8a9a0e84c6893fdd263fd1c4665b1c55.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] insane: Check if the C++ toolchain supports
 --std=gnu++20
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Wed, 19 Mar 2025 19:19:48 +0000
In-Reply-To: <20250319182029.675932-1-yoann.congal@smile.fr>
References: <20250319182029.675932-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 19:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213350

On Wed, 2025-03-19 at 19:20 +0100, Yoann Congal via lists.openembedded.org =
wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>=20
> This is needed to build nodejs from meta-oe. Check this early to avoid
> an error later in the build.
>=20
> Fixes [YOCTO #15804]
>=20
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> WARNING: as discussed in previous threads [0][1], this will disqualify
> builds on Ubuntu 20.04 (its g++ does not support the option)
> [0]: https://lists.openembedded.org/g/openembedded-devel/topic/111740469
> [1]: https://lists.yoctoproject.org/g/yocto-patches/topic/yocto_autobuild=
er2_patch/111757761
> ---
> =C2=A0meta/classes-global/sanity.bbclass | 25 +++++++++++++++++++++++++
> =C2=A01 file changed, 25 insertions(+)
>=20
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 1bae998f74..5783b92b26 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -629,6 +629,28 @@ def check_cpp_toolchain(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return f"An unexpected i=
ssue occurred during the C++ toolchain check: {str(e)}"
> =C2=A0
> +def check_cpp_stdgnupp20_toolchain(d):
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 Checks if the C++ toolchain support the '--std=3Dgnu+=
+20' option
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 import shlex
> +=C2=A0=C2=A0=C2=A0 import subprocess
> +
> +=C2=A0=C2=A0=C2=A0 cpp_code =3D """
> +=C2=A0=C2=A0=C2=A0 #include <iostream>
> +=C2=A0=C2=A0=C2=A0 int main() {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 std::cout << "Hello, World!" =
<< std::endl;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 """
> +
> +=C2=A0=C2=A0=C2=A0 cmd =3D shlex.split(d.getVar("BUILD_CXX")) + ["-x", "=
c++","-", "-o", "/dev/null", "--std=3Dgnu++20"]
> +=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subprocess.run(cmd, input=3Dc=
pp_code, capture_output=3DTrue, text=3DTrue, check=3DTrue)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return None
> +=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return f"An unexpected issue =
occurred during the C++ 'std=3Dgnu++20' toolchain check: {str(e)}"
> +
> =C2=A0

I did test this:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/1281

I'm wondering if we should add:

". Please use a g++ compiler that supports C++20 (e.g. g++ version 10 onwar=
ds)."

In the meantime, since we're going to do this, I will take the
opportunity to bump the python version minimum to 3.9 and install
buildtools on the 20.04 ubuntu workers from now on.

Cheers,

Richard

