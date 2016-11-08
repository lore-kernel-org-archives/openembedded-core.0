Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68A8A6067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 06:14:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA86Eghi017582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2016 22:14:42 -0800 (PST)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 7 Nov 2016 22:14:42 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1478487736-115662-1-git-send-email-li.zhou@windriver.com>
From: "Zhou, Li" <li.zhou@windriver.com>
Message-ID: <42194f13-8e2c-1baf-faf5-b8d2c7a46c2c@windriver.com>
Date: Tue, 8 Nov 2016 14:13:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1478487736-115662-1-git-send-email-li.zhou@windriver.com>
Subject: Re: [PATCH version2] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Tue, 08 Nov 2016 06:14:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping


On 11/07/2016 11:02 AM, Li Zhou wrote:
> The swpb in macro MUTEX_SET will cause "undefined instruction" error
> on the new arm arches which don't support this assembly instruction
> any more. If use ldrex/strex to replace swpb, the old arm arches don't
> support them. So to avoid this issue, just disable the ARM assembler
> mutex code, and use the default pthreads mutex.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>   meta/recipes-support/db/db_6.0.35.bb | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/meta/recipes-support/db/db_6.0.35.bb b/meta/recipes-support/db/db_6.0.35.bb
> index f60edf9..b1bec0e 100644
> --- a/meta/recipes-support/db/db_6.0.35.bb
> +++ b/meta/recipes-support/db/db_6.0.35.bb
> @@ -77,15 +77,6 @@ do_configure() {
>   	oe_runconf
>   }
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
>   EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
>   EXTRA_OEMAKE += "STRIP=true docdir=${docdir}/db/"
>   

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


