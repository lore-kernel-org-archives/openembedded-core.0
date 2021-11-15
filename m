Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B01C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 19:34:11 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.1340.1637004848154823194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 11:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XGuQZF7x;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id i9so18049559qki.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 11:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=YbVziG/2E4zAU7mK9FUP5Cx/mOAHwc2s0ttYDNZidgg=;
        b=XGuQZF7xCtsBUxWa4m2Gq3UvhZXOn6uU4wU4yJW+gXGlIe4OB31n2KXDtufpCIUWPn
         23I+zAQPR6npYzUyFx16Sbt2Abjy58pw/kQ5Ci7rRR7T5eP2LHXpfk9fOE9nVma76uQl
         bQdvRwUZV1fXKzyfABIBOWxvah5N1uul2NLeJeTdvE4vPPubA8As+hbzOCuMirta9CVA
         NJ/hrbsBhimrif9pkToaPY2ohRwQyNnTNFCIYfh8KBT5IYMGrC8gIqvb8YWHUrrrUJEu
         S1myV+4SUntRI1jMbY44BVZg6ZUFQ7b57aW+etbZeMqQFfIbkRc+SyQfMeBjKOBfQJtk
         WqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=YbVziG/2E4zAU7mK9FUP5Cx/mOAHwc2s0ttYDNZidgg=;
        b=oThcD7vjQeMEvb2yvMS8XT7iCO0Dc7IKOCASD2JaJagvNQTW93/MjNIqalLJaCoetc
         PobPygLLtd1QyngFQfdxpAgv2LBi1HOuHbPuRiu6K8n/eKUUUCItklZdhJpHJBfeUAB9
         bzCgpNoEcpEcL4upgAUucUdm40Zj+N4Q5RMVNWTiXEsFBVgAgh6SWzLz6QviJb4jx3um
         OWtGZ/aCTkDyHm8pSYAmRufYwycJChbUgAnOOgQ9aowGTxMYTDuVVEqVk3kPk+IDKVT0
         Gz9DgaBjNVuZPabzM39I0LU2iV2ziZDhCdQd5MiP1vPFQlWwrcgON8GDfYMB5UNWsKaL
         RlOg==
X-Gm-Message-State: AOAM530PNwyOrZviH2gsrwUNTPh1quDra7aVFZFzsN+N9QfN/9mfTKf7
	WTJdmUbTWr3g62wQhd7yO2g4rJhLwqc6zqlu
X-Google-Smtp-Source: 
 ABdhPJzvVCljTeNhCOFhW3QoiCcu5gOtW9KBwi5DXLW1ogOpr3BKyDsIgflG4n7OThIIZYBpvdI1Rw==
X-Received: by 2002:a05:620a:1226:: with SMTP id
 v6mr1285994qkj.240.1637004847057;
        Mon, 15 Nov 2021 11:34:07 -0800 (PST)
Received: from [10.129.163.78] ([37.120.205.172])
        by smtp.gmail.com with ESMTPSA id
 g5sm2315042qko.12.2021.11.15.11.34.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 11:34:06 -0800 (PST)
Message-ID: <8a12d84e-fdb1-3383-ce9e-10ddc75130cf@gmail.com>
Date: Mon, 15 Nov 2021 20:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Suggestion to use python-parameterized for QA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 19:34:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158309

Hi guys,
I have a suggestion to add https://pypi.org/project/parameterized/ as a 
required package for QA selftests. Together with python unittest module 
it can be useful to increase code coverage and reduce duplication in 
case you want to do the same test with different input values.

Anything speaks against it?

Cheers,
Vyacheslav

