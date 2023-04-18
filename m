Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A83FC77B71
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 07:31:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.2860.1681803080791348229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 00:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=wf+kebIk;
 spf=pass (domain: baylibre.com, ip: 209.85.221.45, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-2f27a9c7970so2007939f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681803079; x=1684395079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gm0bDvixrRaLQSgYh4EhqBepfc5NJxjE2ES9gLRW2IM=;
        b=wf+kebIkuip7yuNPdldQJFu82ZA9lk2ysZi7qLdFgt1r8IbMl9EpOocZhSWcr6LRuM
         kOhwK+yr2457RE8Wtj3QEpu1gct9UfIDP8secRlbxCZ0SOjst6sgtnDGawvWpQtpDnDt
         t9umiz4qsrf9cTRObLOMKn1RtvUmjIEL7aspXkGKQoXezSBskATckr3/oD5Bckg/CIlo
         MMuAywDQ5vCfO+4i3a9hs+mpBCKjelXHwftUJxjPcNt4dZNSAnTIRRlz0Q1S34f3gZ6y
         OnOFzWL5Iy2shz5t/i+0Fc0jqUetiyaRblyPcnYQFdLDygzy/YWMBY5/TSq1p6afTTip
         p9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681803079; x=1684395079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gm0bDvixrRaLQSgYh4EhqBepfc5NJxjE2ES9gLRW2IM=;
        b=Wjc6L3opDdKhCphW5y5jr6u2Un/O/cf1/D8nMBfBBH0SIEDbSZGNQK7OVXueiwyebS
         kU4nqU8PcRdPOKasiCxAfjn6L30QyHEZRyLODkqpjIhTPm5kItgFAIfR8z8c8lmfga1y
         DFvPZriQ5RNgwcsrL61JIoftfx4UCkMJzG+OXVtVY0PCGROdEU9eqCslu0HQQ/mPz55C
         i9aqWSJB7NuwQ9OC9hygUOV5upiez6YRfRcIG8fh1Me79LTgD3lGS1lBXfsChMr8bMJA
         13RZUgxQf5JUJs2D9WHlXymvdcDE7Qk6VgCZBplxjgG/MZyGeCN+BD1q20Ex8OWSsDlF
         BdNw==
X-Gm-Message-State: AAQBX9flRuyfabLA624mV+iXROpNYJ5F5gEFSQDXKJqx5Nah2H5icCR/
	ecCqJLh/1O3NzCC8UQbMNCcLAA==
X-Google-Smtp-Source: AKy350bGNVSLnnEVZtOKRvwvLFlujhtxclwuLFveE6C4dW0dde6ad+NifLHrgpug5OMW9yFbv266AQ==
X-Received: by 2002:a05:6000:11cb:b0:2f0:bab2:dc3c with SMTP id i11-20020a05600011cb00b002f0bab2dc3cmr992672wrx.27.1681803078908;
        Tue, 18 Apr 2023 00:31:18 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b003f173956a82sm5126284wmq.21.2023.04.18.00.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 00:31:18 -0700 (PDT)
Message-ID: <18563bee-f233-6dd4-8d7b-a4e8940fbf28@baylibre.com>
Date: Tue, 18 Apr 2023 09:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [OE-core] [PATCH v4 1/2] oeqa/utils/qemurunner: change the serial
 runner
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, khilman@baylibre.com
References: <20230411150503.2105880-1-lrannou@baylibre.com>
 <20230411150503.2105880-2-lrannou@baylibre.com>
 <20230412095722.79b78b4e@booty>
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <20230412095722.79b78b4e@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 07:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180180

Hello Luca,

You are correct, thanks !

Louis

On 12/04/2023 09:57, Luca Ceresoli wrote:
> Hello Louis,
> 
> On Tue, 11 Apr 2023 17:05:02 +0200
> "Louis Rannou" <lrannou@baylibre.com> wrote:
> 
>> [YOCTO #15021]
>>
>> Create a new runner run_serial_socket which usage matches the traditional ssh
> 
> Nit: I'm not a native English speaker, but I think "whose usage" is the
> correct form.
> 
>> runner. Its return status is 0 when the command succeeded or 0 when it
>> failed. If an error is encountered, it raises an Exception.
> 
> Should be "or a negative error when it fails"?
> 
> I'm taking the patch for testing with these two changes, let me know if
> I should do otherwise.
> 
> Luca
> 

