Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC49C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 08:32:29 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.8471.1743669140005140385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KIOd9r/s;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so17100736d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743669139; x=1744273939; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NKrb7jRF9/0bI+lRZEo87BvZQuj5DYlw/do8Z/TzH38=;
        b=KIOd9r/sjw9xLtFTAHU7PjbahmAEZsDZYNuzCD+ru+Z/QuQsqFmCW5decE9u6OJlb0
         cXJl4mrkUmVkWIlG2rbT8HFwB/2+r1AhdNj8psmnNipj3w1Del2tQ6CU5RZ0hCT6MMbw
         z7rTRiv7nsb21rGO136YDlsl+poK2t6u7KQV33uHfDro52BNDT4CcIJh/SGc43TM4KTY
         qXTLbtCyeFIzB8XT6J9cKcxJszVQ5gFGEXxFc58snReSXfn9AcHK9vWRsknRM+qYpA7Q
         Sx6V2VUyI/+ymFH8/6fatsS1X8Mtp+FMHipOW5bfRaXlZGU7zGR7a064fPq5hjPqihAL
         m0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743669139; x=1744273939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKrb7jRF9/0bI+lRZEo87BvZQuj5DYlw/do8Z/TzH38=;
        b=kVROifCBQIeGHs9ISQVkxKswt8NOSonFPXOMSB1HYR/Azs1CpxeEOBAPHFx12BItck
         HnoyMNDe7ObKNEx1Nt4uNZLFhn6BY0bfgrkH1fze42yumKwC0EoQXpxr0po6tAFyAqG9
         EX2L4DPImWCNmXyDlASlKFhVtAu5F/Sz6e1+HcIAisggtZId5Cz4lATrQlysdoXnszJg
         jJrumTnou75XFlOYMPx5oZyLIQ2cu5JM9yMHK4cm7KGRULxkzFCAqQrqNx0k7qPK3zaa
         LJDI3IdcvmOxAG+14A9+sjNlDflMMVkDoSK7aMrB8LDboi/a3tdC3yo0xNmRmJd3anpf
         Jegw==
X-Gm-Message-State: AOJu0YwhYWAWtv7LXrq3k/6NIfCEm0pRjwg0g6FnyNiPxrup7UXpqWf4
	A0uFSWn/Lt6vhsoRuoMP9n5lHkzAhvF7F8bOcxRFMV6vltAAMwCLO3FomKvSMVMRPkXKpjmcyKb
	a0zmkVA4GCRI+EYbMthyfuPmp7QTVpw==
X-Gm-Gg: ASbGnctApvnD/oZZdWfH1lvoMUkNuwUEggD64EtDp8XJYu3GXOlI3U6wnAzdtZk6iTa
	xRaDhyuYqTiEgT95Ai6NEgpT3vxU72CQrGgDyHC4N+D/PKLeK30BD+xPbjSZSZv7MK5Mdc/tyBt
	4lcshIKMkIa53aYyk6nzX23e4eyXMDwrb4kZaJJoQs1mQcKuRZH0rEwP/imHi3
X-Google-Smtp-Source: AGHT+IFIWDn2vudEbgSra1dpO9QXcDhFYDkhBdQFDogt3Zb/l/D1q9tLCiCdci5euUmSZ8v8IfUmMVaXx0eX9oGcp00=
X-Received: by 2002:a05:6214:21ae:b0:6ed:1637:442f with SMTP id
 6a1803df08f44-6ef0bf9c501mr30208666d6.17.1743669138107; Thu, 03 Apr 2025
 01:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250403074552.971291-1-Qi.Chen@windriver.com>
In-Reply-To: <20250403074552.971291-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Apr 2025 10:32:07 +0200
X-Gm-Features: ATxdqUFVxRDW8C6SuvqFvhfTQeZjlSbYBKoCMnE99PCkXaM7Ga05YNccpQzo6qs
Message-ID: <CANNYZj9BwZVVt2Mk61KY0S0NLmD8zR-=a2EDnSccKF7xRL6ofA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu.bbclass: move to classes/ directory so that
 INHERIT can use it
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 08:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214306

On Thu, 3 Apr 2025 at 09:46, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> The functions in this bbclass is useful. Move it to classes/ directory
> so that it could both inherited by individual recipes and via INHERIT.

If the functions are useful, they should be moved into meta/lib/oe. It
would also be good to explain what is specifically useful and why.

Alex

