Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D06C71136
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 07:22:32 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.8996.1750317751988693953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 00:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XN6seFic;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so6259976d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750317751; x=1750922551; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iq9uTKDlkjcu0pxurgxQStcQS7mtPKxi8YO3tbLmgMA=;
        b=XN6seFicE96aH3Flkv5UKJMr6NMa6Cfi+VgDf32+XRsvJyZL0eRyBEMqUB3pNzA3OY
         SLihj84zMGrVnz4woqWujrrP/Xssbnt8EJ5Oa18RVnnOlCLYyK2ate5CpFG+TFdGu7SX
         mlz0T1i0ZKPEb4m2A+PuH/QfdCme2oxtDwlpw7HUpZmsOXfdjb9JpVV3QWDT9VsoRHRj
         c+g2KA4BzIXdCqW5waDMDbo3uOOBKfWVhhVh9alNHJMh57PxYM41W8VY+FJuGxkiKF/a
         zNX+Q8R363FgrPSY6GYrt3ZBoFfM5f+WRwrRgLXWD63Nr091mp6BrRJeq6ONFaheV5Of
         v2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317751; x=1750922551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iq9uTKDlkjcu0pxurgxQStcQS7mtPKxi8YO3tbLmgMA=;
        b=EVOJTsUewA3iBFYwUFlvU/E6kjkVuzxvVz0EXFA40f8TXsrbiPepkBdCWJNnTa5JSc
         7R925/i9AISGmLoHMOV5MG1QylRZN1DB5S8ZAmYcBcoE4hmgRNRthdzmPa20iZpQJKy0
         xHLGeqVM5B0q98JrZasVAL3+y3yRrjZcDwiGLG+0BSB66w07CiY32KVDwjKxDgsv/yJg
         ffMvAMzvC2wHcxgiSxCHcmP5iPeS5a6kdfP5fP+tXTzf7ivhIaocI+LdoIEkxpjjh7o1
         /BSoZ3EuZCFN3xBsFSnRZ/fdeTMT76a16909Gv9FJhBIQWnmfU0vzu2bkM+8zyIp/pyG
         jrpw==
X-Gm-Message-State: AOJu0Yx0UotKIvPPHe5675ds/xCNv6AgRBG1U0WM/qw5WoG/jX4CHul4
	8x15IHq5dqD6aQadidPFbNSiA99K5giL6TTrMITr6tjNU0lJHhIWbhEZ0UbriZr3jjzkzuZJv8o
	P8ecF1j4pXH0Sh4XVpXMvto9CuP9/6Pg=
X-Gm-Gg: ASbGnctEbzVgnsEVqG8xcKop6jcCmiliNnD8Tepq1zLQ1LKfVxc+RUvIzzIiqRkEZPb
	hBLtxabCQ1ZJwdLFx0HGJ2cQGnFjgjgCtS+6YZKc3H44uEQA5KaxhlbEt4lo2QdyIk1517mK6zJ
	BtlWtzBK9VmKfe3XFz7/issh2pZN9wpwt5J7uO2gGV0DzeUnB5em96TVqpX5TIOgtJSYqpMgca5
	kHXxQ==
X-Google-Smtp-Source: AGHT+IG+8vRgB2AXUOAQpYJSRMQRvq3SOx2e0+EtAkseiwq7HlKrdYMh2AemLHF0sagTV5M1RzcC3O/imsd7/LkYiaY=
X-Received: by 2002:ad4:5ce1:0:b0:6e8:9957:e705 with SMTP id
 6a1803df08f44-6fb477e7e37mr334258956d6.34.1750317750887; Thu, 19 Jun 2025
 00:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250616074341.32477-1-jimmy.ho@sifive.com> <CANNYZj-njPQU9VN3yxZSs1cRiWNvZ172nzV=abD2jVm0mGfpdQ@mail.gmail.com>
 <CAJh9TSLZvZG6VJdqOZiMhGJykKQHCf2uem3ebVxRH_0o0FahYg@mail.gmail.com>
In-Reply-To: <CAJh9TSLZvZG6VJdqOZiMhGJykKQHCf2uem3ebVxRH_0o0FahYg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jun 2025 09:22:19 +0200
X-Gm-Features: Ac12FXwKABmf8duMA8FThImBSDhasqfVfM44bnN8yXgHv02Jxl5zqc8FwXK-cZ8
Message-ID: <CANNYZj9cRomNCdFH8MdOB3NjaPk4h86dME1hMKtNeQP8kFkc7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfsrootfs: disable warning message if bootargs
 root parameter have not been defined
To: Jimmy Ho <jimmy.ho@sifive.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 07:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219052

On Thu, 19 Jun 2025 at 08:12, Jimmy Ho <jimmy.ho@sifive.com> wrote:
>
> hi Alexander:
> in one of our use case, we don't define root in bootargs,
> if [ ${bootparam_root} != "/dev/nfs" ] will output /init.d/85-nfsrootfs: line 4: [: !=: unary operator expected
> by checking   if [-z ${bootparam_root} ] can clear this warning message

Thanks, makese sense. Can you resend the patch with this information
in the commit message?

Alex

