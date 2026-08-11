Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A1DC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 21:33:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.295.1786483980883000389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 14:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BPByqy0j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49800c6a846so2384985e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 14:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786483979; x=1787088779; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q58+SS8qZ9pAmC1ELjsyKHSudtax8zyTtTCq3bkzNp0=;
        b=BPByqy0jlNgIilDxrwq87nGEkD2/yCo3BMGe+0xsJqhOqOauf9xNnqsQt29GTXkTkk
         STjuUmJKoOCeN+t8ePca0io+w+4yC/8pOLuaoyVfm1pk8DXNgyzl7w3QK4FwiMA2FHw0
         6OCEp1b2EQSbYqxuv72shsicfftAtEMq7TPx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483979; x=1787088779;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q58+SS8qZ9pAmC1ELjsyKHSudtax8zyTtTCq3bkzNp0=;
        b=tK0CCxwN4tjkpvdB6EDO/VQcnmeL3SPUmoUPQlT8jcsxwpCIKNsIIoM/nGqC3Byhil
         TTq6IW5z+FiR64+0a7uT7Q1p5KT02zAJxbyASg9Vh11D6VeRpQr2fyGDE7jhMVb9bk4V
         xi5Lfd0hqfeHTdkzMbMyebkUNcu5NE8tMtgStihiMCA9rEglPxqpXf7VI710CvU36iIp
         8b84K6iB6ggSl/3JUoaSMjUhK+BOLFnF3fnjmX/nZLtIgtj40fVoHGYWYZnPdCjuIh9N
         G0zJXTynqomt1oI7FbSs/iYvcgVLyASnwocPTWjtnue+ssnBN5XSZd5VnZum0ZXaPFmZ
         yJmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtvOacjbvJdw3cBdQKSjjBQV1f8hqCDlcSHZGQ55U0ta/iKcnl1CFLDFAfCRJA3z/dfjFVQp4mF09efJ23wwX7RA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyqs160uLV00uFnix/kLrVI0VSFf3Llc0ZFjnYZvjX5Y/AttT7y
	pqiMeThOF7UvOCxBHVaSu7uizHE5vWPzjgz3vFwqElOr20I3ZfrYPWPHYaMb++A1wLQ=
X-Gm-Gg: AR+sD13ypXo4ETBzpZmMFwx1sLS59dupyLh716gUl+144vHEV+Zy/uKFVEkgRu85My/
	p22Bh7tTnbU0/fDfqe5rAePqK1M79OzBkhQsyu4p3ITO8Ht01vDxNQwlBN3Uw75HvPzOSE2sT1q
	it702U4M1cOkTL31t8JJQPyK/3vwzanjDNlWuW2fXydvj2TeQGCwlK9lJbok0epzBlnKseCcZ2G
	ztntBddog/ol0L2lJFTvtcUWabI+w6Vw8nYgSc1KH7Tgd/VNFkyIp/za92UEIvQjlZRpPC6Kq/Z
	UbV+tL5JYh/joj4iOJDG8/uop/6FR+C4sr57puJCYfWkb5D24IpyrwpyNQT3Zg+Bid+zRjbc1ln
	aS5Ugv8FiH2gqI8PChn0Fgf/BwyeudwBxygouLqwJmncWGr1l2yqnWbalJLxjLeb8wHpSJwkO26
	DDkIoMM6Itwneag4cCV1OvfTeQvqEv5GIM8mivapxX4zg+dpDDnTqK2EgCDzmXirAVDNJx2EiDV
	vwAYaQRcWWBtT4I9tIPcJGW+wgcWCCA6z4BkbT2XnkoMRfIgNngEA==
X-Received: by 2002:a05:600c:b85:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-4997c13a13emr1575835e9.11.1786483978930;
        Tue, 11 Aug 2026 14:32:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bc1c:c556:fddb:cc97? ([2001:8b0:aba:5f3c:bc1c:c556:fddb:cc97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150c08920sm1330342f8f.15.2026.08.11.14.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:32:56 -0700 (PDT)
Message-ID: <ec53193f5004c9f3f5147406b383b99f19cd19e1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] classes/python_setuptools_build_meta:
 remove wheel dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2026 22:32:55 +0100
In-Reply-To: <20260811143607.1200407-4-ross.burton@arm.com>
References: <20260811143607.1200407-1-ross.burton@arm.com>
	 <20260811143607.1200407-4-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 21:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243222

On Tue, 2026-08-11 at 15:36 +0100, Ross Burton via lists.openembedded.org w=
rote:
> Historically, setuptools provided most of the build commands but the
> wheel package provided bdist_wheel.
>=20
> However, as of setuptools 70.1.0[1], this command is part of setuptools
> itself and the wheel package is not required.
>=20
> [1] https://github.com/pypa/setuptools/commit/b3d3e93a834426f1bef8712e140=
5495084eb3b7f
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/classes-recipe/python_setuptools_build_meta.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

One of the changes breaks python3-qemu-qmp:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/4402

I suspect it needs the wheel dependency adding...

I'll test a patch.

Cheers,

Richard

