Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 45D4E6EAC7;
	Thu, 27 Mar 2014 06:08:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2R68kum015805
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Mar 2014 23:08:46 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 26 Mar 2014 23:08:46 -0700
Message-ID: <5333C06C.6020900@windriver.com>
Date: Thu, 27 Mar 2014 14:08:44 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, Stefan Stanacar
	<stefanx.stanacar@intel.com>, <openembedded-core@lists.openembedded.org>
References: <20140311162355.554E95039B@opal> <20140326201833.GI3709@jama>
In-Reply-To: <20140326201833.GI3709@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Stefan Stanacar : recipes-bsp: Add gummiboot recipe
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
X-List-Received-Date: Thu, 27 Mar 2014 06:08:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


I met a similar error, maybe we can add:
COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"

to gummiboot_git.bb to fix the problem.

I will send a patch for it, and fix another gnu-efi error.

// Robert

On 03/27/2014 04:18 AM, Martin Jansa wrote:
> On Tue, Mar 11, 2014 at 04:23:55PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 8f95d0598c31fff76e2a58fecb6c96197121a044
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=8f95d0598c31fff76e2a58fecb6c96197121a044
>>
>> Author: Stefan Stanacar <stefanx.stanacar@intel.com>
>> Date:   Fri Feb 21 12:17:35 2014 +0200
>
> COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>
> matching with gnu-efi on which it depends?
>
> Right now it causes ugly error in "bitbake world"
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'gnu-efi' (but /home/jenkins/oe/shr-core-branches/shr-core/openembedded-core/meta/recipes-bsp/gummiboot/gummiboot_git.bb DEPENDS on or otherwise requires it)
> ERROR: gnu-efi was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
> ERROR: Nothing RPROVIDES 'gummiboot-dev' (but /home/jenkins/oe/shr-core-branches/shr-core/openembedded-core/meta/recipes-bsp/gummiboot/gummiboot_git.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'gummiboot-dev'
> NOTE: Runtime target 'gummiboot-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['gummiboot-dev']
> ERROR: Nothing RPROVIDES 'gummiboot' (but /home/jenkins/oe/shr-core-branches/shr-core/openembedded-core/meta/recipes-bsp/gummiboot/gummiboot_git.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'gummiboot'
> NOTE: Runtime target 'gummiboot' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['gummiboot']
>
>
>>
>> recipes-bsp: Add gummiboot recipe
>>
>> gummiboot is a simple UEFI boot manager.
>>
>> Recipe imported from meta-intel with these changes:
>>   - drop PR and update configure options
>>   - upgraded to latest version
>>
>> A couple of notes:
>>   - If you wish you can install the gummiboot package on the target and
>> use 'gummiboot install' to add the payload to the ESP (see gummiboot --help,
>> just make sure the ESP partition has the boot flag on as gummiboot won't accept it
>> otherwise). However the point of this recipe is to be used by bootimg.bbclass and
>> generate images with gummiboot instead of grub-efi.
>>   - You need a kernel which has CONFIG_EFI_STUB=y at least
>>   - The default linux-yocto kernel config does not enable that, easiest way
>> to enable is to build with KERNEL_FEATURES_append = " cfg/efi-ext" in local.conf
>>
>> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-bsp/gummiboot/gummiboot_git.bb | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
>> new file mode 100644
>> index 0000000..5868a23
>> --- /dev/null
>> +++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "Gummiboot is a simple UEFI boot manager which executes configured EFI images."
>> +HOMEPAGE = "http://freedesktop.org/wiki/Software/gummiboot"
>> +
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
>> +
>> +DEPENDS = "gnu-efi util-linux"
>> +
>> +inherit autotools
>> +inherit deploy
>> +
>> +PV = "43+git${SRCPV}"
>> +SRCREV = "4062c51075ba054d4949c714fe06123f9ad3097d"
>> +SRC_URI = "git://anongit.freedesktop.org/gummiboot"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OECONF = "--disable-manpages --with-efi-includedir=${STAGING_INCDIR} \
>> +                --with-efi-ldsdir=${STAGING_LIBDIR} \
>> +                --with-efi-libdir=${STAGING_LIBDIR}"
>> +
>> +do_deploy () {
>> +        install ${B}/gummiboot*.efi ${DEPLOYDIR}
>> +}
>> +addtask deploy before do_build after do_compile
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>
>

