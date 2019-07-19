Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60D227EE6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 08:06:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n9so6226454wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 01:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=zlYusrtaspkUK67HXTYqUy33qPCNNjcZwFe3wWFnMEQ=;
	b=JGE1ceoSQ0CoNlMWgDsScGaoFkfQMIQUj13oeKuYyIjK8HDFMuhvvaWiLa3TDOb+sE
	ocevs9Dh8qEzAbaRC8ysIoZkbpw2NxIju/Qmh+KQFX1K15hUx+gLisZr9lNv+j673QyH
	8gZkTwgdGjuzLU/b4pPTTPHk4jndOw795qzjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zlYusrtaspkUK67HXTYqUy33qPCNNjcZwFe3wWFnMEQ=;
	b=FuqUKoCUvBByJ4Niop4mL2uzFcatyx9/vu04PtdLzH8KAA4OxFBDAKdB1u+q9QZoKC
	PhNHWSeq5cRSbd4uxdyQ7yOT5j64NeFFFpWAewBLMr8OCkFaGnrWtqfvUWUld+IEgJhu
	avSrlmErjGYFXsTg2yyCimYGM56b0afdqD0gRACPVBU4/uisYwuIlwAgEtXyfXqJjZHP
	O7xcBkhDvE/mjvoWB1/7e8AO/w58lrDYzoUzaF1VtDzj7ohhnc7tw6lSQTr7wUlR+NnY
	9mPk0BfH6coCFXYRtWEp1TY+nKDLC4koYOpcJUQ5P0JXYuD8qcSPj1othK4D3JHOrQLZ
	Cdkw==
X-Gm-Message-State: APjAAAUm/RXQK62COLyQcZIHVHPAygwI/R3yK43MHGpQXm6CkrYGynjh
	TvgN8Xf/vNmnfwFb0nhvrRwciw==
X-Google-Smtp-Source: APXvYqwNGN7aXSITyhWfvRwLM4aPftidrQCw1BusxF6GW1Pr8W7hesbu0PtYry4HP5FDQN/wzE3XaA==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr42377006wrm.55.1563523620116; 
	Fri, 19 Jul 2019 01:07:00 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o6sm54867849wra.27.2019.07.19.01.06.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 01:06:59 -0700 (PDT)
Message-ID: <99beb56891c932f2d4efc59dd80ae69f043e5cde.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, "Hongzhi.Song"
	<hongzhi.song@windriver.com>
Date: Fri, 19 Jul 2019 09:06:58 +0100
In-Reply-To: <20190718215132.GD26895@dell5510>
References: <20190717095039.121044-1-hongzhi.song@windriver.com>
	<20190718215132.GD26895@dell5510>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: getrlimit03: adjust-a-bit-of-code-to-compatiable-with mips32
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
X-List-Received-Date: Fri, 19 Jul 2019 08:06:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Petr,

On Thu, 2019-07-18 at 23:51 +0200, Petr Vorel wrote:
> I have to say I prefer policy when only build fixes are backported /
> added. (approach which e.g. buildroot has). Having many patches (25
> atm) makes updating a bit difficult (ok, not that much, 'Upstream-
> Status: Backport' shows what has been merged since last release) and
> sometimes brings users patches which weren't accepted by upstream
> (your mips patch [1] was not accepted [2]).
> 
> But I understand that LTP 3 months release cycle can be to
> slow for some LTP users.

FWIW our policy does vary a lot depending on the upstream. Where we can
have an open dialog with active projects I'm very keen to figure out
how to get our patch set to zero, we really don't want patches.

Backports don't worry me so much because as you say, we clearly mark
them and those are easy to drop upon upgrade.

I see we have an ltp upgrade which looks to remove 50% of the patches
which is a good start. 

That leaves 12 of them, of which 6 are musl and 6 appear to be other
test 'fixes' of various kinds.

Of the other 6, 3 say they're backports, one submitted and two pending.
Figuring out the two pending and the submitted would set us up for a
cleaner upgrade in future outside of musl.

> Kind regards,
> Petr
> 
> PS: I'm slowly working on fixing all musl issues in LTP upstream.
> It's a long term run but were moving towards that goal. Patch "build:
> Add option to select libc implementation" [3] is a nota good
> approach.  Instead it's needed to find for each failure why it's not
> presented in musl.  Mostly because it uses non POSIX features or
> deprecated API, which needs to be avoided or used kernel headers
> where it's available.

This sounds great, I think what we have right now can only be described
as a bit of a hack. It lets us build and run tests but clearly isn't
appropriate to merge upstream. We can at the very least help with
testing and certainly want to drop our patch if/as/when we can.

Also, I'm not sure if you've seen it but our "full" builds now run ltp
for x86 and arm under qemu and report the results:

https://autobuilder.yocto.io/pub/non-release/20190712-13/testresults/testresult-report.txt

(see the Ltp and Ltp Posix sections)

I'm actually quite worried about the numbers of failures we see there.
Up to now I've been focusing on sorting out our ptest results but ltp
would be something we need to focus on next.

There should be more raw log data in 
https://autobuilder.yocto.io/pub/non-release/20190712-13/testresults/qemux86-64-ltp/
and
https://autobuilder.yocto.io/pub/non-release/20190712-13/testresults/qemuarm64-ltp/testresults.json
but I've not had a chance to look at the ltp side of things at all
myself, Armin has done the integration work so far.

Cheers,

Richard





