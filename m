Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE25C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:30:21 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.9415.1667323818255741264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7k/R+O0K;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id d26so38768366eje.10
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 10:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1tc0bnyrFZlIcZVJewFqxrgK8jCgXN7SJOkn6J3ixw=;
        b=7k/R+O0KciVxombH5/nxDK8sZzNm3TfS5/qbhiQME7JZsSCDA82e5+7fRsV481Bk76
         RDeTjX9IXbRa0fr0lT99PsSrzZaabhs5liIdoopq30I+wVQIt0AF/Z+WAQ486sYPuNIL
         Iuk37SngSfHxidKt4wzpqzHB4b6FcKcNiCFKU0aYbnWvZO9tX58tlEjYoLnZOQdHj8Xu
         Gf5/7SK4L7RJhE7zTEeHRcOUB74DpTMiTcv+PAXT8iHwM/+LXUwa8eQdInK34VsvJW9z
         9JGQw9tuDgE8Rfwk57gGfS/1fe4druzlztD3EYie4MwhaAKbZxucvDDaC2DV1mOXDfgj
         +wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1tc0bnyrFZlIcZVJewFqxrgK8jCgXN7SJOkn6J3ixw=;
        b=6GqnliN0i7QWBajHXdsOvFZX1NR07JHOugjxvf3dLzTyj4Zm3Et2SBAWhP597yZv0h
         7zTxQwIk+Nw68WZ8Q4hUpY/EcoaHcKW3PzKb50njhgc8f5hIn8hdpvo3pjZ3Ar0N1ba5
         ZTkQxya5tIAEKAKl6Vi8WcaUmP//znvUKp0l6ltr51hKTjKrbfMR5N5tjguQxkxPbx8m
         K+dNgH1vEoYWMwRwWpp2UemQDt8kp7WPYlW/HFH9H97Hx+m3JgXjHUwF7fF2k6HUI0Dk
         ekAqOhAYRZUVY5MEOfVkUEXATkZE53FR/tdkN9IbGM92mS7X2YaZ9DqrQVppoKQcebtu
         1BTQ==
X-Gm-Message-State: ACrzQf0eccGg4W21tsCe9fUyB0XCcnAhnjoDxnba+k+15sAaWnZa7lAX
	QHZKSIZpQUwn09/FHk5jTO0w1idvPb6zWij2yuuC6w==
X-Google-Smtp-Source: AMsMyM5HlgbAzyhX0KZhocDZnPty0LVh7VN5v0rJ9aBRQP2vIT2NMy6nX/zW7EGOE3X+luPt9oBRz1V/QOTqDIGcD6I=
X-Received: by 2002:a17:906:dc8c:b0:7ad:a030:c305 with SMTP id
 cs12-20020a170906dc8c00b007ada030c305mr18965529ejc.132.1667323816536; Tue, 01
 Nov 2022 10:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221011030216.3874881-1-raj.khem@gmail.com> <CAOMZO5BZQFHDYgA99ymw_zL12Qsmg9yzkLwqYRDUh5x53b9ZKg@mail.gmail.com>
 <0d990cdc-e424-f4c9-007d-8a31c9149353@gmail.com>
In-Reply-To: <0d990cdc-e424-f4c9-007d-8a31c9149353@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 1 Nov 2022 07:30:05 -1000
Message-ID: <CAOSpxdZ=p99wBNGXXD1kTB5C6ZHkGo4TazhvzbYz1TJ8eWpBpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Depend on native setuptools3
To: Khem Raj <raj.khem@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, akuster808@gmail.com, 
	openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172373

On Tue, Nov 1, 2022 at 7:21 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 11/1/22 10:11 AM, Fabio Estevam wrote:
> > Hi Armin,
> >
> > On Tue, Oct 11, 2022 at 12:02 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> perf has need for python setuptools when scripting is enabled
> >> from 6.0.0 onwards it seems to throw an explicit error
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > This one landed in master:
> > https://github.com/openembedded/openembedded-core/commit/da3d00178809bbf7cc453401e0c5937796ebc2c1
> >
> > Could it be backported to kirkstone too?
> >
> > I am facing an error when building a 6.0 kernel and this commit in
> > master fixes it.
> >
> > Thanks
>
> +Steve

Got it!

Steve

