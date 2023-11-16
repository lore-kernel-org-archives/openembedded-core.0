Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563D2C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 10:36:57 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.4092.1700131012788705421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 02:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e8Qkv0Jp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so8927061fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 02:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700131011; x=1700735811; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0WlysE2LtANBOXBk0jUPX4LDIFlitA1L8ZyWIETTGjM=;
        b=e8Qkv0JpmoDcohkdfdrrCK8TKqmcBFWZAJr6qX+jL4kt/w+zyoKZtodIahpo6zoRL3
         nCsaiiibtm4MA6octAT9BzlIRaWy8PhzIyjBlnCN+0GX7x1AwTrB9UHITy9CSWtLH2Hn
         YIItavbIzkB8oolHrJM8lHJ2BKLoE+SWj+LA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700131011; x=1700735811;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WlysE2LtANBOXBk0jUPX4LDIFlitA1L8ZyWIETTGjM=;
        b=jCWWA3EBXfHlvYW/Yu1wfsnKtwvnrRrT+XWe1EEuC+kR7gTfIiLA0zKAEOzFs2G+XG
         weP0FQSvF6SxjRLn1eeKIm1SGuHaQysecef0TCUY0SFWsh9o6qX6cCxUwjJ/dHVAVEwB
         Wh9uZEMACB7DmePF1vmNpJLvckVrhCIR4vbFs4YPeosb/RtzbVgIz9d9H2DMBSAo4GTZ
         fWNORPu+LKdIWY3Ksd6jcpUmPcwv8z05gmBfo/aDMVMRyKFsqbl9+vYVSCYoy/3Rj0fu
         zw6UlmfINIP7hLAGTIs8kECqE60etJk2hToCPTGc1R6csz9OEO4OGgaJcaLuLm10GGVT
         rdNg==
X-Gm-Message-State: AOJu0YyC1Y/PASuG7ZASPOcqSSUZMNxn+PDODhVQ+DuE3joHWdhbmLqy
	pHS5dxdodYi0lOdXGqPafKzS+Q==
X-Google-Smtp-Source: AGHT+IF8V7z2Kc9JgQmMtLYkzz8SXOXeeJmqv6XFHwfLseD/Neh5Dbz721HHgXw/wfBovTGnDmRbgw==
X-Received: by 2002:a2e:891a:0:b0:2c5:3339:71d6 with SMTP id d26-20020a2e891a000000b002c5333971d6mr6867089lji.19.1700131010845;
        Thu, 16 Nov 2023 02:36:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952? ([2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bca4a000000b00407b93d8085sm2933216wml.27.2023.11.16.02.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 02:36:50 -0800 (PST)
Message-ID: <ba52e5486c2111a4a6cca3b013d8acd836098bab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3 01/11] bitbake.conf: drop ${PE} and ${PR}
 from -f{file,macro,debug}-prefix-map
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2023 10:36:49 +0000
In-Reply-To: <CA+chaQfUHPdaMJA93bYpSi5ezQhjcNR4_86YCc7sX=PeX6bO2Q@mail.gmail.com>
References: <17980A549B19C5AB.23420@lists.openembedded.org>
	 <CA+chaQfUHPdaMJA93bYpSi5ezQhjcNR4_86YCc7sX=PeX6bO2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 10:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190770

On Thu, 2023-11-16 at 11:30 +0100, Martin Jansa wrote:
> RP asked on #yocto to add=C2=A0TARGET_DBGSRC_DIR variable for
> /usr/src/debug/${PN}/${PV} so that all recipes fixed in follow up
> changes (and 10+ more for meta-oe layers) can use this instead of
> hardcoding the /usr/src/debug/${PN}/${PV} value.
>=20
> Will send v4 later today.

Thanks Martin!

May as well tidy this up since you've located all the usages :)

Cheers,

Richard

