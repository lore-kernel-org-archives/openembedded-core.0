Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F781C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:49:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.94304.1738604935527589324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fxQztZCi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43621d27adeso32335535e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738604934; x=1739209734; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nTKr+HLQOWKxOCspW63jCwvWx1sW9Z3Nnu4zpCUX4w=;
        b=fxQztZCi3iItxvYZpPuSXgSwZHaVvzW9qdVbkYKkLSmasDwfxcqqu5aLEGOLteNoGs
         5dR96unAYTR0lODxHaWgPzjC6/Ld2JOnYcoXscLD+2g+lRA27xYhEqUxqJykQXXLqVak
         8R0ECr7MpKYdp5+oLe10vgfu6NtawcFSL8SAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604934; x=1739209734;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nTKr+HLQOWKxOCspW63jCwvWx1sW9Z3Nnu4zpCUX4w=;
        b=v+NdNUohrYQ7HuW4mKHbuLyKRjbF3LkNtpm4+iQQuMB4rEOiSebFieWqcew7YB33sT
         PejT+0UjATVLak7pssDbSlBRF/xBSxpjOtKk1lLMLJFBS5G3fZ280jFLG6ai8+hsALEH
         EpI/7fO62wV/Nz18eZidVICMegvqZ5x7RcB7js3sgXkPpDzfc56HCAQhoM9zCuFO1ICt
         lDF2FlI3mqWPXNzOMFdqysiD6zcNsYrab9vbvwWvqhNwm/8KLe/PEojWS/qTn9zjUHF5
         8OJlzhIQkPQzcPo4qFZP4gpwADx1KXxlELSBN7qiAusIJjofOnPPgLJH2Aoary5ZjC4m
         YGLg==
X-Forwarded-Encrypted: i=1; AJvYcCUyjqeKFe7X4qMXoUY+ARYi7iX6Wi4Gx8VjEO7Nf+93CUHqQM2iht4RcBPVHwSZZsNNvlSQ2adj9vtaFZj/uC5E9g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKUqBBH0Tx0cXO0CcbQnuvAr5YpXjsFXcpF0Txgbv590kXRoEA
	OBxcO3wo1im67x/Y3bZc3fT7kPfwACjQ2utp5rMl/OardkMWypLxODKN0qnuUOg=
X-Gm-Gg: ASbGnct/WyDg/RuCUYlWH9JSd8hFbW74tBymiRvRpz+wDAs5P2NJLFAiHagWVBxJC/4
	Me9ofz7FdAjWfBVZ/dQ48I9F1Jbub5QYLwG01n+7Nt4rXAMWuTu9PUJrTScpEKX7ATVW9orCbLP
	Mp6kS+Jlzstp2TkNnDuF5RZnf1MyYKsB9V57fYAQz7a03HhSBW4Hngy0cz084+lGTnCQLyi2xOS
	6+5p8TW5p4CBp4p304fLrPN+1UVFYGinEwPFy87pcj9cZUc8kdgVo3UxcPJZe6QHvT7O7r5HOe8
	mu0g9YllfWKdcZprJCOrNJFKB67YhwDTKo8/dKm/iWZnikGMBpzTCUeM5eji5pU1MuKWB9fz3Bx
	6U4wf
X-Google-Smtp-Source: AGHT+IFz3Vw+PjpZwxobfaTXbRl6A2x9VBEdx9A7z0GcGpQ/gBua0HUajeptlLr9CaaDIseczGYw8A==
X-Received: by 2002:a05:600c:3b94:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-438dc3cc3b1mr207532205e9.15.1738604933864;
        Mon, 03 Feb 2025 09:48:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:41c1:3919:865f:692c? ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e6a4dsm161225905e9.21.2025.02.03.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:48:53 -0800 (PST)
Message-ID: <c9286cc8f33e97e8678d2639c17f8617a49b20a4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemuboot.bbclass: Fix QB_DEFAULT_KERNEL
 expansion
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
Date: Mon, 03 Feb 2025 17:48:52 +0000
In-Reply-To: <1738604640-31507-1-git-send-email-mark.hatle@kernel.crashing.org>
References: 
	<1738604640-31507-1-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210728

On Mon, 2025-02-03 at 11:44 -0600, Mark Hatle via lists.openembedded.org wr=
ote:
> QB_DEFAULT_KERNEL was not being expanded unless INITRAMFS_LINK_NAME
> was defined.=C2=A0 This only happens when building a kernel with an
> integrated (bundled) initramfs.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
> =C2=A0meta/classes-recipe/qemuboot.bbclass | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/q=
emuboot.bbclass
> index 0f80c60..ee71a2f 100644
> --- a/meta/classes-recipe/qemuboot.bbclass
> +++ b/meta/classes-recipe/qemuboot.bbclass
> @@ -96,6 +96,9 @@
> =C2=A0QB_MEM ?=3D "-m 256"
> =C2=A0QB_SMP ?=3D ""
> =C2=A0QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
> +# Define INITRAMFS_LINK_NAME to ensure that QB_DEFAULT_KERNEL expands,
> +# even when INITRAMFS_LINK_NAME would not otherwise be defined.
> +INITRAMFS_LINK_NAME ??=3D ""
> =C2=A0QB_DEFAULT_KERNEL ?=3D "${@bb.utils.contains("INITRAMFS_IMAGE_BUNDL=
E", "1", "${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_IMAGET=
YPE}", d)}"
> =C2=A0QB_DEFAULT_FSTYPE ?=3D "ext4"
> =C2=A0QB_RNG ?=3D "-object rng-random,filename=3D/dev/urandom,id=3Drng0 -=
device virtio-rng-pci,rng=3Drng0"

Is the kernel really called ${KERNEL_IMAGETYPE}-.bin in that scenario?
That looks a bit odd :/

It feels like a situation we shouldn't be getting into in the first place s=
omehow.

Cheers,

Richard

