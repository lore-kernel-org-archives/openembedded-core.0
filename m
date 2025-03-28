Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AE7C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 22:20:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.321.1743200411420560818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 15:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ihjXQDf+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39127512371so1675649f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200410; x=1743805210; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5vkYfxQmr91ZszNTx4tRXrXGfohz9yO23z/C6KJtz8=;
        b=ihjXQDf+/HSjuAePNiqFvW8cLOp+tOEwxWC230z9voYgWZk3REefMB2SI3L56FqNvM
         lfXQogl3vcWDOD2LoAox3d4jjYz7aWXhMvWTNXbUw95/uC2DmGrIaImEFYaYx3xwryoX
         47NB4tjrkdHyj22b+4Grll5Jv33tfzk0xcxDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200410; x=1743805210;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5vkYfxQmr91ZszNTx4tRXrXGfohz9yO23z/C6KJtz8=;
        b=BsDHncmSnGbNosSo1MVO5nl9nsU7b8QoKBwVWLNpCoUBINeFPJVaOyigqCzkd6TtH3
         cY9AtKs0YJyxWhfpLamyffiBuIMKXXT/ydvMv/HiPwORqkoUaLMjh9PwN4pQSb+LU3Ef
         ot0wjHi+kPYcdouRWjdTEjatlb7/m/oR3WlB9fjObNwQOnTHIF1kzPWZGC95Rm6W81/d
         ytvWVt6/hVLdw48+bIFMcIy4581IOudc3nC7z7TYy8yyuBoR94yODUQLf9V/roGgVIYr
         XGYbChu+B7NN91GWE8S1u0xc8Rodk1Rcj9T8ace2ZGTJO29AMSnUQRKRk5ItFucg6uGI
         Fm2g==
X-Forwarded-Encrypted: i=1; AJvYcCWgdTzNfQoW9LwJ+lzYMvSVuGTO+qMFHYP7KVOElUBG2WWSIPhZ405Mojt65YYPpAdPWfmsPsfZebgaW+/bEvzc2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVf+FWibrt/JwMpVfmneVcW7XvhU/W9dg+jT0mVC0SzjGn0UMk
	J1lsCPnuTAlCVGy224KzowqjW61f5xTLFQmBjrsl18yMFWJtYxXbvfOtTsFLgeQ=
X-Gm-Gg: ASbGnctwzaGaxd+O1iSHQuedVjXPKUXwaL/GyJHDJKem5ZxGiwH6RElxPnArRkoEgdf
	r9DfshxlZByH7sIEjppLAs0PQHw3MAoXVqM5/kzIEQa3T72A2aScMGwYp7bCja5LYekFb8LHNkN
	RUXVe9iuEQWbhKqZBpxwjcVyrcwbSDfPinbLuQsILYco6asxftyIOqfIpp6SRbXdWKrl6kOUbSY
	2p3CGMAKaUGO3HmuNbXwAe8wIETZP8Y58KWXzp5Kzc+a2opyheeYBS/QJq2BoDeDC7xX+JEOcUD
	mK3bGFuYMFD3a5App5bTWnCXnkjaB/jZELTVnZqX8oJFgxcn7BmsQ6vRsJzN+pDRearv9DMAPQ/
	EgNeLZAXn8lZHSgrBOHS+uALoxbrvncz1Rg==
X-Google-Smtp-Source: AGHT+IFvZ0Yon13j5b2lsqUHtv6Y94xnY7nH3c+I/2woAZV96ID6rc6jkDm08Kvlzc/yD+vfA1vA9w==
X-Received: by 2002:a5d:6da5:0:b0:390:ea34:7d83 with SMTP id ffacd0b85a97d-39c120e26a6mr639334f8f.31.1743200409718;
        Fri, 28 Mar 2025 15:20:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6247:e15f:3651:1c16? ([2001:8b0:aba:5f3c:6247:e15f:3651:1c16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66d56csm3882296f8f.59.2025.03.28.15.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 15:20:07 -0700 (PDT)
Message-ID: <0d58c141fe25581f0a04240a593466667de82269.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] cve-update-nvd2-native: handle missing
 vulnStatus
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, 
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>, Steve Sakoman
 <steve@sakoman.com>,  Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 28 Mar 2025 22:20:05 +0000
In-Reply-To: <AS1PR10MB569714EB15C26420109E5BA0FDA02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <183102268539BD3E.31520@lists.openembedded.org>
	 <AS1PR10MB569714EB15C26420109E5BA0FDA02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 22:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213876

On Fri, 2025-03-28 at 15:59 +0000, Marko, Peter wrote:
> dunfell and styhead are EOL and not accepting patches, so they will
> start failing to update DB.
> Shall they be removed from the Valkyrie CVE reports?
>=20
> Alternatively, they could reuse database fetched by a branch which
> can process CVE feeds.
> Or we could also ask NVD to fix this CVE in their API and wait what
> happens.

I suspect if we fix the stable branches which are active, we'll have an
up to date database for the rest of the code to work off. That should
work for styhead but I'm less sure about dunfell. We may want to stop
the metrics for that now though anyway. I'd left it as it was
interesting to have the data on what happens after they go EOL. The
kernel CVE data has kind of drowned out everything else unfortnuatley.

Cheers,

Richard

