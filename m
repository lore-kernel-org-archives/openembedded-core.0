Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFF3C3ABBC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:51:44 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.46528.1747043502044107461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RL0H1QBo;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f54036c4b9so43928956d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 02:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747043501; x=1747648301; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=maNbEdganbjB55dW5xJ04tglgIN5myIpzHGdQCog004=;
        b=RL0H1QBoNujVs0c+b6t0qslyeHmh9J+JT2r22JyvMONdL49R2Xcz42xtvX37XmGPhM
         zvV68rCuiYYm9oYk9ERP3Fr+WgSyVLhuB/4O+yGN1xY9LKkW/ZqdvmK6UN+JSxM2zXhx
         4eZS878gtig8KFRxhmjE1yvsfN1GEm4hivOS/e4IewvN2tG+KnG3rTf+ZyqxDppmQobk
         bOkIsB7i/gLu/vPVabJAqHjXBQCDg1SS3svRnXJM5WDIOJ/wvPNUOt++lqgWx4cw/FDG
         ToRq//X2BczyU7fR10mQYyHq2u9DQkE/aK0c8P+XB7tIeUxpeVVdQndxFxwAkM4TITJN
         XvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043501; x=1747648301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maNbEdganbjB55dW5xJ04tglgIN5myIpzHGdQCog004=;
        b=dWwGF0u6Y3CCin88FQ3Mwf4NcboeG1GacT4SETD5rsV8taeZ84a6S0HgjsAQRWVKQL
         cZlFpDR0jXGCtIOTfTnjyGlUYv1wc5ARCbuU9zOE7Vg+LaQf1OLXOHBb7A4UgFsmVaS4
         6mv62hGIuOQsbJ7wfDbf/0Vq5q14C4KoGNTYpKN2XYZJ1EGR6+y4yH1yBS7aCi+x47tF
         sLZXCBmtoEQt0deH/kk94mGnTCVqb8AqnLa1oEZc/EhqcqzIoj4UoH2Bs1XLI0hH+ntA
         CplvX+S/13LD1iQkNimtVcZ21mQ42Q20DPczWJzZWaBlLM41KfgPAgsHEmJqXL/L/cI5
         L4MQ==
X-Gm-Message-State: AOJu0YxRx6zPpvODj9OtbIt2qg6nJsr2Di/Dtvt9hM2jfwmAu3oWYiBk
	KaBSKgZUC3WseO8P5+fTiETroyCO5wIKM4vik1wUaZvyDwygsodmw6yBN76/7Z/Gh0C7dupHxx4
	tGa+ROlWaUwCAPRm+QaG2DiTDalg=
X-Gm-Gg: ASbGncvRvAFPCCa6B1WsRqWTtZXTG4VY8JqBrHCcQRfho1pUbidLJn2Cgo2Yb2dMd7j
	UUuuo+56+mhGPb0OyUPgrteUyNSZsJMbs2lpaRs5sk28m+w1RsRxwNhJLWqRw+AEy2TO3keRs4E
	X2z8HtwgqNzl9vxFR9FWCUOVxCr+9iLZPdfw==
X-Google-Smtp-Source: AGHT+IFyX24GjRnJ76BghJk7BNXZslbeylgfpNH6Ze00Bl5UnTBUM7vuA6aPhgWgSXAyTzAR8zs/d4Om6F6kyM3AaHc=
X-Received: by 2002:ad4:4eaf:0:b0:6f5:3bba:837d with SMTP id
 6a1803df08f44-6f6e47cab39mr190145096d6.25.1747043501154; Mon, 12 May 2025
 02:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250511211411.1720365-1-raj.khem@gmail.com>
In-Reply-To: <20250511211411.1720365-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 May 2025 11:51:30 +0200
X-Gm-Features: AX0GCFs7acwhSAulLWoyynGmGv95BaykFBJ23VzENXk2bIKBkEoMGUOJKYcEYmA
Message-ID: <CANNYZj-cF_GPpkHv1gQE2nNOtVBu3RKMtn9mbcN-cBuLQSNzog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: Skip a non-posix awk ptest on musl systems
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216360

On Sun, 11 May 2025 at 23:14, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> The test depends on BSD extension REG_STARTEND which
> is not in POSIX, glibc does implement this extention so it
> works on glibc systems. Therefore the patch to disable this test
> is made musl specific
             "
> +SRC_URI:append:libc-musl = "\
> +                            file://musl.cfg \
> +                            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch"


Please no conditional inappropriate patches that disable things
unconditionally and add breakage and friction to version updates. Can
we rather fix the test itself to determine if the extension is
available, and skip if not so. Or add a configuration switch, or
preprocessor ifdef block, or something more maintainable.

Alex

