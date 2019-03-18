Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF0C56C0F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 23:56:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o10so15449787wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=At8J10pyK50vPHfbU7rlw8K21NBK9dV5IYUf63qfjSE=;
	b=FEC8QVO/EQ1qNk90WBuT2uR0YxdJmgUKgjekw7F3sE50FxUkecXkE+RhLrpO9v2wy9
	g169R3+375KtL5Q4OJhd8vjMeBDja/6MN4ppOh5EirJum9mnBoz+f5WOOmBYTrubIl21
	hMXZn3MZx/yRPFbHcPfM8kuQBZZ12BDfUU/1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=At8J10pyK50vPHfbU7rlw8K21NBK9dV5IYUf63qfjSE=;
	b=gi4LkE5D/X6iZqbi86zCP1Kwnb536atGcfhk7uh1i9endQDHhH2Txjo6kaG5B0li42
	jsfD1Pp0lL1jD1ilxR6wtLxvcz4c15gz8V/cAUZJ1lXrEWUs1tiDxoI++gQO3yXZukgo
	L2EAvYBjvlAQodrAHNBtcmesoSP4ACXuMkrw8vW8J+V595ObU1ropT6219EZi3F943CA
	ZbtmIYfU20V5QLdiFuqUXwZ+oFUZzaKquidVHNefsbceQ8aG+aCe14av7KBw2NF14j8M
	L7iNRI7Ot4nXhllDn542ouoNX1knCfnocAojsZo67oxGoIfXYbU+vxiKbP++SH7RGyiL
	T9OQ==
X-Gm-Message-State: APjAAAVyeglHguNNRSgbjc4lo38UJE9B6rDbBSG0XUWNHaSwERjwhlqW
	Uof7ZU8oXzlf4BIaDj97RtJGWQ==
X-Google-Smtp-Source: APXvYqzrsKXGksS3vlocrjseY40RAXiHxXrZjmB/NJBBhPYvqDSPhMr9fjVWu9ms4fEmsvn+pqF9Fw==
X-Received: by 2002:a1c:66c2:: with SMTP id a185mr1026681wmc.139.1552953406487;
	Mon, 18 Mar 2019 16:56:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v9sm27278768wrg.84.2019.03.18.16.56.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 16:56:45 -0700 (PDT)
Message-ID: <5ebe88235599c79c6f125e327bf321f9e3c30700.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Mar 2019 23:56:44 +0000
In-Reply-To: <CAJ86T=U0NLArgbpFWt_FooB0H9sTYxyqC345ZMftFDXezJfV9Q@mail.gmail.com>
References: <20190318133618.4022-1-otavio@ossystems.com.br>
	<e9d01fa735d068ea16da35db9cf303841b67b909.camel@linuxfoundation.org>
	<CAJ86T=U0NLArgbpFWt_FooB0H9sTYxyqC345ZMftFDXezJfV9Q@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2019 23:56:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-18 at 16:52 -0700, Andre McCurdy wrote:
> On Mon, Mar 18, 2019 at 4:35 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I went to have a look at how this upstream C utility was going and
> > found that they've moved to github issues and there is no such
> > issue
> > open.
> 
> It's already been implemented and is present in openssl 1.1.0:
> 
>   https://www.openssl.org/docs/man1.1.0/man1/rehash.html

Great, it felt like I was missing something!

Otavio: Why do we need c_rehash on target at all, can we use rehash?

Cheers,

Richard


