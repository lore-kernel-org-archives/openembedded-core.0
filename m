Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B630C636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 11:10:59 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.8207.1675422656198845716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 03:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DR3iqdry;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id x29so4936219ljq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 03:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1uTBU8SEouKvQXbshp2lqPJeBcddnG9tyN77I2x+cvk=;
        b=DR3iqdrybOdomEaSk4CnFok25V66aKWKzogErlBh3xpli1CdhVb4txfHG3j1IY4RO3
         A9OC4FhaJ/Ac+8Q5ty2PXSYbJX3g7Ub5Y7IdBYX3V0ALioZjjV0aJ3BZXH+BByTknbTw
         cW9YU+ioPtDvoBDtQ7i7xg/4BpQJLII747cBb7lcFocmb3MTiNNbNKzbnE+OGXHzoYou
         106wwGTKZ3OATESdS1BQ4QdWYC/WI5dFI1IZ8fEiymkRylmAiuWv4yq3h0TZt4Du01o4
         T2vC5/Sk1XHUB73A+CHjf3tvj/0FXNiXX7bUUDSLrCbOb5AMI/kH0viigLqrsfJsbAMk
         yjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uTBU8SEouKvQXbshp2lqPJeBcddnG9tyN77I2x+cvk=;
        b=CAdxFISvHjwIUJeGqoYfMjS8K4VBfBGTlYcXILYShLUdEMrEoKkuYJVbBrRPzfLQbl
         Bj2EmVhcrVeiCeEQPvtaDpTOdROj+rcO0jXcPuso7n8VQyo0em0S1KUDoz/eEp67Anf7
         9MdlntWnq497sUc1oy7WLZUmUPWV2gQRvQp19jxEcJh/6ljElXKlCIG3+ruJPeUb7dNn
         nTHSmlfuTLPtdgoRh3SV6D+glEfeqBjX1B98/APEUZikFbl4TifuT10BNekjjzRW6/Nv
         jGwLV2XDIzMxhVjS5N1qkTljpk3ew/NdbiYiU9h/GmkXQnveLJZ+4eS90ikYqCjt8hKC
         qb7g==
X-Gm-Message-State: AO0yUKW7ukVG9Xs1caWQ4qgAApXe+ujWwq59ZUdMkjERV4NN/nN+WNOF
	WMZQNZ680KdT3+gxfnZIU1RMNNOnD61U7qGl34k=
X-Google-Smtp-Source: AK7set8YsdwXGlo7Cci8xhv+yd9Tl8Sai85lMrEqA90UUBc9bum7awKjosGd+gH0fhAiPrJ4deuepjd6C1i202tlh0Q=
X-Received: by 2002:a2e:9ad7:0:b0:287:4eeb:53dc with SMTP id
 p23-20020a2e9ad7000000b002874eeb53dcmr1560991ljj.27.1675422654081; Fri, 03
 Feb 2023 03:10:54 -0800 (PST)
MIME-Version: 1.0
References: <1667351911-9129-1-git-send-email-yanxk.fnst@fujitsu.com>
In-Reply-To: <1667351911-9129-1-git-send-email-yanxk.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Feb 2023 12:10:44 +0100
Message-ID: <CANNYZj9dF79rWO22kXswLNT4Z+GumXo1EQBjO250PrG25sfacA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH V1] tar: add ptest
To: Yan Xin Kuan <yanxk.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org, fnstml-fujitsuten@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 11:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176714

On Fri, 3 Feb 2023 at 04:08, Yan Xin Kuan <yanxk.fnst@fujitsu.com> wrote:
> @@ -100,6 +100,7 @@ PTESTS_SLOW = "\
>      python3-cryptography-ptest \
>      python3-ptest \
>      strace-ptest \
> +    tar-ptest \
>      tcl-ptest \
>      util-linux-ptest \
>      valgrind-ptest \

PTESTS_SLOW is for tests longer than 30 seconds. How long does the tar
test take in your local testing? Is kvm in use?

Alex

