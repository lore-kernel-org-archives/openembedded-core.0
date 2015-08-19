Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3AD73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 19:59:11 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZS9ea-00027B-UB from Nathan_Lynch@mentor.com ;
	Wed, 19 Aug 2015 13:08:08 -0700
Received: from [172.30.80.73] (147.34.91.1) by SVR-ORW-FEM-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 12:59:10 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1440006296-15277-1-git-send-email-raj.khem@gmail.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <55D4E00C.9060601@mentor.com>
Date: Wed, 19 Aug 2015 14:59:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1440006296-15277-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-arch: Force BFD kernel when using gcc for linking
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
X-List-Received-Date: Wed, 19 Aug 2015 19:59:11 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 08/19/2015 12:44 PM, Khem Raj wrote:
> We redefine LD to point to ld.bfd when building kernel, which works in
> most cases since kbuild system calls out for bare LD most of the time,
> however some of newer kernels e.g. 4.1+ have some code added which can
> call gcc directly to do the linking job e.g. arm vdso code
> 
> This causes build failures when we have configured the default cross
> toolchain to use gold linker as default. Errors like
> 
> BFD: arch/arm/vdso/vdso.so: Not enough room for program headers, try
> linking with -N
> | arm-angstrom-linux-gnueabi-objcopy:arch/arm/vdso/vdso.so[.hash]: Bad
> value
> 
> start happening.
> 
> With this patch we force gcc to choose bfd linker as well


This is fixed upstream as of:

commit d2b30cd4b7223a96e606dfc8120626f66d81e091
Author: Nathan Lynch <nathan_lynch@mentor.com>
Date:   Wed Jun 3 00:41:15 2015 +0100

    ARM: 8384/1: VDSO: force use of BFD linker

which should make it to 4.1-stable soon.


