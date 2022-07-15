Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B20FC43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:16:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.1177.1657901763744062821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hMX8zItN;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id n18so8622929lfq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/N7ZuLBP5m/shpP2p8Asp7X/Grwzr5wQEW6lCSsbo0=;
        b=hMX8zItN4UpSrHQGYeF1C7P2Uv+idsiprtFIMBmel0gl6qqCA4iR7pZRbFttTZxc/c
         H//DW3UKbdZIoqZUQcU1wnqOyRGBT9TrhCU53p+w/mA2H6olygcxdXa2hG3AppjOMd2f
         iPEQo3ijOhxbWA8eDSFm5XFtLRURP76tou/OsWybb6fJYs2eavb+Gir5qrSxeEG1EsVX
         1Xs233w3eovwDlDTPfdMg+5qAOUSSqN9m8Cjcms29HYBcCTDrNfQfVIdTT5jzg/9jaYM
         xeEm66qKiepqBOE3g2sIAd+Je9R2eWc3zqkdSS2xixhVBukhbgoD5HWoBLN8MlrZJRkM
         d7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/N7ZuLBP5m/shpP2p8Asp7X/Grwzr5wQEW6lCSsbo0=;
        b=T6mGduGlQzPnES/W61NNe/UcH7oaD1xYY/FvQtciPviNAgsbIm46RpUxDAx823OMga
         XWyK3wjQ7M0FccQRObiJF0kyI87969HCl3aSFLufHjed/cKqUSd4Qfbsfz7kwRgqOJjf
         s4NInVbZfVE+VMbvbfOC3x5XMDbqUkSHCrmlGVT7Bf3WxWy8wBNdeOhYemslHZOaBbSn
         axCO+S9RuGrE1uk2HRFqYn+rMkF3VvIHuUnUdsDY+E5ngLfeDDh7x3O8NCzCW4TsQL5W
         RhGnUVwHq+uTccHOaOB4i7aV0fF/SAyE1EZUn+Y9IDJSoQEGULJFdV42ICbPeefchg3c
         p79g==
X-Gm-Message-State: AJIora84bonQsoZPuDlp8CqVapw2OXfOnGYKJvFQO31VTjyZkXrb6YCy
	vvhZnIePUbEeEKC8kvlYcoBuUWFqdcZw8uimff8=
X-Google-Smtp-Source: 
 AGRyM1vWa/KHbeIUhvogH9BQdQtTqAHlfIXlu2uS7Q8RxxgA7SG2HoiOzMT0kad6VErEBE//wTEsCnhuiFo9q3+2ag0=
X-Received: by 2002:a05:6512:238a:b0:489:e6f6:c13f with SMTP id
 c10-20020a056512238a00b00489e6f6c13fmr8945466lfv.673.1657901762023; Fri, 15
 Jul 2022 09:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182329.3085564-1-alex@linutronix.de>
 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
In-Reply-To: 
 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Jul 2022 18:15:50 +0200
Message-ID: 
 <CANNYZj9Xdk7+-miNQiKi7CBHpGk7X29oF8Miv2Sd2QbBbj6sTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:16:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168124

On Fri, 15 Jul 2022 at 16:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We'd always intended that site.conf was more something the user would
> setup once for their environment and not need to change. It was
> therefore deliberately left out of the auto-setup piece.

I don't think I understand this point in particular. If site.conf is
copied once into a newly created, empty build directory, why is that
problematic?

Alex

