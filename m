Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B180BC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 10:25:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16061.1782642353674341947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 03:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZMoO92mI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46cf972f281so1229277f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782642352; x=1783247152; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYRLsYGdEeKVpCvnEO/bIHyboeZRysloQJOcuz5nGFE=;
        b=ZMoO92mIq3ULjmPiPKR8gSI/e84g6dgm9b8ivnvML4JHshuYx8lYHePnzIHZmRvQxK
         W2lk0WviYrzLtWxrvk8QVirMEFVtw8VyR6y2nWxrLCSZqp/4SvRMtrXYpsjf9MM+XtQC
         67XKQzMEYw9YjOlHlzywGhBnakb++D5S7EfCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782642352; x=1783247152;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYRLsYGdEeKVpCvnEO/bIHyboeZRysloQJOcuz5nGFE=;
        b=HCalNU0lbXMI0vuaGXZAkuoffY7fbNjBrXvCrSn6BlkXQOts0oUDNhrnYCL5OuDQMH
         r1tHBQJzleNxgoPSa3Msoo1oNOf/miZmzxy7ZS5ILu1GINuNF6Y5mEYWGuHUhRZmszBy
         0Zro6cUPIYkF7faI7mRgaj8SyRdIOGx1wslKE5BqBAUF6qYC+Lg7Rvpz85gz7I6q1itP
         9BYfhK/T1nDljn6KY5V+ybw/fqG4FV/tusGTvQcp5BOYwsLharJOlTRfeC2Xw78utyIR
         CPekTpnEyXjDYV8pSbnYVUYiriwfsuSxc9vhwit+0cH5AEb4xMj6nbH97syqVTOly6Xt
         CRww==
X-Forwarded-Encrypted: i=1; AHgh+RqQ68BpmUZ20cSHtdgg5WSGyt1GuiC4O8y6UhTZkhk/iL+YDWAlTLm0ElDvL0j6H4uinriGHFPB1R4rCM3wIR3LVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywi72qWeoWk+QVo6Mlu89/E8wANkiAo+srnoFNsacw5C9p/8fVd
	jX9c6MvM0n4cIoXxRHdvE619ZdMCTtIhCEFo8A4yK/xONT3CLRZEJtYFI7JN8KXC+Mw=
X-Gm-Gg: AfdE7cn2wSSyNP9BmqfB182ktgLWBMYYnogiQTRJlCYiu5WAQtirh+gOJMhWeiw9XiX
	KyqnmQVumCwkcRDZtk3RISLcEwxZRjoYq0nX8fZazVu4N/48v1vUNJoOGObIVE+Btmf79aX3me7
	ivO+JMcva57fKxbd7z7/s8INXrp1kds4X31/6mRIewV147IOeyrOR2ZKgxwNmCC5rEOSPtUKEbl
	WO7wQQmVDlaumSsAsEWE1Rt/8IiHDaLvKagXQkZ5bfnqf3pFoSEN46OXMGc+MyvYKhGn9TyAlos
	3EVbDpwqS0NwAJAvP64pYhr+Ch+W/ShhmAs44w8dlZgsECJF7o4QGbE6a8SDuwllToYsZ34HEyu
	vk5Ulg7IQSGvsOxg3+/u4wWvWNQ6qtCKibPwY5y+Sydeq7GgN5Wz5pT0hueA3nW+kHj/ND+wXZD
	pErB3bHPF7ZFToympawoXQYIwjkyE4Zq8H96e/UYm+SjtOigUVkRj5wnyY1ekjknFm7FJ8F8tbZ
	H8Ito2huxtRCCnr
X-Received: by 2002:a5d:588b:0:b0:461:a16c:d88d with SMTP id ffacd0b85a97d-46dc0efe59dmr21047470f8f.26.1782642351668;
        Sun, 28 Jun 2026 03:25:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a165:6d61:c7bd:48ff? ([2001:8b0:aba:5f3c:a165:6d61:c7bd:48ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-473772c72e2sm882540f8f.31.2026.06.28.03.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 03:25:49 -0700 (PDT)
Message-ID: <9ec404ced0ab0f4762d9c4e863ffe67de4baa025.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 4/5] llvm-project-source.inc: add vardeps
 to do_preconfigure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, raj.khem@gmail.com
Date: Sun, 28 Jun 2026 11:25:49 +0100
In-Reply-To: <20260623120818.110754-5-joaomarcos.costa@bootlin.com>
References: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
	 <20260623120818.110754-5-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 10:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239709

On Tue, 2026-06-23 at 14:08 +0200, Joao Marcos Costa via lists.openembedded=
.org wrote:
> The task's signature should change if CLANG_EXTRA_OE_DISTRO and/or
> CLANG_EXTRA_OE_VENDORS, considering the couple of for loops in
> do_preconfigure iterate over their values.
>=20
> By adding them to 'vardeps', bitbake will correctly detect if
> do_preconfigure needs to be executed.
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
> =C2=A0meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
> index 85b5ef06dc..84d4bae0ab 100644
> --- a/meta/recipes-devtools/clang/llvm-project-source.inc
> +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
> @@ -90,4 +90,5 @@ python do_preconfigure() {
> =C2=A0
> =C2=A0do_patch[vardepsexclude] +=3D "MULTILIBS MULTILIB_VARIANTS"
> =C2=A0addtask do_preconfigure after do_patch
> +do_preconfigure[vardeps] +=3D "CLANG_EXTRA_OE_DISTRO CLANG_EXTRA_OE_VEND=
ORS"
> =C2=A0do_create_spdx[depends] +=3D "${PN}:do_preconfigure"

We require that tasks can run in isolation and that can happen for many
different reasons. Your fix does improve things a bit but it doesn't
fix the underlying problem.

Ideally we'd change the search/replace expressions so that they always
change/update the required entries. That does sometimes need a bit more
thought about how the expressions work and it means you can't use
replacement tokens (unless as a comment on the line above?).

Another less optimal way to improve things is to change do_preconfigure
into a postfunc for do_unpack, but it wouldn't be able to change things
altered by do_patch. You can't make it a do_patch postfunc as it could
still have the current issues with the changes not being updated.

Cheers,

Richard

