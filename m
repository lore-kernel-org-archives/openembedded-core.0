Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 77BC87F8CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 17:34:21 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xAIHYKvv015040
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 11:34:21 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
References: <20191118171730.153048-1-mark.hatle@kernel.crashing.org>
Message-ID: <878a811e-0649-e67e-159f-97de89fa5909@kernel.crashing.org>
Date: Mon, 18 Nov 2019 11:34:19 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191118171730.153048-1-mark.hatle@kernel.crashing.org>
Subject: Re: [PATCH 0/1] Add PREFIX and EXEC_PREFIX to gccrelocprefix section
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
X-List-Received-Date: Mon, 18 Nov 2019 17:34:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/18/19 11:17 AM, Mark Hatle wrote:
> I have an unusual use-case that requires me to move the location of gcc.
> As part of this, I noticed that the built-in include paths were not being
> runtime relocated, while other paths were.  It turns out this was becaue
> PREFIX/EXEC_PREFIX were being used as defined at build time, but the other
> prefixes were being used as relocated at SDK install time.
> 
> The patch set corrects this and adds PREFIX/EXEC_PREFIX to the list.  There
> is no test case for this, as I'm not sure how we could ever test this with
> the standard OE SDKs.
> 
> The way I tested this code change was:
> 
> bitbake meta-toolchain
> 
> install the SDK
> 
> wrap all of the executables in the HOST sysroot with:
> 
> exec <LDSO> --library-path <LIBPATH>:<LIBBASEPATH> <executable> $@
> 
> mv the 'installed' version else where and then build a simple hellow world
> application.
> 
> Doing this before the change resulted in 'unable to find <stddef.h>', after
> the change it works as expected.  Use the '-v' to inspect what it was doing
> it was clear that runtime relocation was NOT relocating the system include
> paths before the change.

Forgot to mention, I also tested this using the regular approach of sourcing the
environment file, and compiling using $CC.  :)

--Mark

> Mark Hatle (1):
>   gcc-9.2: Update the relocation patch to add PREFIX/EXEC_PREFIX
> 
>  ...le-sysroot-support-for-nativesdk-gcc.patch | 185 +++++++++++++++---
>  1 file changed, 159 insertions(+), 26 deletions(-)
> 

