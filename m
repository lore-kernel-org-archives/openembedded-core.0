Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56CBC65F77
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 02:31:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8P2VYQu014386
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 19:31:35 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 19:31:33 -0700
Message-ID: <54237E80.2040905@windriver.com>
Date: Thu, 25 Sep 2014 10:31:28 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1411572129.git.hongxu.jia@windriver.com>	<CAJTo0LYMRuVfx5poDJuNRdu5TPaLBTtgsJLLXJrB_G8e4ur-3Q@mail.gmail.com>	<542375C6.70804@windriver.com>
	<542377AB.9050201@windriver.com>
In-Reply-To: <542377AB.9050201@windriver.com>
Subject: Re: [PATCH V3 0/4] man/info: fix not support xz/bz2 compression
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
X-List-Received-Date: Thu, 25 Sep 2014 02:31:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2014 10:02 AM, Hongxu Jia wrote:
> On 09/25/2014 09:54 AM, Hongxu Jia wrote:
>> On 09/25/2014 05:53 AM, Burton, Ross wrote:
>>> Hi Hongxu,
>>>
>>> This is failing for me, core-image-minimal for NUC with doc-pkgs:
>>>
>
> And what NUC means? I am not familiar with is.
>

Oh, it is a intel BSP located in yocto/meta-intel/meta-nuc.

//Hongxu


> //Hongxu
>
>>> Collected errors:
>>>   * check_data_file_clashes: Package util-linux-doc wants to install
>>> file /data/poky-master/tmp/work/nuc-poky-linux/cor
>>> e-image-minimal/1.0-r0/rootfs/usr/share/man/man3/libblkid.3.xz
>>>          But that file is already provided by package  * e2fsprogs-doc
>>>   * check_data_file_clashes: Package util-linux-doc wants to install
>>> file /data/poky-master/tmp/work/nuc-poky-linux/cor
>>> e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/findfs.8.xz
>>>          But that file is already provided by package  * e2fsprogs-doc
>>>   * check_data_file_clashes: Package util-linux-doc wants to install
>>> file /data/poky-master/tmp/work/nuc-poky-linux/cor
>>> e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/fsck.8.xz
>>>          But that file is already provided by package  * e2fsprogs-doc
>>>   * check_data_file_clashes: Package util-linux-doc wants to install
>>> file /data/poky-master/tmp/work/nuc-poky-linux/cor
>>> e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/blkid.8.xz
>>>          But that file is already provided by package  * e2fsprogs-doc
>>>   * opkg_install_cmd: Cannot install package util-linux-doc.
>>>
>>> NOTE: Running intercept scripts:
>>> NOTE: > Executing update_info_dir intercept ...
>>> /data/poky-master/tmp/work/nuc-poky-linux/core-image-minimal/1.0-r0/intercept_scripts/update_info_dir: 
>>>
>>> line 63: /insta
>>> ll-info: No such file or directory
>>> /data/poky-master/tmp/work/nuc-poky-linux/core-image-minimal/1.0-r0/intercept_scripts/update_info_dir: 
>>>
>>> line 63: /insta
>>> ll-info: No such file or directory
>>
>> Thanks for testing, the error log shows STAGING_BINDIR_NATIVE is unset,
>> but I could not reproduce it, could you paste more details about the 
>> config,
>> such as
>> ...
>> PACKAGE_CLASSES ?= "package_ipk"
>> EXTRA_IMAGE_FEATURES = "debug-tweaks doc-pkgs"
>> USER_CLASSES += "compress_doc"
>> DOC_COMPRESS = "xz"
>> ...
>>
>> bitbake core-image-minimal
>>
>> //Hongxu
>>
>>> Ross
>>>
>>> On 24 September 2014 16:27, Hongxu Jia <hongxu.jia@windriver.com> 
>>> wrote:
>>>> Changed in V3:
>>>> - Remove Debian-specific code
>>>> - split() the INHERIT variable
>>>>
>>>> Changed in V2:
>>>> - Conditionally add 'gzip/bzip2/xz' to man/info's RDEPENDS
>>>>    rather than modify busybox's defconfig.
>>>>
>>>> - Refer Ubuntu to add a script to postinst_intercept to
>>>>    run it after all packages have been installed at build time.
>>>>
>>>> Test Case:
>>>>
>>>> vim local.conf
>>>> ..
>>>> IMAGE_INSTALL_append = " man man-doc texinfo texinfo-doc info 
>>>> info-doc"
>>>> INHERIT += "compress_doc"
>>>> DOC_COMPRESS = "xz" or DOC_COMPRESS = "bz2"
>>>> ..
>>>>
>>>> bitbake core-image-minimal
>>>>
>>>> runqemu qemux86
>>>>
>>>> On target,
>>>> ...
>>>> root@qemux86:~# man man
>>>>
>>>> root@qemux86:~# info info
>>>> ...
>>>>
>>>> //Hongxu
>>>>
>>>>
>>>> The following changes since commit 
>>>> 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3:
>>>>
>>>>    build-appliance-image: Update to dizzy head revision (2014-09-23 
>>>> 22:10:26 +0100)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>    git://git.pokylinux.org/poky-contrib hongxu/fix-doc
>>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-doc
>>>>
>>>> Hongxu Jia (4):
>>>>    scripts/postinst-intercepts: add update_info_dir
>>>>    texinfo: fix QA Error while doc compress enabled
>>>>    texinfo: fix info not work
>>>>    man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS
>>>>
>>>>   meta/recipes-extended/man/man_1.6g.bb        | 13 +++++
>>>>   meta/recipes-extended/texinfo/texinfo_5.2.bb | 68 
>>>> +++++++++++++++++++++++-
>>>>   scripts/postinst-intercepts/update_info_dir  | 77 
>>>> ++++++++++++++++++++++++++++
>>>>   3 files changed, 157 insertions(+), 1 deletion(-)
>>>>   create mode 100755 scripts/postinst-intercepts/update_info_dir
>>>>
>>>> -- 
>>>> 1.9.1
>>>>
>>
>


