Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9E4C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 14:22:29 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.8899.1742480541265494453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 07:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WTzafuCj;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KEMKqN029266
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 09:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742480540;
	bh=tAzMeAxt1Sp7Y2MuPfuBm5Yg/+t/6NVCuKMbRXqUjOo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=WTzafuCjT+q+KNjRXdigPHTvT1nyf0ILZvqAKIvKVYkXLAUrBBS+eA0PK3Uq9WZdd
	 2kHFNq0XzZLtArk3szIwPoc8FitVoZ3UqL48ax/XOLmAwPlGlWvw83U0tdyMSWd1s0
	 XoOfJ5zmACmuu0UkCBw3QDpOUS/LFDWWwGBm2HMI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KEMK0S003138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 09:22:20 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 09:22:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 09:22:19 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KEMKkn079980;
	Thu, 20 Mar 2025 09:22:20 -0500
Message-ID: <b3d803cb-dbf0-4b05-b7af-a0fa3a8f7a69@ti.com>
Date: Thu, 20 Mar 2025 09:22:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 4/4] gcc-cross-canadian.inc: Fix buildpaths
 error for pthread.h
To: Steve Sakoman <steve@sakoman.com>,
        <openembedded-core@lists.openembedded.org>
References: <cover.1741980835.git.steve@sakoman.com>
 <d3c294ee0afe4d2eb46320945d41064ebfb5cbff.1741980835.git.steve@sakoman.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <d3c294ee0afe4d2eb46320945d41064ebfb5cbff.1741980835.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 14:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213403


I'm seeing build errors in our nightly builds due to this patch.  The 
pthread.h file does not exist and the command is erroring out causing 
do_install to fail.


sed: can't read 
/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-arm/13.3.0/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-arago-linux/usr/lib/arm-oe-eabi/gcc/arm-oe-eabi/13.3.0/include-fixed/pthread.h: 
No such file or directory
WARNING: 
/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-arm/13.3.0/temp/run.do_install.958706:182 
exit 2 from 'sed -i -e 
"s|/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-arm/13.3.0/recipe-sysroot-native|/not/exist|g" 
-e 
"s|/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-arm/13.3.0/recipe-sysroot|/not/exist|g" 
/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-arm/13.3.0/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-arago-linux/usr/lib/arm-oe-eabi/gcc/arm-oe-eabi/13.3.0/include-fixed/pthread.h'
WARNING: Backtrace (BB generated script):
	#1: do_install, 
/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-arm/13.3.0/temp/run.do_install.958706, 
line 182
	#2: main, 
/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-arm/13.3.0/temp/run.do_install.958706, 
line 301


And line 182 is the sed line.

Should the sed call be wrapped in an if file exists check?


On 3/14/2025 2:35 PM, Steve Sakoman wrote:
> From: Sana Kazi <sanakazi720@gmail.com>
> 
> Replace the hardcoded path with /not/exist as used for other
> options[--with-sysroot] to ensure pthread.h does not contain
> hardocded references to TMPDIR:
> 
> ERROR: gcc-cross-canadian-x86-64-13.3.0-r0 do_package_qa: QA Issue:
> File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/
> usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.3.0/include-fixed/
> pthread.h in package gcc-cross-canadian-x86-64 contains reference to
> TMPDIR [buildpaths]
> 
> Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index adcaef2b0f..06f0cef864 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -118,6 +118,11 @@ do_install () {
>   	# We don't care about the gcc-<version> copies
>   	rm -f ${D}${bindir}/*gcc-${BINV}*
>   
> +        # Remove buildpaths from pthread.h
> +        sed -i -e "s|${RECIPE_SYSROOT_NATIVE}|/not/exist|g" \
> +        -e "s|${RECIPE_SYSROOT}|/not/exist|g" \
> +        ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed/pthread.h
> +
>   	# Cleanup empty directories which are not shipped
>   	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
>   	# ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212863): https://lists.openembedded.org/g/openembedded-core/message/212863
> Mute This Topic: https://lists.openembedded.org/mt/111706016/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

