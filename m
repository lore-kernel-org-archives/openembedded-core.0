Return-Path: <peter.suti@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB717C001DE
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 09:27:17 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.10202.1690968431187192336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 02:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=EMZHoBc6;
 spf=pass (domain: streamunlimited.com, ip: 209.85.167.44, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe2503e3easo7647452e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1690968429; x=1691573229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1vwhgfJewDb6lbgPbS7I2TdWOszCsZ/mco86mYQAQ8=;
        b=EMZHoBc63yffEmzCzkxDVok830aM6WxsjWWu4xq/U8q2PjcLbZAlOkqfhiGsCGcHtm
         KNc6X78rguFHd8Qr+x+Hn0qX95WVZf9RnkXHNBUPYsOI6MiFQIWx00qTvYpPRSR168NC
         QV3gikxgH5lRrtes46ugDX+bhMJ0ldhE83ykE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690968429; x=1691573229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1vwhgfJewDb6lbgPbS7I2TdWOszCsZ/mco86mYQAQ8=;
        b=NizFpcDJPS6Bfjzv9mmD9uD6fMCiZFE6ftihKcnERFG76dalQn0KbnvP4SSb6JcivG
         qxI61FNCgwNoIACjZLIiUvdZ1q1Aduh8UcZidLR42Xuk2/eRp1NKtr313enibx5ph+5M
         YUJWxgQ8cMgOip9m/IatObOM4o732mPd7nCoVUY31PVn/1hlSdtBx7FCP1a1pJbky/8I
         IcqR2YU3YZwVFRM2ZmXJD5C3ErRY9FwbpBjl36rIjHplHicQrrqZpJZixyCO2CM+F7Y+
         u2Nwoy1gQN71phWjqF1gvnUoNVwIyd99KiXw/BD2lc4ZATn0KkPCqSGTxq+lrQcoiba5
         lsfw==
X-Gm-Message-State: ABy/qLb8y64ZN/F1rnZdJR5XDv0itN0Si0O3n8vN38/K0ZY8J/8nwpaY
	hlo/eqYEIcL7hszYDCblUi9P9cyyNls5MZzceIqUOA==
X-Google-Smtp-Source: APBJJlE/DboVu3X4XvUGhVc82D/nd1x3ljvbnJReAFt8IZUOXTKYjexi/WOSxI1+vyjOUCQ9h1uA202sp2jpTyfvRds=
X-Received: by 2002:a19:4f4e:0:b0:4fb:820a:f87f with SMTP id
 a14-20020a194f4e000000b004fb820af87fmr4377589lfk.10.1690968428968; Wed, 02
 Aug 2023 02:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
 <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
 <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com> <fdc2b7c450443e11836df189b5a6c584c6024d54.camel@linuxfoundation.org>
In-Reply-To: <fdc2b7c450443e11836df189b5a6c584c6024d54.camel@linuxfoundation.org>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Wed, 2 Aug 2023 11:26:57 +0200
Message-ID: <CACMGZgazaZR1z4opzxwNNug-97DanqC6qciEzS+noshjQcsTeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 09:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185384

On Mon, Jul 31, 2023 at 2:33=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I did look at the bug and it sounds like if you clean a recipe, builds
> of other recipes which depend upon it then fail?

Well not just in this case specifically, it is reproducible when doing
a clean build.
But this is the easiest most convenient way to reproduce because most
of the sstate can be reused.

> We need to understand what is happening with both the sstate manifests
> and the stamp files to fully understand this bug.
>
> do_prepare_recipe_sysroot of this recipe that depends on the
> externalsrc one should trigger it's do_populate_sysroot. The question
> is whether the do_clean removed the do_populate_sysroot stamp file for
> that recipe or not? It sounds like it did remove the sstate manifest.

I have checked the manifest and stamp creation and as far as I can
tell that part is correct.

> The more I look at this, the more I think changing the deltask is just
> masking the issue and there is some other problem at play here which we
> need to address directly.

I agree, I have dug a bit further and the issue seems to come from runqueue=
.py.
It seems that the current implementation depends heavily on the
presence of _setscene tasks to build the dependency graph. Altering
this behavior would indeed require significant effort and potentially
lead to unforeseen consequences.

> Unfortunately it took me half an hour just to be able to read through
> the pieces of this and get far enough I could write a coherent answer
> to your question. It is a struggle to reply to everything in this level
> of detail, much as I'd like to :/.

I'd like to thank you for the time you have invested in this issue! I
appreciate the help.
I understand that my proposed solution might not be ideal, but fixing
the underlying issue in runqueue would be a real challenge.
If upstream is not interested in this patch, I can also understand that.

