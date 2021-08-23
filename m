Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web08.23640.1629725515489101965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=TFEnK1Yl;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mIA3O-0008O9-1q; Mon, 23 Aug 2021 15:31:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cz7wT5Ml8vRmlyAOcYaca/zF6Ebp1+CuPBa0+oi6Pto=; b=TFEnK1Yl+ezdDFWuWiKxbMZTIc
	VMogQKh8ckgr+npvq1kc73hcaOzkxMOOF7shYIigItTFPXi9mMb4mRh40he6J88u9JLCOPOJ/XR7l
	rzxGwRnDepFjIYaJjPQrpgBfzE3PJZASKwl2YGP8S7pnBVbmY70aOqHbmSofe2wNd1kDVZ5pmIMmp
	NVwOJ9SsIVNCvyBw9xZSel2O+Zfy4t5ei6w0r1bZmNYh2U1owUZNuxl/qLznXMxoSU27JbFEg8iXJ
	w0NY9tGEaYaYADpsTJOup295N0ECeesjCFU6Yxq1eV0gb6Ww0ClIFyTHwJKMc1/rqLT3Y8vPd1vlR
	odhaCtgQ==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mIA3J-0004fn-Oq; Mon, 23 Aug 2021 15:31:51 +0200
Subject: Re: [OE-core] [PATCH 3/6] kernel-module-split.bbclass: Allow opt-out of split kernel modules
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
References: <20210823122323.97400-1-zboszor@pr.hu>
 <20210823122323.97400-4-zboszor@pr.hu>
 <CADkTA4PC3Fi6y+OSFUWSxRgdbFQsc=Vfq4Yv_G86nmatnWirbA@mail.gmail.com>
 <d780f47b-38a7-a44e-d8a1-3d6dd0a286c5@pr.hu>
 <CADkTA4NrgEbv-8qh9gQ0oyKYCsNCmv=hu0OTnC0RnRmvjo4cYA@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <e2b1a3e3-125a-f36c-21df-eadcfa2ffaa7@pr.hu>
Date: Mon, 23 Aug 2021 15:31:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NrgEbv-8qh9gQ0oyKYCsNCmv=hu0OTnC0RnRmvjo4cYA@mail.gmail.com>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: a09ad50f114de790746f127b11672ad6
X-Spam-Tracer: backend.mail.pr.hu -1.9 20210823133151Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 08. 23. 15:27 keltezéssel, Bruce Ashfield írta:
> On Mon, Aug 23, 2021 at 9:18 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>
>> 2021. 08. 23. 14:55 keltezéssel, Bruce Ashfield írta:
>>> On Mon, Aug 23, 2021 at 8:23 AM Zoltan Boszormenyi via
>>> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>>>>
>>>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>>>
>>>> For some use cases, a monolithic kernel-modules package containing
>>>> all modules built from the kernel sources may be preferred.
>>>> For one, download time is shorter and installation time is faster.
>>>>
>>>
>>> There's still an outstanding issue though. Unless you generate the
>>> provides/rdepends along with the monolithic package, any existing
>>> rdepends on kernel modules break.
>>
>> The next patch in the thread does it.
> 
> That's what my follow up said ;)
> 
> See my second reply though, this gap in functionality created by this
> commit, should be documented in the commit that it will be restored in
> future ones.

I can squash the two commits so there's no gap.

> 
> Cheers,
> 
> Bruce
> 
>>
>>>
>>> While that likely isn't something you hit in your use case, it would
>>> be something that would have to be covered to make this part of core.
>>>
>>> About 7 years ago, I was most of the way through a similar change,
>>> that created on large package with all the rprovides generated (I'm
>>> not sure I can track it down now, but I could have a look), since
>>> doing an on target update with thousands of kernel module package is
>>> very painful.
>>
>> Well, yes. In our defconfig, about 1500 kernel-module-* subpackages
>> were created and had to be upgraded at once. It was *very* painful
>> with over 50 minutes to download and upgrade the kernel.
>>
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>> Set KERNEL_SPLIT_MODULES="0" for this.
>>>>
>>>> The default is one subpackage per module.
>>>>
>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>> ---
>>>>    meta/classes/kernel-module-split.bbclass | 17 +++++++++++++----
>>>>    1 file changed, 13 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
>>>> index 6c1de4c992..a29c294810 100644
>>>> --- a/meta/classes/kernel-module-split.bbclass
>>>> +++ b/meta/classes/kernel-module-split.bbclass
>>>> @@ -28,6 +28,7 @@ do_install:append() {
>>>>           install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
>>>>    }
>>>>
>>>> +KERNEL_SPLIT_MODULES ?= "1"
>>>>    PACKAGESPLITFUNCS:prepend = "split_kernel_module_packages "
>>>>
>>>>    KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-modules"
>>>> @@ -156,18 +157,26 @@ python split_kernel_module_packages () {
>>>>        kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
>>>>        kernel_version = d.getVar("KERNEL_VERSION")
>>>>
>>>> +    metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>>> +    splitmods = d.getVar('KERNEL_SPLIT_MODULES')
>>>> +    postinst = d.getVar('pkg_postinst:modules')
>>>> +    postrm = d.getVar('pkg_postrm:modules')
>>>> +
>>>> +    if splitmods != '1':
>>>> +        etcdir = d.getVar('sysconfdir')
>>>> +        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
>>>> +        d.appendVar('pkg_postinst:%s' % metapkg, postinst)
>>>> +        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
>>>> +        return
>>>> +
>>>>        module_regex = r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
>>>>
>>>>        module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>>>>        module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>>>>        module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
>>>>
>>>> -    postinst = d.getVar('pkg_postinst:modules')
>>>> -    postrm = d.getVar('pkg_postrm:modules')
>>>> -
>>>>        modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>>>        if modules:
>>>> -        metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>>>            d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
>>>>
>>>>        # If modules-load.d and modprobe.d are empty at this point, remove them to
>>>> --
>>>> 2.31.1
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>
> 
> 
> 
> 
> 
> 

