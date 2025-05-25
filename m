Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86486C54E90
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 11:53:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.8031.1748174027714455407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 04:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WHXCYp2N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-443a787bd14so17384755e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 04:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748174026; x=1748778826; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wG5PSVpzso4AmeCASrGsWV07N/gzsyy1FMi3TH7uZOE=;
        b=WHXCYp2NqDqLmjoYlP2qXU5z39fUoXphSskvFJQqvu0pgqQtsvKI6TJrmsMrecY9AD
         YkgSTEYmoqTc2WogrmozmOxbO1z/S+p0jQNFX8UMSrs+Hg1UYRn+rJyzLXJEiTQEfJUh
         4fAK/4F+Xih3fEosA4myefu4SauYVX9Xr2mT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748174026; x=1748778826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wG5PSVpzso4AmeCASrGsWV07N/gzsyy1FMi3TH7uZOE=;
        b=vF8oghZLD5sH+OqJp5tw86cA8VKVqgxNKebIofEQ7IHcqZm944GD6IPeBFezBgeXbY
         uPXjB1nxux6vmpEH2qnHDiC+/o6K7z9aExZI/qwixyEYHLGPEZUqQl0AO+SP/lADkxpF
         BYIFjaZwgSOT+FQ022Ot1qfqlfj7h0egrCI+XVHzO6GMV6w2NdMrcv6FRhC2kfmF0UFp
         Gbk2sGZFViWzarAz8EQqrtJXivrF8yyFjpdWfZ2Xcljy1UmbqU/xImxNdEGTCfi8XTTG
         XlMolhfXS1VEyJuN+dDkztNt5fKYkH+2qaVE1IBqNt8FFvAxWTRePl33BEPFxr7IN9eg
         wnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBaLEuZyG6P3//dpABLoCaAuVjSE5JaJrHmR8jWyETf28gRK2IF4eWI598HkOE1EIs3ccn1ttpPEmn307AiirfXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFZUM6VKfBFjETovJ4tlV1qXBqkOU0xb6tgcusZpyDv++szGWq
	jevzl3uwIrHmkVDlSTcoGTz4CM+6y8ORwW1NfLySawyF0YVlPlqU4D79z9t47CilymY=
X-Gm-Gg: ASbGncsRLIBAp6J8PTchhSsN5MnwTtEgjsdNMwTtGtJvKCfnQzdMFFH5Uq6G95Xwlwk
	sfgNpnfgZqeNFcsJP+QCuODGg8lU5KQC9VRlnM+sXMYGU6LVgp1oc+YnzSf9YzHqDVv4C4Owu/U
	0tblFpXwvnjFJ5cnDdTzzYwKYTJwnD0WiRV+zm87I5YyUCIdCLMbyetI8Imq5vlhHDYT7IHbEgJ
	1MB74YSPFe9aT474oI5wPz8igzNRH/3w1pDO7+rw1BP0GpzjYIhyhIpTsGlgBrP6GXbCaoK0Xnc
	zG2O8WfvtQe2t/u7q2oc8EcRAn7t/k0lo9aAJh7XwzNm5qK6JEyZRkU65VP66YWLtgMFTNizMur
	K8Ukr0Jh1GFPolicVyRZ7UqIOGvuQSWTYspRKwH2XK70b1fLmcpE=
X-Google-Smtp-Source: AGHT+IFW50HZHYipTVSb4l1FtTO/d5H+FO3mH1qicGNJh9w26h0i3ccfdHhOubYKWCKWJ9fiLuZlDg==
X-Received: by 2002:a05:6000:178f:b0:3a3:76e2:ccb7 with SMTP id ffacd0b85a97d-3a4c14ead74mr7413062f8f.5.1748174026119;
        Sun, 25 May 2025 04:53:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eeed:a623:5d92:7ad3? ([2001:8b0:aba:5f3c:eeed:a623:5d92:7ad3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef035csm200975835e9.11.2025.05.25.04.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 04:53:45 -0700 (PDT)
Message-ID: <948ec601bd28eaea531a29036f536149ddb8465a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 00/16] FIT image improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "marex@denx.de" <marex@denx.de>
Date: Sun, 25 May 2025 12:53:44 +0100
In-Reply-To: <6434982eca3cbdf04bd7213e343ace21572b8ab5.camel@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
			 <1841F71260544116.22209@lists.openembedded.org>
		 <7bc2bb3a7f938d67c37031baff442ce95bf52bf1.camel@linuxfoundation.org>
	 <6434982eca3cbdf04bd7213e343ace21572b8ab5.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 11:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217244

On Fri, 2025-05-23 at 09:55 +0000, Freihofer, Adrian wrote:
> I've just submitted v5, which should be identical to what's currently
> in master-next. Based on your feedback, I understand that v4's only
> issue was the missing maintainer entry.
>=20
> For context: The recently merged commit "u-boot: ensure keys are
> generated before assembling U-Boot FIT image" reintroduced a task
> dependency where U-Boot depends on a kernel task. To resolve this
> dependency, I've moved the key generation functionality out of the
> kernel into a separate recipe. However, I overlooked adding a
> maintainer entry for this new key-generation recipe, which is now
> addressed in v5.

Thanks, v5 passes testing and is queued for final review/merge. I
understand larger patch series are a bit more complex to merge, this
does look like a good and much needed improvement to me.

Cheers,

Richard

