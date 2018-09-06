Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6A74079519
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:17:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id j25-v6so15929802wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VE63MdbPU+m55ACbSu5wNXVB2etaUlaf2XHYLkawoME=;
	b=aYb1JuAT8h2WIPlA5rX8zZM806AhWYlPVSOELsUcPOp6xiTtAAKucp6bvkz/SQlxFi
	n6lbTzc0b6GBQf4g/rA2Qgu+d9EJlNFSv2FUOlmHz27fcD8nYED7fOF6RMmTpfWJvVSh
	76k1Vxt8jUkCnsMzvvnn0wVkuYQ9t9iHbbDNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VE63MdbPU+m55ACbSu5wNXVB2etaUlaf2XHYLkawoME=;
	b=iGOMuJa3wb4SX3TX4JxOsqZHi2xKJ81Eg+QCEHHk6SylnpV3KXn2TdMW8g9XsuclJz
	++0lfG62I9PxAqbLras9nTFv0f6ToYCXkX+H0klYDkRNtWt11jp/trw/tLW9zKqjmGFg
	vFuSBehxEhPgeAIlACtxGctnP8qHFQfYE5rH1Ibb8JMaYh4J3uCY5AexsKsYUJcssHmn
	Nqsv9oUfBTMSd3rFg08XawylHsBIc3lU2q7BsE6vlW4aZc5rSugt6Itext7yRL1sK+ge
	ygw+IBrWCXd7o+27VOBACA4ipGLfYbXwJQLJjGfGwA/VQjgvrJSv2HO7HUDUB3fr99P3
	oycg==
X-Gm-Message-State: APzg51A/sa2V7yUW64sDCbA7LgAR9A+LAXXADxd/SGmGpeI01ObnLIfi
	ZcXpc1oUJlRYBFGVgrt6bYa4p1GM4Yk=
X-Google-Smtp-Source: ANB0VdZf5XGbiAKE8A10BzNicPFwMsZYcjDr3re2WoHOjM/+VwuHOzXTlhm5qpWpzMJ1yDcB/q55HA==
X-Received: by 2002:a1c:c3:: with SMTP id 186-v6mr1356597wma.126.1536221837050;
	Thu, 06 Sep 2018 01:17:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	139-v6sm7077394wmp.4.2018.09.06.01.17.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Sep 2018 01:17:15 -0700 (PDT)
Message-ID: <cea8be2755a95002fb28718121baa756a7e4f668.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Sep 2018 09:17:14 +0100
In-Reply-To: <57018506-c661-a554-01a9-42f4de2cabb9@windriver.com>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<57018506-c661-a554-01a9-42f4de2cabb9@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 1/8] python: Run pybench once for optimisation task in pgo
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
X-List-Received-Date: Thu, 06 Sep 2018 08:17:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-06 at 16:15 +0800, Robert Yang wrote:
> What's the fault if I don't run it, please ? This is very slow, here
> are some rough thoughts to speed it up:
> 
> 1) Make it optional to run, and default to no if there isn't any
> faults without running it.

Without running it, python is not profile optimised and runs slower.

> 2) Use qemu-kvm to run the tests if qemu kvm has been setup (I tried
> it, it can
>     reduce form 12m -> 4m, saved 8 mins:
>     * Without kvm
>       $ bitbake python3 -ccleansstate && time bitbake python3
>       real    12m28.070s
>       user    0m1.316s
>       sys     0m0.184s
> 
>     * With kvm:
>     real    3m53.781s
>     user    0m1.080s
>     sys     0m0.220s
> 
>    We may need a oe-core/scripts/qemu-kvm-check to check strictly
> whether kvm
>    can be used or not.
> 
> Please feel free to give your comments.

Ross has some patches coming in this area which should improve things a
lot so I'd suggest we wait for those. I merged the n10 -> n1 change
simply because it was an easy fix to same some time whilst the other
patches a debugged.

Cheers,

Richard

