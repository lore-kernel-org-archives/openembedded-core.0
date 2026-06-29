Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141FEC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 06:29:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86406.1782714582435385639
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 23:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fB2sBoRM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so2652285e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782714580; x=1783319380; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+1YAcRMPf8SimN+yzh19kozO0oastdp3QEvDuzy3t4=;
        b=fB2sBoRM6CAEh0jr1UD9TH7wKVMhCSRlCjqvbUi9sULHodtLVqZXmOrPFHyqjeCqNp
         P8jIIl7KFkrf3cB87l8gihCpciEoF5nTL9LF4rgSBgcGqKxcefzukjF88C2QB081S3ZX
         0RjfLGWv11geqMMbGsZSicSd46vaMVM+dKuFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782714580; x=1783319380;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+1YAcRMPf8SimN+yzh19kozO0oastdp3QEvDuzy3t4=;
        b=IvH9RNLYXhGBE0AFF1J+JTdRdY5+/pfaSzhNaeWW3Zi3PTsTvuFbLCr7tJtOjkYPNr
         MS5RDnPdAUoCm9rNvo0aEdXoqMB7Op4NkImupnkWwYtD7d7an4S0chddPXJejBVY/gmC
         GZBo8meEKt21qsMbV2f/dCK4kfLgUK3ijQwFe1GxFjC+79YqcXf64dRSbt3DyNFTc1qW
         OTZ7CtIpcTHAVOR6LjAyGr1ZEsxo39WnrI+V+5t3hJpEgEpcKVQzGZCtB9labOK5yzFV
         uJ+dvRd3rbvr3mwOmxXB86RsS66SunLsYDZjsBIQ/ZDtXd6IsrzEJOuCMUO4KKMDk78d
         h1bA==
X-Forwarded-Encrypted: i=1; AFNElJ+TWdVr1dpdsc7dui0n5bmQ59uyxu0WxM7Y4Rg4p40ycVvgQI7eGU40YSkAROMI+XLY/JYH8bjXk425HifhSij5wQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHyFkebL30BwSOgDckuJExyZ/g8mKrOdldgdmjBWvDFZan6w4u
	J6M+U6jekVMlS9r1+e70y4vFbnN3BVGlFY5VkLJP9R5hsd04p9Pak1TgQv5WD7bt5+Q=
X-Gm-Gg: AfdE7ckrlHaUUpsWcoNEU0MzrnJtng5D7c6PRIJJLROaaCpE7OOoxUdB5MdvXtZ0xqp
	QHiS3/bsGZZ32robYrdjclT0NtTpUImXxcmQ/a96HjXDF9FsRo570MgL/ZWAL9+7vwk5Q4AFoA1
	j0/D8HVh4mlkfUQd6aA9GUgTRNjU3HDb5mOut2m1qJkeDMqMujXqB5ML4OHMCcZg3q98/EHeFw9
	8wIj7jlZTtaxFVQ2OQnRWsu+nthRfzYlTnBYqwkPq9G2j5tckdqo5mtE+5zIVbO7DTYIoQ6X+3k
	/820Wq/feVGcwkn0mKdicmP41/2ftbKumXakmkZJ7pVt6wR2RN3XiRyUPIrHGliW00DCdQogJ/D
	NwTmdyvAkTwnNNkDMMRpJcmHguFfBmxoxqC5Oe+oiBkpwPWQsO3mGfToAyBwDAEkJ5Gw9Xg17nB
	IP1Qk3NvFEHBw3xgvT9XeSeFRzXY2Xt6vQd+Iu9tPYHfS9fM2Bl7nqKHtmT9Jg37HwSHc0+ocvs
	DxZ5g==
X-Received: by 2002:a05:600c:3b96:b0:493:b4a3:5a97 with SMTP id 5b1f17b1804b1-493b4a35cd2mr7391885e9.16.1782714580434;
        Sun, 28 Jun 2026 23:29:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a58:86d2:ead6:c8fb? ([2001:8b0:aba:5f3c:5a58:86d2:ead6:c8fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926f94f213sm250016715e9.12.2026.06.28.23.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:29:39 -0700 (PDT)
Message-ID: <993e8d27ed255ee05dcdcf27b24a9fdd765c6ef3.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][PATCH] package.bbclass: add
 PACKAGE_POSTPROCESS_FUNCS hook
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: emailaddress.ashish@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2026 07:29:38 +0100
In-Reply-To: <20260618081020.86040-1-emailaddress.ashish@gmail.com>
References: <20260618081020.86040-1-emailaddress.ashish@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 06:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239724

On Thu, 2026-06-18 at 13:40 +0530, Ashish Mishra via lists.openembedded.org=
 wrote:
> From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
>=20
> This patch adds a new hook point PACKAGE_POSTPROCESS_FUNCS to
> package.bbclass, inserted into PACKAGEFUNCS immediately before
> emit_pkgdata.
>=20
> PACKAGE_PREPROCESS_FUNCS comes in picture before the per-package file spl=
it,
> so at that point the final file lists are not yet available.
> There is no existing hook that fires after the split with the ability to =
still
> modify package scripts postinst
>=20
> The primary use case driving this patch is SELinux context labeling
> SELinux labels must be applied on the target via a postinst script
> That script must know exactly which files are in the package but this is
> only available after the split.
> This hook enables a bbclass to auto-generate per-package postinst
> scripts containing targeted chcon/restorecon calls
> This helps while getting proper selinux context to files if package
> is updated on target while incremental update scenarios
>=20
> There can be other user defined usage if the hook is available
> The change is small 2 lines and entirely non-breaking as the variable
> defaults to "" so all existing builds are unaffected

The trouble is that this is only going to work as long as it is only
your use case using this function name. As soon as someone else decides
their function should be last, it will break your use case.

I guess we could hardcode the emit_pkgdata which would give you access
to the end of the list of functions?

Cheers,

Richard

