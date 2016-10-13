Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AB29B71A04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 03:23:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 12 Oct 2016 20:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,338,1473145200"; d="scan'208";a="1064115062"
Received: from ychiu-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.183.245])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2016 20:23:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Oct 2016 16:23:21 +1300
Message-ID: <3373280.EktDFKHOVZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.6-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <7066324.XsME15mTTJ@peggleto-mobl.ger.corp.intel.com>
References: <20161012132615.GC2923@jama>
	<7066324.XsME15mTTJ@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK_OLDEST_KERNEL vs OLDEST_KERNEL
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
X-List-Received-Date: Thu, 13 Oct 2016 03:23:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 13 Oct 2016 09:38:08 Paul Eggleton wrote:
> On Wed, 12 Oct 2016 15:26:15 Martin Jansa wrote:
> > is this separate variable working correctly?
> > 
> > It was introduced in:
> > commit 522ba4c51fff53566678b2689d0d63c393e417b3
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Fri Sep 11 13:25:46 2015 +0100
> > 
> >     populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues
> >     
> >     aarch64 sets OLDEST_KERNEL to 3.14. This stops the aarch64 SDK
> > 
> > installing on anything with an older kernel which is clearly incorrect.
> > 
> >     I attempted to extract the correct non-overridden version from the
> >     data
> > 
> > store but it proved problematic and I was running into data store issues.
> > Those are a separate problem but there isn't time to fix this right now.
> > 
> >     Instead just code the SDK kernel version separately to work around
> >     this
> > 
> > for now (and fix the autobuilder tests and SDK usage).
> > 
> > But when I'm using:
> > OLDEST_KERNEL = "3.2" (default)
> > SDK_OLDEST_KERNEL = "2.6.32"
> > because we would like to use SDK on host with older kernel, then
> > SDK_OLDEST_KERNEL helped to bypass the uname check in environment-setup
> > script, but then gcc cannot be used, because it fails immediately with:
> > 
> > FATAL: kernel too old
> > 
> > So I'm not sure what this variable are trying to achieve, maybe
> > autobuilder
> > tests were only testing setup script and not the actual $CC?
> > 
> > The other option is that it works only when sdk toolchain is built with
> > default OLDEST_KERNEL (which is lower than OLDEST_KERNEL_aarch64) and only
> > target bits use OLDEST_KERNEL_aarch64, but those aren't executed on host
> > using SDK.
> 
> I'm not sure how this ever could have worked, since it doesn't enter into
> the nativesdk-glibc configuration. It seems to me that the glibc recipe
> needs to be using SDK_OLDEST_KERNEL in place of OLDEST_KERNEL for
> class-nativesdk.

Thinking about it - even if that were fixed, would setting it to 2.6.32 
actually work on master? We are now using glibc 2.24 and that requires a 
minimum kernel version of 3.2.0.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

