Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589C5CCD1BC
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 15:26:26 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.12444.1761146779336335571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 08:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WUDotKM9;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-879b99b7ca8so94300516d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761146778; x=1761751578; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HmUMzljytU+dU3kaJD761o3Cx4BwLdI0ABnJEN81I7Q=;
        b=WUDotKM9PAQvguGm3m3ojGznK/44MUiJ/TnqNe7acw5PB+IZeeC5T3TYbNv3ro0yvM
         l0iQ3jGr6BS7z/L97akA0UbwaEnl0RON/Ha6ZVw7m10XO9eZPiU7klFFmcl0kfxpsfKx
         yOq1RyTNm/GaZRmKvYiQCc1SFaNceAowPUEOafOA5dFuo6cWnqAv2hTKVPHMgt7LOPee
         E6u8OLcKr6+N/BjzdWpmbQOHuis0KTa5vgRtGkv5dA6v7KJxsswDn5aEyMiGxakTSuLj
         icWSN+x+yiezLYTch1xUkNQEmpsM8N/X38F2SLgsbA2yDcjDvDoET0D6F0FFC4OMKRt1
         T5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146778; x=1761751578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmUMzljytU+dU3kaJD761o3Cx4BwLdI0ABnJEN81I7Q=;
        b=OkHTJGWtgsDkJLvmviy40Fr3YpCMj+Ppq+UBKzbwnM5HnOFieAv9dD8iwIU3z2xIkz
         UxjqCFUNpsxhcoIcSUV9iXcBM3souCZb/XT+/qoaBL9fiFx89whmdIpC250jRH29s9Fy
         4EmUcwscS90FFmf6DC6ckDzmS5uOzzyD0qMI0RYuTBeaV2huznFIjkMPDU+lBrBzGsXX
         VR35fD/P4VRHMFWTS/c0IQQmNLjfT0Vrt5AkRhLPobc/zjUAxcYnnUe+CdnMqvtXglyy
         hn3PA7jsKyhOU/H4fflUTqm9vh7MdATZIuPZm+Jx6/JSqKR2PhOO3xfR5lYwR7V1xN0L
         7rGA==
X-Gm-Message-State: AOJu0YzkCnZsN8BRDwP2eQzHElvaxY3RUuPyhozcu9aNWRhXi9iAPDCV
	mxELBnPAZAS5zMM+9B1hAJojbNDKqXYyK5XlOQyct95Hbm95LMuSB9GtLAa9lp0JGJVdu5Z+ff0
	3Xnx4yvztDCaZHEYrFTFVCaYsDDmQS7A=
X-Gm-Gg: ASbGncvtMPgZNU/RHy6q/Aqm7Ghy9FfiiLctf6h3VE6Fqjn9E5CvCtNMTga05MU8VL5
	5YIEDVrKzuWSuuhT90J3GX8/W7W4R3KjuIkZXbUCszDmGcadVUGswOKL3L5SObKcOroTmMkOM8V
	N49rzotbsW13YfUjCFfMDFl1q5OlnTlTzqPJ/5cva1++Vej8GOGt7XKKZ50yyz1Uft/1weVvJis
	U9dZbkpAX6BPUpbUhbgAuOtvsOyaFRp3h+UByec2bgIr7bNLb8HEtpnWovBevDj1FzlCmnzjOwb
	d1fML7H8OY+z2ozj5XnUIhFb9V17IcxX+TE9l0wgaulpBCISJTaB3UKGVw==
X-Google-Smtp-Source: AGHT+IFJM9IM/KLK9p5izau/3KgCq2FERIpyF0gLZbJvYqjMo/+L1ienaiWtkjCOxM91TiIu6QQ5e2hmSLU/uiQFxCc=
X-Received: by 2002:a05:6214:1949:b0:879:f90d:fd88 with SMTP id
 6a1803df08f44-87c2082a9e0mr292165946d6.66.1761146778274; Wed, 22 Oct 2025
 08:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251022113212.3220395-1-alex.kanavin@gmail.com>
 <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de> <CANNYZj9-37415LXhP7jnNSqOynuxZVtoEo5rdQOEg-_0rirQpg@mail.gmail.com>
 <a082d3c9-ca41-4195-9020-aa722fd9bb17@cherry.de> <CANNYZj9syemH4k8NVko4uBnEuH56D9KQntjoinNYRuLRph6uog@mail.gmail.com>
 <98fb3807-f779-438b-87fa-04bf706c28cf@cherry.de>
In-Reply-To: <98fb3807-f779-438b-87fa-04bf706c28cf@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Oct 2025 17:26:05 +0200
X-Gm-Features: AS18NWDaNwrOfrlC72VX1BhL-Dah7wUOUF7vgX9lUV9lRS6efkXMACbcLegk2DY
Message-ID: <CANNYZj-_=hdvz5EmKxoSEFJcsyCtYyQsDfJ7G+W6bnRvmWLVLw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] layer.conf: add a bb_min_version statement
 to perform an early bitbake version check
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 15:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225202

On Wed, 22 Oct 2025 at 17:22, Quentin Schulz <quentin.schulz@cherry.de> wrote:

> I have no clue if this is proper but
>
> diff --git a/lib/bb/parse/ast.py b/lib/bb/parse/ast.py
> index 20c6f51a8..9f6874b06 100644
> --- a/lib/bb/parse/ast.py
> +++ b/lib/bb/parse/ast.py
> @@ -418,6 +418,7 @@ class BbMinVersionNode(AstNode):
>           self.bb_min_version = bb_min_version
>
>       def eval(self, data):
> +        self.bb_min_version = data.expand(self.bb_min_version)
>           bb.parse.ConfHandler.check_bb_version(self.filename,
> self.lineno, self.bb_min_version)
>
>   def handleInclude(statements, filename, lineno, m, force):
>
> Made it work (both with ${BB_MIN_VERSION} and the 2.15.2 string).

Well, this is what I did (data.expand(...)), and yet the expansion
didn't happen for me. Can you share a patch where it works?

Alex

