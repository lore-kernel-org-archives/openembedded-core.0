Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BED82793F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 07:46:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8H7k4n5009776
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 00:46:04 -0700 (PDT)
Received: from [128.224.124.169] (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 17 Sep 2018 00:46:03 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180914130310.395-1-ovidiu.panait@windriver.com>
	<20180914133207.GC1369@jama>
From: Ovidiu Panait <ovidiu.panait@windriver.com>
Message-ID: <4b92701f-c2b0-8f10-4a39-8dbbc07a8659@windriver.com>
Date: Mon, 17 Sep 2018 10:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180914133207.GC1369@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH v2] qemux86: wic: Add MLPREFIX to syslinux
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
X-List-Received-Date: Mon, 17 Sep 2018 07:46:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 14.09.2018 16:32, Martin Jansa wrote:

> On Fri, Sep 14, 2018 at 04:03:10PM +0300, Ovidiu Panait wrote:
>> Fix the following do_image_wic failure for lib32-core-image-minimal:
>> | DEBUG: Executing python function set_image_size
>> | DEBUG: Python function set_image_size finished
>> | DEBUG: Executing shell function do_image_wic
>> | Error: Please build syslinux first
>>
>> Test case:
>> MACHINE ?= "qemux86-64"
>>
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>> IMAGE_FSTYPES_append = " wic wic.bmap"
>>
>> $ bitbake lib32-core-image-minimal
>>
>> Currently, syslinux gets built instead of lib32-syslinux, so do_image_wic
>> doesn't find the right files into tmp/sysroots/lib32-qemux86-64 sysroot.
>>
>> Pyro and later releases are not affected by this issue because they are
>> based on Recipe Specific Sysroot, so syslinux binaries end up in the
>> right place.
> How does RSS help with this issue? It still builds the wrong version of
> syslinux, doesn't it?
Hi,

It seems that do_image_wic needs some files that are independent of the 
architecture syslinux is built for.

$ cat scripts/lib/wic/plugins/source/bootimg-pcbios.py
...
         cmds = ("install -m 0644 %s/bzImage %s/vmlinuz" %
                 (staging_kernel_dir, hdddir),
                 "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
                 (bootimg_dir, hdddir),
                 "install -m 0644 %s/syslinux/vesamenu.c32 
%s/vesamenu.c32" %
                 (bootimg_dir, hdddir),
                 "install -m 444 %s/syslinux/libcom32.c32 %s/libcom32.c32" %
                 (bootimg_dir, hdddir),
                 "install -m 444 %s/syslinux/libutil.c32 %s/libutil.c32" %
                 (bootimg_dir, hdddir))
...

These files are provided by both syslinux and lib32-syslinux, but before 
RSS, they will be present in the 64bit sysroot, not the lib32 one, so 
wic won't find them when building lib32-core-image-minimal.

With RSS, all binaries are in the same sysroot directory:

$ ls -1 
tmp/work/qemux86_64-pokymllib32-linux/lib32-core-image-minimal/1.0-r0/lib32-recipe-sysroot/usr/share/syslinux
...
ldlinux.sys
libcom32.c32
libutil.c32
vesamenu.c32
...

Thanks,
Ovidiu
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>   meta/conf/machine/qemux86-64.conf | 2 +-
>>   meta/conf/machine/qemux86.conf    | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
>> index 4f30033e51..e093078d9d 100644
>> --- a/meta/conf/machine/qemux86-64.conf
>> +++ b/meta/conf/machine/qemux86-64.conf
>> @@ -33,4 +33,4 @@ MACHINE_FEATURES += "x86"
>>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>>   
>>   WKS_FILE ?= "directdisk.wks"
>> -do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
>> +do_image_wic[depends] += "${MLPREFIX}syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
>> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
>> index e232947aee..29897aaaaf 100644
>> --- a/meta/conf/machine/qemux86.conf
>> +++ b/meta/conf/machine/qemux86.conf
>> @@ -32,4 +32,4 @@ MACHINE_FEATURES += "x86"
>>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>>   
>>   WKS_FILE = "directdisk.wks"
>> -do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
>> +do_image_wic[depends] += "${MLPREFIX}syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
>> -- 
>> 2.17.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


