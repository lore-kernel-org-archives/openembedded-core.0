Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792B2C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 11:13:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4926.1749122002754068198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 04:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FSmy42Cw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441ab63a415so8176495e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749122001; x=1749726801; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B02VsjFh1ENH6lUshpLETC1/9BB5Gu/K7DDFHVpGTQU=;
        b=FSmy42CwFEnZdkI7gDGUO7sv5NCxdkBT3lbog8NYTXMNKRKdnXtdSiirm0d4Lo23D0
         dhTjmQ/BEBayYsc+sDpaXjf89uIAj+SrmAKbcqmyMSY4IAtqh0yt/qi12si2cB0Szjan
         0Zm61Brt0teymVE4yn30QmOTUEJlMuJgGF4M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122001; x=1749726801;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B02VsjFh1ENH6lUshpLETC1/9BB5Gu/K7DDFHVpGTQU=;
        b=NqO0O/i6UjkD96C9iY5FoRISZmS1K8MztuM724j+lqHOX1zbwchrDU0fe/exk7oVUt
         m9bODgWSNYcAPVuRcDhPBfAhKsPXt4Vv73kF06MsIAFenYcswaxqv3Ublvh/l1L99scu
         Xazx+eFVuvBSjgh0229pC5QA6FSkHEVSaFFJcTAXoq8cylZIsueSCjQ7VcskCvkf5sXN
         1YCWPdHkWwDlYND39uG9uRUQ8EYAopPikIltiA/UF0jpeihY+5LKRsXekT6/5hCZ10S3
         n88bY07pQkIueeAH8KbG5trvF+jnDpN8n17XdaDL7/nq1hqk+mD8UiRddY8idsuikd70
         Tgbg==
X-Forwarded-Encrypted: i=1; AJvYcCVPjsOanBulqi1Z5ZwxeUqfstjp7L847zqdNtPB0UyFfGJzjuasu9g4HuYfStlOyMT1dEv6lZb1gm04LesNdpUumA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJww37ofDDRlAg5UdsyL33GNs40nTR0XrquveYnooyVNtIYkVb
	XXh1G+8SwhBulfaAFwBQWKCKD9qQcSZO/M9ymL607QW8xavUrqMYUDVGYJU03eIb6j0=
X-Gm-Gg: ASbGncsIsq8GZLBau8o9jrzkF3eOQl9GZOt1OyzmTFstvAQ7y3FJ2NTDoiKWrwO3H2M
	c5pIFaj5ZZ6Kp5LkrcZD//N/s/fDnv+JWMg9j2dhq4SjZCxWbZm1widKue6qyepZzajxmucOt3M
	zJ7UXbzqds8UnEf+DAs0zbtOB1wZw+BjlV50MQD+R4DiORHrQmBCFdAu/ohKR5LpNoZ2jVV2mhD
	Sk1bKe0K5XLZdb5CDYpecujKJTyHGTkDA1ub9qpmmMd5sQgIkno44y1GGBFqQYie4vOp+Z68I88
	enb5kdmDj8VXZiFvK0o8msqzbiXLOwHLLKY8pRSQXe4ZwnMv2BsuYaVqzEbhFBFUhVRH2iv9WTE
	pkBk0aXKGrzMXXCnxnSUC+qLtqiTlzjiVI+htEA==
X-Google-Smtp-Source: AGHT+IERes7qCy3UGeMt+k49Q6g/nsR2IbAFp0o3lscyMMA32eOq5EEWgr/6Gq4J45aPrgZOxgzO9g==
X-Received: by 2002:a05:600c:1d98:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-451f0b2c818mr55053215e9.28.1749122001060;
        Thu, 05 Jun 2025 04:13:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:33af:62c:15cc:322e? ([2001:8b0:aba:5f3c:33af:62c:15cc:322e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb2213f1sm14975815e9.32.2025.06.05.04.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 04:13:20 -0700 (PDT)
Message-ID: <32101037c3eeca29077a61ca6a14e40437d8145f.camel@linuxfoundation.org>
Subject: Re: [PATCH v6 1/3] package: export debugsources in PKGDESTWORK as
 json
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Turull <daniel.turull@ericsson.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Thu, 05 Jun 2025 12:13:19 +0100
In-Reply-To: <PR3PR07MB666659AD2EE7924E191731C08A6FA@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250604112133.2581063-1-daniel.turull@ericsson.com>
		 <20250604112133.2581063-2-daniel.turull@ericsson.com>
	 <d765e17f7c7b3e2d46da0f2983748dc7cf413948.camel@linuxfoundation.org>
	 <PR3PR07MB666659AD2EE7924E191731C08A6FA@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 11:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218007

On Thu, 2025-06-05 at 11:01 +0000, Daniel Turull wrote:
> Thanks, I=E2=80=99ll do that and resubmit with the changes. Should I resu=
bmit
> the whole series or only this patch?

Just this one is fine. I'm trying to get this sorted, then we can focus
on the others. Joshua is the person I'll look to on the SPDX piece,
then the wider community on the script.

Cheers,

Richard

