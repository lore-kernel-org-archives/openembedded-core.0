Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3249CC54E90
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 11:54:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.8036.1748174051200589593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 04:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bBPvUSAy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4d152cb44so963082f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 04:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748174049; x=1748778849; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDUSeKIlz0atoV0UAZ1DATbkYcbPmn7/5q50tZM4iRg=;
        b=bBPvUSAy5Lny9NZ/aN3ERMHu2Kr0ubgK9v9RFSkTK9z6S8ndK6oWHDBRrb0eVPo9Xu
         aDgJliDdaD9YCwDwX1zKChcEcmN9whEzkIiara+cs0DgGlNYD3RIbOtP2b7JbXDaxuiB
         sr17P68audqIQWy3BexM/Qkxz9jiL32ZN1DAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748174049; x=1748778849;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDUSeKIlz0atoV0UAZ1DATbkYcbPmn7/5q50tZM4iRg=;
        b=XKgob3jonCpRV1AgVBjOqYkaBGF7i1yz0rSzBPv+MSF+UGaw8L6vpu1B+P64QbXqOO
         eGsvf3R7rRGmr+OR0cKf6HOiRwThjWpu1EP0PzQbqjXOFmKw5xDrZFYdoguYyDyz8Bd6
         gMkQkcGZ3IPbXiLdebNjMXplK0vxSLLHR61pHBYIUJWjz/UJH6jMixHluQVcUIL3YPyY
         DYart3AGfwTgQKrr2ITl9sRNnktdylo/o8MxROrA/x3K11ldH/+LjUuedtRi6kPG1Jez
         3/5Z184XOlVI3uWsDT9qxoHMP9E7prCAnF0aHdCA/5OQ/C/NaYGrXtf31hmifadEA5RN
         t1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWER+GoWrDf5pc5wmKqkQzbdZhEOwu2JZx+YWf/adTHxMsx40vfTT5fPlhVzj5w3oXFMp8qeWa9sYndfhV7xVBFhg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzyul6sEdDP3It5sEjQnvUYxc8HrYrzym3JNLCIicQZfn/V4sAj
	s9xlYJAccNKAuGxm4rpWT6ri34vIdKimvHgvkfF5BTteJ7xwirfkEXPjHmlov0Lb6imgxb5l35r
	JCh0A0WE=
X-Gm-Gg: ASbGnct232YOWhdyEh2DdQ84DTf7so4JrcW0B3J4CeNqkzUx169SmrW6nPWq4wSEaRF
	LLe3PvPO84NJfHCX8vv0biSCltoTEmualPZhn/zPtm9XKGQyaimdPJCb+F/BBIDGxuhHwVYdPcj
	f5BrscBVlJVNQFk+4mb75kfNkNZfJbPAM2tY19I94HN5duTSW9cl7oEmqSOp0dqvZrJ3PfaMtuJ
	LxcTMlFyGc9rWDGriER1T9p+eHI2JqgRP4ZewYWmdGv/me3BDC1AzqgXX0vfce/GptjIZg2DSQn
	pIhHkST1LWPGV4mox8VZk9/RaU57fKPLe+CulZBWzK+LdNl4vzwaSErz6Il0vbx8p5sLFf1PqLw
	z11BkKUnxuMEpmw9Je2aVPgruL9kvqZCkU1TNlTcq
X-Google-Smtp-Source: AGHT+IE5dToU0/OjkCwUcxA6hke4ryUGvOODsPnxrYLj4qljwgN8NEqs2KDUgqbATlAxXlB13X1+2g==
X-Received: by 2002:a05:6000:2083:b0:3a3:6ae4:6615 with SMTP id ffacd0b85a97d-3a4cb453dc9mr3915519f8f.13.1748174049630;
        Sun, 25 May 2025 04:54:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eeed:a623:5d92:7ad3? ([2001:8b0:aba:5f3c:eeed:a623:5d92:7ad3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d0884cabsm3129402f8f.82.2025.05.25.04.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 04:54:08 -0700 (PDT)
Message-ID: <5960acc38fd27b3a17252400c643e046e978e199.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "xserver-xorg: mark CVEs fixed in
 21.1.16 as fixed"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "ross.burton@arm.com"
	 <ross.burton@arm.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 25 May 2025 12:54:08 +0100
In-Reply-To: <AS1PR10MB5697488DFACCBD82D8F571E5FD9EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250516111027.1710115-1-ross.burton@arm.com>
	 <AS1PR10MB5697488DFACCBD82D8F571E5FD9EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 11:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217245

On Wed, 2025-05-21 at 11:25 +0000, Marko, Peter wrote:
> Would be great if someone could delete broken cve-check sqlite DBs
> from autobuilder infrastructure.
> It contains stale data from over a month ago and these reverts caused
> these CVEs to reappear on
> https://valkyrie.yocto.io/pub/non-release/patchmetrics/

I went ahead and did this.

Cheers,

Richard

