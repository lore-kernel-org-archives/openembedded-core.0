Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69ACCCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:18:52 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.432.1760725123275740985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 11:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cuo6AnTo;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-78f75b0a058so29346176d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760725122; x=1761329922; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kl1A+Hor4KPKouJogGf+dkZAaXVVTYL6DRr+XX2lZ7g=;
        b=cuo6AnTot9ckgPcRo/HWAonefNf8QAi8Z3Mot8ZH62NRhw5KgBXCavdjz8hlNoqz/y
         adr4mRqir/RGX2k0pfMIJxUuBHvbrwcE4R179UQa9DBSL5jrC5Ka5QewZxyU9gAjbPN5
         rfm4mBJVjoDFXV/7jJWFUmitX8KpCtNsOwsbIsumw4juPW2Uds3Y/zGowrfXVzioN11c
         Tykjs1pvShoo1fys91UUu8EJCNLUYrxM6rKF7GAoJ3TldJEf++UcddUKIYjvA0/9TsLr
         yzJzQ2SZ5r+z366rEOhr+8l6qBJaHeOzptNjceqMvTqiE3nEV86af5/SuKTdzL7mNuVN
         U0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760725122; x=1761329922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kl1A+Hor4KPKouJogGf+dkZAaXVVTYL6DRr+XX2lZ7g=;
        b=NkUaM0+qrM8b8IIb7pkhGts97GlHi0nZDeNnOuXUI1oyzp9pxwNsRDI0TvC+Qyb730
         pmBwhBgRvq3q8qR7iG8SbpiRMKjc08+YpWt33a5iOtAUwxReT+iEdZiQvMvGuGYeL6QF
         vvrl0E1gDEeg+Y4ycerI/Zc6Vx30tx3qseObthgFKeQhkxlt2inIzC3rtZB5U2Vvfdkp
         kmc5FXvIXc6y7PfFAZwqlYwOTaVMizNWVI1turZTj2ViCirA7qUPcqjk8mqzLyVkOTZq
         H0BxMZ5ze8QUa/NIT3i+sF2ttdIQ5QH1G3+4B2yU5nzgLYomzehcf0yw8y0n5wYp810R
         YReQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCBgcNvji43cPChuN0crhcBjMUaF1zyMhfaSB8aJxaY3vUgNdBkB0A0VPGbK++3kcQsgkxchNSeBO0aHpI75YLIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEQSJrbrKx9IqZsb16Hsx0+UzfJ4VhkB8+WsvRmje5Czy3+Vku
	vubuJwubjdi5NRewOHVcr6+Z/BN5K3N6H2BsAGWaxW557p8ZfH4ZrCJZUnNVCGOllemfKVGvN9n
	sV/cjM/ECs2i3vmcUfZIRhBFBNpaOFvI=
X-Gm-Gg: ASbGncstKmdT6iZwyhX++OMDnrnfscQTunNYuyqQxtCdXrDI650bbNlUOiqCflBcWnx
	5AmOVlZ1Kd/KPJ5GJ0IjfvFwgi0DbL1K1Y/WyVKVMcD2UYOe4phhevJn3Mm/XwJeH9EHzmDv9qb
	Vavt+3lBNi5i5KoUxl0TW/AE+SuzNSpAyQyPygg8RR89K2D3gmi1gLcV68WvzPY7LWwVZK0pVHN
	fX4etkgR7DRQXnTGsUNa9EO2VejEbGceJmuDmxnLHwhy3SbIHd/sfXYZRpLPsbS5Gh59jVZpHfb
	gNgVWtQ7lbzydFtgWu9M5g3y6G/qoy6EEIb97Tp2PAkX7z9/M2UjWPwdLcdr
X-Google-Smtp-Source: AGHT+IGJxA+ldDjM/uLndIQaymEzt7N6exKD34bcXwYGsOgShbjTBjUxZOPUdZRW/vnWYFhnlp5aPN46NokNI9rNgZM=
X-Received: by 2002:a05:6214:212d:b0:87c:8e4:3375 with SMTP id
 6a1803df08f44-87c2061dadfmr80243306d6.31.1760725122229; Fri, 17 Oct 2025
 11:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20251013185934.GA114595@pevik> <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
 <20251017164332.GA355538@pevik>
In-Reply-To: <20251017164332.GA355538@pevik>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Oct 2025 20:18:33 +0200
X-Gm-Features: AS18NWAbHqrQ5GktiFwEIDpoE_I95gCu76Y_b8lKCPZlY_WHZbPHT4tCR1tM4TY
Message-ID: <CANNYZj-6s0z-VgsONFkD-BW-kimhJ1R7bRLsXTJ2NQ7ANjfi4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
To: petr.vorel@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Yi Zhao <yi.zhao@eng.windriver.com>, 
	Khem Raj <raj.khem@gmail.com>, Hui Min Mina Chou <minachou@andestech.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 18:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225030

On Fri, 17 Oct 2025 at 18:43, Petr Vorel via lists.openembedded.org
<petr.vorel=gmail.com@lists.openembedded.org> wrote:
> Master branch from my fork [1] do:
>
> ... $ . oe-init-build-env
> ./build $ bitbake ltp
>
> ERROR: Error importing OE modules: module 'bb.parse' has no attribute 'vardepsexclude'
> ERROR: Unable to parse /home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py
> Traceback (most recent call last):
>   File "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py", line 372, in eval
>     layerid, fragment_name = f.split('/', 1)
>     ^^^^^^^^^^^^^^^^^^^^^^
> ValueError: not enough values to unpack (expected 2, got 1)
>
> Kind regards,
> Petr
>
> [1] https://github.com/pevik/openembedded-core

Which revision/branch of bitbake repo are you using? Note that bitbake
and oe-core repositories are tightly coupled, and if branches are
different, or branches are same but one is behind the other, you will
get errors such as above, e.g. "ERROR: Error importing OE modules:
module 'bb.parse' has no attribute 'vardepsexclude'" is pretty much
saying that oe-core is expecting something bitbake on your machine
doesn't have.

Alex

