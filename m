Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 073EA6CF1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 13:40:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rALDe7of009255
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 05:40:07 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 21 Nov 2013 05:40:06 -0800
Message-ID: <528E0D2D.4010202@windriver.com>
Date: Thu, 21 Nov 2013 21:39:57 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1384419666.git.hongxu.jia@windriver.com>
	<ac4248f073a505534a6fc9b7c9922b6781b85685.1384419666.git.hongxu.jia@windriver.com>
In-Reply-To: <ac4248f073a505534a6fc9b7c9922b6781b85685.1384419666.git.hongxu.jia@windriver.com>
Cc: saul.wold@intel.com
Subject: [RFC PATCH 1/1] lib32-packagegroup-core-nfs: fix qa issue - install files into a shared area when those files already exist
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
X-List-Received-Date: Thu, 21 Nov 2013 13:40:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

In this case, there are two 'packagegroup-core-nfs-server-1.0-r2.0.all.rpm'
in tmp/deploy/rpm/all. One is made by 'bitbake packagegroup-core-nfs ',
and the other is made by 'bitbake lib32-packagegroup-core-nfs '.
The last one overrode the previous triggered the QA check.

By default, packagegroup inherit allarch, which means the PACKAGE_ARCH
is "all".

Is it proper that 'all' packages are not supposed to be expanded into the
multilib versions?

There are some other packagegroup recipes have the similar issue.

//Hongxu

On 11/14/2013 05:02 PM, Hongxu Jia wrote:
> By default, packagegroup-core-nfs do not depend on a certain architecture,
> there will be qa warning while multilib enabled.
>
> $ bitbake packagegroup-core-nfs
> $ bitbake lib32-packagegroup-core-nfs
> ...
> WARNING: The recipe lib32-packagegroup-core-nfs is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
> tmp/deploy/rpm/all/packagegroup-core-nfs-server-1.0-r2.0.all.rpm
> Matched in manifest-allarch-packagegroup-core-nfs.deploy-rpm
> Please verify which package should provide the above files.
> ...
>
> Set PACKAGE_ARCH with MACHINE_ARCH fixed this issue.
>
> [YOCTO #5532]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-core-nfs.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> index 531eceb..b57ef63 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> @@ -7,6 +7,7 @@ LICENSE = "MIT"
>   PR = "r2"
>   
>   inherit packagegroup
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   PACKAGES = "${PN}-server"
>   


