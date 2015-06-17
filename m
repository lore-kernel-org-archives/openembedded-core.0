Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id EACA073E65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 10:09:43 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so23654078wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 03:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=a6Ju7ByDjnIID9qdGjk1JbGUAr5/ePDRkWCoQ1hd304=;
	b=UcijrWWArh3fjNamPKCmC960Ghkmgci0e2vT8GHvOIdNvMrarrBl42ZZW+/3ooTYdp
	DPLYFlQ8AUd5REGSkzSZdPf1GNox6Tns69Az1O0eI6Owa38Zq5NGTVhm+UMrIkG8JIyE
	9YHu/MIf2LmUbncpf8lnupLO1WQpajE7mMBtGlVwCsV7lNvDdpeauVwzkaoC4HA1gr4Y
	y6Ynsdrk8QQMci0MIxMNexX806cWe4r9zc+1AvXZ1MMEdNeE+HAoALvKf06oZK11+xki
	uBy6JpSI3r6k0ZenhpEl2AVKuKcgRccnZ9xO6UbKu4YukYeFXU49dmSeNMQhUKfRIIRt
	pgiA==
X-Gm-Message-State: ALoCoQlj8zIpmn43+7wFpxtzcCS2Mt2iTBYh+isOc6hjGOTPxm5ujhPhpP645pmhS5Y5EWa2GhHc
X-Received: by 10.180.36.4 with SMTP id m4mr15583379wij.34.1434535784377;
	Wed, 17 Jun 2015 03:09:44 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id n3sm25685131wix.1.2015.06.17.03.09.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 03:09:43 -0700 (PDT)
Message-ID: <55814766.4000503@dresearch-fe.de>
Date: Wed, 17 Jun 2015 12:09:42 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <55802EE1.6040703@dresearch-fe.de>	
	<3080821.5ZItofk0yx@peggleto-mobl.ger.corp.intel.com>	
	<5581216F.7080503@dresearch-fe.de>
	<1434528621.14710.3.camel@linuxfoundation.org>
In-Reply-To: <1434528621.14710.3.camel@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: multiple git repos vs. AUTOREV?
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
X-List-Received-Date: Wed, 17 Jun 2015 10:09:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 17.06.2015 10:10, Richard Purdie wrote:
> On Wed, 2015-06-17 at 09:27 +0200, Steffen Sledz wrote:
>> On 16.06.2015 16:20, Paul Eggleton wrote:
>>> On Tuesday 16 June 2015 16:12:49 Steffen Sledz wrote:
>>>> For development purposes we use this method to build always from the HEAD
>>>> revision of a git repository.
>>>> ...
>>>> Now we like to do the same in one recipe which uses sources from two git
>>>> repos.
>>>> ...
>>>
>>> I believe this should work:
>>>
>>> -------------> snip <--------------
>>> SRCREV_FORMAT = "foo_bar"
>>> SRCREV_foo = "${AUTOREV}"
>>> SRCREV_bar = "${AUTOREV}"
>>> PV = "gitr${SRCPV}"
>>>  
>>> SRC_URI = " \
>>> 	git://git@bitbucket.org/.../foo.git;protocol=ssh,name=foo \
>>>  	git://git@bitbucket.org/.../bar.git;protocol=ssh,name=bar \
>>>  "
>>> -------------> snap <--------------
>>
>> Thanx.
>>
>> Now we have a similar but little different problem definition. We like to integrate the code of an own kernel driver into the current linux-boundary recipe. Because the driver is under development we like to use the HEAD revision of this repo. My first try was this bbappend.
>>
>> -------------> snip <--------------
>> SRCREV_FORMAT_append += "_mydriver"
>> SRCREV_mydriver = "${AUTOREV}"
>> PV_append = "gitr${SRCPV}"
>>
>> SRC_URI_append = " \
>> 	git://github.com/.../mydriver.git;protocol=https;destsuffix=git.mydriver;name=mydriver \
>> "
>>
>> ...
>> -------------> snap <--------------
>>
>> But this leads to an error.
>>
>> ERROR: ExpansionError during parsing /.../meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary_3.10.53.bb: Failure expanding variable pkg_postrm_kernel-devicetree: ExpansionError: Failure expanding variable KERNEL_PRIORITY, expression was ${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 +                        int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 +                        int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])} which triggered exception ValueError: invalid literal for int() with base 10: '53gitrAUTOINC'
>>
>> Without the PV_append line everything builds well but the resulting package version does not contain a part for the additional repo version. :(
>>
>> Any ideas on this one?
> 
> What value of PV does the recipe have originally? That code (from
> KERNEL_PRIORITY in kernel.bbclass) is meant to be stripping off the base
> version and computing values from it:
> 
> d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]
> 
> however if you don't have a "good" base PV value, its likely its getting
> confused. If you use a form like:
> 
> PV = "x.y.z"
> (in the base recipe)
> PV_append = "+gitr${SRCPV}"
> (in the append)
> 
> then the code above should work ok.

The unmodified PV ist 3.10.53.

Unfortunatly an additional PV_append = "+gitr${SRCPV}" leads to exception. :(

-------------> snip <--------------
NOTE: Preparing RunQueue
ERROR: An uncaught exception occured in runqueue, please see the failure below:
ERROR: Running idle function
Traceback (most recent call last):
  File "/home/sledz/work/HIPOS.fido/bitbake/lib/bb/runqueue.py", line 1029, in RunQueue._execute_runqueue():
                 self.rqexe = RunQueueExecuteDummy(self)
    >            if self.rqdata.prepare() == 0:
                     self.state = runQueueComplete
  File "/home/sledz/work/HIPOS.fido/bitbake/lib/bb/runqueue.py", line 809, in RunQueueData.prepare():
                             procdep.append(self.taskData.fn_index[self.runq_fnid[dep]] + "." + self.runq_task[dep])
    >                    self.runq_hash[task] = bb.parse.siggen.get_taskhash(self.taskData.fn_index[self.runq_fnid[task]], self.runq_task[task], procdep, self.dataCache)

  File "/home/sledz/work/HIPOS.fido/openembedded-core/meta/lib/oe/sstatesig.py", line 113, in SignatureGeneratorOEBasicHash.get_taskhash(fn='/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary_3.10.53.bb', task='do_fetch', deps=[], dataCache=<bb.cache.CacheData object at 0x7f62d4409fd0>):
         def get_taskhash(self, fn, task, deps, dataCache):
    >        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)

  File "/home/sledz/work/HIPOS.fido/bitbake/lib/bb/siggen.py", line 192, in SignatureGeneratorOEBasicHash.get_taskhash(fn='/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary_3.10.53.bb', task='do_fetch', deps=[], dataCache=<bb.cache.CacheData object at 0x7f62d4409fd0>):
             if task in dataCache.file_checksums[fn]:
    >            checksums = bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task], recipename)
                 for (f,cs) in checksums:
  File "/home/sledz/work/HIPOS.fido/bitbake/lib/bb/fetch2/__init__.py", line 1077, in get_file_checksums(filelist='/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/defconfig:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/defconfig:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/defconfig:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/defconfig:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/defconfig:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/defconfig:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/defconfig:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/defconfig:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/defconfig:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/imx6qdl-himx0294.dtsi:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/imx6qdl-himx0294.dtsi:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/imx6qdl-himx0294.dtsi:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/imx6qdl-himx0294.dtsi:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/imx6qdl-himx0294.dtsi:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/imx6qdl-himx0294.dtsi:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/imx6qdl-himx0294.dtsi:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/imx6qdl-himx0294.dtsi:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/imx6qdl-himx0294.dtsi:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/imx6q-himx0294.dts:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/imx6q-himx0294.dts:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/imx6q-himx0294.dts:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/imx6q-himx0294.dts:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/imx6q-himx0294.dts:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/imx6q-himx0294.dts:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/imx6q-himx0294.dts:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/imx6q-himx0294.dts:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/imx6q-himx0294.dts:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/mlb-pll.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/himx0294/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/himx0294/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/himx0294/mlb-pll.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6q/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6q/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6q/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6q/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6dl/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6dl/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6dl/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6dl/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6/mlb-pll.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/armv7a/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/armv7a/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/armv7a/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/armv7a/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/arm/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+
_6c4bcab6c1/arm/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/arm/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/arm/mlb-pll.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mlb-pll.patch:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/iio-tsl2x7x-fix-trigger.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/himx0294/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/himx0294/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/himx0294/iio-tsl2x7x-fix-trigger.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6q/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6q/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6q/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6q/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6dl/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6dl/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6dl/iio-tsl2x7x-fix-trigger.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6dl/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/armv7a/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/armv7a/iio-tsl2x7x-fix-trigger.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/armv7a/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/armv7a/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/arm/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/arm/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/arm/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/arm/iio-tsl2x7x-fix-trigger.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/iio-tsl2x7x-fix-trigger.patch:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/fec-main-mii-access.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/fec-main-mii-access.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/himx0294/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/himx0294/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/himx0294/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6q/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6q/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6q/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6q/fec-main-mii-access.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6dl/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6dl/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6dl/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6dl/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6/fec-main-mii-access.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/armv7a/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/armv7a/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/armv7a/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/armv7a/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/arm/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/arm/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/arm/fec-main-mii-access.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/arm/fec-main-mii-access.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/fec-main-mii-access.patch:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/fec-main-simulate-phy.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/fec-main-simulate-phy.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/fec-main-simulate-phy.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/fec-main-simulate-phy.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/fec-main-simulate-phy.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/fec-main-simulate-phy.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/fec-main-simulate-phy.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/fec-main-simulate-phy.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/fec-main-simulate-phy.patch:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/rafi-touchscreen-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/rafi-touchscreen-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/rafi-touchscreen-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/rafi-touchscreen-support.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/rafi-touchscreen-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/rafi-touchscreen-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/rafi-touchscreen-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/rafi-touchscreen-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/rafi-touchscreen-support.patch:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/rafi-touchscreen-event-report.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/rafi-touchscreen-event-report.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/rafi-touchscreen-event-report.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/rafi-touchscreen-event-report.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/rafi-touchscreen-event-report.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/rafi-touchscreen-event-report.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/rafi-touchscreen-event-report.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/rafi-touchscreen-event-report.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/rafi-touchscreen-event-report.patch:True
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/telit-modem-support.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/himx0294/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/himx0294/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/himx0294/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6q/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6q/telit-modem-support.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6q/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6q/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6dl/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6dl/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6dl/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6dl/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6/telit-modem-support.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/mx6/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/mx6/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/armv7a/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/armv7a/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/armv7a/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/armv7a/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/arm/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/arm/telit-modem-support.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/arm/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/arm/telit-modem-support.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/telit-modem-support.patch:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:True /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstrom/bpp-default-device-tree.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/bpp-default-device-tree.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/angstrom/bpp-default-device-tree.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/angstrom/bpp-default-device-tree.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/bpp-default-device-tree.patch:False
/home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/bpp-default-device-tree.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/bpp-default-device-tree.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/cortexa9t2hf-vfp-neon/bpp-default-device-tree.patch:False /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/bpp-default-device-tree.patch:True  ', pn='linux-boundary'):
         for pth in filelist.split():
    >        exist = pth.split(":")[1]
             if exist == "False":
IndexError: list index out of range
-------------> snip <--------------

I assume the problem is the space in "3.10.53+gitrAUTOINC+ _6c4bcab6c1".

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

