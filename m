Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 02A546FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 18:46:13 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1c0CAQ-0007b9-9K from Nathan_Lynch@mentor.com ;
	Fri, 28 Oct 2016 11:46:14 -0700
Received: from [172.30.80.120] (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 28 Oct 2016 11:46:11 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
	<a47281b1272e238a4eeda7a034dfda9c02e5f089.1477667287.git.alexander.kanavin@linux.intel.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <c39f2013-9bad-9e64-d2b8-721db94001a0@mentor.com>
Date: Fri, 28 Oct 2016 13:46:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <a47281b1272e238a4eeda7a034dfda9c02e5f089.1477667287.git.alexander.kanavin@linux.intel.com>
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
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
X-List-Received-Date: Fri, 28 Oct 2016 18:46:14 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/28/2016 10:12 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-kernel/lttng/lttng-tools_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
> index 016346f..18259e4 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
> @@ -113,4 +113,7 @@ do_install_ptest () {
>  	# checkpatch.pl is unneeded on target and causes file-rdeps QA
>  	# warnings.
>  	rm -f ${D}${PTEST_PATH}/extras/checkpatch.pl
> +
> +        # Remove manpages if they are built
> +        rm -f ${D}${PTEST_PATH}/doc/man/*.[0-9]
>  }


This actually breaks running the lttng-tools test suite on the target:

root@qemux86-64:/usr/lib/lttng-tools/ptest# cat run-ptest
#!/bin/sh
# Without --ignore-exit, the tap harness causes any FAILs within a
# test plan to raise ERRORs; this is just noise.
makeargs="LOG_DRIVER_FLAGS=--ignore-exit"
make -t all >/dev/null 2>&1 && exec make -s $makeargs check 2>/dev/null

root@qemux86-64:/usr/lib/lttng-tools/ptest# sh -x run-ptest
+ makeargs=LOG_DRIVER_FLAGS=--ignore-exit
+ make -t all

root@qemux86-64:/usr/lib/lttng-tools/ptest# echo $?
2

root@qemux86-64:/usr/lib/lttng-tools/ptest# make -s -t all
make[2]: *** No rule to make target 'lttng-health-check.3', needed by
'all-am'.  Stop.
make[1]: *** [Makefile:537: all-recursive] Error 1
make: *** [Makefile:570: all-recursive] Error 1


I'd rather see "do not install shared libraries in ptest package" go in
first as it fixes an existing problem without regressing lttng-tools-ptest.

I'm looking at reworking do_install_ptest to do a selective copy, as you
suggested earlier, so maybe just drop this patch?


