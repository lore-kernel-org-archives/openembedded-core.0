Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C673C7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 23:28:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.42246.1680218922933773228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 16:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MzftnAKT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so9012309wmq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 16:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680218921;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FG7p2yzKdgAwH3JsM/18D6mGKoBcgGYLq9ZCxkXpi1g=;
        b=MzftnAKTyN3hL3nLiY3EHgrijQGKfSMJrpbSDTwAS0DDdNkDaFU8m0RwoMZxX1iTFy
         W3gqPm6XU5sS6PWMRpP3GU6nc1Y0H0eiqj4t1wYVUgYBYAgDcNSWLU6+MO11O4KdEbXI
         62ZarcD2NfI7L1gHhULqpHw8vTmQCZsUtgLoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218921;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FG7p2yzKdgAwH3JsM/18D6mGKoBcgGYLq9ZCxkXpi1g=;
        b=R2Z8zE/c7Ey5p5bEeMok9uicXky8cT42BBG/y2jp8kiFe3e8f5LSdOVGsli9RwtJnB
         UITlb69+NzFKewy1EovIvqhAqDIAJimOr6iwDMe3Wzm5+EJbRzVj8KNFeMYDrhcPiwwP
         ROvGEd5Ya4bG5MfN/OMG/DJY7FhYKcJ5jvSWi+N613+J5RnqaksAWGBPF3vBi2BqIwUb
         XSajawaLmY1suXwgknqBZoZxqJcBr4qsQiUAHA9odzMFPR2tYBiwosylDQCYnjc9VmP1
         AxoPEju3zJgfzBCBc1WMLlN/Ah0fD/EVEwx+u2O/DeABuR47hiMQr3RQk5YlVEJqlMQ4
         9JsA==
X-Gm-Message-State: AO0yUKXeyQ+U1tjD6Ci8kILSXfTRJGL5SY/FBxNEMPyCJdPFbyIJiXyg
	wbN9gXrNCiAAViYISHy/73Mumu6vq1Osjofv+hE=
X-Google-Smtp-Source: AK7set+T+q0H2vrT8Z5pRq9TbT+/2dZkbLhsOH4WZuVOp0uqxlVXn/BVVCKQXhUqe2Fui2Qo37z4+Q==
X-Received: by 2002:a05:600c:3795:b0:3dc:4fd7:31f7 with SMTP id o21-20020a05600c379500b003dc4fd731f7mr17591015wmr.41.1680218921334;
        Thu, 30 Mar 2023 16:28:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:18b7:bfe:d74b:7341? ([2001:8b0:aba:5f3c:18b7:bfe:d74b:7341])
        by smtp.gmail.com with ESMTPSA id w18-20020a1cf612000000b003ee58e8c971sm679838wmc.14.2023.03.30.16.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:28:41 -0700 (PDT)
Message-ID: <681c50ecd228ac9b44fc4debfc287f046934faa0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/loader: Ensure module names don't
 contain uppercase characters
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2023 00:28:40 +0100
In-Reply-To: <CA+chaQfbGEFeADX9oxo34RCL8Ffb7QXOHpvN6g6aNxv26nW+Tg@mail.gmail.com>
References: <20230330224404.51167-1-richard.purdie@linuxfoundation.org>
	 <CA+chaQfbGEFeADX9oxo34RCL8Ffb7QXOHpvN6g6aNxv26nW+Tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 23:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179381

On Fri, 2023-03-31 at 01:16 +0200, Martin Jansa wrote:
> I've similar one locally, but this one works for me as well.
>=20
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

I did check your public branches and didn't see it and wanted to get
the other patch in so I quickly put it together!

Cheers,

Richard

