Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FB4D6555F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:25:26 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13407.1765974323129430356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kHhlt38E;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b29ff9d18cso622784585a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 04:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765974322; x=1766579122; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rv3egj2i5Pxlpi8YCkQs7+SIHV0+7TjqbevfKDa2GNA=;
        b=kHhlt38EUI31ZAHSydMqn/p5YzA2BIq4gt9RXgOWRoWKmUYJlTKigAVTrZ8i0OxZfo
         v35v6u57KZfA91MyXIHmxG4Je0IaWON1CsA3xZMZd5HNNacW9BPFTnVByF5JL0nPzT/Q
         WIQMMuRLgIau7royC5OEaQHpSEdp2+AjT39Ye7Z5cB+Yxq7tUV6KiuWGs3tEsMkBBl2D
         5CbtsnfhcuCZiC4odPQAdRfRs4Kew3/pbEcfnJH5FLzJxtY1eWNKyIwBJ1xINerEJzw6
         ijgR0z1dsOUiwB0QedeStX4j7C6LDD3+fjcUteohoYRTVlL4CTt2Mf0c/PLSA+E3eICG
         KBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765974322; x=1766579122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rv3egj2i5Pxlpi8YCkQs7+SIHV0+7TjqbevfKDa2GNA=;
        b=iY/JC9zy16VIshccj99NmwzTjnih2Bgs/7affCDWTGAQ7ii1+qML9Tz/HfoXeDyZPX
         FRpsvRbDoY5bU7mD6ubciy3vvUQ3ajaGxWM3n6MwOHGmfxd22kyuP9qhgMeohZSeI+yI
         6bjVJKbjJSm0zEUOZBo3pq4UQqUQ1C8/My9mJMcgH4VYd7pPopdhFzi1CcPgBJAFeutO
         WIR1YKr8eSDQdLG+tSatnnQsjtjMSKDnxNzV9Fma70AwJaQRDgM3AwzyaGQG9kI0X84T
         eGtqJ6pQBET1DZ1IcVc0XbII4BGioi7Gddd/WCgZNw66kmuSjHxeWE4uIW/CPLBRxISe
         WGew==
X-Forwarded-Encrypted: i=1; AJvYcCVYKDnbj1hDjQWjXjqrhPHWb3QP1JiTm9bGRqC2YNb7p+x0Z6hK0l/TMYQ96IMBXWdE2ls+5vtaM/T98qv20QFFCQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxO8Tad/DyYgnwRod697/18lm5zlq95dbEAndQbLqUcQPJPoOfm
	LqF2aQJnkIosxH9ReqluULvCWr12S8c9y4TuPkvoD3EkVGJdXJBCKcRBLop9CmHQCw4irBYeZJF
	BwvJVIKmvuIRJhPpf74nEPe76orvmuwg=
X-Gm-Gg: AY/fxX6Y5xCrDZK24/tQuRcT4Uryflnmg49tGZT75LSD7M54/FoNXI55Tw4itEIvya3
	9ZGJr4Yaj8XO1iwzhvC6Oh/6jcz7tET/GJYH9dSq28vL4xuJo4hvkXceJFaCIG4KkPeckCjnLVr
	Aql2YaKWE5nz2hmghskkMnV2GxWKRsZSQG6wWnjaaLxT9jnPOUV3yTzzse0uxILqa8kc0uxDGJ2
	Jc0dkiac/f93z8CkBohiUEDJhyU4S2pyWey/IpwBC1unNOLtt+hxV/h7qC5dS/AkyfZRiFy+ee+
	5iEyP3LR4y/argbXsd89qWhJn1C0F78MPXyK7cYI
X-Google-Smtp-Source: AGHT+IGBQb+Qs3Hj8D6NWdWTRa6KhevYUZDlFCC/2rE9hGHaj54hQCkUmrX4mmC8emgW7mIwLqz0eabNYq8jsvrju/U=
X-Received: by 2002:a05:620a:28d2:b0:89e:b3a0:bce9 with SMTP id
 af79cd13be357-8bb39dc4752mr2438738285a.22.1765974321950; Wed, 17 Dec 2025
 04:25:21 -0800 (PST)
MIME-Version: 1.0
References: <0101019b262ede8c-49d9befe-c250-4b00-a166-8ac8b9a5461e-000000@us-west-2.amazonses.com>
 <2a314131-0dc4-4a21-9963-03063761b8f1@rootcommit.com>
In-Reply-To: <2a314131-0dc4-4a21-9963-03063761b8f1@rootcommit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Dec 2025 13:25:10 +0100
X-Gm-Features: AQt7F2qdRb8A-QL3c4kDJs0vVM-Isc3ZJJ9Zad7DmP875ORe-BNm5dm6DpBRfCg
Message-ID: <CANNYZj-TZkRiX01Pu6i713YfT+UwdVrk+m0FVVB2TobqtkWp5Q@mail.gmail.com>
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.15 FAILED
To: michael.opdenacker@rootcommit.com
Cc: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228034

On Wed, 17 Dec 2025 at 13:22, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=3Drootcommit.com@lists.openembedded.org> wrote:

> I probably won't have time to investigate this, but there turned out to
> be no issue here.
> I upgraded the recipe with devtool (as AUH does too, I guess), and the
> changes built fine.
>
> So apparently a false positive here (meaning "failed" instead of
> "succeeded=C2=A8).

Did you build specifically with musl, on qemuarm?

Alex

