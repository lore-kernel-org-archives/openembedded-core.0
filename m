Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 863597E741
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 16:10:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n9so2814310wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=XKO+l/n4xKBSp2zEKEXfLXFs/qU2gNud83xawsAkxd8=;
	b=CF13hbZuS6rAVTpuBaG/nGcyWd9Bsn+GoSDzfrLX1du/MD5BZIQvM98QZ3cL8xHt/S
	tY4vUD0LGoL8jGkMFx78C8iNtABYvwCILR9u8Wq/2oFRP2UVJBljBfKuByVNKyIF4lqY
	3sP9lT0PS0btTGAX070YSXHiSrPnjZsoOuXBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XKO+l/n4xKBSp2zEKEXfLXFs/qU2gNud83xawsAkxd8=;
	b=iksWcYsfYRorwuPRD+FvSxbCLlpnlIcAluK7CQ8ImJHjlt8aIrxQt7rcIDE3N00hJn
	YPKiEix7bKipEngNzQ+/pfjp1erMkZR3ypgSxaZMuku80sT1LLwK53UJFcaKsgvcqEnl
	7k3/+AKIUe9EKt5AnbIc497T+fDr3X+57b3BE2RqDhN/1nGJNq5eAxRzKkCsgsEfBM0n
	aCkRoC1E40jgCE1d6N0yRQZAie0RLegM8isZwU41kQ7we+QBiPuQI/7obtpHWFdyG0Vz
	MxMBgnxF4M2VQhJoZbVirKDfGTGOk+Yn+eAsFIpLJepcgmjBqqi7d+ESdNHrAiOyq/np
	URpg==
X-Gm-Message-State: APjAAAWZvziUOIbdYT+m4KlvvNihRPo38KKi51bV1z4n3ESatgUZuuwv
	c1fxtnr4s6yMsyTuzYXDX+inPQ==
X-Google-Smtp-Source: APXvYqwwmW85LJFyG1eO+h8SdYMWs9syMNyLgh2xgKvrWz0QWRfPS83xxc8/aUyx9+OerpAX2T6wuA==
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr9109810wme.9.1562170217192;
	Wed, 03 Jul 2019 09:10:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 18sm2658532wmg.43.2019.07.03.09.10.15
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 09:10:16 -0700 (PDT)
Message-ID: <1008b3f46332ba67abe67586b176bc7f565b11ad.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jul 2019 17:10:14 +0100
In-Reply-To: <20190703150405.GA23280@linux-uys3>
References: <20190703150405.GA23280@linux-uys3>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: build failures due to pigz host tool
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
X-List-Received-Date: Wed, 03 Jul 2019 16:10:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-03 at 11:04 -0400, Trevor Woerner wrote:
> This came up as a topic in yesterday's Engineering Sync meeting. For roughly a
> year I've been seeing random build failures on my Jenkins setup due to pigz
> failing; apparently the project is now seeing them on their builds, so I'll
> share what I know of them.
> 
> At the time I started seeing these failures (Aug 2018) I had just upgraded my
> system to openSUSE 15.0. Since nobody else was seeing them, I assumed they
> were related to my setup. When I went out searching for an answer, I found
> there wasn't very much out there to help me. But I did notice that there were
> reports of other people seeing the issue who weren't using openSUSE and who
> weren't doing anything related to OE builds using Jenkins.
> 
> The build failure looks something like this:
> 
> 	| DEBUG: Executing shell function sstate_create_package
> 	| pigz: abort: internal threads error
> 	| tar: /z/jenkins-workspace/nightly/cubietruck/build/sstate-cache/8a/sstate:linux-mainline:cubietruck-oe-linux-gnueabi:4.19.46:r0:cubietruck:3:8a159ba1ffefb5fc2feeeff5b40abf8ad67658e5ff3ed3bf67d25d9c8f2805e0_package.tgz.9bA8tCje: Wrote only 6144 of 10240 bytes
> 	| tar: Child returned status 16
> 	| tar: Error is not recoverable: exiting now
> 	| WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/cubietruck-oe-linux-gnueabi/linux-mainline/4.19.46-r0/temp/run.sstate_create_package.19996:1 exit 1 from 'exit 1'
> 	| DEBUG: Python function sstate_task_postfunc finished
> 	| ERROR: Function failed: sstate_create_package (log file is located at /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/cubietruck-oe-linux-gnueabi/linux-mainline/4.19.46-r0/temp/log.do_package.19996)
> 	NOTE: recipe linux-mainline-4.19.46-r0: task do_package: Failed
> 	ERROR: Task (/opt/oe/configs/z/jenkins-workspace/nightly/cubietruck/layers/meta-sunxi/recipes-kernel/linux/linux-mainline_4.19.46.bb:do_package) failed with exit code '1'

Thanks, I can at least confirm that is the same error we're seeing on
the autobuilders, in particular on opensuse151 but I think we've seen
it on others.

The exit code of 16 is probably significant, EBUSY or "device or
resource busy". I have a suspicion its coming from some pthread
function.

I suspect a bug in error handling of EBUSY in yarn (a sub piece of
pigz).

> When I first started seeing this problem, I would see it quite frequently.
> Every morning, out of roughly 15 nightly builds, around 4-5 of them would have
> failed in this way. Back then I would also get a lot of errors that would
> report something along the lines of the following:
> 
> 	fork: Resource temporarily unavailable
> 	Cannot spawn thread (?)

I think this is a different bug FWIW.

> I don't have an example of that error on hand, but I used to get a lot of
> those around the same time too.
> 
> My observations are:
> - I've never seen any of these errors with builds that I run by hand, oddly
>   enough, these errors only ever happen to builds that are run by Jenkins. I
>   have no idea if this is just a coincidence, or if there is something going
>   on related to kicking off a build from a large program (Jenkins)
> 
> - Back then these failures were quite frequent. Today, of the 20-ish or so
>   Jenkins builds that are kicked off every night, in a 2-week span I have only
>   2 such failures. So it seems that I've been able to reduce the occurrence
>   rate, but not eliminate it completely

That is about the same rate we're seeing on the autobuilder, its
occasional.

> - I haven't seen the "resource" failure in a while. I don't know if these are
>   two separate issues that just happened to start at the same time, or if
>   they're related in some way.

My guess is two issues exposed by your distro upgrade.

> From what little information I was able to find online, here are the things I
> tweaked (which may or may not have contributed to the reduction in the rate of
> occurrence):
> 
> - At that time, I had been setting a "barrier=6000" on the disk I was using
>   for the builds. I removed that tweak.
> 
> - I edited /etc/systemd/logind.conf and set
> 	UserTaskMax=infinity
> 
> - I edited /etc/systemd/system.conf and set:
> 	DefaultTaskAccounting=no
> 	DefaultTaskMax=infinity
> 
> - I edited /etc/sysconfig/jenkins and added/set:
> 	JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Xmx1g"

These probably fixed the fork issue but not the other.

> Since this build failure is so intermittent, it's quite hard to dig into it.
> As I said above, of the last roughly 280 builds my system has done in the last
> 2 weeks, only 2 such failures occurred.
> 
> It's possible that overriding CONVERSION_CMD_gz in my builds to not use pigz
> would probably fix the issue at the cost of losing the parallelism of the
> sstate_create_package task.
> 
> My host machine's version of pigz is: 2.3.3

We're also only seeing this with 2.3.3 as far as I can see.

The debug patch in master-next hasn't triggered it, there is also a
possibility that its down to uninative though. With uninative applied,
we'd use a different pthread library which may have some bug fixed...

Thanks for the data points, it does help try and narrow things down.

Is there any way you could try pigz 2.4 on your machine, see if the
problem still occurred there? If you do rebuild pigz, could you apply
the debug patch in master-next?

I think I might have to try this on our opensuse151 worker too...

Cheers,

Richard


