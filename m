Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26682CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 07:59:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4841.1763366371954870255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 23:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQ+y2TII;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so10536745e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 23:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763366370; x=1763971170; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1majmVUetQQqxGm7U+fXuLq4SiKrSqLm6OY5Rf1+Abg=;
        b=hQ+y2TIILJBNoeSfzw9aBk5kHjkRWw0X7Voq8b8LaTqXrkVSasf34gPJf+11JXmngN
         L2XUQdu5Lg6dTW5UCnT613YbzErhhpzjmvY1N5rVtyM3E3itDsFLubY2nPvK/UYz8bTW
         osjzklZa9vXGtmLXKgvEPgtyfQAP9OJ50cDo5Ot1Eu4LzkFk44riQO4KtUj16qp0GNKM
         TbsbyUlZBXnQK0Haqt+33DpHHncqbZpvkNoUDTOAESSOa+z2Eb1rg5g8m+RigX3PqG6g
         bwvX79dcOBF6AJRCLx3z5gBXncnRtrm+NYhvnYMK9qYStWH78OOn8XSI3RxpI87MO9j6
         mgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366370; x=1763971170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1majmVUetQQqxGm7U+fXuLq4SiKrSqLm6OY5Rf1+Abg=;
        b=BK3hRw9WoZ5/w+/vwuFSQYpqr9lAE6IOGqa0OY9GPTaSrL0FHdEpFwH9bWTTECB0oP
         nkPASOgFcyHYPaaRWb3tXFpicM2gs6TcKZX1k90IT1/FZ2Yk2vPOCWaDsJYmYJgBkdrp
         j99UBaYswr3oRDFva2nShNqMEW5X7rFmK0k3xuvo9QexAQ6FzJVqRWCY5j6TwZrn6vT0
         9ESeL/htOQVgKga3LtP9Nwsdc9F8I4gHtEomp7E8UOueyTtvvhRNnAEnJBpOcL84hZqe
         2fQwoOjxOw2h7zKxB0Ob0mvJyMelO07UxWkU/xgvi2HSENxDS7ieE8x1nhINgWiznWyO
         4gmw==
X-Forwarded-Encrypted: i=1; AJvYcCWH8VOZqgTaoEV8JM2pCdWkVF479eSa0TuUIBtoObXtjuGiMehSgGtXmtwcYmrjABD/eOn2Un8Owc4FSlRfTp1OkQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy902nd/CkcTIh3I7VCRgRAHhbrYP9A8i/fj82D0S2JQ4kMHvm4
	JGtTtqjdLj8hCTlnR5Ow/BFSI+JcpO7xsVOerQmtj7JEiQnO0G8YiDn23EOgrP3K
X-Gm-Gg: ASbGncsLPesiotD+bVrLO0Pirgz863u2qmkOxCdWB4IOqpQpbINxPE1nzHaFY1GczF7
	LQbTztIHSreD0HCFVs9xAL9WrkfE0sKa/XJDU5M4JFzWHaiPQP1ay98HxTm1SNNHbGMe4/Bjsd5
	mjN0P7nLB2ygNt7hUjHO+xoIfN8SMgRm5KV+QEYCWH5RxJbyrPehj080AtzsGcnMuUdozTER5pw
	uQb4eFo2FGCU9slr+vNGxFUSuvLC57FIuVyLliRQ9S1l7yv/F9rdPuljoiBayBEnl5OIZdOA4Q0
	BqZ63oDQbJNL7K5pcebVwBoeL5I/glHZsimmZOdliNVtMQ6Pa1BTqfVmehxtJcT3WsWY5Htpzkx
	FMRIBzWh8klvxQmLU8gAFOpnCg0bKKkvFO5k6P8YfJsvPMi61PloqsTW/K+ldTwPBaAT0ZPHAlj
	fi9CVw90vI
X-Google-Smtp-Source: AGHT+IGWxc7EexaxH2FYXf2mNuMcjD9W3h92qh/D/VZaxHRKtfzSDMfRTqG0FC68tMGjLRs9yYng0A==
X-Received: by 2002:a5d:5d0b:0:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-42b5934f412mr9837223f8f.14.1763366370228;
        Sun, 16 Nov 2025 23:59:30 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm25374953f8f.26.2025.11.16.23.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 23:59:29 -0800 (PST)
Message-ID: <d3095e64-7f05-472f-9b6c-eeb84ba92853@gmail.com>
Date: Mon, 17 Nov 2025 08:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] OE-core CVE metrics for walnascar on Sun 16 Nov 2025
 01:44:40 AM HST
To: steve@sakoman.com, openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org
References: <20251116114710.9CA081003B6@builder.sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251116114710.9CA081003B6@builder.sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 07:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226487

There hasn't been a CVE report email for master branch since 2 weeks
ago. Did it break due to bitbake-setup or something else?

(If it's because of bb-setup, I'd be happy to take a stab at it, if
someone could help me by pointing to the repo where this job lives)



