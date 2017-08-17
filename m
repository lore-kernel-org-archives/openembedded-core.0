Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 72A8F784F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 13:20:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 17 Aug 2017 06:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,387,1498546800"; d="scan'208";a="124737870"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2017 06:20:43 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Mark Hatle <mark.hatle@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
	<1502890461.13978.127.camel@linuxfoundation.org>
	<e285fe7c-320d-db44-98fd-ff1d06df5706@windriver.com>
	<d01a078c-ad1a-2979-3fc2-fc5d4052ae02@linux.intel.com>
	<3d6ca1eb131841adac87ed6bbbe1b769@XBOX02.axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cdc04bd4-bde2-9e0e-80cb-d93327f7338a@linux.intel.com>
Date: Thu, 17 Aug 2017 16:17:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3d6ca1eb131841adac87ed6bbbe1b769@XBOX02.axis.com>
Subject: Re: [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Thu, 17 Aug 2017 13:20:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/17/2017 04:01 PM, Peter Kjellerstedt wrote:

> The problem we have, which caused me to look into this, is:
> 
> We unfortunately have a lot of unversioned libraries, e.g.,
> "libfoo.so" instead of "libfoo.so.1.2.3". There is no problem
> building these (except we need to work around OE's default of
> putting *.so in ${PN}-dev rather than ${PN}). However, when rpm
> creates the packages for the applications linked with these
> libraries, it fails to automatically determine these runtime
> dependencies. However, since there are no errors, what then
> happens is that the image is created, lacking most of our
> libraries, which of course leads to the image failing to boot
> when applications cannot find the libraries they need...

Thanks. The problem with relying on rpm for this discovery is that this 
mechanism is not used anywhere in oe-core. I may update rpm to 4.14 and 
again break this stuff without noticing. I'd say it's better if you fix 
oe-core's code to discover those in the same way versioned libraries are 
discovered.


Alex

