Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A348C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 15:49:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.12287.1752162591401501817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 08:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rDdQ+36Y;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56AFnooC1200995;
	Thu, 10 Jul 2025 10:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752162590;
	bh=GyEo6bC08RgcS6b8tNoUMIza4EX+Ig7N4dk8BYkzTco=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=rDdQ+36YDR48rkO/9ol8mOip0TT5UUYghN+AaNezb5uVqK/oJfMFaE9CFurr89PND
	 62Eb62Ll1NomjG2GWkxnCgZvd7lJ2NKuhnaJiKFs76L6yksOkyn3XtFyNexjluFyTN
	 Ic+5cFbH09QRwjksHpQV1rVWK2dUsSaiWCZtApPU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56AFnoUV303414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 10:49:50 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 10:49:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 10:49:50 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56AFnokX1608682;
	Thu, 10 Jul 2025 10:49:50 -0500
Message-ID: <7dc7cab6-5f3d-4864-91f3-04fa54088036@ti.com>
Date: Thu, 10 Jul 2025 10:49:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] spirv-llvm-translator: upgrade 20.1.2 ->
 20.1.4
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20250708063810.1921024-1-raj.khem@gmail.com>
 <20250708063810.1921024-2-raj.khem@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250708063810.1921024-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 15:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220126


I'm getting an error building with this patch:


ERROR: Bitbake Fetcher Error: FetchError('Fetch command export 
PSEUDO_DISABLED=1; <snip>; export PATH="<snip>"; export 
HOME="/home/yoctouser"; git -c gc.autoDetach=false -c core.pager=cat -c 
safe.bareRepository=all -c clone.defaultRemoteName=origin rev-list -n 1 
v20.1.4 failed with exit code 128, output:\nfatal: ambiguous argument 
\'v20.1.4\': unknown revision or path not in the working tree.\nUse 
\'--\' to separate paths from revisions, like this:\n\'git <command> 
[<revision>...] -- [<file>...]\'\n', None)


I "fixed" it by clearing out the central shared downloads cache for this 
git repo and forcing bitbake to refetch the repo from github.

Heads up if anyone runs into this.



On 7/8/2025 1:38 AM, Khem Raj via lists.openembedded.org wrote:
> Details of changes
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/compare/v20.1.2...v20.1.4
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   ...-translator_20.1.2.bb => spirv-llvm-translator_20.1.4.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta/recipes-graphics/spir/{spirv-llvm-translator_20.1.2.bb => spirv-llvm-translator_20.1.4.bb} (92%)
> 
> diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> similarity index 92%
> rename from meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
> rename to meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> index 4952e8ba4ff..14e4bb74ace 100644
> --- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
> +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> @@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
>   
>   # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
>   SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
> +SRCREV = "74843f2186bb63b6802758222084da17fcbe603c"
>   SRC_URI = " \
> -    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH} \
> +    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
>   "
>   
> -SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
> -
>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>   
>   DEPENDS = "clang spirv-tools spirv-headers"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220011): https://lists.openembedded.org/g/openembedded-core/message/220011
> Mute This Topic: https://lists.openembedded.org/mt/114042510/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

