Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F7CD32D8E
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 10:32:07 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.83568.1731407523963686322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 02:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dI3cVazi;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso47941941fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 02:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731407522; x=1732012322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W+5Y0FaBy82wRnno+81a8AiYFviwlxJnYM+06Qwz3CI=;
        b=dI3cVaziwfiJs6sJHQyRfyce7cPOyYEgWuaAlMzeovGrheE7oZ67j8NwJJoyIWghVu
         Vn0Uefvf7Nh4VwL95TNn1aF6MTcKvUZXAa3shGnnL/2e+DZE6fyfOMKJEmqty1hVlMP7
         ORS7UzqK2eWBYapA4B0NOjQRKv/5Ze/0PAbnbfClV0SaVjhE57Ss2jqAhOr1SnmsDIFJ
         HRKf1l5KN81NBcebvlT7igoqESXlnirbIX6uMcNeXbXxlxjWrSNqmuBdLLEMjTbpDmvG
         OF8XsJOYPXd+byH09mCxAaRQAIhW5smd9HarsHNsfcJ4NhTannNbdWinxLjoT6GgJx/t
         tnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407522; x=1732012322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+5Y0FaBy82wRnno+81a8AiYFviwlxJnYM+06Qwz3CI=;
        b=Dyvp8YyVjmOrkd6XWc6bd0MFXMQYNFIfSoUUdryshPc3Q2YqxKVPb94GrmO26nrGS4
         zhprQHuYh2abqVcU8SFuiwNXUE84VOgSF59bEXc3lVU4+sx2QgtH+ORoNKi44s/sjPe4
         pZVvPjoZls6zH7ZzgB9rtQHCHap74mFPOhSxETKJpOwg2w3k6GTUhgIKudWCgATBio1S
         vr1jlSUte1LjXkfxYn6a6znwK231g5WiSrmNq+SMHJD1IT0xtKyzz2aQgoHkF0hllkMN
         NXH5HYPFNvLtZaYw6pvsSe/RVSSIQjWaIn3HRi7PCYQiPCWkp28EKBMWuVpia5aG+4Gq
         bX2A==
X-Forwarded-Encrypted: i=1; AJvYcCW2FIzlcyiAB9P0sGZ4amTJ83iX4s7XIb/+HkZdugyfaP3XNObe4BFhs2bepqSywqFs2YUFKYeBh7eRXU0rAq/H0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDg2NmRdsxJRWXPwD5J5vEsUlEDhWAGxqZw/WYRx1hVIYPt4FW
	KnK8bwSim0w05hRKph17krqWoZ8z4CtmXC0Wh4daPxiXId+VQTzRSEPWTMMofjYprKM6v+wz+NZ
	QeLF/Pdv5uRQ6wEFx5IAWePpqnOY=
X-Google-Smtp-Source: AGHT+IGLxlAS8kS4zuaQoAsxz2pVfADAI3HeOYc3LqgpXzyf8GkWpMvddvbYjx+alTysqS70YqoX27XEPuhuQfDMiQ8=
X-Received: by 2002:a05:651c:12c7:b0:2fb:51e0:93f with SMTP id
 38308e7fff4ca-2ff4271ea29mr12359051fa.35.1731407521799; Tue, 12 Nov 2024
 02:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20241025161627.3352-1-sreejith.ravi087@gmail.com>
 <CANNYZj8+5LwPXrQ4eda4muAdOmpfvkg5oo0GXzCG+HJJh65vDQ@mail.gmail.com>
 <CAFt4JuEdi+zFkN37vvvK-PNtqshncC_8dn44gU+FcKXpde-ynA@mail.gmail.com>
 <CANNYZj-Q_Y4X80o_mbA=uEQ3gQbfwNB3bPcnu5-xvsOaPjKCbg@mail.gmail.com>
 <CAFt4JuGioQWK8G72z_J6aJvKscp7zy4W2ZQPWP1_imH_keGSog@mail.gmail.com>
 <a2870fb05d59ddd3578cee006200ed0d59919a48.camel@linuxfoundation.org> <CAFt4JuFFY=huUr=ZBxsb1g2mKHv8o6h9361ddhrv8c6r095eZA@mail.gmail.com>
In-Reply-To: <CAFt4JuFFY=huUr=ZBxsb1g2mKHv8o6h9361ddhrv8c6r095eZA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Nov 2024 11:31:50 +0100
Message-ID: <CANNYZj-MtYntv-O3REwBnQNW-KTx1YjMHPUkjhha9HJsHoCpQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_manager : Add configuration option to
 select filterbydependencies
To: Sreejith Ravi <sreejith.ravi087@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 10:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207041

On Tue, 12 Nov 2024 at 11:26, Sreejith Ravi <sreejith.ravi087@gmail.com> wrote:
> Regarding your concern about potential misuse and the risk of race conditions like above, I share that reservation. Would it be helpful if we documented these concerns prominently or added clear guidance on how to use this parameter safely?

I would still suggest that you need to implement your own packaging
class, and not try to reuse classes from oe-core. If that class needs
tweaks to the base implementations, we can consider them.

Alex

