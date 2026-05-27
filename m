Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3F4CD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:06:45 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18963.1779883596096414234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YEbeTqOC;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6312af106e3so9053066137.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 05:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779883595; cv=none;
        d=google.com; s=arc-20240605;
        b=OTt91SHnGI1TQVRD+huOEaDMKa1yoDz13u/bZNlAFXBnUER0U12WMdvJr1gJhoV0Lk
         NXyXpWHUVTGCjsfiAr0+AMk6wgib4FqqlP6QFTazn39ed+Kk59wx3qDVzolCvsCXwOhI
         krGgJcCrHQpilzS8SIo4g8LidsZUr4VA5W4ogJP+T5awwGIypc3RAdM3QKA/YlVUSPwa
         oU5v9xmDDYmISec7UzYyH00f8NeO3nRALDOpxVZi2IVRIdJpGKu2xNaFX16X1nx2/ua8
         AQM5eDmCrnUspCqP4N/tE081UwVwh6VNbRV0Fw2IG+e1GMFvqB0qyEShyjGr2tEE8l5N
         e57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LaLfHXKa3AL69x2H/TkWWJm+fp3weFCs6Qr/hAgy7NI=;
        fh=MtFXnbtSY8cYZkrXRgxdOGzOIF+Ezgbo2KzA7GBSL4o=;
        b=KfPlxxy6mUgxga6ZTbf2BSIgF26Zc7optSrIarPfM2Ugei6Y144ewfFGN3uH72ApES
         nOwJMsQMHDZSxiKyhum9ccgR2/H5UpXbGLWeIf5S/6ggWPAa6tAZCEN2Uuoie8kJ3usT
         QecXSFA7s4f3VsT+j4xwestqwPMFyA1+Trs035A8El+jknqzEsm5qBW5Offu9Bzv79R0
         c6Q559YrnCs+Hoty1XYGBQzBW91ZbRAXsvCTZlgskZSqSoAaePwJjTr0L9IyuoWhvRIg
         rQWyMG2Ns8R0fEU9WS8reg0ABwzbuSnuFfazRTbIfAfNPCaPfZ+HJ9nrRSCe6oBQteAa
         SpHQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779883595; x=1780488395; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LaLfHXKa3AL69x2H/TkWWJm+fp3weFCs6Qr/hAgy7NI=;
        b=YEbeTqOCILDXkHblx7qfZyqS8K9gmZTOCB8mwYdg7DY52LsWbRb5v7eoIvfTtIgsZb
         jrxF2aOa6N+9ljXGJ9Cs5kduq1cENC0hvd5LIUJPAD/pD6p7/Azobd9a35cK8Z7IIK2S
         UqDbpykHeTYGYG5wnOGl9OdbZJYfOxr0MUFnZ6UVxiKV7oZNou6fFApHkkwhnlWYamuL
         ups1YnRdH1ryDtdgJcTZsRCI5JTDlqdexQ2mMUQR5dlKZx+k21WjgrEch8Cslnov19oj
         VsNCvsVx2qtKTL+Inv3cljkk0EsV36fBdL7i27bIT1llNo6a6j/qRbr9zXmuM4GbNOta
         ufjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779883595; x=1780488395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaLfHXKa3AL69x2H/TkWWJm+fp3weFCs6Qr/hAgy7NI=;
        b=Lpff9y29UGnVKRhe7frool5dNCzPYoliMGVwWIemuaW75a+4LyMSTl9kiVMIyotpxm
         zM3Hbq9TFHtIW2Shcg4L7eRAYPKBhjq2R1eeOIjV5tESQsWcWC4fvYEGFk/yHULupsYE
         /7VyIhAg8g6x4oJT5Kq1NEX2sfGA54hCaIBGxMXOTHulSaJEVHLPlI6mL+zO8MDMxF/0
         YgCU/bRZCQpAM2TKBT5L5/XUntWH5K6TmyD16TzQ+qX2QIQW7ck35tEQyxL7jO9FC3b/
         NCE4tysSahPiVa1sD2Z8/EMa6Zx8vqb8w9g5Mys35Yw/cFsotV0TJCDliurVB/D/MNf6
         QboA==
X-Gm-Message-State: AOJu0YwFBdIfHIVUNEoINBBC60SX49h2bNdGMUSTERTTrhZ1qv888BYc
	8vRjnG1yw0LQ6vPLUczB0d8ta4fIcYTUdRaXYQxKIq6UBSZ+C1KZ0aj2Snbk+F6m9Opgas+cSnW
	ej+1GTFYnDXXqBVjzrVNqtVEbYnE/u8M=
X-Gm-Gg: Acq92OGg1CTy3pTI7InfJ56+JKCUM2cFSjHgN0BASd7KHgIPLRZZ+sliA7BC8ZtsUt6
	6aFyEezeiF0Yhzq7l2Zlm08eFj7L+J3oQg9ETCHi0fYp6Hbf6vxUMFQMRlyKS/BqO2+jPMGJj2C
	gVM9ARDfGOQhRzoN3uJqmUsQc4uoFKHcE0b/oUOz8q9HmWc4rpUayh7uuFzcYUAdIjdTsxR/+ZH
	9s7ofdPMZB/d8eVw3fT2fxj0lGTfgO9CfCxo4y5Duq3+IHCpKeRw07xu2K2B06MGtZZaMt+bkfI
	U/3WWvhtOdCI6CdCzVbmfOHBh8ilHCvFbWA9gvpCXB8RUAxZimWc
X-Received: by 2002:a67:f0d2:0:b0:6a2:b2a1:f170 with SMTP id
 ada2fe7eead31-6a2b2ef1eecmr2664239137.19.1779883594217; Wed, 27 May 2026
 05:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
 <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
 <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com> <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com>
In-Reply-To: <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 May 2026 14:06:21 +0200
X-Gm-Features: AVHnY4KvLe0efRkKEClBBuULuO0oeMXi8cJDEBp0h3YiCTT7UquIVcU_XnIeSeA
Message-ID: <CANNYZj-BEjNW54zU6tOQ54BmtK8magKQe7oakp=iOggj6BBk-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of
 tolerating statistical outliers
To: "Aditya G.S" <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237646

On Wed, 27 May 2026 at 13:41, Aditya G.S <adityags2004@gmail.com> wrote:
> At this point, I am waiting for his feedback on the proposed fix. Once I receive a response or the patch is accepted (or revised), I will follow up accordingly and share the upstream link when available.
>
> Please let me know if you would prefer that I proceed with a temporary Yocto-side workaround (such as skipping the test) while the upstream resolution is pending.

Thanks for summarizing, but I think there's a standard mailing list
archive, where emails are placed as soon as they're sent:

https://lists.gnu.org/archive/html/bug-gawk/2026-05/msg00054.html

I see you're struggling with sending attachments there, I'm not sure
why you can't simply use 'git send-email' to send the patch, as you
just did on this list, but that is typically much preferred. Email
attachments are difficult to review, especially when line by line
comments are needed.

Otherwise, upstream seems friendly and responsive, so we should
probably wait a bit? Ideally, they'd add the fix to the upstream git
repo, and then it can be backported in oe-core.

Alex

