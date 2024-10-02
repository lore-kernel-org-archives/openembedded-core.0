Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF01ECF6D2C
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:39:44 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.7549.1727876384346525365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BSGUkE65;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e2b1b10103so1839647b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727876383; x=1728481183; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idv1zMIbQXrJASVBXohYF08ZTAQm20IFj9LtMyGGfnc=;
        b=BSGUkE65YcEf8bmTr5AAML8Wof64LbISZWLfcheRxWBYmqkiGYMLSPyrTvgth8F+h+
         6M7VP+HHBsbwD5LYqZ1GrnEvGws32+PjCgqs8SW9U1UnKP7phKQWnWtT0QfMxqhS0mr/
         IvNvApMXgub8bPtsjbBjcRORr7HSbcN1Bk7vExOx4/fHhMYXlHyPlFJF1ZBIEreiB+iY
         r+f61ZiYtTjAjlJflReIBRAwniX+7Pcf2hPWbUTa3PP+fhhqZpmhPBHzBSOil03PD1sv
         L899XUW1zj0ororlspyyG3X1hmintjvflpKqeIZsTUzAItcRgXVp+QCwZio8rknM2dB8
         st8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727876383; x=1728481183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idv1zMIbQXrJASVBXohYF08ZTAQm20IFj9LtMyGGfnc=;
        b=xLLwcxwjLP6X1Cr6SA2qvaedI+AQXDvNdG/ODL6SR1o7qX3lCo6xcAuJYlhOUi1rMF
         7JCN847biUHcnJ7kv/lJqP9555ncjyjhrgnnPygyLC1pQ4pC77gJSeihkdhz5ZZJJcWr
         STYh8yhvUi4Y8S8ZJfERAiA5xo/q6uCQZvnke+dhomGymKRHP0oTP0wZ6BJuhakasH+7
         X0ZYtyEsS4nVxg2TEmvxdJzAI4XCIqFpa9CFA0tq1CIwj7m/TaZbH8vwnUuH5colEdds
         SUAFTpxJaQxdyn//fnBubaUWF39cbfgn4hKCAI6LTZt+Cn+ibS7REhitQkUHEDRVVcVZ
         DO2A==
X-Gm-Message-State: AOJu0Ywqe+c9TOVCqyuS+GGOZcLQo0PjkzCWa5zU7Ux03HgVdJxaefaq
	78KL/Emhp6u9IH6PhBxnl+ksK8m+8E3sJ3ByU+Nz2JedLNrwSCQBiwYWbElN0U2n2zoA1duT11Q
	XWtwWqw8zRx83unFoYl4c818sZTM=
X-Google-Smtp-Source: AGHT+IE1v7PU1qS1hM5UkB7WOMhBb3XYWN2uMsDOEtBQb/19g1iBx0MF1odRM1O3BWm8xuWLEYhcr/E9QbL6RJrHlx4=
X-Received: by 2002:a05:690c:30f:b0:65f:cd49:48e0 with SMTP id
 00721157ae682-6e2a2e4d374mr31120417b3.31.1727876383316; Wed, 02 Oct 2024
 06:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241002100900.2975523-1-paul@pbarker.dev>
In-Reply-To: <20241002100900.2975523-1-paul@pbarker.dev>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Oct 2024 09:39:31 -0400
Message-ID: <CADkTA4NYV5AtcMMZMWfHRO+iR7dbW+QPtf1oBav=EONWET0Bmw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] kernel-yocto: Support in-tree config fragments
To: paul@pbarker.dev
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205201

On Wed, Oct 2, 2024 at 6:09=E2=80=AFAM Paul Barker via lists.openembedded.o=
rg
<paul=3Dpbarker.dev@lists.openembedded.org> wrote:
>
> [This is currently an RFC as it depends on a separate patch to add
>   support for config fragments with .config file extensions in
>   yocto-kernel-tools:
>   https://lists.yoctoproject.org/g/linux-yocto/message/14431]
>
> In Linux 6.8, the in-tree rv32_defconfig file for 32-bit RISC-V support
> was dropped in favour of a Makefile target which combines the RISC-V
> defconfig with a config fragment '32-bit.config'. So to build for 32-bit
> RISC-V using the in-tree configuration from an upstream kernel, we need
> to be able to enable this 32-bit config fragment.
>
> We can support this via KERNEL_FEATURES if we add the in-tree arch
> config directory (arch/${ARCH}/configs) to the search path.

Agreed, that this is a more consistent way to bring in these types
of fragments (versus being hidden under the build/make, etc).

The only issue is that the audit won't react correctly to these
fragments, so we'll potentially end up with silent failure of them
to apply and/or options that are not valid, etc.

Let me queue this patch locally, do some audit testing (and changes
if necessary) and I'll send it along in my next pull request.

(Same goes for the kern-tools patch).

Bruce

>
> While we're here, let's also add the generic config directory
> (kernel/configs) to the search path so in-tree config fragments such as
> 'hardening.config' can be used.
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 6d5c3b6327b6..66602d359404 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -248,6 +248,9 @@ do_kernel_metadata() {
>                  fi
>         done
>
> +       # allow in-tree config fragments to be used in KERNEL_FEATURES
> +       includes=3D"$includes -I${S}/arch/${ARCH}/configs -I${S}/kernel/c=
onfigs"
> +
>         # expand kernel features into their full path equivalents
>         bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHINE=
} -DKTYPE=3D${LINUX_KERNEL_TYPE})
>         if [ -z "$bsp_definition" ]; then
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205183): https://lists.openembedded.org/g/openembedde=
d-core/message/205183
> Mute This Topic: https://lists.openembedded.org/mt/108776739/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

