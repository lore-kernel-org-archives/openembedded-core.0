Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294D5CEBF61
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 14:54:24 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11306.1763391256865967383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 06:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bn53PCv6;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.49, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6420c0cf4abso532583d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 06:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763391256; x=1763996056; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu2/1EFEXGV2ZPw9WxtLHFdto6vb1D8BBgbhIRIPupU=;
        b=Bn53PCv60WHRW5h8uEXjnmtBtJR4TSJF2DKGyaqCU6SN2lhd0MehSimw/vg7VgCJ+V
         WQ+vHYvuLQv/hKqc8ilO7oJfhHoAGFLCBkTmcJxnh20Idu0alj56yLerFkJSECWo3zuH
         WkL8bsHJMTeBmDNI0YMF1FZNP2NbyAJWNgSiaWF/dbiHUg1sp581pLEILi5goT75y1KZ
         8Yc6FFITJjRNC/xNpyceC9qhdwiSOuyRVllg1gNlgcDOewwf4/VouDyKQSZyXUmhY8N0
         hBD8Lj/p76/b3hW9ViEUvR0h/R4HOjv4ms2k6scNLoIh7L+cxWdaZlUCjkeNNI9xGYNF
         dQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391256; x=1763996056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fu2/1EFEXGV2ZPw9WxtLHFdto6vb1D8BBgbhIRIPupU=;
        b=mLukr/GigKHRcYFIsFNsiqSb3Ej4weqUUORvXC3+8K2Xy4/ppmhVoMEs4CPX3KVgOx
         0rOxbHWrj+AyHdXvfN4sG5O3NEx5ZH05SGtUfMxLK2aEWJd8pvpR6BjR4aF2bbJQui11
         dru4PpbFzob5eDii9g4uRRpHapdJdVV6J5bukNYuNnCDQ2d+YDRlrvemgiDTw6K4InfW
         OBCRxkoeUkvV00mQJMvKDsa8pXc8pkymjEChk+J4JJEgffEdjehCuJJl/+gmycclbpG9
         /fpr8HAqVUH03xvhCkYCs/E5WHU5d2k0NckxjSTUQjfXRnX5U/s43vP2cprOiflZ64ph
         C6YA==
X-Gm-Message-State: AOJu0YyfubLjqDJRJ+lcCDg5X5UqLDsuMM3TXbThrtsz5lhhlT23oZG2
	ofqBuKbRRDGfTSaXiCpSlSLsAW3Bj6fs5d67Zb8zo49eCJEZzJBAp2/emybuUE6T9i1wrrx0NZh
	R3ieCGn7CuA83+hFZnUTPnSTFcIlASxhyLhmyXQPPZg==
X-Gm-Gg: ASbGnctraUVuKqjDd7237BnYIG3kV7cwoOY8uMzhNGVgj8MgvzRo4ttmI4t8DzdIwAw
	9x/JM5HJhUwh7XOeClI1lz2VcdfulQCoeiKdiyPe2ejK2x4g0AEzO/vGLJ8yhgcMjyCnv7vo9DO
	7C02uOnCBDxMctfIRGmVltLoEDNw4NlVAkSRDoVHwii1frGbFiz9v/DzwW6gDXzDzO+NDKaE85x
	pdT8wxcZr49cvzXigtzg9ZA2Nx6sdTWPMZnn9vBVo0lFk28GD1lJpgqrzpb7wFvVEFGfKLaFeh1
	pm0J2WPwjYI4NDuXUrtxd0n/dpzZRbbpkdQwQg==
X-Google-Smtp-Source: AGHT+IH7rP6QbpZoDVRgYbux91SAm9RNqzcUDozxfvItFZvr0UXM+f083GD34k69W1bNblT83tcSkOAg1+T99yCWkkQ=
X-Received: by 2002:a05:690e:d4a:b0:63e:1f47:f504 with SMTP id
 956f58d0204a3-641e766148fmr9549249d50.50.1763391255867; Mon, 17 Nov 2025
 06:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20251116114710.9CA081003B6@builder.sakoman.com> <d3095e64-7f05-472f-9b6c-eeb84ba92853@gmail.com>
In-Reply-To: <d3095e64-7f05-472f-9b6c-eeb84ba92853@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 17 Nov 2025 06:54:04 -0800
X-Gm-Features: AWmQ_bmT6VzEdqiDFdF23EP7KR255hgHt8ExhEkwFo3vxJe459-svqM_LE5scEU
Message-ID: <CAOSpxdYhos2a6Mig3wOjP_QqCJMyQePOi02_+muc4j9hRZrS0Q@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for walnascar on Sun 16 Nov 2025
 01:44:40 AM HST
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 14:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226495

On Sun, Nov 16, 2025 at 11:59=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> There hasn't been a CVE report email for master branch since 2 weeks
> ago. Did it break due to bitbake-setup or something else?
>
> (If it's because of bb-setup, I'd be happy to take a stab at it, if
> someone could help me by pointing to the repo where this job lives)

Yes, it is due to bb-setup.

Thanks for offering to help! I'll get the code into a public repo and
coordinate with you off-list.

Steve

