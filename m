Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id A4994745D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 23:12:38 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r10so836678wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=YBkA88gN1MQii7hWJT1WhG3d2x7je43khY9+9l+hF8E=;
	b=TszPHuUWXxIkHWCTVftpfn+sE1tEbAzn4hN6pxTsszeIywdKk3PwvLWW806ulvpUll
	+eoHGGm6KAanpqBqBXcnR0XHUtWLW0DslhuaV/PRK2HUoi4lMs8EOnE2F+tXDHvStugt
	9+OyPXcKxqTHhHLraX5rqGmaBMQ8vEFDPANJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YBkA88gN1MQii7hWJT1WhG3d2x7je43khY9+9l+hF8E=;
	b=mLPZFGuwpsTfYRCBeB0m6vesQIvln9Rxq6h5FPGULBpFhR0ALSCleW5Aevz9UdNyM+
	RSPfXtpS8J4ARvkzzqqybnRSvB3ydGcl9Yc+89LaeZoxsnVXskt9gtN+tA9ZXqozKRH1
	sC29TrT9AvhC5ie7+xCA5RL7Ua/zbuc1fZGSvKijLQOIiydfxEMU4dRKGXBEBOHUXbn2
	GaLql2PPbPeqJ6PlCMnZ/7Uo2+Xev7ytopjlGfNua1+Vyc4Ou9ca3Dmm1ysOvm8SeuE1
	3J6J0JLj4ZZSHkWGW/lAp5TLJ8WnEmGmBZAMsQls/p6+pmSc752yTz4r3g+xay8sP05Q
	1MDQ==
X-Gm-Message-State: AJcUukffesti7gLBxj9xn9JOCZLplwMPUmtoGyI+XwFQZaTFHs5yHwOk
	x186kpBbejHNPhz/at4jG2MWtUIbzLE=
X-Google-Smtp-Source: ALg8bN7RG1pXAS/xVHVGeWFzcH7zrBG4DYu71FKgOcfvHciVqGObRz0datw39K6qIr9zZcZWfr68yQ==
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr600725wrd.294.1547507559109;
	Mon, 14 Jan 2019 15:12:39 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a17sm72658246wrs.58.2019.01.14.15.12.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 14 Jan 2019 15:12:38 -0800 (PST)
Message-ID: <8fe4c0f740f7fc993a4939178e6c6bffb4896c83.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 23:12:33 +0000
In-Reply-To: <20190114230432.22116-1-richard.purdie@linuxfoundation.org>
References: <20190114230432.22116-1-richard.purdie@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2 v2] meta: Fix Deprecated warnings from regexs
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
X-List-Received-Date: Mon, 14 Jan 2019 23:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-14 at 23:04 +0000, Richard Purdie wrote:
> Fix handling of escape characters in regexs and hence fix python
> Deprecation warnings which will be problematic in python 3.8.
> 
> Note that some show up as:
> 
> """
> meta/classes/package.bbclass:1293: DeprecationWarning: invalid escape
> sequence \.  
> 
> """
> 
> where the problem isn't on 1293 in package.bbclass but in some
> _prepend to a
> package.bbclass function in a different file like mesa.inc, often
> from
> do_package_split() calls.

meta-oe and other layers are likely going to need this kind of cleanup
at some point.

A tip when trying to debug this is to remove the cache, tmp/cache and
all __pycache__ directories so that you force everything to get re-
parsed when debugging/fixing them.

Cheers,

Richard




