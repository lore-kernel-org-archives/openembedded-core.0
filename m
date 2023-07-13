Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57A1C001DC
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 11:11:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.5751.1689246662699850415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 04:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=fEtfegkf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so4944415e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689246661; x=1691838661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mMux0qr3QRMTLlqsZy5vlo55ELTVtiIBn76ryG6ENpM=;
        b=fEtfegkfUJqrAMsXqKDw8MkqS3jChU5QJBasb+3KNKQ2fFfKeevlaiBWozSpP7mx+L
         PX205vKTWks6t9rSxeRqAOLHfkXW7nVlxDWLtGu6UlToIra2p4xFKyFGw3uMrDcekVCK
         s1WTlNhmWQYZdSEiWLv/x53izWTjdMgVRfFDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246661; x=1691838661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMux0qr3QRMTLlqsZy5vlo55ELTVtiIBn76ryG6ENpM=;
        b=VjhOYeiQTBmmRnc77BlI2+zsZUQ5knbedKwSIuiSN/V/JgLjsV2lvIwHee/GXvp+83
         /xaOviYhx4dVCtEla0whYdL0UjtjCgYQIv9EQ+oXproSYmnRCVEBlWPGC0kK/XoHcSMr
         5pIrluUvERXxodYr+xW9obLmqf0vOqYD7mogPDlBPjMxZjmeg1oOicR07TVTFIBPKPIK
         T0tercoYKEFlz3bnjechlU52NHKGa5R3d2ZvwxTvNC2L6tzwQl+KHiBD5k0ZgCtO2yK1
         HJsHad7ZZ+K5GzUfiZy+flS60uVrIbX7dbj55oalwoLMh6lOXQoLK1XmnRarTERQhh7V
         Cotg==
X-Gm-Message-State: ABy/qLYcw/r+e9lMdcHzuSa0R1vK9lDEF6EGRwDrl28UcqtFq/65xR3B
	8T26dhjKOKzqX30XGHWQaGBDtg==
X-Google-Smtp-Source: APBJJlHMf3VkgTYojX5oWBZiU0xHB25VEalO5NDkCdEU3msOYXMD0WSdsA1yZZJjSUeyRfYKtdmjjg==
X-Received: by 2002:adf:e40b:0:b0:314:27ae:5ad6 with SMTP id g11-20020adfe40b000000b0031427ae5ad6mr1016889wrm.61.1689246661095;
        Thu, 13 Jul 2023 04:11:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:63d8:38f2:4435:df11? ([2001:8b0:aba:5f3c:63d8:38f2:4435:df11])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d560d000000b0031590317c26sm7666779wrv.61.2023.07.13.04.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:11:00 -0700 (PDT)
Message-ID: <3f44bb222d7ad35fb14e8bee4832311915b1ff10.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 2/2] sstatesig: do_image_complete needs to run
 with pseudo disbale
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io, Jose Quaresma <jose.quaresma@foundries.io>
Date: Thu, 13 Jul 2023 12:11:00 +0100
In-Reply-To: <20230713110244.3169513-2-jose.quaresma@foundries.io>
References: <20230713110244.3169513-1-jose.quaresma@foundries.io>
	 <20230713110244.3169513-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 11:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184242

On Thu, 2023-07-13 at 11:02 +0000, Jose Quaresma wrote:
> sstate_report_unihash function from sstate.bbclass needs to
> run with pseudo disbaled when running do_image_complete task.
> This is because it have the deploy content with uid and gid
> of the user that run bitbake on the build machine.
>=20
> By default the creation of sstate is skiped in the task do_image_complete
> in the image.bbclass using SSTATE_SKIP_CREATION:task-image-complete=3D1
> so the issue is not triggered.
>=20
> There are some situation when is useful to store the image artifacts on t=
he
> sstate cache for future reuse and speedup the build without need to prudu=
ce
> the same image again. These cases are especially useful in the case of th=
e
> initramfs images used by the kernel.
>=20
> The issue can be reproduced in oe-core with:
>  echo "SSTATE_SKIP_CREATION:task-image-complete =3D '0'" >> meta/recipes-=
core/images/core-image-minimal-initramfs.bb
>  bitbake core-image-minimal-initramfs -C do_image_complete

I can see why you've done this but I have a lot of worries about adding
code for use cases we don't support.=C2=A0

If we do this in too many places the code just becomes unmaintainable
as we have no idea how it is being used. I'll merge patches which break
things, then we'll get patches to fix that and break something else
someone relies upon and things will turn into a mess.

I really don't know what to do with such patches :(

Cheers,

Richard





