Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E2EC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:37:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.26050.1668879470603078639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OPS8YYCd;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id a29so12990026lfj.9
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=azbVr8440hXaDAI74bJ8z6BT2X/lrPRVFA/9tvOxW/M=;
        b=OPS8YYCdVlvYXD4F5EvQ0z9L7hRDzSde/RV9NKL67B1I8APfTi7hpALfn5idlAh9M+
         zszEhKd9O0oWxUnSdgXTpVFVCG5ElWmHRJLDMgEpbURbKqzd+Rjp/rxNCRVRvTw4+JFB
         sorI7EPLCrsN3tx78vRsM37NOrI6pLKve8a0f6WEesyluIKchAn486tx696wb4CVgE4O
         J0AtuDwAEi7nkZ/ExB0PlfYmtyRjPGGKrW7acAz777l/e3tvuLNNBATTaniq3Be8oETN
         Bc2/k2itNHwPqvELVR9dAIYRJNRcvxhMRBBEgcc0Sbx028MeWPpIT1iZnNZRPMMq7i+q
         s5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azbVr8440hXaDAI74bJ8z6BT2X/lrPRVFA/9tvOxW/M=;
        b=OVjVa3+i5WYd2V4ZCNHnpe71hrytlWhiC7CbzCRy3Ula8wurhFW7I/fge+zEm6PMjB
         fb4Lg1xvHVlAw+AkwRjILYeniyJp/NrDPhRYgh2qriA1CTMIASGUaEzP+HkStMcyiycK
         76iLDOBndLxlL25+0lzWqjfUJYe6wHQXoeIplv0w7r1IkL/wzbezSZYkiXSYrcZjH/f8
         y+8hUtxzcqDC+gkjgCS6tXQ1t0X8fduT/xtU1UQl2bKJZWMaihKvzkiN9ENHpR5QBz85
         SWXrlG3zzEEWf+HfkNzQ6/qWu8K/SBDvp+boHP9KbeQ4jj05xGceboWfwVOqpGRP7XiK
         zPuQ==
X-Gm-Message-State: ANoB5pmcrU9ABlInIZWYwQOlQTq7CWsmH6vHvkQWFYHHalt1xH35qs1j
	n1hBkgAyV7aHK3J5QrHguv5Rv4R3eRoAE+W7w1E=
X-Google-Smtp-Source: AA0mqf4SCnyR+dwi9m9hWgj5w5e9Ukl4QKXyFta96TQ2HxgcY/RVIQbrnoUdGVCxMVLZdTjWgqoPrh44O0Vr5UBkrr4=
X-Received: by 2002:ac2:4c47:0:b0:4a2:4d53:8294 with SMTP id
 o7-20020ac24c47000000b004a24d538294mr3590611lfk.263.1668879468504; Sat, 19
 Nov 2022 09:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
 <CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
 <DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
 <CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com>
 <4JYHLR.TSDICAGWLD7L@t-online.de> <CANNYZj_akT9iove+LmqnrY4zA1ghct93t4P7hc5UtuSf8s5eHQ@mail.gmail.com>
 <XAMJLR.696EYFVTYA7M3@t-online.de> <CANNYZj_KxF2o1TdsKRN3ESqN1T=tkbb3wBB4UZ8-5SPDY2or+g@mail.gmail.com>
 <52PJLR.JPC24H6Y7EH91@t-online.de>
In-Reply-To: <52PJLR.JPC24H6Y7EH91@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 19 Nov 2022 18:37:37 +0100
Message-ID: <CANNYZj8AcsEM2SQXarq=x_6_OjnJMKNkyJAQnuRrBaz4vw7s5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: Markus Volk <f_l_k@t-online.de>
Cc: "Sajal, Sakib" <Sakib.Sajal@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173517

On Fri, 18 Nov 2022 at 14:21, Markus Volk <f_l_k@t-online.de> wrote:
> I'd rather force everyone to patch their 2.x scripts to ask for python2.
>
>
> Should anybody still promise Python2 support?
> I know, reality is still different, but since it is meanwhile unsupported, my idea would rather be to put the pressure on the possibly still failing scripts to get them fixed for python3.

Very well. Can you make a patch?

Alex

