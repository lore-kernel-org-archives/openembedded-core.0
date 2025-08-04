Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8982FC87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 11:07:34 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.15296.1754305654135804179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 04:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6EYAWoK;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae401ebcbc4so733864566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754305652; x=1754910452; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TnJCtAgrfXTpC4E/h2jZtKAF3Zqjzlot79qw0Cwcg14=;
        b=J6EYAWoKCXUQkdZ0ba2A3Xoc+05l1ZijZuZIsnXuq9+lEA2OD4jl05XnN9aGAE1gAs
         yMtlzBeEF2cJ53Lq/0yEkpSVRthEcE09hv9BYfHUIULn+zeCQcP74yZqGYWupDpACVcE
         l/rZ9PVBCsznVzHgAjnYxtn1+a2as0iu7UOZsUtBUtrZK9NVEVJq3uvQByRfDUZdd60T
         brRomWKl1K0ZUaFq4Xc7mQUnv7WWtHlOh1Pzj0mx1ldatEFI3fTPod6oYTA7XCOXdXzs
         /hG9Vc/FcRpp8bKBeO1QvvuMlKes6Hgz1SdE6KNzsDFAjbaMYn95savUQzFvGrA+8JXJ
         W4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754305652; x=1754910452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnJCtAgrfXTpC4E/h2jZtKAF3Zqjzlot79qw0Cwcg14=;
        b=u4Txuth0xXWkgQfep/seFbTCPw+xwErcoOK0vt/ngGgf/wUdC12cmrEqEwjuPNW/yN
         eg85BPjpXPYHpPmX++vmpJBbbdugazXNQrn7fDWj7M/S26dbCcT9xxPNpRouv0g4oJzq
         QU02E9X2BCDhe9lLwvG15MMogD8PsFHxBw7GNj5iqSf2iyOPRkb+/18qv3VTDsBLtIcN
         /V7IDw5DOgurTA67oMT08puNi8KH/iT+84XhDvlVlldL1rdihV2S2193mPErKHLTKKq/
         XNWKYdfcnoN6PFtWWMcsXtKdyKLd0oJ3f4Uz6ED3uaFpVRWvIwIDKdGwWaNIf1QGl0KK
         kTsw==
X-Forwarded-Encrypted: i=1; AJvYcCWICkT0zJ+xFVWKbU46FwYDN1L44/v4wZiNaL49DOTcEyKEG2M6ZIt9U5mE/jkBZQKCBsIwruZS1gE7KQPd+ZcPXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcRTmNun/Rkc5CTTva2p5kyvl0EqA5EUZq2r9BAILL+7xh9jH3
	+talyXbxBflWfPw27vcFNJ/vB9GlmLJK95xWBLNEMspBySzbPIsPsXTr
X-Gm-Gg: ASbGncsrd0wck4f1pC7bNwKNBoL6Axjtf1TBhYgXe6/8g3zSjexx8p2000LlRdFHR++
	mp8YH5EvzMDTceXFuzHyUYCe+y5WImEQONYfI53bFOKZfzMvkdUqiu6aBxOMA81t0ZQAFiQ9HDi
	CymR3rCB/8Qm4bx1rFK294/fskFbxIuwErX/6K84We+k6Iy4bRnSyJ4PmKoWoAjko7sf5E3eBYe
	6OvdvtQjW3nKrocuaE/7ZrxkgkpaA3ia8ko6xBXufADF8q5+Z/xCwKCSdK1TZ4PAdrTTZcnrw/R
	SC45GNtFmF413AfSJ3nFmn3uYcQlJBjirC4i+8XWW0SgubPQXxtk0MnMsgIXIsuNuG6aDs4LlMk
	F1yG4dLqpLNDZDLtQZpjHw2jJZftoknbBOb/o9A/o
X-Google-Smtp-Source: AGHT+IHbosW2RCSN2HLKApXthwoDSgUy33jEUnpycA8UtuvG3bYJq55lbq/xlKmKI1Q4pYZ8CtkV3w==
X-Received: by 2002:a17:907:9712:b0:ae0:a590:bc64 with SMTP id a640c23a62f3a-af94000e2d0mr980637566b.18.1754305652128;
        Mon, 04 Aug 2025 04:07:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c157sm708222866b.100.2025.08.04.04.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 04:07:31 -0700 (PDT)
Message-ID: <b8b9f95c-5149-45e2-8276-20ac9259f6b4@gmail.com>
Date: Mon, 4 Aug 2025 13:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5Boe-core=5D=5Bltp=5D_LTP_20250130_fails_to_run_du?=
 =?UTF-8?Q?e_to_missing_kirk_=E2=80=93_should_kirk_be_packaged_separately=3F?=
To: nikhil.r@kpit.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <MAZPR01MB8950AA2D5C8F86D05817FDB9EE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <MAZPR01MB8950AA2D5C8F86D05817FDB9EE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 11:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221425

On 7/31/25 16:08, Nikhil via lists.openembedded.org wrote:
> I’m using the LTP 20250130 recipe from Poky
> (meta/recipes-extended/ltp) master branch, and running into an issue
> where the test framework doesn’t work as expected.
>
> While run the ltp tests via 'runltp', we get the following messages:
>
> sh-5.1# ./runltp
> -------------------------------------------
> INFO: runltp script is deprecated, try kirk
> https://github.com/linux-test-project/kirk
>
>
> ./runltp: line 804: /var/data/opt/ltp/bin/ltp-pan: No such file or
> directory

It seems that this error is failing the execution, not the missing
"kirk" binary (which is at this time only a warning, displayed with each
execution).
You should debug this part - runltp is a reasonably readable shell script.

> INFO: ltp-pan reported some tests FAIL
> LTP Version: 20250130
>
>        ###############################################################
>
>             Done executing testcases.
>             LTP Version:  20250130
>        ###############################################################
>
> -------------------------------------------
> INFO: runltp script is deprecated, try kirk
> https://github.com/linux-test-project/kirk
> -------------------------------------------
>
>
> It appears that the 'kirk' binary is expected for running the test
> scenarios, but it is not present in the installed in current LTP package
>
> Do we need to add a separate recipe for 'kirk' support for ltp in Yocto?  
> Or is there a plan to integrate kirk directly into the existing LTP
> recipe?
>
> Looking forward to your guidance.
>
>  Regards,
>
>  Nikhil R
>
>  KPIT Technologies Limited
>
>
> This message contains information that may be privileged or
> confidential and is the property of the KPIT Technologies Ltd. It is
> intended only for the person to whom it is addressed. If you are not
> the intended recipient, you are not authorized to read, print, retain
> copy, disseminate, distribute, or use this message or any part
> thereof. If you receive this message in error, please notify the
> sender immediately and delete all copies of this message. KPIT
> Technologies Ltd. does not accept any liability for virus infected mails.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221196): https://lists.openembedded.org/g/openembedded-core/message/221196
> Mute This Topic: https://lists.openembedded.org/mt/114467214/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


