Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC3C7FD46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:26:24 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id c14so3049910wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rRs5+fnMVXI8uEgewxKmC9hL5XvU6JVCZD1XZ/mZRN8=;
	b=VrCJVYi/9gLQpf8/hsL9bdynxNIGObyE2DW+clK7Th8iuyqnQXFML2U25N0xLmzYc2
	/9fI+pGAvNFVk610gMNsoiSNHvi+TbHO316LiEyApuwh9dRgYvYpLEssbZPaTwFIEueX
	K4Unrl1Q2R5OfYDaqFilLehbRCu2yzoVe0130=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rRs5+fnMVXI8uEgewxKmC9hL5XvU6JVCZD1XZ/mZRN8=;
	b=rtpo50Rp0yI0W5QQtlrb62cwalY32eKo1BLsUzv7WLg2In55Ch/uRxsnkjkfYybUn0
	PFnL8KYR3m81c9h0harR5pUMkFmiLc8vrSHgg4ehVjoBoWMjTdJjbn1dVKw6s4VhrlRQ
	P6xI5qRHhDvCe90mVG67XeYSonOTBoGhbPYEZyb/S+NWhj7HQ5iOYk3rMlfKxHkeqHSq
	jyx4U/l5iP6+ZtSb1lTmbJ3gnj5aT5Rna77fuTUyepwXRBna7CEjAcNOKFohJ0EV1iUQ
	w4xUfTXsmzUPxiysKPp37BHt6RR7nRKzbx55am+POQ3b7CWEuhdgg3XZJDc/x2DvScHD
	AAoQ==
X-Gm-Message-State: APjAAAWdnw4rCPIvIcIj4z6ZdM+kkkPj6wvmHXYdEJ8aut+aMhDTPyyD
	W7eTwlX19B2MBtss6RjscxI6eISR37s=
X-Google-Smtp-Source: APXvYqxtrM1sDhe5P2rKKmO+6Rk5oWcO6tQPUQQRsZ9uDHTSr/blWGvxx1Rd1JyEeCExWbBCg6lREQ==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr16817726wrp.378.1579785985208;
	Thu, 23 Jan 2020 05:26:25 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k13sm2860207wrx.59.2020.01.23.05.26.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 05:26:24 -0800 (PST)
Message-ID: <fc798fd12d4a06537fd235b6247a0193d1df3022.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2020 13:26:23 +0000
In-Reply-To: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 13:26:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-23 at 08:14 -0500, Jean-Marie LEMETAYER wrote:
> Hi folks,
> 
> I have noticed some hang-ups at the beginning of my builds on the
> master branch.
> I have search a little and discovered that the connectivity check
> made by poky
> was the root cause. In fact connectivity check use the
> CONNECTIVITY_CHECK_URIS
> variable which is by default set to "https://www.example.com/".
> 
> So I have made some tests with a little script which gets the URI 100
> times:
> 
> 	$ cat connectivity_check.sh
> 	#!/bin/sh
> 	connectivity_check()
> 	{
> 		local ok=0
> 		for i in $(seq 100)
> 		do
> 			$@ > /dev/null && ok=$(($ok + 1))
> 		done
> 		echo $ok $@
> 	}
> 	connectivity_check wget -qO- --timeout=1 --tries=1 $1
> 	connectivity_check curl -s --connect-timeout 1 $1
> 
> Note that in the script, I use wget and curl to see if there are any
> differences
> but I don't think that's a thing.
> 
> Here are the results:
> 	$ time ./connectivity_check.sh https://example.com
> 	45 wget -qO- --timeout=1 --tries=1 https://example.com
> 	45 curl -s --connect-timeout 1 https://example.com
> 
> 	real	2m23.595s
> 	user	0m3.352s
> 	sys	0m1.834s
> 
> 	$ time ./connectivity_check.sh https://openembedded.org
> 	100 wget -qO- --timeout=1 --tries=1 https://openembedded.org
> 	100 curl -s --connect-timeout 1 https://openembedded.org
> 
> 	real	4m36.188s
> 	user	0m3.853s
> 	sys	0m1.761s
> 
> 	$ time ./connectivity_check.sh https://google.com
> 	100 wget -qO- --timeout=1 --tries=1 https://google.com
> 	100 curl -s --connect-timeout 1 https://google.com
> 
> 	real	0m36.328s
> 	user	0m4.265s
> 	sys	0m2.028s
> 
> So "example.com" is clearly not a good domain to do connectivity
> checks.
> 
> The "openembedded.org" domain is good but have a slow response time.
> 
> And finally "google.com" which have all sort of speedy networking
> stuff is very
> efficient.
> 
> ---
> 
> I think the CONNECTIVITY_CHECK_URIS variable must be updated and not
> use the
> "example.com" domain anymore. Using "google.com" may be the best
> option. But
> eetting up a custom domain like "connectivitycheck.openembedded.org"
> could be
> another idea.
> 
> Any ideas 

I think if you look at the history we did use google.com however that
caused problems for people in geos where that is blocked (e.g. PRC).

We may want to move the default back given the performance isse, not
sure...

Cheers,

Richard


