Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC04C7EE39
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 07:06:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.13207.1751180816758327880
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jun 2025 00:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LBA64sk/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453398e90e9so8063735e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 00:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751180815; x=1751785615; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Uc9CLTbg20OHlAZHUOJfN+UL0g3Ss2cADFxnHYivl8=;
        b=LBA64sk/YYr3K9CpL0akq/wnVT8X6ikusx3GAJuYXDN4hrrtqmfeHySpujeDHaVMN6
         VNnJkfTtVxt6+WNO5/wH+ZQEbu7SW7hxCe0d/U1IgJ8bEm3qthHGCvYq+D/BcFrMq9MD
         0lUfKXwaVay3q2Sc9PBiICO6aE6dhNEoic+Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751180815; x=1751785615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Uc9CLTbg20OHlAZHUOJfN+UL0g3Ss2cADFxnHYivl8=;
        b=jIa3TS96cxjXmuGvWHVfnmPgqjU08Rm8GtLNOHxs21wol116yKBMdIKJAnaHufYxPc
         jP5lwAo45Yk3Tc1+UWRMBDf4eZlzAUQp7u7VJADWDkGp5DD09gslGieFJ4cjAUT0Emv1
         zknJwwNa8on+u2hN3XL7ad4sednGFhIImmNs/dKpuamd6PNAHgWSWP+5zSkPOPCmhY5o
         G9jUlMeeMPJYqaPEEwrmJfp+eIMLbG1Evdxwt0DqUR3ZV/HvoTSaRgOzBPH5JVP7zdaK
         DMoKS4jqjrKylW47pWuCZ+MdZF46DtdLi/22IK3ibCTp4Ou+ucHyyPTSPAhrwW7kcP9+
         0lmg==
X-Forwarded-Encrypted: i=1; AJvYcCWT8PGD9ZdNXwgGeISL3a5Fczeegidbdu0cbv3SFS0KMa8xV2/fxy2X2G5OwUwnwg2Rp4Rv0I2hy2rxIEb8wp7GNw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNyWoYPEx9VCPR18Zb2FbqVR8nvRgPGx2Zeza07dSDWJ3pX3Zj
	esD4sc29g84WnhbzVJk1tnQfTuK0++aW28yx5rHY9CER9pTtGvsSa/RxnjYaLqeINWc=
X-Gm-Gg: ASbGnctyi3Fuds0Zf3u3dToj8eehTXqRBGC7gw78eZBFZMwr2n7n8jzMJYeBI4QvLcy
	OAdZl33DfDFTeijmK0WE9O9mpAWMKH7J7GOHVSuyMS9fXm/p2gjUiuIJWz6WLV1osFsjW9ibCUB
	N6UUOsi5nY1eivT/HfOGhXbxFaW/cH3weDwZwBVEhWFQ9+i9u5sMmiDeTjsB1l6ribD1SlwrcwH
	Uu5pFhMfm9d09DhyFoJQTax8N12Q3/3MfBeVAv7bhFBSaVmjVxLBBBNNmjZNWSOA9KRa8/BNNuN
	/xojFZ9s2T8nmPGPECJy1W6HNT3CknOzDGtyj3G9Qyafbr9pheav0Kg3hyw+pgTahZJxrwVPkrg
	PAw5HIeNAYDAiNKfNdboodjosvK+9kscxfQwqx/kpuwr+fLle43M=
X-Google-Smtp-Source: AGHT+IEgTGK8dZz0uK42ZbZpCbuCnem1iQGtXQLWtJSH3mVH9wRWBDuw0uBXhB8o9t96iyGKJi5zLw==
X-Received: by 2002:a05:6000:4716:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a8fe5b1d18mr8278408f8f.35.1751180815093;
        Sun, 29 Jun 2025 00:06:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:81c4:3967:adbe:b687? ([2001:8b0:aba:5f3c:81c4:3967:adbe:b687])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453814ae64fsm84321735e9.1.2025.06.29.00.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 00:06:54 -0700 (PDT)
Message-ID: <8e1a855a274565f4e6facd4f7cb747e461b2cd8f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/6] oeqa runtime ping.py: make
 run_network_serialdebug() specific to qemu
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Sun, 29 Jun 2025 08:06:53 +0100
In-Reply-To: <20250627063004.781560-1-mikko.rapeli@linaro.org>
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 07:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219439

On Fri, 2025-06-27 at 09:29 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> Only qemu runner supports self.targets.runner. ssh runner does not
> define this and on error path this function causes another exception.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/lib/oeqa/runtime/cases/ping.py | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/=
cases/ping.py
> index efb91d4cc9da..515d376602bd 100644
> --- a/meta/lib/oeqa/runtime/cases/ping.py
> +++ b/meta/lib/oeqa/runtime/cases/ping.py
> @@ -10,6 +10,7 @@ from time import sleep
> =C2=A0from oeqa.runtime.case import OERuntimeTestCase, run_network_serial=
debug
> =C2=A0from oeqa.core.decorator.oetimeout import OETimeout
> =C2=A0from oeqa.core.exception import OEQATimeoutError
> +from oeqa.core.target.qemu import OEQemuTarget
> =C2=A0
> =C2=A0class PingTest(OERuntimeTestCase):
> =C2=A0
> @@ -36,7 +37,8 @@ class PingTest(OERuntimeTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 count =3D 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sleep(1)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except OEQATimeoutError:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 run_n=
etwork_serialdebug(self.target.runner)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if is=
instance(self.target, OEQemuTarget):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 run_network_serialdebug(self.target.runner)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.fail("Ping timeout error for address %s, count %s, output: %s" % (self=
.target.ip, count, output))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg =3D ('Expected 5 con=
secutive, got %d.\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'ping output is:\n%s' % (count,output))

Rather than make the tests target runner specific, should we put a
dummy function in the main class, then backends can support this if
they can/want to?

Cheers,

Richard


