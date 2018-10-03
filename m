Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id EF03974E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 01:40:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2018 18:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,334,1534834800"; d="scan'208";a="78003736"
Received: from hgpavank-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.79.21])
	by orsmga007.jf.intel.com with ESMTP; 02 Oct 2018 18:40:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 03 Oct 2018 14:40:50 +1300
Message-ID: <3055606.kz0EKk41BX@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <20181003004405.34524-1-raj.khem@gmail.com>
References: <20181003004405.34524-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] mesa: Disable asm on musl
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
X-List-Received-Date: Wed, 03 Oct 2018 01:40:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 3 October 2018 1:44:05 PM NZDT Khem Raj wrote:
> Musl started blocking dlopen of libs with initial-exec references into
> dynamic TLS area, via
> 
> https://github.com/kraj/musl/commit/5c2f46a214fceeee3c3e41700c51415e0a4f1acd
> 
> prior to that commit, musl was loading it and silently letting
> subsequent TLS accesses via the miscompiled code clobber memory that
> didn't belong to them
> 
> This was wrong behavior and it relied on additional space reserved by
> libc in TLS space to adjust fo such broken libs, but it also fails
> with glibc if the reserved space was already used up
> 
> Right fix is that  mesa should be patched to remove all the
> initial-exec hacks and use real TLS, and -mtls-dialect=gnu2 (TLSDESC)
> should be used on archs it's supported on (i386, x86_64, and aarch64)
> to make up for the lost performance, but mesa hardcodes the initial-exec,
> so there must be a reason that probably is better known to mesa devs.
> 
> but we 'fixed' it for musl by adding --disable-glx-tls for mesa in OE,
> which uses pthread_getspecific instead and makes is lot slower.
> 
> this caused additional problems with security flags on, it get textrels
> in .text segment. Therefore this is 'second fix' to get us through this
> warning.
> 
> Cause is some unknown part of mesa's x86 assembly code is broken by
> readonly text segments

That's excellent, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



