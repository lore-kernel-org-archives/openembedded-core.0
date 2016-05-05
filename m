Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C804601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 15:55:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u45Ftqua008433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 May 2016 08:55:52 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 5 May 2016 08:55:51 -0700
To: Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1461084427.31320.25.camel@linuxfoundation.org>
	<20160505154748.GA23370@jama>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <9ac61a33-ea21-17d4-a7d5-c5c2e94fad86@windriver.com>
Date: Thu, 5 May 2016 10:55:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <20160505154748.GA23370@jama>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure rootfs dependencies cover DEBUGFS
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
X-List-Received-Date: Thu, 05 May 2016 15:55:55 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/5/16 10:47 AM, Martin Jansa wrote:
> On Tue, Apr 19, 2016 at 05:47:07PM +0100, Richard Purdie wrote:
>> If you configure a bz2 debugfs, pbzip2-native currently isn't built.
>> This patch makes sure the dependencies are added.

I thought this had been fixed.

IMAGE_FSTYPES_DEBUGFS -should- be set to default to:

IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"

I usually set it to "tar.gz" myself.

So this is a bug, and we definitely need to fix it.  :P

--Mark

> BTW: I've tried to enable IMAGE_GEN_DEBUGFS for first time as described in manual:
>   Build sysroot paths are now removed from debug symbol files. Removing these paths means that remote GDB using an unstripped build system sysroot will no longer work (although this was never documented to work). The supported method to accomplish something similar is to set IMAGE_GEN_DEBUGFS to "1", which will generate a companion debug image containing unstripped binaries and associated debug sources alongside the image.
> 
> and it fails with ugly exception, because IMAGE_FSTYPES_DEBUGFS isn't set by default.
> 
> It should either be mentioned in the manual or there should be some sane default for it.
> 
> meta/conf/local.conf.sample.extended shows example how to set it next to IMAGE_GEN_DEBUGFS,
> people reading this sample may notice it, but the comment also says:
>   If IMAGE_FSTYPES_DEBUGFS is not defined, it defaults to IMAGE_FSTYPES.
> which isn't true for some reason in my setup, looking at the code I don't see where it is supposed
> to default to IMAGE_FSTYPES
> 
>     if d.getVar('IMAGE_GEN_DEBUGFS', True) == "1":
>         debugfs_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS', True).split()
>         for t in debugfs_fstypes:
>             alltypes.append("debugfs_" + t)
> 
> Maybe the author meant that IMAGE_FSTYPES variable is set to IMAGE_FSTYPES_DEBUGFS
> only when IMAGE_FSTYPES_DEBUGFS is set, but that still leaves that split()
> causing parse failure.
> 
>     debugfs_image_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS', True)
>     if debugfs_image_fstypes:
>         d.setVar('IMAGE_FSTYPES', debugfs_image_fstypes)
> 
> ERROR: /OE/build/wpb/webos-ports/meta-webos-ports/meta-luneos/recipes-core/images/luneos-image.bb: Error executing a python function in <code>:
> 
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 14, function: <module>
>      0010:__anon_38__OE_build_wpb_webos_ports_openembedded_core_meta_classes_rootfs_ipk_bbclass(d)
>      0011:__anon_113__OE_build_wpb_webos_ports_openembedded_core_meta_classes_image_bbclass(d)
>      0012:__anon_176__OE_build_wpb_webos_ports_openembedded_core_meta_classes_image_bbclass(d)
>      0013:__anon_146__OE_build_wpb_webos_ports_openembedded_core_meta_classes_siteinfo_bbclass(d)
>  *** 0014:__anon_439__OE_build_wpb_webos_ports_openembedded_core_meta_classes_image_bbclass(d)
> File: '/OE/build/wpb/webos-ports/openembedded-core/meta/classes/image.bbclass', lineno: 322, function: __anon_439__OE_build_wpb_webos_ports_openembedded_core_meta_classes_image_bbclass
>      0318:    typedeps = {}
>      0319:
>      0320:    if d.getVar('IMAGE_GEN_DEBUGFS', True) == "1":
>      0321:        debugfs_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS', True).split()
>  *** 0322:        for t in debugfs_fstypes: 
>      0323:            alltypes.append("debugfs_" + t)
>      0324:
>      0325:    def _add_type(t):
>      0326:        baset = _image_base_type(t)
> Exception: AttributeError: 'NoneType' object has no attribute 'split'
> 
> ERROR: Failed to parse recipe: /OE/build/wpb/webos-ports/meta-webos-ports/meta-luneos/recipes-core/images/luneos-image.bb
> 
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
> 
> 
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index e2467bd..122e080 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -17,7 +17,9 @@ def imagetypes_getdepends(d):
>>  
>>      deps = []
>>      ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>> -    for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
>> +    fstypes = set((d.getVar('IMAGE_FSTYPES', True) or "").split())
>> +    fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or "").split())
>> +    for type in fstypes:
>>          if type in ["vmdk", "vdi", "qcow2", "hdddirect", "live", "iso", "hddimg"]:
>>              type = "ext4"
>>          basetype = type
>>
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 


