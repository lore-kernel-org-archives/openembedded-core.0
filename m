Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4033A7949C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:12:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w868Cj1H029805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 01:12:46 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 01:12:45 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57018506-c661-a554-01a9-42f4de2cabb9@windriver.com>
Date: Thu, 6 Sep 2018 16:15:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/8] python: Run pybench once for optimisation task in pgo
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
X-List-Received-Date: Thu, 06 Sep 2018 08:12:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP,

On 09/06/2018 12:52 AM, Richard Purdie wrote:
> From: Ross Burton <ross.burton@intel.com>
> 
> There is no good reason to loop 10 times on the test since the profile
> optimisation won't change between runs, we don't need/want a statistical
> average. This is just burning cpu cycles, just make 1 run.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/python/python3_3.5.5.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
> index bfe91fb1c71..8afe15eee6a 100644
> --- a/meta/recipes-devtools/python/python3_3.5.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.5.bb
> @@ -74,7 +74,7 @@ TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
>   SDK_CC_ARCH += "-DNDEBUG -fno-inline"
>   EXTRA_OEMAKE += "CROSS_COMPILE=yes"
>   EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip --enable-optimizations"
> -PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 10"
> +PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 1"

What's the fault if I don't run it, please ? This is very slow, here are some
rough thoughts to speed it up:

1) Make it optional to run, and default to no if there isn't any faults without 
running it.

2) Use qemu-kvm to run the tests if qemu kvm has been setup (I tried it, it can
    reduce form 12m -> 4m, saved 8 mins:
    * Without kvm
      $ bitbake python3 -ccleansstate && time bitbake python3
      real    12m28.070s
      user    0m1.316s
      sys     0m0.184s

    * With kvm:
    real    3m53.781s
    user    0m1.080s
    sys     0m0.220s

   We may need a oe-core/scripts/qemu-kvm-check to check strictly whether kvm
   can be used or not.

Please feel free to give your comments.

// Robert

>   
>   export CROSS_COMPILE = "${TARGET_PREFIX}"
>   export _PYTHON_PROJECT_BASE = "${B}"
> 

