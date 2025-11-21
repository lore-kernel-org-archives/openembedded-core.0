Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D532CFA47B
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 08:02:04 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7260.1763712121899195235
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 00:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PHg0wfoc;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-450b3f60c31so578974b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 00:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763712121; x=1764316921; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3IXXb16vFT9Y0Ivsdt7l/RkXNE32JLpgd0xAKQCiHc=;
        b=PHg0wfoclDNn7SiTUxnZmmY+ad+0aZCJrjlM4+uqrq2/qO+t+LWPCkIjLkCOOtt+3H
         71N5ZDJVrG2dpSzGvWNUCkbe7EksmqWkBzMFV7fy3sE3LkrmXIRMlj7LKk06etY9OKv/
         I/jTm3qFMSsOHeo/UDvVLgozuKPPXY1sBh2Npgh4KohI+KWSNtEWn1tZXdsJk+XO8Hi0
         8JHYbRK1EsPtAsxNewVUiYvKKrKu277mHIknRwxxkakuEvPxdHe7l7e8smH3MTE537+g
         KcHuCPbjPjlkgOuKxuA2uzouN4W8MsZAevOKws9JHB/R7XdprLAEjqJaT73Wf4kbBAZj
         066w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763712121; x=1764316921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3IXXb16vFT9Y0Ivsdt7l/RkXNE32JLpgd0xAKQCiHc=;
        b=WKhX1M7G9DF/Wa3Rw0FHxE0kwVrjR98MKo0j3hw2VqbXLJG/ofYUlBlHJyC/G4ZjN8
         wIC/rvX46lij5vR1KrvdAAMygdjUB1F7pFNOtvHRYu9Z6qxLBODMVCQS6wahfZto6daX
         qbAB/cBTGw62ZBmiSkTcTLiA6ZE3qx0FVAVYVKOc94a4QOkNewkCzFJaWtLif6kcjD6j
         sNMfvFt+KDtHcn8Ke1q8LBEhGGGeBfS9rsh6DHGW4T38TtTNc2t3Xq+KDTtipYFFgtNT
         BrbvbeCzIAuvqMCm4oNMK3E6L2Cy7lXqAVk8zu21kBNA+UxNM39tQw1mK3MM3fRgg6w8
         VAiA==
X-Gm-Message-State: AOJu0Yw6gTP/iTnP/PfScT8t4Me8QfbFuLRw9INJbx5s9IItBPdPa9Np
	3QTVfg5sMRAzLg+lNfNnBYL3YtILx0BDfgPrQ9bAtBeorfe4jqJXFVNZl97EvRfJzoPMXhhaXTF
	QMmIgQ0nNxocrUT0qYeIsGJEz94b1KyPfGA==
X-Gm-Gg: ASbGncvYdp+fKBx2lniINgD3HBlkzLe5cU0sb4iI+yJUs30kGvXSltd6DWY8EEa7wyA
	pEnwni31I9Yo9eD1sxFcTMj0u5CszmLUR6b69McWOOuAJJjCQFXtwfWEIwG22YXoFz30pLGmblL
	M+eYRgQU5oTG0uozy3FZEjmJdDmWAR+CMV3bBPn4vkuSwMQgQgd4bQS645umRqAnrlWUKfmcbvK
	9DHzFV6alieCideWzBsuzqt18Pj+l1J33LXm37b8yzk0DcamFexwx/mnz+MNSoCScvDuVBMGg==
X-Google-Smtp-Source: AGHT+IHRt/0pjDRRlQvIkgGvEByxMc2jqmEUQMc/eGwqv1s3L6sNuHzVJusyp+9Foto7MUo5EUCNS2dcjWF2fC2w0TM=
X-Received: by 2002:a05:6808:3c45:b0:450:c9f4:ca10 with SMTP id
 5614622812f47-45112ce83dbmr633944b6e.42.1763712120933; Fri, 21 Nov 2025
 00:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20251118100140.1584703-1-ankur.tyagi85@gmail.com> <DEE7ENXV6WVQ.2O6ZK5X4KV174@bootlin.com>
In-Reply-To: <DEE7ENXV6WVQ.2O6ZK5X4KV174@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 21 Nov 2025 21:01:49 +1300
X-Gm-Features: AWmQ_bnxbiGQ4hO7-ZnLFhxuZ9-0Aa9p4OD-w-96YOH1HYBTPbea3qWLxQ2FuX0
Message-ID: <CADySD0FdsVUsEBkNhCTeX3_Y5WyURx9JrUebEpeXFEtOhGAWhg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] nasm: upgrade 2.16.03 -> 3.01
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 08:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226651

On Fri, Nov 21, 2025 at 8:45=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Nov 18, 2025 at 11:01 AM CET, Ankur Tyagi via lists.openembedded.o=
rg wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > License-Update: Copyright year updated to 2025 and upstream replaced ve=
rbose copyright headers with SPDX tags
> >
> > Refreshed patches for the new version.
> >
> > Release Note:
> > https://www.nasm.us/docs/3.01/nasmac.html
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> Thanks for the v2.
>
> Now it looks like this is breaking ovmf build:
>
> ERROR: ovmf-edk2-stable202508-r0 do_compile: Execution of '/srv/pokybuild=
/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-mus=
l/ovmf/edk2-stable202508/temp/run.do_compile.3506090' failed with exit code=
 1
> ...
> | /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64=
-v3-poky-linux-musl/ovmf/edk2-stable202508/sources/ovmf-edk2-stable202508/B=
uild/OvmfX64/RELEASE_GCC5/X64/UefiCpuPkg/Library/CpuExceptionHandlerLib/Dxe=
CpuExceptionHandlerLib/OUTPUT/X64/ExceptionHandlerAsm.iii:60: error: instru=
ction not valid with 32-bit operand size
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2810
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2595
>
> Can you have a look at the issue?
>
Hi Mathieu,

Sure, I will look into it but need few days as I am currently travelling.

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

