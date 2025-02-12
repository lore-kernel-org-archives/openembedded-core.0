Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4534C0219E
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 04:35:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8003.1739334927650375316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 20:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N07+zKFL;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394036c0efso20302895e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739334926; x=1739939726; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQrMp/P0XXKb9+Ahr6j94suL1nGBOyb3g2YM13p2NlA=;
        b=N07+zKFLr9ULlB7S/zeXoXAqEIPhL8UnT1ign/T/WrGQozU5a3G8+pk+XXvj3q+mRD
         1CxKJIclVP6fnbsa3LlrrV0dXRMo20AQV1wrLzP4tAsKWb2AqzU32FLC4k0icb7ChDj0
         XjIfrHeETPcg0rpIyisH5Rl0TG26jlWKKiLUStS/pW2g6qqhicabhmN3P96uAZTQRshv
         8vHgYgz12z9dN5wUYMdnobF/uCape7fTloW87YBJLPhHENKJOkRLd8aMYnqkBWhqfCu0
         pZ1pGUnE7UUgGA5/86t08KH+sC+S7JlsOx2JsSfLH3JJyKVyBA4rlAq5gmZTuWm/eEGg
         W2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739334926; x=1739939726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQrMp/P0XXKb9+Ahr6j94suL1nGBOyb3g2YM13p2NlA=;
        b=vzS396Ah0CKA///oT7EKKLeD+yFj+6fuI2x2n4toR6tnBknvrFSL1LtoKr1B0x2Gc1
         iYV2dHhg/04CUg7HkN8w4HK22Ab7jY6FnzEqt17J6IlApRb3oalmFdi9c03683PSPmAn
         O8ZFe9bf4hlLNtkoCd9pjr09Qunx9nKjltkCU396tUAsTi5pZ1laTo1pmDPqFx2v3/5O
         +Wo8ELfCQYMx0m3sjGD5lgjVBNZgS48lsgTttkfUjQQX6lHk64bdhEgzpc2EsV6c2Gs7
         Ezi7/EdO8H8LUkfdBM9kRIxO0IcS9TG7chSuyBc/qrQDQkFi+PF4Wt4ZHvVE+Dm5qvjO
         KHTg==
X-Gm-Message-State: AOJu0YzNWqdvz+RSSm0iw/P34BEt6nAL6kRo1As+pORcEW9SfnBH8b3X
	abQgeezb+v5d/5CFo8rMDNZunmidM/rhnUsZn3pUS1SOvJ+IM3N1
X-Gm-Gg: ASbGnculqdfF7pP8fIJBMEtz0Vb1OjNoEI22A60zqHAjX90qRzeFQ79997dOfpwEpf1
	CAaba8WOCBJ1qz0Uhvb0fyUfOM6gQo2CofjZXrgCYbbCyZcgWOUgXOh2lQLS6iQUiR9TnzHjksn
	tH51l4enJj8xtINOjo2o0vDYAcYtzo65P709VrPIr5dF25EQKWP3GXxGVoia72Qcd9RbrC8k+DR
	T+GZbsEEuLsbp/TfPLY/Kl4d0aUU+mvsODxWKV+UWAnzG1/aFYb1zxibZgEGEah806LkJxRCMcz
	Spg+74HokRNbgCGzEhEeJXqhR1mcc3VJCHKx91R9JGyvoPiF
X-Google-Smtp-Source: AGHT+IHXX1rpcDH+HRuf5zwcwbhYjqeSmiGYbah4Iyv5V9lMJZYcslmVCxeybSZ2AuzD+P8norz3eg==
X-Received: by 2002:a05:600c:5487:b0:439:4a10:48e8 with SMTP id 5b1f17b1804b1-4395815f530mr15216255e9.6.1739334925727;
        Tue, 11 Feb 2025 20:35:25 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a058930sm7467865e9.17.2025.02.11.20.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 20:35:25 -0800 (PST)
Message-ID: <bd635513-bf80-471e-984b-1d04e82f4b15@gmail.com>
Date: Wed, 12 Feb 2025 05:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v10 1/5] rpm-sequoia-crypto-policy: New recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250208072445.986573-1-zboszor@gmail.com>
 <CANNYZj_fcDG+PAoLNcEnKOD3+ooiiSS0acLOrT+j5yqZHjr8ww@mail.gmail.com>
 <1822D4A7D4324BD6.32551@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1822D4A7D4324BD6.32551@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 04:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211202

2025. 02. 10. 12:17 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2025. 02. 10. 10:03 keltezéssel, Alexander Kanavin írta:
>> On Sat, 8 Feb 2025 at 08:24, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>> +Assume that the policies are good as they are committed.
>>> +The CI for fedora-crypto-policies ensures this.
>>> +
>>> +Upstream-Status: Inappropriate [Yocto specific]
>> The patch as it is is indeed not suitable, but perhaps you can open a
>> ticket, describe the issue, and see if upstream would be willing to
>> take a configuration option instead?
>>
>> We generally ask that Inappropriate patches still come with ticket
>> links, so upstreams are aware of the problems we face. Sometimes
>> solutions come out of that, and if not
>> this documents their response.

The upstream discussion happened, my patches were
merged into fedora-crypto-policies. v12 series is on its way.


