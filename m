Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20C507F88D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 10:18:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 002AI7Lm015773
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 2 Jan 2020 02:18:07 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 2 Jan 2020 02:18:06 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-6-alex.kanavin@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <81f2806c-4107-2ce5-2c0f-4bdd28438fb1@windriver.com>
Date: Thu, 2 Jan 2020 18:17:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191127164003.115980-6-alex.kanavin@gmail.com>
Subject: Re: [PATCH 06/14] dummy-sdk-package.inc: do not include files into RREPLACES
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
X-List-Received-Date: Thu, 02 Jan 2020 10:18:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/11/28 上午12:39, Alexander Kanavin wrote:
> rpm 4.15 no longer allows it, which makes sense.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

Hi Alex,

I tried this patch with rpm 4.15 and it fails to run task populate_sdk 
when multilib is enabled and lib32-perl is installed.

IMAGE_INSTALL_append = " lib32-perl "

It fails with:

No module defaults found
--> Starting dependency resolution
--> Finished dependency resolution
Error:
  Problem: package 
target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts 
with lib32-perl provided by lib32-perl-5.30.1-r0.i586
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with lib32-perl-module-strict provided by 
lib32-perl-5.30.1-r0.i586
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with lib32-perl-module-warnings provided by 
lib32-perl-5.30.1-r0.i586
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with lib32-perl-module-vars provided by lib32-perl-5.30.1-r0.i586
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with lib32-perl-module-config provided by 
lib32-perl-5.30.1-r0.i586
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with lib32-perl-module-warnings-register provided by 
lib32-perl-5.30.1-r0.i586
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with /usr/bin/perl provided by lib32-perl-5.30.1-r0.i586
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with libperl.so.5 provided by lib32-perl-5.30.1-r0.i586
   - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting 
packages or '--skip-broken' to skip uninstallable packages or '--nobest' 
to use not only best candidate packages)

Any suggestion about it, please?

Regards,
Kai


> ---
>   meta/recipes-core/meta/dummy-sdk-package.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
> index 4d653706b13..58b0482eca5 100644
> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> @@ -16,11 +16,12 @@ python() {
>   ALLOW_EMPTY_${PN} = "1"
>   
>   PR[vardeps] += "DUMMYPROVIDES"
> +PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
>   
>   python populate_packages_prepend() {
>       p = d.getVar("PN")
>       d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
>       d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
> -    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
> +    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES_PACKAGES}")
>   }
>   


-- 
Kai Kang


