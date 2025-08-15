Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4687CCA0EE6
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:04:59 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.7659.1755248691883757590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mtSjI1yK;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70a88dcb665so17669166d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 02:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755248691; x=1755853491; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sfOKXxhcvga6c1LFXB9xB16gXvPpyviEfgi5XhQGuNA=;
        b=mtSjI1yKWVTANWGE70INTt3bnA9Ern02dMT8g8igmpPupKr14HQ5NtOQoUZpPk+He0
         7E7VGJy2IgL5hqSGd59DcAOwD54D8KqcNZIizadTV8hjg+N4nNoqw5gGR4tqk8rJ1yex
         NvYHpXAvGRVcnzMQZPHIFIcJq04ZlRmtL6EEkSyRclPQa9jpwIWzuQkZASHjckAQNF7k
         H/nFk0x1xAh3ERKx4X1aP0zVEHTap/H1ORHB6c411RcN0aeXCAlODbwdQx2mRtVJ8czg
         ns23Vbk+tR0n1Gj5xdOXNzhVAHrDCkX3PWI9g0ALd54iAVmZzXSplZq3Pa5DoH9r9xAv
         J5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248691; x=1755853491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfOKXxhcvga6c1LFXB9xB16gXvPpyviEfgi5XhQGuNA=;
        b=jk0UYgMfSmpE1U1fndCFOrW7lSXVFA4QozrpYa641eosJWnZ0Z8mYX7rfvKAcJaKq9
         zXH2MJ0VFHZkyBLuIGxqcgc2/KcMaOmWhfLTtx2K3By5e3aR1+iNKS2TTXFYuGd7uHX8
         FhVwoM4DAQJjSgKv+8qHOWTW3qpjd/tUbbb7kcnhbxM1AbVifNhqbxCfvk7PyvMGlk/s
         qyoeD5fjI4KEj4VgvmyLgFxHWZxvJY9oc1GJrqohpccne2feZRB5R3+zJWvU54g6oOrE
         OYgDiw32HBYtm543+kCpFVtqfS+RWIklIcEphNRxMFHPicbjMc/v0h7khG328a4BFqUP
         9Oeg==
X-Gm-Message-State: AOJu0YxnKhAk21RHnciFFxKTjwP1Ozb0L8FGCnS2+daPqY9vGC6gBnQ3
	wh1jxKYDfKXO2DikZSFDWYZNH39OIYgHzla7WvhmQ38x1lMUAsQZb0ZGv09+u0Nh49sjx1+6o/f
	1U6vqVs+hU69IkVgjm5TyfTRTy9W10hs=
X-Gm-Gg: ASbGnctVonP6pk2UC0wuCOv5Bc23ypXtJqodbN32NsDPFDZ/GGXD4yf9/BC0yNrmE+X
	EIug987zfYhfIMJu4F/ttCB+HGhML9xlE02P+FXupBoefXL3S0pFAlSnEwxaI5oqMa1py48yNGq
	3qYJoD2x9AxSQFcPEgRPdB8psur/rAIJdanTqUmXCYUQGfu7ewdSYR2LTaqhftgOhDoLON9mgA3
	6D4tFhEtCBlIgug751hGpLSron3VFurjpUV3oaUb5AVlSms
X-Google-Smtp-Source: AGHT+IEKuRVSCynwV094HUHtSv6IIAidZl379wRk0TQGzBGsfkqfQePovMmjLTcujsyrxk0ykHXx6UGhMwjJ2MAJ8Sk=
X-Received: by 2002:a05:6214:1c4b:b0:70b:9f37:7f11 with SMTP id
 6a1803df08f44-70ba7a93c28mr12737656d6.13.1755248690714; Fri, 15 Aug 2025
 02:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250814172348.3882586-1-tony.rex@ericsson.com> <20250814172348.3882586-2-tony.rex@ericsson.com>
In-Reply-To: <20250814172348.3882586-2-tony.rex@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Aug 2025 11:04:40 +0200
X-Gm-Features: Ac12FXzW3sJYap_yxfUNLc8POnRhb2eA4dyIK81xc5Bqi35HCi3SiXu18hC30JQ
Message-ID: <CANNYZj8WU_gjQsf8GhVcFg6371UK+T+ePUcT9Oa6QjKjRE_nMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] base.bbclass: Fix the recipe parsing race issue
To: tony.rex@ericsson.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221876

I don't understand. Does this patch trigger the fail or fix it? If it
fixes the fail, how can the fail be observed?

Alex

On Thu, 14 Aug 2025 at 21:05, Tony Rex via lists.openembedded.org
<tony.rex=ericsson.com@lists.openembedded.org> wrote:
>
> There seems to be some settings that are not done in time in
> base.bbclass when setting up the do_fetch function which leads
> to parsing issues of the recipes:
>
> bb.data_smart.ExpansionError: Failure expanding variable
> fetcher_hashes_dummyfunc[vardepvalue]
>
> Also by fixing the build error the floating tag/branch build error
> is taking effect again:
> FetchError("Recipe uses a floating tag/branch
>
> Signed-off-by: Tony Rex <tony.rex@ericsson.com>
> ---
>  meta/classes-global/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
> index 6be1f5c2df..c955bb861f 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -147,7 +147,7 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>  python fetcher_hashes_dummyfunc() {
>      return
>  }
> -fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
> +fetcher_hashes_dummyfunc[vardepvalue] := "${@bb.fetch.get_hashvalue(d)}"
>
>  addtask fetch
>  do_fetch[dirs] = "${DL_DIR}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221870): https://lists.openembedded.org/g/openembedded-core/message/221870
> Mute This Topic: https://lists.openembedded.org/mt/114706198/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

