Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474F910854CF
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 02:21:24 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5403.1773800482275337535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 19:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gq4mWocA;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b6b0500e06so7610980eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 19:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773800482; x=1774405282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvxG0vb8UyrQ9mCQtgy5KFs50Wkto1vL1wdh1Y2oz/0=;
        b=gq4mWocAf/gaCHiEshqUpCty5TZONcks5X6Gk0ULg1sy79dX1Teby7Q8zulcVyH9F4
         q0MPW5+7422kaUwMTuLaCuRokzOMGG7og1qVS0ywT2AL2od4mBUlgN/BXI7YWq28jeOS
         TcHJWQymPHQOR9rM1yJT/zy6KTfeCTZWiTmxY/lp9wyr7/dBQbnAQjotihiviiLxX1jy
         RvGNqFswDV0Q3Gs774AyK7DiFLHojQ5JDWR1+tmbDeovFgyxf7w+IrHm7SiFHWIs4kTO
         Xt01W6w1WW2WgIvzBGYgF86iIETAUXcuWk9bllY7FtlCGaBPLrzjFAZ2vGkFkacwe7Hr
         TktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773800482; x=1774405282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvxG0vb8UyrQ9mCQtgy5KFs50Wkto1vL1wdh1Y2oz/0=;
        b=jLc3qR7dR2xNlDblXfqWbcIIIukktr0pQ76PcrprLwVJ/kEuC1JvIUcIFRISWwLQky
         TFpykK1+GZpQPcwhha3w1+f+AYDHE0XXj09ea6mpn1II5imLAHs6GlJySwOzCZv+U72b
         vP8Oti1AoNv6X2qicS2f1z6AdaQ79SINJdnFYjjRhQqsMrHJsccVbuyjBLNsE0z0eO0H
         NuGVsIMmQ6bkkiAitOqhQNiSeoLb/reG7c95UjxuGUJLmPoV9p9Md2Ih2NQs3LdySHbm
         kbPlAWIne8L8NAz3isbXqTKUU/11J9Tv1RWHUoShk5N6L+Eq/PQnD5BRRRb4HBAsh/ZL
         eKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEXtYY6XanfRN84JowDt2aS8s4BS3qgwxQFZWlSX01lH5JBTGQQXjpgJTxublR/XpwliKAda6W+BMukQRwJW29Eg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKVHb6thn7s6rziBOdceHBspCpMhwdyy4dXKCjuyEBtGm8jFr7
	LXYkcPPX64aC5To25p0XloMmuEY98/Cnc/zf7amTz9XX/wKI/s4iADEK
X-Gm-Gg: ATEYQzyY6+B8j/678wCm/psGmiljGT5DfSUqbkZ8CD8IQEE8zAxhnFaNy/k6ar26eyo
	mfcTnYP+LKi6sA47IyXwmqNb8h0EUOlMuGo6B4/THSepz9JEo4cj6htYD/tvvejCW1pn6NzCVUu
	mqbARVWGkSANQaANFL7I6KATwzMM3oNb3s3abwhGH7b5v+PiQbP9wdkK6kuJ1hFX9HZy98R4bIZ
	SnZLVk9wDm+pYTJrImA5Sn4VbvsMwWcoK7PvYodVXKc40XvmeFzY8MG8pq2sZYM0yxChTGBHRNF
	M9Mu1SDHLA+OnrBBnIgoXJRaQNIEmKgy4waB5BGs92NKNwnycgOCEuRPEyplLrkcEGYXYCMQS5X
	E6gZhWmPHU4cmk+Jb9QSMG450qChfK1nNddmpqjtNfyROT3mlDJv1YnPmxZjI6hWFUPNNa90S5k
	pXviY61n3BTInVXvZLYTRju4SjEG0uxe7OZJ+OHLr+lOYUWlYMORgGwPAwN4v68HTfni1M4gdyh
	3UBPQSyD0AWuPLYZCYyIKbxg/g/TQEoliFoxKdl0axhtd1brQM=
X-Received: by 2002:a05:7300:3205:b0:2b8:26b8:3446 with SMTP id 5a478bee46e88-2c0e507ed04mr752223eec.2.1773800481517;
        Tue, 17 Mar 2026 19:21:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582b30sm1884451eec.17.2026.03.17.19.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 19:21:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: changqing.li@windriver.com
Cc: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
Date: Tue, 17 Mar 2026 19:21:19 -0700
Message-ID: <20260318022119.1702888-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <165ebb9c-7b39-4c96-b180-cb2e131312fc@windriver.com>
References: <165ebb9c-7b39-4c96-b180-cb2e131312fc@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 02:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233356

I meant to day, this patch is needed, its not breaking anything :)

Thanks
-Khem

