Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0E8E63F34
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 07:43:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15072.1771227773784833811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 23:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ip5rjUda;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8860d6251bso350919866b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 23:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771227772; x=1771832572; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5KicjVx9V1jc8zkzDW33zZbJFG2G7auRm0sfWdaRc4=;
        b=Ip5rjUdazqrhON4LdIaHO9Oik7k5c0Y+xdRf7qGgmycQFDFhCmHOUoUxRwLqreJsFq
         zzMFkCiOzb10Buta8mhrw5BCzVa6UBM0J3Uu66G75B4B92K9NnjwgpaKwxSp6qFucPd2
         tD5dhxtSpZO6wvDumbSt2RiX710FlUZvoPA7rOhPHNYUkRXU4CJmSYmZN4cjS1GHR3ok
         xwSvrHMtA2Xhprx+Ex1X9dxJFAiL2rkZXRULsKlJuBUEW8N7HsEfdBi76fBO+T8pjNR1
         CuuwnyO4bNC7eUf4yEkxCBGRW1HM3aLtlOlq8UzZ4uq92EhhsZzszA42MvQN9+9D6eiw
         lKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771227772; x=1771832572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5KicjVx9V1jc8zkzDW33zZbJFG2G7auRm0sfWdaRc4=;
        b=Ip28AqY1cj6UcrAm9If671jlpB7+ecJM4iaa9n2Q/hdfQRa8bw1iKcltjxrVbuxP5T
         pLDR93uODm0tiXMREb+VGL2l6UPYxRa34EdKIpIPd7srVIz4xHacAduX2GMfm551sBKD
         w5k+ueqZh3aOCj0EnU72Zn9OzVVt1A22/ZKEVQha2C6qZFn5dNnG4aeh0SsR/Qy25EUb
         JXavkVk3G9C3sx2QaWBvZZ2kf7Pn1a3E0zr49+2MQrHQXX92NCdumFpOSzr5urHrYF7l
         l2CQ4k0PuTuID5dv6wVuhOTQHMuhfy7OKygE7iA+AjsPF1Nd4yj2Ni22A2VtBiSxJx1q
         zR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYxo6mAyl+PWeUsvaM6wGQtibguMoKvkJiHHIx1fcB8ed3qm5hxba3tZ93rrwBCQA+DKKJmYIJsbDDplU8ii86Xw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyir4kzDANcADpYw7/J5SSVpiC003wkVoGyWFtMzUFpfRLLmTFz
	CbdRJpebPSz8RXrtAlfQKuv42zjBs9V0mxf6m4QjaQnFfQdEcdlV4Kdy
X-Gm-Gg: AZuq6aLpUMJrvNNtIuh4SaGkTX+57CJO5/pkCItZwYj7hJRSK1XSlAn8Ljp8hxS+3Cl
	XUq6hsfjfOyRLWRlxncm0p91pNITjg/3mp2rdobn4LNfPmE6Uy8GNJUuoHxp75aLLM2YS0OK2ZY
	omQbIuCiv9aBInGmkP6HBEypvFDey309q0Dg36hJre6ApwZrOLb6TwZN8l0l8WYYDYmM8WMqTRD
	t4iVyn3X6hYSFGwDIcGmurEVsSHRLoeccicA6h2+4Ybyjis+BOXQzHrzOxEDsNS8IW0/wBFgeuZ
	pcXDOtZ5fshUc3azMz1j7XScDkmavaTehLI7YCIpe6E3JY2WMjfRLilU0Ob6yvdQ4J8upYay44V
	1d1U0kq54JxSCxUglZZYT6omHivszwrajwBgCFkWFxzR5gMkD1KIYFozaEFmOiVxEFSpVn3H5qY
	JRbz2U0E8Gn5Yt2eqsiZiTTg9EzFhb8t2wIso=
X-Received: by 2002:a17:907:6e9e:b0:b72:58b6:b263 with SMTP id a640c23a62f3a-b8fb4574b84mr471416766b.60.1771227771910;
        Sun, 15 Feb 2026 23:42:51 -0800 (PST)
Received: from [10.55.59.9] ([149.50.217.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7629b63sm225468766b.35.2026.02.15.23.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 23:42:51 -0800 (PST)
Message-ID: <869743bb-2db7-476a-b3b0-0a69805107bb@gmail.com>
Date: Mon, 16 Feb 2026 08:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd: Stop supporting sysvinit compatibility
To: mathieu.dubois-briand@bootlin.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20260213175618.1801591-1-richard.purdie@linuxfoundation.org>
 <DGFOGZFG9RCO.2210182JJUNRG@bootlin.com>
 <1671a6263c305f54398e74a0a826387f343bbe34.camel@linuxfoundation.org>
 <DGG6RBRHEHWH.3AZ2ZBL0IW4NP@bootlin.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <DGG6RBRHEHWH.3AZ2ZBL0IW4NP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 07:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231182

On 16.02.2026 07:51, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> Just in case: I also noted following selftests:
>
> bbclasses.Systemd.test_systemd_and_sysvinit_in_distro
> overlayfs.OverlayFSTests.test_not_all_units_installed
> overlayfs.OverlayFSTests.test_not_all_units_installed_but_qa_skipped
>
> Thanks,
> Mathieu

Overlayfs feature doesn't use sysvinit.

Slava

