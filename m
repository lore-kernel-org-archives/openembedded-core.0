Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6163C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 09:13:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.10058.1638954809731717056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EgIjeUbv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id i5so2896328wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gaTPFrJy+EqscLhPtYEItZt8YIxdJU+T5qRXr4PEbn4=;
        b=EgIjeUbvqCTWQHB9/deGh6acAzXHW6wS1bDPjiDtBOyICqsLsu6wZf8e3k6eqEK7YI
         hh7i8QwkD5lU1Dn4G9HFpy4Tz5aBFr53Q7w74cIiDfDwzq0u7AbhSxgef1Q/vuLGQtTp
         U1hXTf1ca7rl1Nu3GsATPThzHyPhlrmeoxrjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gaTPFrJy+EqscLhPtYEItZt8YIxdJU+T5qRXr4PEbn4=;
        b=ggJJbiLw0nd8EuO8L8Ozi8QaLdtMi/7KpLB0neokuNM8ZUFBUo/N9c6qbVexedswr+
         cXhP0AOh68vC+aDghz6J+gwr8UjusG6kGb0nGhk4OVK8MUZCApT7PgEGEB0wuWHlpiK3
         ni55ls4lXxF5PFrgShMq58/1Qh8KNtwuaRblAyKocvkdwpDGsxsX2zZagM7Z/DAgxp7f
         5FMhxQSKdEF6ZMRSBezL8KJQtjfwUoEzGr0RFa3QfJ1fduuUTcXZOOhS7mxGsnfXlj65
         e66TsfY1qq+/kb9AVNWoVuQc1al2QXl4tyq852/Qx+fsxKyALOHA6dLDP1PS3jBW43Y4
         DSeQ==
X-Gm-Message-State: AOAM533nSjME3ofjp8iQ3KxKRBFXp/joDR5nJwnPT8oPkKwnREXcDrIp
	7BNoHO4Hyamt5/o1HYfIRnOLkA==
X-Google-Smtp-Source: 
 ABdhPJyqdU+ge+1SB3WPtJAIk+V7bo13aLnxOyPOx+gdXbA1xubVX0sANnbaUDZBKcDoY5TZTN/lSA==
X-Received: by 2002:adf:e3ca:: with SMTP id
 k10mr58498753wrm.592.1638954808299;
        Wed, 08 Dec 2021 01:13:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e1bd:cff7:4306:4546?
 ([2001:8b0:aba:5f3c:e1bd:cff7:4306:4546])
        by smtp.gmail.com with ESMTPSA id
 p8sm2094051wrx.25.2021.12.08.01.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 01:13:28 -0800 (PST)
Message-ID: 
 <02ccda38b2f525b699ede5a92cfb5e26bb6b4a4d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] recipetool: Set master branch only as
 fallback
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Stefan Herbrechtsmeier
	 <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Stefan
	Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Wed, 08 Dec 2021 09:13:27 +0000
In-Reply-To: 
 <CANNYZj9W613_D++e=OH63rE1=rRAciziOKM439Yw4nxLai7ymA@mail.gmail.com>
References: 
	<20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
	 <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
	 <CANNYZj9W613_D++e=OH63rE1=rRAciziOKM439Yw4nxLai7ymA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 09:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159350

On Wed, 2021-12-08 at 09:10 +0100, Alexander Kanavin wrote:
> On Wed, 8 Dec 2021 at 08:45, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> > I will update my patch series but need some time to test it locally. The 
> > devtool test build a lot of recipe on every run because it use a private 
> > sstate cache. How does the autobuilder overcome this problem?
> > 
> 
> 
> If you don't rebase the branch used for testing, and set the cache to a
> directory outside of build directory (e.g. /home/stefan/sstate ) it will reuse
> that cache between selftest invocations.
> 
> The autobuilder uses a single writeable cache for all builds and builders,
> mounted as read-write NFS partition.

Stefan is correct here, it deliberately avoids the main cache. It does this as
it deletes things from it to run the test and we cannot do that on the public
cache.

Cheers,

Richard


