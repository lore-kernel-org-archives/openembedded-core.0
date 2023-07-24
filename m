Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0091C001DF
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 14:04:01 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.48189.1690207432848708373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 07:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=k5uWWhjt;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fdea55743eso3187733e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 07:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690207431; x=1690812231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+2LGgfuLgsCLYi++DKiFXU0IAM0nYrXKLWkEfI4bkTA=;
        b=k5uWWhjt0cMQj6ipRmBcMKvaW8F+WmDrX/P3wx7ZdPhsHXPLi5w9KDrZMgCb7hZxmP
         gze/MfxOZGKk/2cOAKnqwcU8gVcyQaFbYF//n9ZioPNBU/qgY4bVK9/uMkdCTZQ13gRQ
         GV2XGI4sbwRTYEsDjt7TyFqdScox+ixUNnAgRadfdo3wXIe4QWzdCNlVh0p35TD7wnUO
         TIHGmMp6zEkMhq9k+VjFhgwzEiV6zbiUxaBc0BzVtwe88mm7CU7MP9/hFtPJsukzQlhe
         dbEoft33gVeyeHSQ3ARcDzn/YaVymBbHhouGd0G4gIbVWVh7pq+WevtSP4kiFV3J8DA7
         2PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690207431; x=1690812231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2LGgfuLgsCLYi++DKiFXU0IAM0nYrXKLWkEfI4bkTA=;
        b=C/7I6Ikn8hDi7Th+WOepjXlL7Mhqc1qibZAD35Cw2WzMkGLT7ZpjsrXoKuBly5Fa7S
         CDm5eZnrfy4O5huK5ZaOeHUqUh2OZUFap0k/FVUmddTapRgXpO5aOCTwiT2+muJSD/dL
         AGquQ49XHwOiUyEmqkfz6og1Mgf8Zql7f1cwrtWkfkMEPGwfj5mWSdooT/TO9HWUGfNM
         i5QpOZWKN/7cafsk5oY9HqY4SJAR4kn+RWfASdXLN9v7WhKDeP/aQ3pR62CTtinSn48G
         ZIiuqBIM1MsTreN+Pi3+gv1j3ItSVVYZ9QgvUKDebrtB4MJALLiT1tvQpCLafIjJHhko
         VP1A==
X-Gm-Message-State: ABy/qLbLKESh35b5WPLSx+UU2dDi2rxjyUJHF63+V8lwRQnPW7G2lmcq
	2Y3DOdlaWT9m/EIrQc8z3E9gtpjwQ/0KalJBezN2f6Rh
X-Google-Smtp-Source: APBJJlEtn4SQkCKOScLL9S+IuCeQO8DZmGBnOeEUBg1II4geGx51a4XcPICj1aMgrb7+LXBRm8LxDG8vIp24hEP5Qw4=
X-Received: by 2002:a05:6512:15a7:b0:4f8:6e52:68ae with SMTP id
 bp39-20020a05651215a700b004f86e5268aemr6649583lfb.31.1690207431035; Mon, 24
 Jul 2023 07:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230724123529.288581-1-zboszor@gmail.com> <CANNYZj9FLbQxnbhd-Lzcr5GB3Ycf+35O1eADZ51EuVNg-eN33A@mail.gmail.com>
In-Reply-To: <CANNYZj9FLbQxnbhd-Lzcr5GB3Ycf+35O1eADZ51EuVNg-eN33A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jul 2023 16:03:39 +0200
Message-ID: <CANNYZj8HRnoCSBax5VzHU+xU+=XqeS3gF_ys_jFzJYs2+MivwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 14:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184792

On Mon, 24 Jul 2023 at 16:02, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > +        sed -i \
> > +            -e "s:^%_lib\t.*$:%_lib\t${baselib}:" \
> > +            -e "s:^%_libdir\t.*$:%_libdir\t${libdir}:" \
> > +            ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux/macros
>
> Can this be refactored to avoid sed please? This is both difficult or
> impossible to understand, and is prone to silent regressions.

What I mean is, can the file be generated in the first place with the
correct values?

Alex

