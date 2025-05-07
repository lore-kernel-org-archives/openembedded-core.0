Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0067EC3ABC5
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 09:00:01 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.4081.1746608393333251059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 01:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YN7zlQzC;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2963dc379so963907166b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746608392; x=1747213192; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YFCcojn2zGduOBZ8dUWqbilLSfkzX6b18WIb+CqyN/U=;
        b=YN7zlQzCH1pLG4cEhkS0HpLdplfj+10kELx3QVtc2MBizGNHdvLRqlawXjne5lghyU
         zEwlHZ6J4UxxKLEV2dI01h+d32b4GzLfEVqT2tE3KVG5SEYWSfJ5ClZo2E/CLzACTVUG
         EUMx0hoxuG+gJM5ocI4GeQEihQ84o2nxvfO9/GaGXJfxaELoKD5UDFPq90cMZrOO2uxE
         xy3Rttk2r6CpPgWcS41ou2SKnEuXRaKCnro0EniL1tckxv/BrbC8vM5wg/YIO1BO745K
         bWFcRGh004/Mtityfaxiwbw5BfN7bvpoFQVPD22XxahzveY5kulKFYEdkLFaVljb/3UY
         a14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746608392; x=1747213192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFCcojn2zGduOBZ8dUWqbilLSfkzX6b18WIb+CqyN/U=;
        b=DCITaM+pw3kzFmV0lfxxYbvdZjy2qfV1Ppw/6gppXjVjYgTAAmfsoSuDOXTZoe+Alt
         G8uSrK/jShx2ewosgUQt2isbCPneW5u6mIapDoVioSY3aLtItBT6px3YbyEL+8M4dn3d
         qBNc2r1KGVPqBa/b1oqD+xg6eYp5/r7RhynkJ0TyB4JDP7qYU7vNP4G/jXc8QVLrJQCS
         h3vzEvScM/DmEj53gpRGPle0/TL9VVqrFIi7VvaZX1cbkJhn+FtxCyGYSKW/8PXoeooO
         4Kz70xZBNYNlTzlkfVEow5RbPjFsgLrAYq1NqrSu6ImwRphjAjodZcgkwPuRtWmWau3K
         BjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsGI3eZz39M0nxZfj64+uTjAhk5RgdsP0/khCUNrkJWL/JYHLIt7xLCUErPy9h8rznZ8uIe0AUfzaW/lX5deF5Mw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLvySIJUqVDD3lnWZIRZ7Ss6chxoC7op5uaXWwzwx7+VgrRjkL
	DlizgJSPRZyu8DJGRg70K15gjnJSCec6FG1lGIvEQqLeRt1q4f83vbKvPw==
X-Gm-Gg: ASbGncsucc5WL4D/CwOkBE8a6hka5yTp5urTRCA+KEQX0Z3adbhMuJQ3PkD7+K35gvK
	gxpEnRvb1J/jscF5HHAL0NsQFHP3b/7RsLfxSmQ6fdOP2nDY56Skt4Ma0LK8S3WR9tPDeU4Ho0V
	lBnTnHQIRifbTdtMccDKdItli0OjhmF8+bnXKb3wf16e6OGVUT/4FtmxIE58nNn8mRqf2XGxoQr
	vBPoXEeWxgtuDiW2UJwHam1YcF773mfEhwLHJnnWfcJsgdZR3gI8nBEBmNSbcK22MW3FBq9Jyvw
	jknLCFw4UALTsZ8cM+RgNQ6ZEySidSbUlwOhC2fsM7OZoWuA
X-Google-Smtp-Source: AGHT+IHe0fx6StDs6O4hW9dpYPVpXB+ZOInivYpKAbhWjzL/8Ex2FL9ONtphZ/20g+4c2X/DqplqzQ==
X-Received: by 2002:a17:907:3f92:b0:ac8:1142:a9e5 with SMTP id a640c23a62f3a-ad1e8d549a8mr244169566b.47.1746608391356;
        Wed, 07 May 2025 01:59:51 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895095d7sm866272966b.151.2025.05.07.01.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 01:59:50 -0700 (PDT)
Message-ID: <bf1cbfe7-2906-4737-9f3e-f84e79e282f8@gmail.com>
Date: Wed, 7 May 2025 10:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][styhead][PATCH 1/3] ruby :fix CVE-2025-27219
To: Divya.Chellam@windriver.com, openembedded-core@lists.openembedded.org
References: <20250507045805.1210982-1-divya.chellam@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250507045805.1210982-1-divya.chellam@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 09:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216104

Note that at least based on yesterday's status report[1], there are no
plans for further Styhead (5.1) releases.

[1]: https://lists.openembedded.org/g/openembedded-core/message/216055

