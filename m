Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1AAC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:29:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.16306.1741876171960528970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c679sc81;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so7027165e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741876170; x=1742480970; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cg6JcBs4+lBf5GPQHA5tZvitbpFDUl3qCG/ZYWpFA8Y=;
        b=c679sc81Lf3acMKlpTZA5O/GkCZhE0uLCyDU8mbnmD9Q7K4fXRW7PdzhXUK93bnewU
         NoPw5Tevov7cr5wUyHmzRtFsR3mRcezoMz5YGF4/qLobuCLVztnsx54KwhEa9bh6QPUJ
         Z2wJSft0032NN1jIXeK1hNsV9UNn2Es4zM21Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876170; x=1742480970;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cg6JcBs4+lBf5GPQHA5tZvitbpFDUl3qCG/ZYWpFA8Y=;
        b=n9WX7ZkfFQj+Wky7molVitfzXw54yuUALudX9lQHA2VdNSXgjT0hHLaCqM1cWhioE5
         oDku0kt+4uh+xBstiEqD2qHuQTgSLTIhZZHqf83+uTv63E4HGJqMzbYuDkOmUPB4E5dT
         u8ihw2A8Y9Cb1hHirmZRvWVU8U/ZBSCdl6dzHnquo9mo1MNoKeUpr7sN3F0wwbyhB07o
         jh8vwM0sEFtHvvyjQeTVhAGcxeGK4y5og0fgmT6hwT6RbcJreL4VD0KI3mB3EZdAPPUC
         8un3hsCk+yllw8AX4D4b8KzrLpU4dKmg/NmNUUQJI7ukVlCARsr5Ly9fBtQr8Xr/gKaD
         PeCw==
X-Forwarded-Encrypted: i=1; AJvYcCWfSbjOqYpKXjPfd2hDH5KQJd21hBKbvpvE1HYzwc1t9q9gbjh/3mKIUKbiQ3V4UmzLIwVzMpviBHid4pf3VCIe0Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDK043axvGucYsX75McL0vKq1s/tXLkq+1SdcMXaVvvimFsldv
	D6S1FrheHImJKSjl9D8Ls3/1fvn7MZVGwwv/cU2ls4RJn85tnLveL/dI4cYgRUzg+LxxYWx075a
	R
X-Gm-Gg: ASbGncsALXNH46O8Ucb05AEUw3mEMlRQ8/jXZvhaesgtl++g56TsM2rAdyiTeb5YPhv
	PzO1oZQ/AqUvaZAopI9QQ/yCwX7iKFN01b0JcbAHUTcUb/7FWutc+kyRN2RUIxklkfyjLzRDmfN
	Jux52VZkKuX+45ipFyfhEhf5056hSdgsmwYn+Wtd/btF9eLnWhAN58Zt9lAM5/oDtuyhsURtSuG
	xuT2vLEZmhAnQbDSjWXGbkspjtrQcRNeQOL9k9JPYh7bfburEOEiACCtQK2KEsQumjofTuNFcpl
	/htatSnvHuA2swwVnRY5D8lN/b2tXTybOPuPfho/IGNAyuc9L72ysAbaX8qcwCVTpxPBqki6KxM
	2YodZNTdLkPCoZEWkW2S0P3H9COMbaUW7xjFc42RWw2LY
X-Google-Smtp-Source: AGHT+IHWkYVhS4RsxsASryO6kCgzC/85XKynnQLw384Q7dvWybYBjwTzvkNgspC9YZY9wQ/yPX8nQw==
X-Received: by 2002:a5d:59a5:0:b0:391:4674:b10f with SMTP id ffacd0b85a97d-3914674b5d4mr14484909f8f.36.1741876170253;
        Thu, 13 Mar 2025 07:29:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8? ([2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm22096695e9.14.2025.03.13.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:29:29 -0700 (PDT)
Message-ID: <aa654d9ac3d79d02192b1bfb00ab725f116efc70.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] lib/oe/qa: raise error on objdump failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Thu, 13 Mar 2025 14:29:27 +0000
In-Reply-To: <20250313093437.95237-1-thomas.perrot@bootlin.com>
References: <20250313093437.95237-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212781

On Thu, 2025-03-13 at 10:34 +0100, Thomas Perrot via lists.openembedded.org=
 wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> Change the log level from 'note' to 'fatal' when objdump fails.
> This ensures failures are treated with higher severity, providing
> more visible feedback when objdump commands fail.
>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
> =C2=A0meta/lib/oe/qa.py | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index cd36cb5070d1..c1e295029abb 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -155,7 +155,7 @@ class ELFFile:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.objdump_output[cmd] =3D bb.process.run([objdump, cmd, self.name], env=
=3Denv, shell=3DFalse)[0]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return self.objdump_output[cmd]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except Exception as e:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.no=
te("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fa=
tal("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return ""
> =C2=A0
> =C2=A0def elf_machine_to_string(machine):
>=20

Unfortunately this will break things:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/1210/ste=
ps/13/logs/stdio

bb.process.ExecutionError: Execution of 'x86_64-poky-linux-objdump -p /srv/=
pokybuild/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-l=
inux/python3-packaging/24.2/packages-split/python3-packaging-ptest/usr/lib/=
python3-packaging/ptest/tests/manylinux/hello-world-x86_64-x32' failed with=
 exit code 1:
x86_64-poky-linux-objdump: /srv/pokybuild/yocto-worker/build-appliance/buil=
d/build/tmp/work/core2-64-poky-linux/python3-packaging/24.2/packages-split/=
python3-packaging-ptest/usr/lib/python3-packaging/ptest/tests/manylinux/hel=
lo-world-x86_64-x32: file format not recognized


https://autobuilder.yoctoproject.org/valkyrie/#/builders/99/builds/1174
https://autobuilder.yoctoproject.org/valkyrie/#/builders/13/builds/1092

and more in that build.

Cheers,

Richard




