Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E387EC5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 16:23:37 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.1219.1724775808192328243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 09:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JcOWPBvZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5343617fdddso8509981e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775806; x=1725380606; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCL4pHtExF1ZdhFqJ8oaauJBSs/sukeJDVN7cG6ospI=;
        b=JcOWPBvZigFcf2rUy/sHyI1pxPA//FuIf6jS7kR7SdHZ7S9F5QwncQvfzy/ZS8IsF1
         iBCSXxj0O+DT8EL3BNHc273m10ot4yN0GMg/huXbPlCEAMa/7f+aYXH+y0Fc3E552vNG
         j+6o4lscaNkq9Te/ZoscnIh1Qx+sOqtFlOHrorcpRuqnICzZsmyzpqwcNRU6F1FUXHoV
         MxF+/YBzWbdAz/GvdqSglgfgOr8a7usakZgJLPscjQKJHQaK2Zq0PeVj5M0IIuTiFcxy
         DvFOoWh0JGqxkBXbLg2TOGP3mwWL8n2QvRsTBGAqUfpT0SJH68JH0u3N9wztrbohokg8
         Kapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775806; x=1725380606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCL4pHtExF1ZdhFqJ8oaauJBSs/sukeJDVN7cG6ospI=;
        b=p0ruWtiFPOkJofot0KO46qIPNifIUWUvMn9VUeNHcZjfqAahEfONwk7zLJvYuJZq1d
         ViofySCCeFFodmrS6IIHVKY8Af9rpqfJRuL607naezBRy1uv10mip8yUxM6VLGSvFDub
         l1N3mjIct1gikHf8SUa1s71b3hgY5aDbLELB81urMs0ZkzpoqGIjaeS0hQi74Mb+3cPd
         M6a5B0vBykWF8R4alnCX7UAzS67LvuvwyiZUGTnySVNW1WD4094Ej+7Oy7hubh7tN1+4
         0Anpy9j9ZowJACkImG/CfJbxWFzjM4VCQD7Yj+s3Se88bb5qEqCWHUxidPUTqdsHVv0T
         yPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfQrrhMZGlVhUzasd3sVh9piByzbPAlvxUXYPYlmfWF3yTJIKjIOaOTmVL8p3vHmTvXzr0CQdBUcFZNN+9LYOLcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9mFd7pjmmTNHYV0ZTJzDH6YkeYmwETt8C5Bkzj/flb6hTrTRc
	1TlPyDGs8J4pS29JtjKMjt2SF4bODvbnlxJjQ8Y4JX1Nhk4pcLmBufAvXlrZFuVLQHApfxmU16T
	Alam1gEauyOrrN9+pIEiu2BFxWIw=
X-Google-Smtp-Source: AGHT+IF3tfo6/hjHHN89pp9NVfV3J3ZvJVWJXYPwqnML2QuV6vCVOEwKG/FKIT036BWnu0s0zfK8u8JODeE8FAh3FRw=
X-Received: by 2002:a05:6512:3b11:b0:52c:dcdc:f186 with SMTP id
 2adb3069b0e04-53438850fccmr12031978e87.27.1724775805648; Tue, 27 Aug 2024
 09:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com> <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com> <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com> <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
In-Reply-To: <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2024 18:23:14 +0200
Message-ID: <CANNYZj8fYKFYdvoiCio3yy6pg2QhKs1S5wHMFMEJrez5eV0hCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 16:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203852

On Tue, 27 Aug 2024 at 15:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
sed.
> > Can we re-run the builds just to be sure this is host distro specific
> > issue, since other hosts passed?
>
> Chances are this will have been built on another host and will now come
> from sstate. We'd have to invalidate the cache and rebuild on a
> specific host. I'm pretty sure this will be a host specific issue given
> the pattern.

I just reproduced this on autobuilder's alma9 in a private build
without sstate. I don't have any immediate ideas on where to start
looking into it, but I left the build in place, so if any of you can
suggest experiments or things to look at, I'd be glad to help.

Alex

