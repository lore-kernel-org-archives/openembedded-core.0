Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAA5E95360
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 09:34:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16737.1770197680134099053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 01:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XCZ7kpBJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so48179365e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 01:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770197678; x=1770802478; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+T7ZB1I8xOuJRDpbUVj6mVLbpR34FTC/BKB5S5UFaNE=;
        b=XCZ7kpBJ05aO23RuuNtYMOS/bJ+KDhxmcsj4nsOgECMphiKZMkMlBzJrIEkRiXkigS
         VHvvTSZdX9lCnjMMMo3LcncIl5Nqm5tztkLfjznrZCeUYIP0AvBV47yjwHAPxlzidA4X
         86LbhGKOUXSxdVIrt4sTMQPArzIkl1qrEZpjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197678; x=1770802478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+T7ZB1I8xOuJRDpbUVj6mVLbpR34FTC/BKB5S5UFaNE=;
        b=Gy5gCb4GOqwseRRxQNBV3SycCVQL9buABMO4kcZRD1pQrFMsM3krMHiQKtn+nIuFV0
         mcjPmpr0IcR7JWwFmrThQTC3LKH/sPVNe0ECZDI+3AHQqIPHD2w4Lsh2A9mkgzImQk7v
         /80xcQkf50EcZvE9jQs0/DU+gGRJOe2tLrS2rebg33hpvgbhodcX2Hi1PBXbsRMqnMhZ
         NPh0bshbsB+gm9UGKyp7JQesm7Z19MSJMNXztHO2Eie2wIp4Tlodon6vE2vNL07v9zXB
         RQX5kV63kNA6uvl9r6Bm06P8ovyFYnD1FOYQGwLW0MmNMCuLV1kTbddN1X8ZVxcA59cA
         MlMA==
X-Forwarded-Encrypted: i=1; AJvYcCXZrGY3e6Hm8u/Siz7AxEhrs8wYZ+HDPAnpZTmchhoisSSH5CcFNRpx+bdZVgEVtnuRvVZxmwFbDVIWscSHTqriRw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEvIWg+VBwdNOJbZSGTcJQ9YbQ+eBViH1dexRuZlFF1j6B9w7n
	IQ/3p/JmKUxAi7PYHOnyUDhsleQbeeAOAn8kKqhrzZKpQ6bAs7biA+G3URAcSkC7fBg=
X-Gm-Gg: AZuq6aJ5RfZ/HW0IUI19bB/yyvFt1ffh+vPvH+1w2B/zM0j3SUCe3ljY9WoIfzXFn6C
	EG9eivPVge7CcbdhqE7TbD61veM3v1neXgYkYx3ROkrQVk2D/eTjxWwl/6WHIqQm4PM8rUwmxGq
	+Og7YWnYgGsKkDAwSOwg7GoflxNn0Qldc8OJcHXfNY+fsjjf8wzegoICYgSOANz6rm5TwazQQms
	2hdYWo6nomahAYFCBkZ4+O5O5EU8vePWBxewYlmtTd/ZXhNdzeyLXt9b3jIUoM4op2yNYV0mY77
	4jSWlxYHT9LJc6CmpXyk6brprullHBJjWeFE+0nZUQXkNoM3N+68hoD1agwiByTswusbdzlf1g1
	/88d4pX+HxCfXUqSt7uQ4xyQXwJ2fXL4w8bw4bECw/mC17oKybrIn1tvf3Pmp7MdsQQwXrlf7BM
	diVddkhAqKVfKR2AZNxzhjAbybCPETNFc+vILL4mbCXUL+g7F9BDII+3ENbTeU54aNcpXFjIQzi
	b8=
X-Received: by 2002:a05:600c:c3cc:10b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-4830e99d47fmr21970285e9.34.1770197678445;
        Wed, 04 Feb 2026 01:34:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d? ([2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831093650esm47139355e9.15.2026.02.04.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:34:37 -0800 (PST)
Message-ID: <f7cff3e3b17aeedaa655c75b4c31269ec90f3bc4.camel@linuxfoundation.org>
Subject: Re: [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to TARGET_LDFLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Cc: rs@ti.com, ricardo.salveti@oss.qualcomm.com, raj.khem@gmail.com, 
	antonin.godard@bootlin.com
Date: Wed, 04 Feb 2026 09:34:36 +0000
In-Reply-To: <20260204052638.284617-1-changqing.li@windriver.com>
References: <20260204052638.284617-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 09:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230504

On Wed, 2026-02-04 at 13:26 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> DEBUG_PREFIX_MAP is appended to TARGET_LDFLAGS in commit [1] for fixing
> reproducible issue when LTO is enabled. It is removed in comit [2] since
> this commit causes cgo binary not reproducible. But actually, we still
> need this DEBUG_PREFIX_MAP in LDFLAGS when LTO enabled. So, only appened
> it when LTO is enabled. Refer [3] for the history, with this patch,
> patch [4] is also needed for cgo + lto enabled.
>=20
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc88=
979967d0e00e2fafdbaaabec030da9f
> [2] https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aa=
d02b8bf429fac4b81e30cdda64b5448
> [3] https://lists.openembedded.org/g/openembedded-core/topic/patch_bitbak=
e_conf_remove/117408334
> [4] https://lists.openembedded.org/g/openembedded-core/message/230059
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/conf/distro/include/lto.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/=
lto.inc
> index 227f0c5c2a..cef92901e3 100644
> --- a/meta/conf/distro/include/lto.inc
> +++ b/meta/conf/distro/include/lto.inc
> @@ -49,5 +49,6 @@ LTO:toolchain-clang =3D "${@bb.utils.contains('DISTRO_F=
EATURES', 'thin-lto', '-flt
> =C2=A0
> =C2=A0SELECTED_OPTIMIZATION:append =3D "${@bb.utils.contains('DISTRO_FEAT=
URES', 'lto', ' ${LTO}', '', d)}"
> =C2=A0TARGET_LDFLAGS:append:class-target =3D "${@bb.utils.contains('DISTR=
O_FEATURES', 'lto', ' ${LTO}', '', d)}"
> +TARGET_LDFLAGS:append:class-target =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'lto', ' ${DEBUG_PREFIX_MAP}', '', d)}"
> =C2=A0
> =C2=A0SELECTED_OPTIMIZATION[vardeps] +=3D "LTO LTOEXTRA"

We need a bit more information. Which version of gcc did you see this issue=
 with?

gcc see this as a bug, for example they added this to fix it:

https://gcc.gnu.org/cgit/gcc/commit/?id=3D7cc2df084b7977653a9b59cbc34a9ad50=
0ae619c

In:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#c21

"I think it is a bug - -fdebug-prefix-map should be fully reflected in
the LTO IL and thus we should not end up creating un-remapped
references to files (we should not create many references to files late
anyway)."

i.e. it is a bug if we have to set this in LDFLAGS if I understand
correctly. So we should file a bug with gcc about this, assuming you
were using gcc 12 or later.

Cheers,

Richard


