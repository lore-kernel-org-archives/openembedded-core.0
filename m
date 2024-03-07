Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DC8C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 09:46:29 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.19727.1709804784135064395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 01:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQR7CQ61;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51320ca689aso686984e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 01:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709804782; x=1710409582; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ony8p5dgiquU60m7HbYOyj0d5H0WYjo3WDRo8yt40F8=;
        b=MQR7CQ61qOF9igEeTAx39EuQAcZI5dsXxxdoRqDfK3eQFbO7txKfYdJRuyYxJUiF6F
         wm+ABUmmlIgHcqkxgv6qgIKN1v7+inVbRfoS23qt9riI5C3N2MM20WcUrRVsEX8SzG9h
         Xcj/Nv1/w+qdfKswZeFbTy9pOCq/d5QbnkVj+v63tMf4QbPkfXs+nYPUql+CTVFvjrfx
         RxDzgXT4Z/VfxK+U4gGWtw9pVZvdmB3CpQPL6PRdPjNaEKgflb7b5h3w1zniz+TFV3VM
         6N0F/cT7bDsJqUEArvczpg4Z22/BHHrNfg3++7HwRbgPDJE4Ev///YavBBJOvF5fbdAV
         9+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709804782; x=1710409582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ony8p5dgiquU60m7HbYOyj0d5H0WYjo3WDRo8yt40F8=;
        b=WLlhavX7w3zoTnUsVlbxEw3plG69gwQQjOBtqTnjAjDEI3zTLCr+2+wqGVsUgqlo6Z
         ekN1/6iKgJ4pu0ZXrgQmlm0i+wagoRAurye3P7Zsjy7LGIzrEzQ78XGF+3KHUjVxfTdE
         Rt29F92XBtZhwKTVTwvEgFo3ivrk7QQ29MaDowmUyqbydMah+FT7dSIivJT98wqmzLmg
         4EHMQDlMbRCIdjtRWuNf+vv9CT5FI4Uhs1Fh5SN9u/kkVqxZV3fB82+VkWIXS8gXIzp8
         o2fFLKR3MLIpZA+omLApM/I+SMlfvqvJHlk2O9FN3aXb+wtm1mel0fKggqss5AIUnLDp
         keyw==
X-Gm-Message-State: AOJu0YxblMDi7/8zKTP86xAK/GH8+aZjWEdz12Xhexb7Zp0KxVe/8SSn
	RpUl14XlFYKpgbRZCO0vNhJa83NlNHwXxotaynllbsaj3VTns5F+b2EkamMozaJPFSQnfUWMimT
	Rb0ysguKiyESByW/ZrJe2gtZLwzE=
X-Google-Smtp-Source: AGHT+IGpneYTSsA5VbHnSMIdctodg8PrF1e9ZB/tiaCMNYrtaZMQ05nSuczw0J4lUhcExAANCJeJSgSvNKFBVuI1WEg=
X-Received: by 2002:a19:5f12:0:b0:513:3b5a:297a with SMTP id
 t18-20020a195f12000000b005133b5a297amr947189lfb.2.1709804781704; Thu, 07 Mar
 2024 01:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20240307091925.2324637-1-changqing.li@windriver.com>
In-Reply-To: <20240307091925.2324637-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Mar 2024 10:46:10 +0100
Message-ID: <CANNYZj-iFLuEwaBvVTKkUnaDwBXSTGostxNPUAKKFeZb=C-tbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] dnf: remove log_lock.pid before exit
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 09:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196781

On Thu, 7 Mar 2024 at 10:19, Changqing Li
<changqing.li@eng.windriver.com> wrote:
> +Upstream-Status: Inappropriate [oe specific workaround]

You *just* said you will send this upstream as requested. Why is it
suddenly Inappropriate?

Alex

