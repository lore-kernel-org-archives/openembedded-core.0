Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88CCCCF9E9
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:08:00 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.10459.1761311277526074210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 06:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ex4SFZIt;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so2399995e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761311276; x=1761916076; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uhvf1R/yEV/8N4EZot2OdZ4HVtaPjAFwsaUqrnw7ySM=;
        b=Ex4SFZIt5vXCWrTIYZx/Rq7JOjy4XocEGvo73y1GSxMi8zEGy92sjbNhA/CJBoKZV3
         2DFrlrZCSL62XVINgyi+58KnaVqOVK98dpnx0A4TlE/+RymUOuhRyIaSqf7YI8U6pAbq
         eondqpJAOtS4ty8N/ChQ0XZkWUez3t/ra+bFTJqKUZ7NiyLGTtMjVAYUppTNbh7pUB+1
         eQzGuA6vmCCgyNl/JLpK8X3u9J8Lopx0Sr47jmYVrkatGYfnllQrceYChN5wWQzmuoav
         AF742vaNih8FFidEqC+WjtbhiMzNR4cil3wdc4XNaGgfwnwUHmYQqt39HQBnJfvD1EKo
         gxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761311276; x=1761916076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uhvf1R/yEV/8N4EZot2OdZ4HVtaPjAFwsaUqrnw7ySM=;
        b=IfoPoYjU/hs/esANuU8WKDGU2yUwTXs/4CguhkWEut97xvAHufKypTqecm5l7+EGYK
         jo4uMoVpEkNY9rSkxdrsEHgi3khrB+bbBVhjYSY5IGZnB5CM+kCzaoUkD7RDhF9tOzh1
         VFzoqzIDSno/fKC7OtZtUvV9Hqe5MtBE8mlJ/25u/+KnUgDshwUEC5dk1zKkNCXlpD2L
         qaabhA9dFjCOXNwWdU/wsujw74+Gv1BNjwrK62s/tcHVFzBTtwF1Uke1osZPF3UQfTKW
         XCiyeJ0WYLScXdVzu7RXmfO8OlXrrJfNfopK9+0qwuOGbKrk+yYxjqpa8xdk8Bxox+x3
         cXKA==
X-Forwarded-Encrypted: i=1; AJvYcCUDO6jqZTv5yvApYuHYklr6r+uSAWL83wK+asnevguQxwaMgWPhQDInKaSpDIlfclpb3j7umuzvGrlMEX3CzVF+lw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxD70s3c3XAp4PRs4UKLaweaZEqJnS5xWu+nW3EEyg6Wjx16nJo
	Ys2enNfkjDoO8W/ZqOHs2gLXffktiMbPMv19oauk5fJAlxZf1nmuoVXmF4AqR4MuN259RjrEmnz
	zRf+aBGBLLBVXs7csg8pVQ4z8ydRI8zo=
X-Gm-Gg: ASbGnctRxCGKk43Nvhv06QP1BhgAB2ImLVQ2ldelGTrZ9s4qgP7dScblxkLvOfpDHa+
	MEcNWBbAJi7v4ClvjXpk0HHRLOutB5+0iXLFoxS03twuXtXlN6bcyvGd1elHzwa1+7wAay8QW7J
	U484qBmD67KJkUKrGkuJf5wXSJhEHMQEHf0OTAPXJwTE3TO0ZAexDQ1LIn7mpeLT9xsyuW0Np9c
	zmll/cJfoTidS2vgffeHOh9O+bU+UShLHTbUThSh5GYuEbcUyBfWxI0YrPyBHlLWrYJqCb6tk+T
	ENKeGxzbxJ00jQ==
X-Google-Smtp-Source: AGHT+IHYQ2FfCGXMXKfz/Nexm5kJ/oFxVFbUht2xCk6ZjZF062HYtZjzMQ9k6i8QCZo5lA5oOAh5LCOXMB2sVzdcCoM=
X-Received: by 2002:a05:6512:3a85:b0:592:f2c7:9b0c with SMTP id
 2adb3069b0e04-592f2c79c84mr2917718e87.28.1761311275279; Fri, 24 Oct 2025
 06:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251024130447.3599900-1-bruce.ashfield@gmail.com>
In-Reply-To: <20251024130447.3599900-1-bruce.ashfield@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 24 Oct 2025 10:07:43 -0300
X-Gm-Features: AS18NWCP1ZHgJNSUMnQtx3QrsAshbNm_ONCCYOAD2wuR2OZWNtCrpnvpFnZyWU8
Message-ID: <CAOMZO5Aj2O4Q0xD0teVRDQ=UmcubfuiU7GJeztWNNuqT-_D3zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-modules: update to v2.14.2
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 13:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225293

On Fri, Oct 24, 2025 at 10:04=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> This fixed the build against kernels 2.17+

Typo: 6.17+

