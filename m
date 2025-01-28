Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49B8C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 09:03:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.13603.1738054990667839072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 01:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kFW2mQpK;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43618283dedso56712335e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 01:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738054989; x=1738659789; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TXDkFoXr6XS3Wjf9TbSoC6buVR4rhcRvMrqVQwSeJA=;
        b=kFW2mQpK/EqN4DcwjbuVuvztihE7h+hSuq3j1jGIydvA7Z3w4AelfTlUkpvi6xHsdJ
         hORk/eaTUJDZlgi3IoD5AQaK9GV/hBf3hsGQ10Zam7GUgCzXoxJgKT2yt5E1N5NgBpTS
         K+KaVH1rysSELNA4Pj+R7JWU27YzIUj1yVSOk5jl9fIjH+XiWHbNcBefWuMzVL+ep5TY
         T006P5b19567G4kPUF0HgSvvA5JjYCmrRrvIRioHYsNIgP5L2lpI7YjthzvflyZhUs2v
         2Am3uRvtIHW3QfWXOoqobs4/xPAi9UcuV4G6tF1s8XKo/vlcc0s90glX/FfhFDY0ys0I
         6IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738054989; x=1738659789;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5TXDkFoXr6XS3Wjf9TbSoC6buVR4rhcRvMrqVQwSeJA=;
        b=Yj0KS1SId22AdAIx7Fp/L/dOh+GQRjfVtQldEhgAqwNPDx1fTXpN+is0BYW569159i
         MKNey0E9+eg+j9E0rwD8NNQm0cAY1spxZhRUDLP0ibcrmKZuZZYNi4VFFu9lhlKaeWw3
         M1gHiIUdwNzZCj5FX6HHb2ociVAqH8rVu+TyQKitqXcnSdQ0ynqAFEqXuHQGXG80rKgL
         e5Ncc4ozKmS+Mu1IJ6rLMqrVg04dZz0FQEaMHWaMMzeOKtJx+yeq2xLEZ+Qcj2UB8TS6
         psq8+gUckvuM0vMm6q8danFqTqibl+EB23USxzl2DHmKF5oh57XhzsAX50PA/tJxhWRW
         nkeg==
X-Gm-Message-State: AOJu0YzwECn9lpnX749qEfkxGReYjCf+v+wPgL0Pj6Tzzf+kzEjtYCbg
	X9GyMbpXvxYcXuKEz3KQ2Qaid/zYe8kB9cQ/Kqy35Loj3jaVql1QHeILYQ==
X-Gm-Gg: ASbGncs7wYmEtxtML8W3RdKZ4NkkNQDI4EzMpI5Tj7Hg5wHNWgjHdunNZQuhyXte/2e
	IeNVnn37795mAfh1AeTvmOZfX25ZmncauMOlH/lOhfUkgxg7UwYDkGC1Pqe/v94iIYeF88un6Pm
	haIbx/42f/XwO5Vn25Iq7kDc6t2ryEfU/7+3sSCPlLjW3lBHJO/sk9PDh8C833eysJhayx9yRHo
	W0BWj2RHvwh/xsM0rt1jF3t2/7NdB5N5GDYFHsSQQL/prw1UV9RoAgyiFnWVgSnk5GJeLGWwv1F
	Sta4BtKNPOWVzFZd3UUBgUNo03r1h1D/phtQpavxjZK9MoFF
X-Google-Smtp-Source: AGHT+IGlw0ZiMdHnAPDcPrru/5epHZS4aNPe6iLPntZSwLhFyRSzON7ZatwQRB3yd9DYXwaxEjtUqw==
X-Received: by 2002:a05:6000:144e:b0:38a:88bc:d57d with SMTP id ffacd0b85a97d-38bf56562e1mr36454399f8f.2.1738054988551;
        Tue, 28 Jan 2025 01:03:08 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c418esm13667970f8f.95.2025.01.28.01.03.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 01:03:08 -0800 (PST)
Message-ID: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
Date: Tue, 28 Jan 2025 10:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: RPM signing errors in Yocto master
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 09:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210312

Hi,

After a new build host installation with Fedora 41,
gnupg defaults to this configuration after creating
or importing a (signing) key:

zozo@localhost:~$ cat ~/.gnupg/common.conf
use-keyboxd

RPM signing in Yocto stalls and eventually fails with:

warning: Could not set GPG_TTY to stdin: Inappropriate ioctl for device
gpg: waiting for lock (held by <pid>) ...
gpg: can't connect to the keyboxd: IPC connect call failed
gpg: error opening key DB: No Keybox daemon running
gpg: skipped "user@email.com": Input/output error
gpg: signing failed: Input/output error

With adding --with-keyboxd-pgm=/usr/libexec/keyboxd to
the Yocto build of gnupg (otherwise it won't install keyboxd),
RPM signing fails again. Now, gpg complains that the keyboxd
version is different from gpg's own.

According to stackoverflow and blogs, the recommended way
to fix "gpg: waiting for lock" issues is to disable use-keyboxd:

zozo@localhost:~$ cat ~/.gnupg/common.conf
#use-keyboxd

I then cleaned up the rest of ~/.gnupg and re-created / re-imported
the key with the new configuration.

Still, RPM signing in Yocto master fails with:

warning: Could not set GPG_TTY to stdin: Inappropriate ioctl for device
error: Unsupported OpenPGP signature

With use-keyboxd disabled, I also tested a build with Yocto 5.1
(it ships gnupg 5.0) on the same Fedora 41 host, and RPM signing
succeeded.

Also FWIW, I also tried to do a build with Yocto 4.3.
To make it work, I had to backport ninja 1.12.1 (to be
compatible with python 3.13 on the host) and the
pseudo changes from Yocto master. With these, RPM signing
succeeded with Yocto 4.3, too.

I also tried reverting these commits in openembedded-core master:

commit 2ab817c434ac443e29d66105056675d6256e8a2c
Author: Wang Mingyu <wangmy@cn.fujitsu.com>
Date:   Tue Dec 10 07:56:38 2024 +0800

     gnupg: upgrade 2.5.1 -> 2.5.2

commit 3a00465f4b0c01580fb27e0c462696bd4f840828
Author: hongxu <hongxu.jia@eng.windriver.com>
Date:   Fri Nov 29 07:33:29 2024 -0800

     gnupg: upgrade 2.5.0 -> 2.5.1

but the same "Unsupported OpenPGP signature" error occurs.

For now, I disabled RPM signing in my distro layer:

-PACKAGE_CLASSES = "package_rpm sign_rpm"
+PACKAGE_CLASSES = "package_rpm"

It would be nice if Yocto 5.2 final can use RPM signing.

Best regards,
Zoltán Böszörményi


