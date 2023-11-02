Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC15C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 09:43:46 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.26862.1698918222661052530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 02:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZE3g822e;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso9556071fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698918220; x=1699523020; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EyqEBWFuBl32woubCN3UHPZV3Bx2yf7i7enARSpM9+A=;
        b=ZE3g822efeLqH6dVCZ/1hOcKi99LoR8YKG0nvYH+sJnZjy/THLOkQx3bFq6uFXY6NH
         5MBJlmB+OPWu8hudhIh5/k4VOyrkMWL+ESSFVpKSoFb2BB3yq72Z3f8ZS+/DVzZMYG6s
         /L8/Ta27DZkwSSzLYnxNuLYW2Kh+PSAigpi8DdGLKlyaW/7tj2AyRMNMo1ebNETsZ1wv
         Y26ceVkKcbmU3+Apg3knZPs0eXZDTDK+p9ElUS+yWIxZwR0FG503it4Z0qPuVJvWkUwj
         NNXj2h5Tbh0XV/mtHvJ2UttLostOV9Q7JWKQ6nBSO793ItZcbHgb5X8eEoq1UEDGLESS
         RQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698918220; x=1699523020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyqEBWFuBl32woubCN3UHPZV3Bx2yf7i7enARSpM9+A=;
        b=tihxWOYrZBqr7aP/O/IJVrfVWTjKyLzOXY64iBOTyOysoUn6Zp/z/myYJ1pGqjwFYf
         0LRwNhjTZt0/dP6wkyxf1z0KyXn+DBMEyg++uJVimti0ToFtd7kvLPpC8zI1f3sMSVgv
         VBNLfN8ab8UhlwGAxG7uWz8O3FTS3AO42TyAylDphsrE5U0ZJUkFZSR2Tgvx/8E1RIPC
         tX/I53IVUewYTQCuxoIz4mXuLbG/cJoIpBs/PuZ07GsoVzIZWro2so+GkO2KYxxBNUUm
         OtHYzqXnXIw3Iy1wk/8EkajsYUQ8Ypzw1xK+1oYozYbQPAuM8g2H9lugZx57/awl/Ht2
         KV1w==
X-Gm-Message-State: AOJu0YzN8t+ReYxUGHS3gpDFYFQpxY/T+k6ylUayOvZHY9R1oEtR3erH
	vt9Fi0MEwl4j8Fd9MWrSYAR7/XmPI84f3MFTIWqI+b08
X-Google-Smtp-Source: AGHT+IEbz0HlM8TD0cenw1tnSjOcF02zrcIAohORl7bSXGQSKMjnjwcufoio//PAawfK1wYqgvQyqp61N3aooKPLgDk=
X-Received: by 2002:a05:6512:1249:b0:509:4ae3:465b with SMTP id
 fb9-20020a056512124900b005094ae3465bmr1091687lfb.8.1698918220114; Thu, 02 Nov
 2023 02:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231102024001.1671273-1-lizhi.xu@windriver.com>
In-Reply-To: <20231102024001.1671273-1-lizhi.xu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Nov 2023 10:43:28 +0100
Message-ID: <CANNYZj8=TSSjpgz_wTmsAJDUw-Wp82_bnZurJ7UR7vL573fBzA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] tzdata: Reduced time zone configuration
To: Lizhi.Xu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 09:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190072

On Thu, 2 Nov 2023 at 03:40, Xu, Lizhi via lists.openembedded.org
<Lizhi.Xu=windriver.com@lists.openembedded.org> wrote:
> The tzdata.bb by default pulls in all possible timezone data packages which
> increases size of the final root filesystem considerably.
> The customer would like to have extra timezones configurable so that only
> tzdata-core is chosen by default and rest of the zones are optional.
> This change would make the fs size a lot smaller.

Thank you for the contribution. To be considered for inclusion in
oe-core, there need to be two improvements:

- please quantify wording like "increases size considerably" and
"makes sizes a lot smaller". What kind of numbers are those and under
what conditions?
- the changes need to be integrated directly into tzdata recipe, and
default behavior needs to remain as it is now.

Alex

