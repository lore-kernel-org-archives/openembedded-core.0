Return-Path: <gijs.peskens@munisense.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91155CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 16:06:06 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.13717.1761149156352995692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 09:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@munisense.com header.s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e header.b=TNwAuuIW;
 spf=pass (domain: munisense.com, ip: 209.85.218.45, mailfrom: gijs.peskens@munisense.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b472842981fso958618366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=munisense.com; s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e; t=1761149154; x=1761753954; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PC9llv758QxTCDFCq6xol4aYfmBpRPXFX3zdv5EjpmM=;
        b=TNwAuuIWcn/3TRGlw71EL4+2MWuwMNyrx+pP4TfX8b8CvcT5mm6WzyZfExLleoxiBU
         ldxmziQamIRA52ROuToQNF3id/Dx6AOT5n9SGXulVc3+elFhvuKpDIqCNmDeqyhtDQvQ
         pYYJKgj31k1R15hmsTSxdll6CnJ550PWilQ0kPFWcwb/ohSrpzQqrojPztKixa2cYlxr
         YcQi4jX3whYDjs1DyGpqQZl0LZgSqpUMxsC6de5yX8grGdCYcFVn4wMSLpg7LNnS1qAY
         1+gmAaeahRint+u1531oHDYyST3rfyFSXThKSrhpy8R+MttzVgSlfbLXagab4wpOumq0
         6NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761149154; x=1761753954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PC9llv758QxTCDFCq6xol4aYfmBpRPXFX3zdv5EjpmM=;
        b=mM7Rypd6cOpPB6MKC4oi7ys9JKQMgLjaBb4p25AhrdnxTthaJrXcaLHrR8JiM2lBK5
         /7rOGa/XbnhycMFfFVrmJ1x7Jazqogvn20UVYmAzTDlOS79lmDt9aG8mmQ6bnxHtQGEQ
         L3w3e6+vCwrQPC6QZIZhUHU9TT2F0sZnof+paMeohqiM2/wcD6elgLIfERwXe/Y2LM9n
         HwuZLynUv8q0XDajnkewyFSmavDK2fqdyALWviPQLAqmjuPC95T77CtVOjl+PauPrU6Y
         qS+OS8XpArcrCixNOxf5JouwciX8qEmcZSik/fHu0i6ExamKmhKiNl6RqimEWBFwx3Kh
         33Lw==
X-Gm-Message-State: AOJu0Yw8rvs0iD0E93p+hIqKse/MlKosaAHvPOZ3nUBNCx5rH2WcfEB/
	pKqAKPUNOx3Xf16lFWdYGHvs0aTg5jSZNqq+FhpXA++1VYK8oHH0QbBTjA76asGk44s=
X-Gm-Gg: ASbGncs3+sg6vf8T9ls5exmBi1TIGagXivM4UU/TT905vDVNE28RCBBvdlXRtmab8Sr
	lXQyCit0xJm/FrScN0HqS7GW9wRHr76oM94G/y936eTX5G7jpx+B2WzVAma+fXBZf12h4Z1SzZS
	6G+sCoIcBUrSkNwh9mNTYuCxrpSoPLvz8XSoal6pUZ24nOVNqb97ornTPXq49lhpVGAeClqNvF9
	P0jpbRGyyozAXRZdPurNMz2yHIPQt+nahKFTOwwmmqiSG7S1+Qj8KFe/IuPB1IQZKPrMl5AHnml
	3KGIyqRjjNt4+g54He5yLre9TLLeJybASlG7UxeZ6AHqYjtTI3/3jkLdB1ulXRi03u5UOvy0bYl
	SYBYmt+qLdXKMp/GNxoQJb5IJi/cn+cjd2h1K/1wpfxzXUUMAQ24uHO5N6ppZdY0rsP7LWEHjS+
	ndyIfi+OCDUTMrVATK9smXOCPeBhZgMQ+S3fkuPPqEqp5TLmgj5QMgTtzY
X-Google-Smtp-Source: AGHT+IHILLNo84kh7GIP6SUfeGeSgGlsQy9I5jm04W1wKlvDFB2v6gkLxwAL3YGueW4Kp6AkMYw9jg==
X-Received: by 2002:a17:907:7f1a:b0:b45:c0cc:2fe9 with SMTP id a640c23a62f3a-b6473e4b103mr2470672866b.46.1761149154593;
        Wed, 22 Oct 2025 09:05:54 -0700 (PDT)
Received: from [10.0.1.30] (154-25-172-82.ftth.glasoperator.nl. [82.172.25.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6cfa6cb6e6sm459581266b.49.2025.10.22.09.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:05:54 -0700 (PDT)
Message-ID: <e13e095b-3174-4f07-af32-b562ee3edc77@munisense.com>
Date: Wed, 22 Oct 2025 18:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Ubuntu 25.10: base-passwd fails to chown. (pseudo
 issue)
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <567bf317-620c-4f00-827c-50a511d431c7@munisense.com>
 <CANNYZj8WZ+hx_OvO+=m_JsayTZEB9GmC6ma4xEp-qPqXso=aog@mail.gmail.com>
Content-Language: en-US
From: Gijs Peskens <gijs.peskens@munisense.com>
In-Reply-To: <CANNYZj8WZ+hx_OvO+=m_JsayTZEB9GmC6ma4xEp-qPqXso=aog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 16:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225204


On 10/22/25 13:11, Alexander Kanavin wrote:
> Thanks for the report. I was dreading the day this happens, and I'm
> sure others as well. Chances are, other distros will follow, and then
> Yocto project has a problem.
>
> Should we build C based native coreutils as early as possible, and
> then use only that? That might buy some time, but isn't a real
> solution, if GNU stops their development.
I'd guess that's the lowest energy approach, other routes would 
potentially involve writing the utils themselves with pseudo in mind and 
calling back into host utilities where needed. I don't believe GNU would 
stop development on coreutils anywhere in the near(ish) future, nor that 
the approach of building native coreutils would break since it should 
more or less only depend on the libC and kernel, things which aren't 
going away anytime soon.

Perhaps some magic right now inside bitbake that checks whether the 
host-utils are uutils and fails early would be nice (again: I'm aware 
I'm in unsupported land, energy shouldn't be wasted too much).

Gijs

