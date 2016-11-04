Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07A1E71B4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 09:43:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA49hgx7004811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Nov 2016 02:43:42 -0700 (PDT)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 4 Nov 2016 02:43:42 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20161104090719.30795-1-li.zhou@windriver.com>
From: "Zhou, Li" <li.zhou@windriver.com>
Message-ID: <4acbc1de-ec1c-92a8-6d58-8f436eb23b66@windriver.com>
Date: Fri, 4 Nov 2016 17:43:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20161104090719.30795-1-li.zhou@windriver.com>
Subject: Re: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 04 Nov 2016 09:43:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Some more explanations:

Berkeley DB's assembly mutex code for arm is related with arm arch version.

The old version DB code uses old arm instruction (such as swpb), which 
isn't supported by new arm arch (such as armv7).

The new version DB (maybe from 6.1.29 or 6.1.26) uses new arm 
instruction (such as ldrex/strex), which isn't supported by old arm arch 
(such as armv5).

To support all the arm arches, and consider that the Berkeley DB code 
will upgrade in the future, I suggest disable the ARM assembler mutex 
code, and use the default pthreads mutex.

Thanks.
Zhou Li

On 11/04/2016 05:07 PM, Li Zhou wrote:
> The swpb in macro MUTEX_SET will cause "undefined instruction" error
> on the new arm arches which don't support this assembly instruction
> any more. If use ldrex/strex to replace swpb, the old arm arches don't
> support them. So to avoid this issue, just disable the ARM assembler
> mutex code, and use the default pthreads mutex.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>   meta/recipes-support/db/db_6.0.30.bb | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
> index 50a469b..2d08b5e 100644
> --- a/meta/recipes-support/db/db_6.0.30.bb
> +++ b/meta/recipes-support/db/db_6.0.30.bb
> @@ -74,15 +74,6 @@ DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
>   
>   EXTRA_OECONF = "${DB6_CONFIG} --enable-shared --enable-cxx --with-sysroot"
>   
> -# Override the MUTEX setting here, the POSIX library is
> -# the default - "POSIX/pthreads/library".
> -# Don't ignore the nice SWP instruction on the ARM:
> -# These enable the ARM assembler mutex code
> -ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
> -MUTEX = ""
> -MUTEX_arm = "${ARM_MUTEX}"
> -MUTEX_armeb = "${ARM_MUTEX}"
> -EXTRA_OECONF += "${MUTEX}"
>   EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
>   
>   # Cancel the site stuff - it's set for db3 and destroys the

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


