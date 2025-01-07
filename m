Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA03E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 08:57:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.16358.1736240229807136715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 00:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HdSesZA0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso104856965e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 00:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736240228; x=1736845028; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9PF2whPG+SXBOw/pQkqESP3h76qU8Vmv769CaxknzI=;
        b=HdSesZA01ixkNOCNAey4UTWXtXVJwuTrCIkv2iyLuk+6GkOmiOmpnAci5vgk6X+XTq
         OVpkVZbiomsKnHad0WcuUb7j+ME7eWLfxrAdRoKPhBbuYSQekpOTDL108euwJdwPd7k3
         haQGnoaTMjGQfIk3zt7H6Cq1y4/1Z5UO84YiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240228; x=1736845028;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p9PF2whPG+SXBOw/pQkqESP3h76qU8Vmv769CaxknzI=;
        b=MTgWST3UIT9gu36RDHLQxWUR8b4IkFAaJdQm8vXfvwH19TODkXTnwIpcE1+97dpo/r
         5/lGnDM6NqRG+4/KVST445UtqiTD8yveyuSD3j6WkHqBuZWli6DMQkWtj0oiJq3QU4GT
         ykEGPI3o0eZCkkTlU8oToTBKM00j6ZGHdPiAmzGsG4t2RQEKtiAj1XvJU+YT2kj5a6TX
         bhNZv6xIXQGZNPSNhbDrB4Rc7o5sgmvOAxiyiHoqlBv67cEyhYxlvlA26qfRbmhl5viB
         L1jnwVq2OBO+GgfiyDW86TvEPVFACZCXh9HFZaFhlFqlKPs2AI+GAc0B8BpFJW0lh/ZS
         zMVA==
X-Forwarded-Encrypted: i=1; AJvYcCWPnykJUcDU9Hz+C2zcj+m03ILT2pilaAhMWEwcyyu0a4qSwNvE1poTqIG1KUha4eeG1IFj0+XX6Hyao62lI6v2+Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLYo5ksesrdqgYLu6bCQ8RlXCQ3M84YjcbHn5fV3u6JgFyFj1u
	awS97nxKSg86WgKneDmjFLh1ij/NTruKmCMsOoOICjn5zeAo9wgsS7kAHhezPwk=
X-Gm-Gg: ASbGncvr5qK5ejo3hNkzWs5keh3AUkQtng6tsGl/fLq6ddQ9WFfG5CW5FAzkQseXTJL
	nFP9wAbgbAEto1gWChdAauJ3pcfmjema3lwvivO5Dfv5sd4ETI2Zw1nOu6C9jTebvIReOJ7KSeC
	xxNTOziFGY09e3i/LSeEmh12puuQvfXZ3rta/dCmYgP13v/LnHX0kEw2/SVpjqzqcLomiR5l3Lj
	UfkYVBAAh506FHwULBPSzbk5AUA1XYrFXNRqoGQd62NNBKiUEi/qub7Qzk3hwCXz2+uF3/f3OiI
	4D4kUTfggoUTeVNGOp92fZn6nkRO5er4MN0/Kw90bnZhFg==
X-Google-Smtp-Source: AGHT+IGkCkcjgBwOazJ1Zfooth/Ad3Mq2ih1X8O90NIl2LgXuwag0i/nVpqsEbLRLIqcOmYJ2AUyiw==
X-Received: by 2002:a05:6000:70a:b0:385:f821:e97e with SMTP id ffacd0b85a97d-38a221e1428mr47362395f8f.9.1736240227910;
        Tue, 07 Jan 2025 00:57:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb? ([2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6d02sm632708265e9.1.2025.01.07.00.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:57:07 -0800 (PST)
Message-ID: <2a086886501016847f0f8294531277f7a164024e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 5/5] mesa: Fix missing GLES3 headers in SDK
 sysroot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tom.hochstein@oss.nxp.com, openembedded-core@lists.openembedded.org
Date: Tue, 07 Jan 2025 08:57:06 +0000
In-Reply-To: <7089f684-8414-42ba-8a31-76233da0e295@oss.nxp.com>
References: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
	 <1813E70C807D6D62.28262@lists.openembedded.org>
	 <7089f684-8414-42ba-8a31-76233da0e295@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209434

On Mon, 2025-01-06 at 20:56 -0600, Tom Hochstein via
lists.openembedded.org wrote:
> I saw that patches 1-4 are accepted but not this one. Do I need to
> re-
> submit?

I'm still not convinced the patch is correct but I haven't worked out
how to explain why (or had time to convince myself it is right). It is
in master-next alongside a ton of other patches I wasn't able to spend
enough time reviewing over the holidays.

Cheers,

Richard

