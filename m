Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 7114B730CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 07:52:55 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id E032168A01C; Thu,  9 Mar 2017 07:52:55 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 69ABE68A019;
	Thu,  9 Mar 2017 07:52:55 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 76D576740222;
	Thu,  9 Mar 2017 08:52:54 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
References: <20170308064023.27986-1-raj.khem@gmail.com>
Message-ID: <81d930ff-2eff-16dd-126b-864f4dbfc1c9@mlbassoc.com>
Date: Thu, 9 Mar 2017 08:52:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170308064023.27986-1-raj.khem@gmail.com>
Subject: Re: [PATCH V9] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Thu, 09 Mar 2017 07:52:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-08 07:40, Khem Raj wrote:
> * This is converging the recipes for go from
>   meta-virtualization and oe-meta-go
>
> * Add recipes for go 1.7
>
> * go.bbclass is added to ease out writing
>   recipes for go packages
>
> * go-examples: Add an example, helloworld written in go
>   This should serve as temlate for writing go recipes
>
> * Disable for musl, at least for now
>
> * Disable for x32/ppc32 which is not supported
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
   <snip>

This is looking pretty good now.  I built go & go-helloworld easily
with no warnings, etc.  'go-helloworld' runs fine on my target.

However, there don't seem to be any packages for the target created
by the 'go' recipe:

$ ls tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go/1.8-r0
armhf-elf-header.patch         go               pseudo                             syslog.patch
build-tmp                      gotooldir.patch  recipe-sysroot                     sysroot-destdir
fix-cc-handling.patch          image            recipe-sysroot-native              temp
fix-target-cc-for-build.patch  license-destdir  split-host-and-target-build.patch

I manually copied the 'image' directory (which obviously has a lot
of stuff not designed to be on my target board) to my target and
'go' seems to run there.

There is a need for RRECOMMENDS = "git-perltools" once this packaging is set:

~# go get golang.org/x/tour/gotour
go: missing Git command. See https://golang.org/s/gogetcmd
package golang.org/x/tour/gotour: exec: "git": executable file not found in $PATH

I ran through the tour (above) and things seemed to go well.

All in all, looking better.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

