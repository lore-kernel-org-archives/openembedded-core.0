Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A76737017D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 13:45:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2016 06:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,575,1473145200"; d="scan'208";a="25737986"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 31 Oct 2016 06:45:56 -0700
To: Nathan Lynch <Nathan_Lynch@mentor.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
	<a47281b1272e238a4eeda7a034dfda9c02e5f089.1477667287.git.alexander.kanavin@linux.intel.com>
	<c39f2013-9bad-9e64-d2b8-721db94001a0@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c3dd23a6-a778-2b02-0a4d-ef37624f5896@linux.intel.com>
Date: Mon, 31 Oct 2016 15:43:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <c39f2013-9bad-9e64-d2b8-721db94001a0@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 24/26] lttng-tools: do not install manpages in ptest package
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
X-List-Received-Date: Mon, 31 Oct 2016 13:45:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/2016 09:46 PM, Nathan Lynch wrote:
> This actually breaks running the lttng-tools test suite on the target:
>
> root@qemux86-64:/usr/lib/lttng-tools/ptest# cat run-ptest
> #!/bin/sh
> # Without --ignore-exit, the tap harness causes any FAILs within a
> # test plan to raise ERRORs; this is just noise.
> makeargs="LOG_DRIVER_FLAGS=--ignore-exit"
> make -t all >/dev/null 2>&1 && exec make -s $makeargs check 2>/dev/null
>
> root@qemux86-64:/usr/lib/lttng-tools/ptest# sh -x run-ptest
> + makeargs=LOG_DRIVER_FLAGS=--ignore-exit
> + make -t all
>
> root@qemux86-64:/usr/lib/lttng-tools/ptest# echo $?
> 2
>
> root@qemux86-64:/usr/lib/lttng-tools/ptest# make -s -t all
> make[2]: *** No rule to make target 'lttng-health-check.3', needed by
> 'all-am'.  Stop.
> make[1]: *** [Makefile:537: all-recursive] Error 1
> make: *** [Makefile:570: all-recursive] Error 1
>
>
> I'd rather see "do not install shared libraries in ptest package" go in
> first as it fixes an existing problem without regressing lttng-tools-ptest.
>
> I'm looking at reworking do_install_ptest to do a selective copy, as you
> suggested earlier, so maybe just drop this patch?

Thanks for checking. This hasn't yet made it to master, so it could 
simply be dropped from master-next. If this doesn't happen, I'll submit 
a revertion patch.

Alex


