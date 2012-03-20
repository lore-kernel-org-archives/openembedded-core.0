Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SA0iW-0003xb-HG
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 16:11:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2012 08:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119577118"
Received: from unknown (HELO envy.home) ([10.255.15.194])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2012 08:02:26 -0700
Message-ID: <4F689BD8.4040201@linux.intel.com>
Date: Tue, 20 Mar 2012 08:01:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332202974-27977-1-git-send-email-denis@denix.org>
In-Reply-To: <1332202974-27977-1-git-send-email-denis@denix.org>
X-Enigmail-Version: 1.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 15:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/19/2012 05:22 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Replace dependency on eglibc with virtual/libc
> Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Thanks Denys,

Looking through the rt-tests sources I don't see TARGET_CC_ARCH
anywhere. Have you confirmed that changes made there make their way into
the actual build?

What was the problem you ran into?

--
Darren

> ---
>  meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> index 6425027..3755c79 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Real-Time preemption testcases"
>  HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
>  SECTION = "tests"
> -DEPENDS = "linux-libc-headers eglibc"
> +DEPENDS = "linux-libc-headers virtual/libc"
>  LICENSE = "GPLv2 & GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                      file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
> @@ -11,13 +11,13 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
>  
>  # git -> 0.83 needs a PE bump
>  PE = "1"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
>  
>  S = "${WORKDIR}/git"
>  
> -CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli ${LDFLAGS}"
> +TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  # calling 'uname -m' is broken on crossbuilds
>  EXTRA_OEMAKE = "NUMA=0"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


