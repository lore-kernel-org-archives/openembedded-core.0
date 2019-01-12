Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id DBDC17C133
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 16:20:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id j2so18424343wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 08:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=8ahNLO5GnLI7RqFtugh5LjEA7KuEo//CkzAVanMsnkw=;
	b=hKlP+PURYZgJGRLRFC0JYp8YJKb1Lxyn1BBweJbhe9KzlgDBSOwubaMvZgmvNSY2UA
	GBIz3IvOUElOjkwpR2dUzXvU0PnsHyNL5Etm1RVA+b2wLEh9V+cp6r/SHvLct0Y9f8wp
	Q1x/EKAVZLs2W5ELP969MxornVC/d+wGNmHhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8ahNLO5GnLI7RqFtugh5LjEA7KuEo//CkzAVanMsnkw=;
	b=AwQEs+qdVyXEYnWav1EZGzd3OUZQIjBQL5ykk5Lh7LxForTIbvLEy7GJt9yH6YLMXq
	n5CFeJUwHYcTd5PcuKaZYesZKeLsx2D9t09XRx7oNTES+aY4Hqo/qoz0NdBolpX4Okt6
	RRlbwAmBu8XipgfP5nV8u4Tsy8Pp0yEw/IAfczoyFFYiJyBViOGGRg8ETd1Xiw63nHxF
	rRqFfdPpj12XrS+7eJAfug53qccWS4K+sujRVKkT6eFdas6IaRWQVMfpe5fq6nmeNlzr
	kM7Nl2WernLGPEEeFyA0at/c4wshg3e4RgQpi6rXnQXn5JPfVmfieRePAWqfO1zTEux3
	r76w==
X-Gm-Message-State: AJcUukdvZ4GTuKUyfZmrPXiKAGJZhNLb02UcTGo7ppVHW1YCb6zXuCi/
	dlFikQCEh+K7iV1Iwr70XUiNVNB8lA4=
X-Google-Smtp-Source: ALg8bN6o4INdpslfW9P9AtXmBXf/BBdOOyeqgD17bj84XoT1nFd86lR2NgOAJlbVKs9XY4rdVQSm2w==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr17763177wrq.15.1547310014616; 
	Sat, 12 Jan 2019 08:20:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l20sm138049050wrb.93.2019.01.12.08.20.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Jan 2019 08:20:13 -0800 (PST)
Message-ID: <698c51c8b3101f5cf95e058d2edd8120e84b9a74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@betafive.co.uk>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 16:20:13 +0000
In-Reply-To: <20190111164438.19749-2-paul@betafive.co.uk>
References: <20190111164438.19749-1-paul@betafive.co.uk>
	<20190111164438.19749-2-paul@betafive.co.uk>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] [RFC/RFT] sstate: Shorten file names in sstate-cache
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
X-List-Received-Date: Sat, 12 Jan 2019 16:20:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paul,

On Fri, 2019-01-11 at 16:44 +0000, Paul Barker wrote:
> With the recent move to using sha256 checksums in sstate, the lengths
> of some file names can now exceed the 255 char limit seen in most
> Linux filesystems. When this occurs, bitbake crashes as it is unable
> to create the sstate archive or sigfile. 

> To avoid this issue we need to shorten the length of the file names
> used in the sstate cache. We can remove the 'sstate:' prefix as these
> files already reside in a directory which only contains sstate files.
> We can also remove the target triplet (set by the expansion of
> ${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}) as we also have the
> package arch later via the expansion of ${SSTATE_PKGARCH}. And for
> simplicity we can replace the expansion of ${PN}, ${PV} and ${PR}
> with ${PF}.

Thanks for looking at this. Firstly, could you split this patch up?
You're making multiple changes in one patch and I'd really like to make
it clear what we're changing here.

You've removed the sstate prefix. I'm torn on that since it does tell
you what the file is when looked at in isolation so I've mixed
feelings. I guess it was insurance in case we ever place other files in
the sstate directory.

In SSTATE_SWSPEC the expression is: "${PN}::${PV}:${PR}" and we need
to be very clear this is not equal to ${PF} (which is ${PN}-
${EXTENDPE}${PV}-${PR}). Its a different set of fields and a different
set of delimiters.

The delimiter was specifically chosen to be ":" so that we could stand
a chance of separating the data back out by machine. PN/PV/PR can
contain "-" which makes it a bad choice of delimiter and makes it hard
to delete " all the sstate for perl-native" or similar.

I agree that the duplication of PACKAGE_ARCH in there is probably
unneeded and can likely remove it, the ${TARGET_VENDOR}-${TARGET_OS}
piece may be useful to people with multiple distro configs. These may
be better captured in SSTATE_PKGARCH, not sure but it is a loss of
information.

I think we need to make a conscious decision on each of these changes
as well as length limitation changes.

Cheers,

Richard


