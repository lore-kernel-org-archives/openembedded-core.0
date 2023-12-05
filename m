Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C415C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 09:44:09 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.96905.1701769439198472562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 01:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAcJ583u;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c9f42ccb55so35461671fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 01:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701769437; x=1702374237; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3fWjVWgKcahSf4Fnw5IVhllC3mOJ/nWZo77eW4CjXEU=;
        b=ZAcJ583u4NQsoWfijjp2v7ETtbF2+53KQgsoBCijoRfGespdHSA56j8InZ9DJ+2BIB
         ZLJ+HT0mA9IJvtIG8Bl4JShK3kZNjjqbZDK7AV3OTRdNiEiEyEBFPqz6pQ+oNd5thjOc
         9S9fDm1MCpmW9D2++XvWaKNlKeqt+WueBYesypOtFTx0Zbpi7i69bCypd/rylHQBdEqt
         KA91gNxODofPTr7jxBHY3EMzcDz6BYgYvRF7rg3gag+mxs2R0qBDfjbY5Kx86JHJGER3
         BRaCUUxs44Pr4nIhLVnuPCgLQSOVp1cq+bQVbLv4E9xicEBT/tax9DbyHYA2SQZdIpmq
         qmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701769437; x=1702374237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fWjVWgKcahSf4Fnw5IVhllC3mOJ/nWZo77eW4CjXEU=;
        b=A8V83rVwdHCCXad9v2/PBZrbuSWMXYRakhkKXprW2CQlaExCCPHFS5XkCsfIM7cod8
         cADb7i7dhx8BNvl/khWoP9wtwOuhmGdmpoypsM9OtGakTLVXZmQ1FtN7iG/nrMJ/XoyT
         i5vMyY8UoH2XUrbfF06W2i0Kk5IyGgRv3S+XL9vt6nBE/qly19aEg9P0MKM5nJzW/qOL
         Y/n87cqmc367b6IYF0+oE3AhRDvQnTX+trAahEPtTfMU5AXz96t3hcfzwKqFb/G+0wgM
         STRJ5+Biix+zG9vI7p7D9/jR+V6jWCoWsGfM+6Valu+63x9Lw++6XqVOgKbUaxnwisLu
         cpZw==
X-Gm-Message-State: AOJu0YzWwV83JCStjRIF2gNidwwA0GBRlVEDX7brV5JLratmOcTAfzH3
	lpyQLg2wBQPFXtK5ZjJv2XTkuGhD9OCn2jf3D/k=
X-Google-Smtp-Source: AGHT+IGVbia5UZ+aJ+8RKqWama6n1ODLZxqm6WiNpqVZMo0wn8SD8bzL5u0i4xYfZgtiNc6AQPyR4PPhbTOMMPiIWgU=
X-Received: by 2002:a2e:9c07:0:b0:2c9:ffd9:5bd6 with SMTP id
 s7-20020a2e9c07000000b002c9ffd95bd6mr1803614lji.85.1701769436929; Tue, 05 Dec
 2023 01:43:56 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_MaSkVc9SS5vJ4TBDZ7oMV-iXfqDi54U6cMyxuqEL-bQ@mail.gmail.com>
 <358.1701701188844188611@lists.openembedded.org>
In-Reply-To: <358.1701701188844188611@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Dec 2023 10:43:45 +0100
Message-ID: <CANNYZj9tW+8sF4JZUiDFY81h0EkpbDLu=v4uoVjrHc4G3dZ8DQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
To: Andrey Popov <andrey.popov@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 09:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191810

Then it's probably best to write a recipe, so that the code can be
hosted externally and maintained independently of oe-core?

Alex

On Mon, 4 Dec 2023 at 15:46, Andrey Popov <andrey.popov@yadro.com> wrote:
>
> Hello, Alex!
>
> I have doubts that the entire isoparser class set could be inlined, that would occupy around 1200 lines in total.
> https://github.com/barneygale/isoparser/tree/master/isoparser
> Three functions that are used to find the file using this class set are 32 lines long in total.
>
> Best regards, Andrey.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191742): https://lists.openembedded.org/g/openembedded-core/message/191742
> Mute This Topic: https://lists.openembedded.org/mt/102896781/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

