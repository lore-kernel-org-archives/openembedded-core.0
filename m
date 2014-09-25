Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 030A260144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 05:35:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8P5ZBmE001968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 22:35:11 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 22:35:10 -0700
Message-ID: <5423A98B.1020703@windriver.com>
Date: Thu, 25 Sep 2014 13:35:08 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1411572129.git.hongxu.jia@windriver.com>
	<CAJTo0LYMRuVfx5poDJuNRdu5TPaLBTtgsJLLXJrB_G8e4ur-3Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYMRuVfx5poDJuNRdu5TPaLBTtgsJLLXJrB_G8e4ur-3Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 25 Sep 2014 05:35:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

I could reproduce it now, and am working on it, v4 incoming

//Hongxu

On 09/25/2014 05:53 AM, Burton, Ross wrote:
> Hi Hongxu,
>
> This is failing for me, core-image-minimal for NUC with doc-pkgs:
>
> Collected errors:
>   * check_data_file_clashes: Package util-linux-doc wants to install
> file /data/poky-master/tmp/work/nuc-poky-linux/cor
> e-image-minimal/1.0-r0/rootfs/usr/share/man/man3/libblkid.3.xz
>          But that file is already provided by package  * e2fsprogs-doc
>   * check_data_file_clashes: Package util-linux-doc wants to install
> file /data/poky-master/tmp/work/nuc-poky-linux/cor
> e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/findfs.8.xz
>          But that file is already provided by package  * e2fsprogs-doc
>   * check_data_file_clashes: Package util-linux-doc wants to install
> file /data/poky-master/tmp/work/nuc-poky-linux/cor
> e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/fsck.8.xz
>          But that file is already provided by package  * e2fsprogs-doc
>   * check_data_file_clashes: Package util-linux-doc wants to install
> file /data/poky-master/tmp/work/nuc-poky-linux/cor
> e-image-minimal/1.0-r0/rootfs/usr/share/man/man8/blkid.8.xz
>          But that file is already provided by package  * e2fsprogs-doc
>   * opkg_install_cmd: Cannot install package util-linux-doc.
>
> NOTE: Running intercept scripts:
> NOTE: > Executing update_info_dir intercept ...
> /data/poky-master/tmp/work/nuc-poky-linux/core-image-minimal/1.0-r0/intercept_scripts/update_info_dir:
> line 63: /insta
> ll-info: No such file or directory
> /data/poky-master/tmp/work/nuc-poky-linux/core-image-minimal/1.0-r0/intercept_scripts/update_info_dir:
> line 63: /insta
> ll-info: No such file or directory
>
> Ross
>
> On 24 September 2014 16:27, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Changed in V3:
>> - Remove Debian-specific code
>> - split() the INHERIT variable
>>
>> Changed in V2:
>> - Conditionally add 'gzip/bzip2/xz' to man/info's RDEPENDS
>>    rather than modify busybox's defconfig.
>>
>> - Refer Ubuntu to add a script to postinst_intercept to
>>    run it after all packages have been installed at build time.
>>
>> Test Case:
>>
>> vim local.conf
>> ..
>> IMAGE_INSTALL_append = " man man-doc texinfo texinfo-doc info info-doc"
>> INHERIT += "compress_doc"
>> DOC_COMPRESS = "xz" or DOC_COMPRESS = "bz2"
>> ..
>>
>> bitbake core-image-minimal
>>
>> runqemu qemux86
>>
>> On target,
>> ...
>> root@qemux86:~# man man
>>
>> root@qemux86:~# info info
>> ...
>>
>> //Hongxu
>>
>>
>> The following changes since commit 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3:
>>
>>    build-appliance-image: Update to dizzy head revision (2014-09-23 22:10:26 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib hongxu/fix-doc
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-doc
>>
>> Hongxu Jia (4):
>>    scripts/postinst-intercepts: add update_info_dir
>>    texinfo: fix QA Error while doc compress enabled
>>    texinfo: fix info not work
>>    man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS
>>
>>   meta/recipes-extended/man/man_1.6g.bb        | 13 +++++
>>   meta/recipes-extended/texinfo/texinfo_5.2.bb | 68 +++++++++++++++++++++++-
>>   scripts/postinst-intercepts/update_info_dir  | 77 ++++++++++++++++++++++++++++
>>   3 files changed, 157 insertions(+), 1 deletion(-)
>>   create mode 100755 scripts/postinst-intercepts/update_info_dir
>>
>> --
>> 1.9.1
>>


