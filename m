Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id F2ED87CECA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 15:58:06 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id k20so3625148ios.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 08:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=9MZrrsS1D+rZzE74sRdneMxT2Ppya+c/haetCCB08+g=;
	b=VEwCYqZ8ee5aycnvAqjnblvp64Rvs/8x507+E1n1qliycnJukRumPqiMBS12F99ANx
	LrKex/sJJtFCav02V9T8k4fQjsQoUJgS3PVD3PmA4zMXQRxc7jghE/Lol/0W/FTUkWmF
	37puN6vOA+yxSu0Ye2gkYkKk585442M5PGsqqTfMnQ9garULPijsr2wqV3aEsWLEmCjo
	Dy28WZhDFwblI3CuH4EH2r/nTJsY7FQkGs+2nojDLjcuJQc4KcNmpDh2GMvXGkZJp4WB
	I2kTtK/3cIf7kvbWJCV2q0v4h7cpBcJrUpVHYpF5W8tbx7RPQIfDd7WROyutj1P4RuUj
	tJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=9MZrrsS1D+rZzE74sRdneMxT2Ppya+c/haetCCB08+g=;
	b=PGftufU6jY6zEBIrFMGAUUi2YiLJ7bdBgzzOago8OsEhYFoygpZC4cWuuKzHMTtuXW
	GWWtY8deta0X2y6iMPB0H4auHA5CVZQSeegN3w/uHJ/Qw3fWXOedqRNEBaCRt8YCR1Zd
	R71+WIyylQy1axwWDHiq7zAgvqUGbOmUpkCUHA9WprM7JYeFGY9VQzRSbUNXklVgUsFm
	F/RuurIFVb4EML7d9VqnxOdIcDOKaWGdITQogkrdYQj8g5U3iRW3U558D3kzB7ZsRbKf
	aWbNyObJj6NyoiOfWggWtmjVYXg8q0zzC5e1h/sv1BN8JcHUh3E/ks9/jHPQvcn8rPPi
	CrSQ==
X-Gm-Message-State: APjAAAV28Gkqtz/z0QGXZu/WmqbiRNj1IZW5DDo3Q0cH8HukjLRDnnfP
	yVcPm6HWoGH8+xkh0uYc6L9MpjKW
X-Google-Smtp-Source: APXvYqxD71ra3wdcpss8DQqqLUYL/NKNtO4NW42+Ch7urym6acTmCxqG1FoEh2yYyddptoDriDEDjw==
X-Received: by 2002:a5e:8a05:: with SMTP id d5mr4985515iok.147.1561996686725; 
	Mon, 01 Jul 2019 08:58:06 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	r24sm8929997ioc.76.2019.07.01.08.58.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jul 2019 08:58:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
Date: Mon, 1 Jul 2019 10:58:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Subject: The state of reproducible Builds
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
X-List-Received-Date: Mon, 01 Jul 2019 15:58:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

All,

I've been working on making OE builds reproducible (that is, two given 
builds can have binary-identical outputs). The current "test" for 
reproducibility involves building core-image-minimal in two different 
build directories, then doing a binary diff of the resulting target 
Debian packages files and reporting if any of them differ (I'd like to 
expand this test, see below). I believe that we are very close to 
achieving this level of reproducibility, with a few caveats as shown below:

1. Both builds must be clean builds from scratch

2. Neither build can use sstate (sstate isn't currently reproducible for 
a variety of reasons, more on that later)

3. The QA test for reproducibility takes about 4 hours on my 4/8 core 
i7-3770 CPU @ 3.40GHz. I'm not sure how "expensive" a test has to be 
before it can't reasonably be run on the autobuilders, but I'm guessing 
this isn't a QA test that would currently be able to be run very often 
(if at all). If sstate were reproducible, this would effectively be cut 
in half, since you would only need one clean build from scratch (if that 
would even matter).


The current test is obviously deficient in a few areas, but I believe 
that is at the very least a good starting point since it has already 
uncovered numerous reproducibility issues. The places where I think it 
needs to be improved are:

1. Testing RPM and IPK package formats. I think RPMs will be pretty 
easy; IPKs might be more challenging since AFAIK the tools that make 
them don't generate reproducible output to begin with.

2. Testing more images than core-image-minimal; This should be pretty 
straight forward to add to the QA test, it's mostly a matter of fixing 
all the issues that come up.

3. Test for binary reproducible images (e.g. check that the entire ext4 
image produced is binary identical). This one also might be pretty easy 
for some formats, and hard for others (e.g. ext4 I think would be easy, 
squashfs might be hard).

4. Improve the test to better test timestamp changes. Currently, the QA 
test runs the two test builds serially which ensures that they have a 
different datestamp when building. However, there are some packages that 
are not reproducible based on only the Day, Month, or Year, neither of 
which is likely to be different between the two serial test builds. I 
would like to figure out a way to force one of the builds to be 
separated by a sufficient about of time to tease out these issues. This 
might be as easy as running bitbake under faketime, or it might be more 
involved.

5. I don't know if anyone is clamoring for reproducible nativesdk builds?

6. We should also be testing if sstate objects are reproducible, 
otherwise sstate can't really be relied on when doing a reproducible 
build (In fact, I think the original reproducible build work that I took 
over was focused on making sstate reproducible).


I think that OE has some significant advantages in being able to make 
reproducible builds compared to other projects attempting the same 
thing; primarily, we are capable of building up all (or most) of the 
required build tools internally, then using these internal tools to 
build up the target (e.g. we build GCC for the target, then use this 
built GCC to compile target source). This means that we have a great 
opportunity to isolate the build from the host environment and truly 
achieve "simple" reproducible builds; any given set of layers at their 
respective SHA's should be able to build a binary identical output on 
any given host, with (ideally) no dependency on the host. We can't do 
this today, and I've identified a number of roadblocks that will need to 
be resolved (this is not a complete list; there will be more):

1. HOSTTOOLS differences. There are a lot of tools listed in HOSTTOOLS, 
and unfortunately some of them have version dependent output and are 
used for target builds (the one I've currently stumbled upon is pod2man, 
but I'm sure there are others). Unfortunately, one could probably argue 
that HOSTTOOLS is somewhat antithetical to the above statement, at least 
in regard to target builds. Any host tool output that "leaks" into the 
target build output can result in a non-reproducible build across hosts, 
and possibly should be avoided; the alternative is to use (or mandate) 
the corresponding -native recipe that provides that tool as a DEPENDS so 
that the controlled internally built version is used instead. Note that 
this only really applies target builds, not -native (or nativesdk right 
now). -native recipes would obviously need more HOSTTOOLS to help 
bootstrap the system. I suspect this would require reworking how 
HOSTOOLS works so that they can be split into two categories somehow; 
the tools that have "ubiquitous and stable" interfaces and are fine for 
all recipes (e.g. cat, sed, true, rm, etc.) and those that are variable 
and should only be used for -native builds (e.g. pod2man, rpcgen(?), 
chrpath(?), tar(?)... others?). Anyone have thoughts on this?

2. sstate currently isn't reproducible. This is at least partially 
related to the why non-clean rebuilds aren't reproducible[1]. These two 
are related because AFAIK there isn't really anyway of knowing if an 
sstate object came from a clean build of a recipe or a rebuild of a 
recipe, so as long as rebuilds aren't reproducible, neither will sstate 
be reproducible. The simplest fixes for these problems is to add more 
-native tools to DEPENDS if they are used by the builds so that are 
"stable" across all the tasks where it matters, but there might also be 
some more "tricky" things that can/should be done with RSS to help 
mitigate the problem. The HOSTTOOLS issue also makes sstate 
non-reproducible, since AFAIK, there isn't necessarily a way to ensure 
that a sstate object came from a specific host. In fact, I would 
speculate that most core reproducibility issues will also make sstate 
non-reproducible. Reproducible sstate also plays directly into hash 
equivalence, since it is based on sstate and would be *much* more 
effective if sstate were reproducible.


Many of the remaining problems can be solved by adding more -native 
recipes to DEPENDS, but this has meet with some (justified) push back; 
doing this things will likely increase the build time since more -native 
dependencies will mean more -native tools have to be built, and more 
serialization of the builds waiting for those tools to be built. I 
suspect this is more true for replacing HOSTTOOLS with -native recipes, 
since many of them may not have needed to be built at all. For the 
sstate/rebuild reproducibility this is likely to have less impact since 
those recipes were going to eventually have been built to be included in 
RSS. Adding them to DEPENDS just moves them to be included sooner.


I'm curious what people thing about all this; How important is 
reproducibility? How reproducible do we want to be? How hard should it 
be to have reproducible builds? What trade-offs are willing to be made 
for reproducible builds? Are there smart ways we can mitigate some of 
the potential performance impacts of reproducible builds?


Thanks for your time. I know this was a long e-mail.

Joshua Watt

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13378




