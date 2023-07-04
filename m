Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173A7EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 12:58:19 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.57902.1688475494073902123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 05:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=iw7k6qOu;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7656652da3cso469627085a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688475493; x=1691067493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+hcvUUpMhptL/bkuvpN8Rpf5IvviAbga+SmcXUjDBI=;
        b=iw7k6qOuB44s0b+qm/cSqawip4gaPfN5O342UDdCnR7ixMjD14ETzBa8YHVt2sQlBi
         PxJPGtL1i2i1zEdaJ7fsMHlCYLVYO21nVGFlb0ty8eBxc3ad8Vl4JVA6G6iSBYKtcle6
         XC8azJU5MD8qf+cmLolznkDYS2wIq2QYDiXNrTpMThMiolZ7y/yKRv9M0P0HSCgsfxdg
         DqOv3xOjnEVpHTAK0cjesQOAU3QVy0ZULStem++2e6GRzJHPz9dsM2yI1Xq5R1DIfulk
         ApPaih0iMDBfz56iuZv68pfp5TxOS9h/idtSzxkbMwDzAVdDKzprj8FMksEu7hp2+Rqf
         Ys6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688475493; x=1691067493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+hcvUUpMhptL/bkuvpN8Rpf5IvviAbga+SmcXUjDBI=;
        b=bja+QlNUSOTZYE4HKvObG+QAy5p1HoCLod0M90NTCBd/mXoAgj7L1vPHv1At2kXPtl
         RyKA7WNuTubpdlr9zF1OX1BA2WuSOlUBn8I7iAYHUfBum/qEh4OLYQvxoHJt9sj6mheT
         WNPZnS44EoW1egmNazczK2dGXuDGjn5uybDbCyaIh59ku1CRqTm85UhFyALCtzS/kJU2
         Vxw/whHjr8/GgFrAfG5W3uZiMxefrqDM0nc90ohklrtOPE6ElnHenLhqvf67/20dO1bo
         P5/RxBPZExuMNNvzmzu0JjZXFg6norGhlqhH+noj2TDEKbIXhMl5au67DovjVBlShccZ
         unnw==
X-Gm-Message-State: AC+VfDwmeQHjFh6qOJqkbGFsmaUwMmRhSLhT6u26bVWgdUVJz8iykV8c
	gubatlyNF9KnASDzev3FAGCH9g==
X-Google-Smtp-Source: ACHHUZ61/irkiE5F3SONajvTnM2hswGSDuUsntKh5K2fC5jiYk1wpHU0HOq0He4xv97o6nfRlB8T3A==
X-Received: by 2002:a05:620a:2042:b0:765:abeb:a14a with SMTP id d2-20020a05620a204200b00765abeba14amr12143024qka.45.1688475492779;
        Tue, 04 Jul 2023 05:58:12 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id cx13-20020a05620a51cd00b007339c5114a9sm8356187qkb.103.2023.07.04.05.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 05:58:12 -0700 (PDT)
Message-ID: <3c362ffd-80e5-50ba-9341-745dfbb3faa3@baylibre.com>
Date: Tue, 4 Jul 2023 08:58:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] python3: add cgitb, zipapp ptest dependencies
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230629194813.1171680-1-tgamblin@baylibre.com>
 <6B91D07E-1A6B-46C4-8375-8E948E3A9478@arm.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <6B91D07E-1A6B-46C4-8375-8E948E3A9478@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 12:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183831


On 2023-07-04 07:15, Ross Burton wrote:
> On 29 Jun 2023, at 20:48, Trevor Gamblin via lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org> wrote:
>> Without these, test_cgitb and test_zipapp both fail when running the
>> python3 ptests. Since cgitb is deprecated, I have only added it to
>> ${PN}-ptest's RDEPENDS specifically, but zipapp is more current and
>> therefore I've put it in the ${PN}-misc list instead.
> The RDEPENDS on misc to other modules should only be needed so that modules in misc actually work.
>
> In this case, the problem is that test_zipapp fails because it’s not installed, so these should be dependencies on the ptest package to the split-out modules, and not a change to the -misc RDEPENDS.
>
> Basically, add the depends to -ptest, and leave -misc as it is.
Noted. v2 coming shortly.
>
> Ross

