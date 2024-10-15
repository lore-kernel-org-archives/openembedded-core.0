Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DAFCFC285
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 10:10:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.9739.1728986994378198769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 03:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ijRnxqAn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-430576ff251so45202785e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728986992; x=1729591792; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3CiMFzW2X6z1yE0q4NNOd0O64CB5pRoAF1WJZdyBwUw=;
        b=ijRnxqAnbcboVpbfVZtqrojktcBGetKH6R5gfFFsnBWcBE4Jjti8o/tGwU0H64Kv8Y
         akI67S1VFcx7ALFBwvpbssE//yOHlSELUUx0hQuCG4n6kmuDleBmWfAWZAP8k0ubX9Z6
         KCQPARpvm3nIOVEO76ytLvLKWbVXmJ25molqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728986992; x=1729591792;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3CiMFzW2X6z1yE0q4NNOd0O64CB5pRoAF1WJZdyBwUw=;
        b=CZ2eDfyHoJICDwgjvqzNOUeFkf49t1uHpeiAt8nOA5um1M+DsyzifnGx7GD/qqM/GO
         rUVEXaDAkdm3YokGBW1bYk47GPjRI5wL4f4KYNzsJjULKHYN0h8JBryvt3tbHOjB81Zy
         HT6qQ6dQBjYV/4PC+tpsFGgLIjCKe1MW+x+F53Vo6wg6qgy87CyQtVq6eDKaEvHho9IX
         qMTiME6iwd1lEyRf/l1TMN43zygen2OttjRoVF0zFVqxRVLVYM0RJRPfLBZVtHZ5GkEm
         uiyYVMoyD9jKt29MeIZDHuzCeXM+T+d48ZADi8qiD/NCMPPr7FvaOGmvUPSYEsrGEjlv
         EH9A==
X-Gm-Message-State: AOJu0YyqGcMcTpgWJaznJHLJ8bTXmo+cvbgu1AacIDl6nb6Cl9rBK44k
	IN67ts5FT6jx7zhYQRe8BVrXN3ac/9UCZiFecy/cMgWjB1FPp/z38bLU+tl1gwmmbF31/bCQEwU
	a
X-Google-Smtp-Source: AGHT+IERbSV+KwndzC5iJ7eZKsPjPWNmrWkjgx9AKP9gAKwlhZIlttJfvJjRkUYcw0lFUp3pxMZwIw==
X-Received: by 2002:a05:600c:4e46:b0:42c:b8cc:205a with SMTP id 5b1f17b1804b1-4311df5644amr139447485e9.32.1728986992213;
        Tue, 15 Oct 2024 03:09:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9? ([2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a086sm1170301f8f.24.2024.10.15.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 03:09:51 -0700 (PDT)
Message-ID: <2bad4dab835a0ce9710e576a2171fb9f70a78457.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Joshua Watt
 <JPEWhacker@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, Chuck Wolber
 <chuck.wolber@boeing.com>,  Adrian Freihofer
 <adrian.freihofer@siemens.com>, Marta Rybczynska
 <marta.rybczynska@syslinbit.com>, Jon Mason <Jon.Mason@arm.com>, Michael
 Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 15 Oct 2024 11:09:51 +0100
In-Reply-To: <17FE55BCAF4D83DD.4702@lists.openembedded.org>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
	 <17FE55BCAF4D83DD.4702@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 10:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205803

On Mon, 2024-10-14 at 14:46 +0100, Richard Purdie via
lists.openembedded.org wrote:
> It was suggested I should write down a list of other issues we have
> on
> the autobuilder right now. Some of these are related to the
> transition
> to new infrastructure, some are previously seen issues occurring more
> frequently, some are entirely new. I appreciate these should all have
> bugs. I'm copying various people including those helping with SWAT so
> we can transition those we don't get solved into bugzilla.
>=20
> a) insane do_package_qa intermittent failures
> ---------------------------------------------
>=20
> Two levels of probems. The cachedpath code returns False instead of
> exceptions so there was unexpected API changes. The recent insane
> changes also stopped handling DEBIAN files correctly leading to
> races.
> This is perhaps the best backtrace we have:
>=20
> https://valkyrie.yoctoproject.org//#/builders/43/builds/246
>=20
> Who/Plan: RP has a partial revert for the first part to fix builds.
> Ross is aware and working on the second.

I tested Ross' patch for this and unfortunate it caused a new problem
to appear.

I accidentally triggered two a-full builds at once, there was also a
scarthgap build running at the time.

The patch from Ross caused all the do_package_qa tasks to rerun at once
in parallel which caused writes to the hash equivalence server. This
caused widespread timeout errors and took out all the builds including
the scarthgap one in parallel.

https://valkyrie.yoctoproject.org/#/builders/4/builds/257
https://valkyrie.yoctoproject.org/#/builders/2/builds/253
https://valkyrie.yoctoproject.org/#/builders/89/builds/236/steps/16/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/40/builds/242/steps/11/logs/st=
dio

and many more.

Joshua: Is there a performance issue with many writes in parallel to
hashequiv?

The stats info off the server was:

    "requests": {
        "average": 0.042532518429623176,
        "max_time": 3.0534732329833787,
        "num": 73325629,
        "stdev": 0.06959859907598737,
        "total_time": 3118723.6668062117
    }

Cheers,

Richard


