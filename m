Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A49EC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 09:50:50 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.66004.1701683446275134239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 01:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CUObt/6A;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c9f166581dso20151531fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701683444; x=1702288244; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9IyTbDdq02w8D1YtNVENeI2l1E5C8MwW0IZED92jew=;
        b=CUObt/6AtmmqKm7KjLAlz+YzvQlV2KJgRM/b75KqmqZgm3KMtWL3Rsnlo5etdepQQr
         fmUzVtqD83sbV07o1LGsjyRmzci4+nhz9wxsNt0CS0Myf5BCfke+Lk3rGxMN3VEKoSNR
         a/zAG6TrOCELOgMbza9ojP0In68GOXjH+RjB8AIpFSaeotOAEqBiR/Q7U0UyEkAB1gP9
         j0FadvHVlgkLJm2KTZ2IdZ2p4XdhWLRbT1wlKqB6w9d3X3Fe2EEu4OZ93yfCAeSm7FmP
         B5bggQfvw8o1XcAxaCfXrdbBE/7sqG+zdhZXRBJwkgZw5ln+Fayx1WZgUVaYD6qy87s1
         vExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683444; x=1702288244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9IyTbDdq02w8D1YtNVENeI2l1E5C8MwW0IZED92jew=;
        b=jk2/8fyTHgajFr409L+VnBOpA3IXYUFTN1QwrSDZae8K7HEZCNWXCDKmwAHvAXvPqR
         ajXdYsE6tB8ty0QpeG7LO+FcgM/Ij+DEGjdqbcWL/626ATtNBdSYLxYOxlxk/bO81Gs/
         tASS4OK85IXWW5+NZTnqw2vd9wXl5jFSx9f0yO7kFE6igAc8CzIc4nffUVxe3PklGduu
         5O+IciL2YSuhPOG8rBUzukQ9j1wV4zRxS0DiGV7gs7Fkp39DsXj8njuD5j8fUlKfOCYT
         XhIiDn6cOX17p5JtIxh3F2Vg29lWknmE4TiHB7R+FVR33HJh2ZFb7n3qtok9mPdirDqe
         ZrZg==
X-Gm-Message-State: AOJu0YyTv+s3BkfFWC5/lUCl9c01mNE6Ha33nYjdTw8vU5MWfLcW8/W0
	55s9XPTiF/tu8cNWIfZUvj0r1Sz/BrFHQbzTeZs=
X-Google-Smtp-Source: AGHT+IGHksUgU3JW9FNKTYSltbJ52Lndx8/RPmFs7eRKSOyDqQpvKz2RRWR6cgcBSOlG/rVfnlF6kxHuXpGQ57ckRSU=
X-Received: by 2002:a2e:9009:0:b0:2c9:c2f3:b2cc with SMTP id
 h9-20020a2e9009000000b002c9c2f3b2ccmr2794942ljg.9.1701683443873; Mon, 04 Dec
 2023 01:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20231202000942.3162961-1-raj.khem@gmail.com>
In-Reply-To: <20231202000942.3162961-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Dec 2023 10:50:32 +0100
Message-ID: <CANNYZj-LOd=4BOVNwq_M6QXsDcdMJdRfjW88bmHJZ9XTbvy_Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust-common.bbclass: Define rust arch for
 x32 platforms
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 09:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191728

Thanks for this one, I hope we can finally get that vte update in :)

Alex

On Sat, 2 Dec 2023 at 01:09, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Change 'if' to 'elif' to make it part of if else block
>
>  meta/classes-recipe/rust-common.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
> index 3d73a370ec8..ae96d9c5b1f 100644
> --- a/meta/classes-recipe/rust-common.bbclass
> +++ b/meta/classes-recipe/rust-common.bbclass
> @@ -63,6 +63,8 @@ def rust_base_triple(d, thing):
>      # This catches ARM targets and appends the necessary hard float bits
>      if os == "linux-gnueabi" or os == "linux-musleabi":
>          libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
> +    elif os == "linux-gnux32" or os == "linux-muslx32":
> +        libc = ""
>      elif "musl" in os:
>          libc = "-musl"
>          os = "linux"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191696): https://lists.openembedded.org/g/openembedded-core/message/191696
> Mute This Topic: https://lists.openembedded.org/mt/102928304/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

