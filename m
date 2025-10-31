Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9B2CCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 05:55:15 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.8445.1761890107058900729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 22:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJ90k0Lt;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-87dfd3cfafbso21501296d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 22:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761890106; x=1762494906; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhDzmsdKi8P9I4gBIJ9j2yo38XRcMz0XraFTxH4etBI=;
        b=KJ90k0Lt81BJoY43BexokfhUkjXkKz25P0PXS+L6VzEzBXCU0l7S2CkX2+vSy+blsv
         ZR+WB9AZI3mMsUTMPFNCmNDVzPudJJ7gMnAR2XlnLZGOXyhXCeZ/H6AboRl4ntbwkY8I
         PsmubjWfnt72CmRdgsBRv3zK8U+rFTNYNavIo/3u5RHjUuLNbFg1mdpqnlVm+jGr8gVS
         kQbD0gNpBuNxbkqNeZtr+3QF+oQCoZ+IAKweO0jP6n7UdZPsbaDcmsAb+XQ9aoELi+Ek
         XSU0JdiMp8PgeGeu3m0Dcu+gSS2pgB6R0RDfHzK710dnWK1t/hxQMjcpdYks5nzLExb7
         ZDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761890106; x=1762494906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhDzmsdKi8P9I4gBIJ9j2yo38XRcMz0XraFTxH4etBI=;
        b=p3qyunBQp/oPFbRCc1iNwdIDSauYb72/FdWtCc15k4VlBz4qV9bgtLMjdAJd6jfFsE
         vzmqfl4kZfISQO5MtL/RW97CNHTrctzlc+R7j8nr3PgjnADNHVLhCotJ/xcj9N/k7Xcp
         yHDO1kJco7KQRBwbGv4HsA7cJAHUzPhu+Ef5pjLJWEt9aEWW4xfGp60EgcMnClfmla0U
         e162DQA1xdrJF+gF/9rHA1iPT56tPeHO83Z0e2Ya4hMV1hCk6wrueTfNv+TejqlrX7eN
         YtP5xf29kZkduIxfa1e9q2CBnNQFsxZNG/kR5+xwpm+KnmOZqdsfZBUTtVJrQhWALXe7
         lYHQ==
X-Gm-Message-State: AOJu0Yyfkrh8S21nha10OEpXlY5GXYgXRIUNxCPlqybdeqmVz1cTOpGN
	h5Y321X5mwp3b0We2ysWL7C/LEr+ITlOdJQqMJ3mLg9+uwW2gx1eN+iaWLKjgPqQTKvvBxh/Mst
	xotOQ+X0J8AgfpfLuUUMYrg2byv6HYCZACJoo
X-Gm-Gg: ASbGnctq7oevsHL3eGZ7JJNwdxwCxr9LCgADQE+j+4kxzr4Ef12iK1iJuYXLX8R+PJK
	NiKms27ONs1Yz3dX3RSBiIVjFiuYkmgON2Lt0YAPVVQhE2QD1epzfcH789nFQmzbmcjPksJTs2f
	QLZuFAF4PAjwSz4Myg/vftR98PV1WX3YuPlHZHRshpC+aXtZd2/pOf3l19Njrdz16QcekCI6Xtp
	IMOGwgWp8lODk0ErZRvPaCo/+Lhz+9V40/tnhueaWs+FHkakiL+iI2SiRCR6x7Umq0s0mPYOD5V
	KtVwqR7hZXHjnDfh9v736HKtJAvjx3Pa4YVPA6Sk+8GKcG2TA9L9UaPtO1fxKWfQwn6PlL83AZr
	O9/BMWz1GlHhAIZdaWAoHm3IdLc4K
X-Google-Smtp-Source: AGHT+IFaChwYhXOhNEFLHe9arTkuOMbr+PYz920Db+v2M07OnF6qeJXCOZFNPrEadcK2xb8ypSwRMUqVeLGzHfhw0Zg=
X-Received: by 2002:a05:6214:e63:b0:872:e9b8:e950 with SMTP id
 6a1803df08f44-8802f48b72cmr29260906d6.44.1761890106025; Thu, 30 Oct 2025
 22:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251031030519.2602967-1-Qi.Chen@windriver.com>
In-Reply-To: <20251031030519.2602967-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 06:54:53 +0100
X-Gm-Features: AWmQ_bkccK8FRBAGekP7xFi92C8BfgDbooBidqGGRIspahty-oswsWOtly1vaT8
Message-ID: <CANNYZj_1CpU0svcA4mRWA6=mvY+GLgqruO50jACnUO439FO6aA@mail.gmail.com>
Subject: Re: [OE-core][PATCH V5 1/3] base-passwd: add clock group
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 05:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225527

On Fri, 31 Oct 2025 at 04:05, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> New systemd version (v258) introduces a new group, clock, to
> "enable applications like linuxptp to open clocks without root
> privileges".[1]
>
> This results in warning at do_rootfs time:
> WARNING: Group clock has never been defined
>
> Add group clock with gid 81 to fix this issue. The wheel group's
> gid is 80, so 81 is chosen.
>
> Note that Debian rejects this patch because they're using sysusers
> to handle such groups, including 'clock', 'kvm', 'sgx', etc. We're
> not relying on sysusers, so we have to add a patch here.

The question I had was why can't this be done in systemd recipe,
similar to what weston recipe does:

GROUPADD_PARAM:${PN} = "--system weston-launch"

Alex

