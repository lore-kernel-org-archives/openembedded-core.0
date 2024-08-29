Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61440C83F0D
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 12:00:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.11670.1724932852889562351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 05:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XvS3PXZE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280bca3960so4997825e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724932851; x=1725537651; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jm9p5s/rD0fiZouQWGnP6PBnI2rMBlnUZ7vBR9iW2dg=;
        b=XvS3PXZEwhHDdNwGzqWdokINGnES0jgkTfkk7yR8q0f/8Mdz853/8mEGuHm8OOko67
         3KxnBIBw0UXk6pXxQiB6Kkl/Whmfzma88EhiDSIRoNFkSFI2kpzwpMsZRNNV09OQcBpf
         HGbLVsFCQbcFZrKBLNIpLOO+WQHB+pEtjZYo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932851; x=1725537651;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jm9p5s/rD0fiZouQWGnP6PBnI2rMBlnUZ7vBR9iW2dg=;
        b=jdIqHpNrRNqU7yJYnAHwKz/BMTs0zx5XW5/ruMFSw5TqerzlpiV6gYjPkro5Er/6la
         dIdMZ0wJuXk2N7ZS3w8fK1f6Luhy3PXhYEcjrs7c55s6vJ5BnljXvMqtNxjHtZ1gKg6u
         yXxkVLQJnJrshmjxgJxgKuJzwU9lXVPvAo2YIMhnxHQk6L4j1YsfpAdQGVw9lPsTzoIO
         ooIvqO34y2H+UWMPkA7SwvYULJMePtj6enKHFN6eIaFKlRSSmjrC54KdqCsAfxQYtY4K
         /7hfObzP+9qm8VGq56f2W1U2bk7V17Pm53v6Esx5y62BSnLF3sDwLxcahX3SIEqFdjxa
         ZDuw==
X-Gm-Message-State: AOJu0YxQHHCPMj5mZpVkaV5l36UsZxKJDIbKyAp9+KbTHPTfJByGwG/7
	yIXaYpdonU+r1qS8Q1cvFLhuh0dOl0uCvYZorKNaB052NjleMlQQYPHoIeZaCxpE3ntI2y4om2I
	V
X-Google-Smtp-Source: AGHT+IFPpFiX1FW43qXuVGhAj1lpA+saSXbK2zQ9HSemngivCBStuIA0DFq9uG+Mbe62xxpsgZD6RQ==
X-Received: by 2002:a05:6000:1569:b0:36b:3384:40e5 with SMTP id ffacd0b85a97d-3749b5486f4mr2214510f8f.24.1724932851141;
        Thu, 29 Aug 2024 05:00:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:19db:d42a:7902:cfcf? ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4d391sm1241745f8f.3.2024.08.29.05.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:00:50 -0700 (PDT)
Message-ID: <0478d307fad333e96d7cb2c2c5f33058d6afd860.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] buildhistory: fix package output
 folder creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2024 13:00:49 +0100
In-Reply-To: <AM8P193MB09004DD00D04193F371CA700C7962@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
	<ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
	 <864.1723536321789931548@lists.openembedded.org>
	 <CAOSpxdaqBx5GMDe2-YJc2z_KA0VuBpv-aqP+Zt=XFa6p-XE9qQ@mail.gmail.com>
	 <AM8P193MB09007D00E8018039DD5FC6A1C7942@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
	 <1e6757fe926b7059a5366b3c7e21c380b6400fb8.camel@linuxfoundation.org>
	 <AM8P193MB09004DD00D04193F371CA700C7962@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 12:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203916

You'd have to test it but I've a patch I've been working on which drops
the use of SSTATEPOSTINSTFUNCS from buildhistory entirely. I've just
sent that out for review.=C2=A0

That might be enough to fix this on the release branches for
buildhistory even if it doesn't fix the sstate bug.

Cheers,

Richard


