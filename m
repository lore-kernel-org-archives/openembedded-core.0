Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6FFC76196
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:25:08 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.91867.1680575102086005076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.41] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 3342P04W007901
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Apr 2023 21:25:01 -0500
Message-ID: <51ba3bfc-caa0-0a31-c295-e59c8416e672@kernel.crashing.org>
Date: Mon, 3 Apr 2023 21:24:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: mesa-native fails on master
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179657

It's been a few weeks since I last built master, but starting with today's pull 
I'm getting errors building mesa-native -- which pretty much kills the whole build.

I'm on an Ubuntu 18.04 host, and have the 'buildtools-tarball' from the last 
4.1.3 loaded so I can get to the minimum version of python to run a build.

(I tried with buildtools-tarball-extended and that DOES appear to work.  If this 
is expected, you can ignore the rest of this.  But I expected the system to 
complain before trying to build everything if the compiler wasn't new enough.)


The error is:

brw_simd_selection.cpp:205:7: sorry, unimplemented: non-trivial designated 
initializers not supported


The host gcc is 7.5.0

What is strange is I had 2 successful builds, and then it started failing.  All 
fresh builds.  I've no idea why one was successful and the others failed.  I'm 
wondering if maybe there is some sort of race in mesa, but lowered my parallel 
build (-j) to 1 and I'm still getting it.


Reproducer:

git clone https://git.yoctoproject.org/poky

cd poky

wget 
http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/buildtools/x86_64-buildtools-nativesdk-standalone-4.1.3.sh

bash x86_64-buildtools-nativesdk-standalone-4.1.3.sh -d buildtools -y

. ./buildtools/environment-...

. ./oe-init-build-env

bitbake mesa-native



