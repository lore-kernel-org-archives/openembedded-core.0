Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E171EC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 14:41:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.6960.1659451274243043035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JNyw1L5R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id z12so8057151wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=+T+aARZoDH6r0VBQOn+vsJcrx+fmafba9TgikcML1BU=;
        b=JNyw1L5RwClmSU+dvSkQ9FJwIwQBxpwpB7nl/bQU4M4g94uY0WwX+VLDsjSSb1wL4S
         t3MyUEmISoAPuD1Lhjv3ymJ7nh9za9unrqqMtGm7XrSKoxC/Hz+HVBe+tVXuyFqHCzoI
         hY+j/1Asf8ztG7rx9rewltvG3BcPTsq4aQwvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=+T+aARZoDH6r0VBQOn+vsJcrx+fmafba9TgikcML1BU=;
        b=iVbkVycKcwHbzu1eQKw0W9Tdbk6ia4MpVR0gkHJL0jU6tvUDmC9IMCfjdYTthxxD7G
         TW+xQUg7S5y8dSBZoOqn3m+nA7XU6RZEKfOELqLyVY9utaW8sqOX7G/4xF4Kdg/D45N2
         CgxijqpzqEoisISuwUVgJwn+b3Qn7CbnRvrtS/9CQPDElDsIpkZJyl3vne33bThjZglQ
         AIJgOzBngqQdbCIEuVs1N7c0loUZqzonWyHGX/JNRTK9BA9JqlMUZpfGvNOFV8MpvrhG
         bv5HvFaK87f5mrb8IVDN+Zvzyxs8AQSVxxzfmF6IuIQVjiLBK5r72/sUZZQOOxLNFgBy
         Wn/w==
X-Gm-Message-State: ACgBeo2pF4G9k+gol5YDH1+jKbEwqrJriUCWKUKodQMmsCdZXBXJcNdr
	3W6UOVx+1TV3Ru7EMnvsa4TfLaqUFgV5lg==
X-Google-Smtp-Source: 
 AA6agR76nh0c5CPxdKOPskGPevi1s4Su2cSq3ifkWfv3BPr3vh0M3Cji/4qbPAC4QNFbqMbU8L+w8A==
X-Received: by 2002:a5d:4d0f:0:b0:220:639c:7787 with SMTP id
 z15-20020a5d4d0f000000b00220639c7787mr5581265wrt.369.1659451272578;
        Tue, 02 Aug 2022 07:41:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2e5a:83:f743:7e5b?
 ([2001:8b0:aba:5f3c:2e5a:83:f743:7e5b])
        by smtp.gmail.com with ESMTPSA id
 a7-20020a5d5707000000b002205a5de337sm10015327wrv.102.2022.08.02.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 07:41:11 -0700 (PDT)
Message-ID: 
 <8470e905aa3fbdcf2cd34594b4e06800dcfd1683.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 01/29] qemu: CVE-2022-35414 can perform an
 uninitialized read on the translate_fail path, leading to an io_readx or
 io_writex crash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Aug 2022 15:41:11 +0100
In-Reply-To: 
 <5f236e744b5b528bdf8d95c9580c273f63c04452.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
	 <5f236e744b5b528bdf8d95c9580c273f63c04452.1659105705.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 14:41:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168790

On Fri, 2022-07-29 at 04:46 -1000, Steve Sakoman wrote:
> From: Hitendra Prajapati <hprajapati@mvista.com>
>=20
> Source: https://github.com/qemu/qemu
> MR: 119830
> Type: Security Fix
> Disposition: Backport from https://github.com/qemu/qemu/commit/418ade7849=
ce7641c0f7333718caf5091a02fd4c
> ChangeID: 41d6646e06319e629da574b9b2e8a3a197a73441
> Description:
>         CVE-2022-35414 qemu: can perform an uninitialized read on the tra=
nslate_fail path, leading to an io_readx or io_writex crash.
>=20
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2022-35414.patch            | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch

This isn't fixed in master yet?

Cheers,

Richard

