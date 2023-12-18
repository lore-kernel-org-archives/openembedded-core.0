Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E5EC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 09:25:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.40742.1702891511888624694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 01:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHfBHSYC;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e18689828so3003860e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 01:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702891510; x=1703496310; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=smSXqpPbEil+Gda7Y/bvOVtNxsWyv4pKanYiOwuHZsU=;
        b=AHfBHSYC1vPcsBlU9jir1I7UfuzDAzN4OyeOs5QDe/mG7IfbZd+QV1WjUGRVgsLOhQ
         GPvYWCmwBwSD2R7KMwnc1dOoQoz9lqd5XM3eFigxWs57IHPA/PwBjdPZAleH7se/eMaA
         kXQioU+bUU8+jnzdBQxG18KxSR0o0q/IRHdxYTRd/ZHLP8tQsCbDM+l2Ez6Fly9Bgstx
         CsXCas1otTSUnhBQkyIUPxrnJUZrQShLd3Z7O/43O4HRVayt1Tpq/c0ZmsLueNyavRdo
         f7P822nBe9RwZZlTDwwj6A1ZxlxnXPlXCMiKg2hKER9Oe8oQcAF1qpnZhr5tPzwnEhFV
         fwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702891510; x=1703496310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smSXqpPbEil+Gda7Y/bvOVtNxsWyv4pKanYiOwuHZsU=;
        b=qwCy7Xc7hx2tCoF6W1k2bIrdwTQqui5QARgsboPrNzPTikH03OJZZVjXdWTMa8V9Je
         /eHntmjU4jk0ewoP/yQCTbkwGGiZmQX8/CSWlWs5vq+43CVrZcQQtwTfOUN3qczv3z2Y
         UI54PWkHSVCds2PqlSX4wfOqKgW2J3wJ8MBPpzSjXyDkQMSQoU3XxM9wTgf2iQBUPwoa
         /Y+tkpvNaynt0yksy7A/u+F7BIw623eLILdg31pxpEqATeqWWhkz9vRK1RZxUg2MBU61
         8FiIC3ag+e1/GZP5ClX11Ah8+ID51ZkKqRZRDnWHNypENAbY31GkaK4204PR/g+AGtEX
         x9Nw==
X-Gm-Message-State: AOJu0Yw0+ld0f44k2dACpQvX9hk87rNP95w5Mep8j09FWPH789/Ul850
	wQNlyoBZZh1KAG2p/6qdVUxoToEU9kR78N9K5wU=
X-Google-Smtp-Source: AGHT+IEY7+1cZitNZ2XW/KTHU695TgLyKNnxOstMTllVHg5Ao69hX0lBaMfFKfdBTbIxWf7FSHWCqU7B6jQcpLss7Dk=
X-Received: by 2002:ac2:46ce:0:b0:50e:2208:6b36 with SMTP id
 p14-20020ac246ce000000b0050e22086b36mr1725899lfo.115.1702891509961; Mon, 18
 Dec 2023 01:25:09 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8Up+UhiQo96T5OMxp+seYj6d8VyAGeF4vCCTj7mt764g@mail.gmail.com>
 <20231218061542.1845279-1-mingli.yu@windriver.com> <CANNYZj_DszK94DujKJ_a52HsAhW92nP0eVtitfuKueKeMNQ3QA@mail.gmail.com>
 <53d83da5-7690-1cf7-f0f8-199c9515142c@windriver.com>
In-Reply-To: <53d83da5-7690-1cf7-f0f8-199c9515142c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Dec 2023 10:24:58 +0100
Message-ID: <CANNYZj-XxVtiMOsdXesuecjAPi3i4in65MakKWrO7z91xwDVGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-license-expression: Fix the ptest failure
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192626

On Mon, 18 Dec 2023 at 10:12, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:

> # echo $?
> 1

Thanks. This however doesn't explain why the failure is not seen on
the autobuilder, but I'll answer that in a response to the patch.

Alex

