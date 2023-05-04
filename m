Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280D8C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 11:22:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.47212.1683199332368839452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 04:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=LhDqphn1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f315712406so59267475e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683199330; x=1685791330;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LZx0Z9eq6/0ecFfvQqwucVf4fPWDKSeOCAUP9NyKkpM=;
        b=LhDqphn1AmpuNwtJfbAV2dNZiGBJP1EzUFJm4yEUyYggL+VAENYnz3cZ63D7Q4GeFb
         jI1tzHrO925gweePfsiX5HO9z5+nOXdwJxqvs2TvI3eJ4mkttmM/pw6GHtfZ4HzXHmwg
         FhZwv81IfbGP5nbC3gqvQ9m8EMLOs+qA0ES+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199330; x=1685791330;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZx0Z9eq6/0ecFfvQqwucVf4fPWDKSeOCAUP9NyKkpM=;
        b=kzI0bVHOP14WSlJFmjYfAOgHN/sqS0RRVuEk9oNw6hFw1gvdOGWzCFKwvWGPAlXdz6
         nI8nmjK3KyYnBhqJD11BOQ+XyVpo92Mp9tiRKCjXHQH5SKYtCymUaWYghb75rCQ7CQVO
         ZkYq3LQj7AACL//GyCduN4BSPT09/8S8e3Ix3oe9672u7CClNIcL6WPSrI185qepuVpC
         0UmGFBiXGTxEoSZI2Q0UHajK+KcNUyjAtRRSZdoLwgZAvHXbJITxx9NHL+6Wn4bailcj
         0SjYHBo/1r+tQ2XDwJzIscCkt4aLOapb2hisk9NVLnWLbpueCXnKz8IFUYjNFpD9SAP3
         6GDA==
X-Gm-Message-State: AC+VfDzhJngZ46c0WzK+6PlZUZRut7UcRJoeIocskyVypa1WhbpdJAIJ
	azWIm2cIwbeFnZte9xpArP0Hjcm0iUWJFMu32vI=
X-Google-Smtp-Source: ACHHUZ4TY4wGUZ1CHcAgvJUirt09lPNZhKNRzV9075jV2KiPF8ioEGKQlxokbkJgSo5wPlw0aAsA8A==
X-Received: by 2002:a05:600c:468c:b0:3f1:6fb4:5645 with SMTP id p12-20020a05600c468c00b003f16fb45645mr4138427wmo.1.1683199330686;
        Thu, 04 May 2023 04:22:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6749:5fda:5dc0:e535? ([2001:8b0:aba:5f3c:6749:5fda:5dc0:e535])
        by smtp.gmail.com with ESMTPSA id l2-20020a1c7902000000b003f195d540d9sm4582119wme.14.2023.05.04.04.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 04:22:10 -0700 (PDT)
Message-ID: <fa347e174bc57d7d8407a2cf867536a1b8f53b87.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] qemu: Add fix for powerpc instruction
 fallback issue
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Date: Thu, 04 May 2023 12:22:09 +0100
In-Reply-To: <175BEC78937C3517.28444@lists.openembedded.org>
References: <175BEC78937C3517.28444@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 11:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180864

On Thu, 2023-05-04 at 12:14 +0100, Richard Purdie via
lists.openembedded.org wrote:
> See the patch for more details, fixes a regression in qemu causing
> illegal instructions in libm on powerpc, triggered by a libinput
> upgrade.
>=20
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Df1c56cdff09f=
650ad721fae026eb6a3651631f3d
> was the glibc code generating the instruction and triggering the issue.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc       |  1 +
>  meta/recipes-devtools/qemu/qemu/ppc.patch | 70 +++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/ppc.patch
>=20
> v2 - add upstream status as submitted (failed to add to the index)

Hi Steve,

I'd suggest rebasing this patch against any branch with qemu versions
which are affected (7.1 onwards I think). The patch here is against 8.0
but it should apply to older versions easily.

The random qemu instruction faults are annoying and a pain to debug.

Cheers,

Richard

