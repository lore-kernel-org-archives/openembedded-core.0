Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4F773CF5;
	Wed, 17 Jun 2015 10:31:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2015 03:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="712530996"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.18.65])
	by orsmga001.jf.intel.com with ESMTP; 17 Jun 2015 03:31:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Wed, 17 Jun 2015 11:31:57 +0100
Message-ID: <11226143.CSLE10tB03@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55814B01.2010504@dresearch-fe.de>
References: <55802EE1.6040703@dresearch-fe.de>
	<55814766.4000503@dresearch-fe.de>
	<55814B01.2010504@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
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
X-List-Received-Date: Wed, 17 Jun 2015 10:32:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 17 June 2015 12:25:05 Steffen Sledz wrote:
> On 17.06.2015 12:09, Steffen Sledz wrote:
> > On 17.06.2015 10:10, Richard Purdie wrote:
> >> On Wed, 2015-06-17 at 09:27 +0200, Steffen Sledz wrote:
> >>> On 16.06.2015 16:20, Paul Eggleton wrote:
> >>>> On Tuesday 16 June 2015 16:12:49 Steffen Sledz wrote:
> >>>>> For development purposes we use this method to build always from the
> >>>>> HEAD
> >>>>> revision of a git repository.
> >>>>> ...
> >>>>> Now we like to do the same in one recipe which uses sources from two
> >>>>> git
> >>>>> repos.
> >>>>> ...
> >>>> 
> >>>> I believe this should work:
> >>>> 
> >>>> -------------> snip <--------------
> >>>> SRCREV_FORMAT = "foo_bar"
> >>>> SRCREV_foo = "${AUTOREV}"
> >>>> SRCREV_bar = "${AUTOREV}"
> >>>> PV = "gitr${SRCPV}"
> >>>> 
> >>>> SRC_URI = " \
> >>>> 
> >>>> 	git://git@bitbucket.org/.../foo.git;protocol=ssh,name=foo \
> >>>> 	
> >>>>  	git://git@bitbucket.org/.../bar.git;protocol=ssh,name=bar \
> >>>>  
> >>>>  "
> >>>> 
> >>>> -------------> snap <--------------
> >>> 
> >>> Thanx.
> >>> 
> >>> Now we have a similar but little different problem definition. We like
> >>> to integrate the code of an own kernel driver into the current
> >>> linux-boundary recipe. Because the driver is under development we like
> >>> to use the HEAD revision of this repo. My first try was this bbappend.
> >>> 
> >>> -------------> snip <--------------
> >>> SRCREV_FORMAT_append += "_mydriver"
> >>> SRCREV_mydriver = "${AUTOREV}"
> >>> PV_append = "gitr${SRCPV}"
> >>> 
> >>> SRC_URI_append = " \
> >>> 
> >>> 	git://github.com/.../mydriver.git;protocol=https;destsuffix=git.mydrive
> >>> 	r;name=mydriver \>>> 
> >>> "
> >>> 
> >>> ...
> >>> -------------> snap <--------------
> >>> 
> >>> But this leads to an error.
> >>> 
> >>> ERROR: ExpansionError during parsing
> >>> /.../meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary_3.10.53.bb:
> >>> Failure expanding variable pkg_postrm_kernel-devicetree:
> >>> ExpansionError: Failure expanding variable KERNEL_PRIORITY, expression
> >>> was ${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0])
> >>> * 10000 +                       
> >>> int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 +
> >>>                       
> >>> int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])} which
> >>> triggered exception ValueError: invalid literal for int() with base 10:
> >>> '53gitrAUTOINC'
> >>> 
> >>> Without the PV_append line everything builds well but the resulting
> >>> package version does not contain a part for the additional repo
> >>> version. :(
> >>> 
> >>> Any ideas on this one?
> >> 
> >> What value of PV does the recipe have originally? That code (from
> >> KERNEL_PRIORITY in kernel.bbclass) is meant to be stripping off the base
> >> version and computing values from it:
> >> 
> >> d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]
> >> 
> >> however if you don't have a "good" base PV value, its likely its getting
> >> confused. If you use a form like:
> >> 
> >> PV = "x.y.z"
> >> (in the base recipe)
> >> PV_append = "+gitr${SRCPV}"
> >> (in the append)
> >> 
> >> then the code above should work ok.
> > 
> > The unmodified PV ist 3.10.53.
> > 
> > Unfortunatly an additional PV_append = "+gitr${SRCPV}" leads to exception.
> > :(
> > 
> > -------------> snip <--------------
> > NOTE: Preparing RunQueue
> > ERROR: An uncaught exception occured in runqueue, please see the failure
> > below: ERROR: Running idle function
> > 
> > Traceback (most recent call last):
> >   File "/home/sledz/work/HIPOS.fido/bitbake/lib/bb/runqueue.py", line 1029, 
in RunQueue._execute_runqueue():
> >                  self.rqexe = RunQueueExecuteDummy(self)
> >                  
> >     >            if self.rqdata.prepare() == 0:
> >                      self.state = runQueueComplete
> >   
> >   File "/home/sledz/work/HIPOS.fido/bitbake/lib/bb/runqueue.py", line 809, 
in RunQueueData.prepare():
> >                              procdep.append(self.taskData.fn_index[self.ru
> >                              nq_fnid[dep]] + "." + self.runq_task[dep])>     
>                    
> >     >                    self.runq_hash[task] =
> >     >                    bb.parse.siggen.get_taskhash(self.taskData.fn_in
> >     >                    dex[self.runq_fnid[task]], self.runq_task[task],
> >     >                    procdep, self.dataCache)>   
> >   File "/home/sledz/work/HIPOS.fido/openembedded-
core/meta/lib/oe/sstatesig.py", line 113, in 
SignatureGeneratorOEBasicHash.get_taskhash(fn='/home/sledz/work/HIPOS.fido/meta-
fsl-arm-extra/recipes-kernel/linux/linux-boundary_3.10.53.bb', 
task='do_fetch', deps=[], dataCache=<bb.cache.CacheData object at 
0x7f62d4409fd0>):
> >          def get_taskhash(self, fn, task, deps, dataCache):
> >     >        h = super(bb.siggen.SignatureGeneratorBasicHash,
> >     >        self).get_taskhash(fn, task, deps, dataCache)>   
> >   File "/home/sledz/work/HIPOS.fido/bitbake/lib/bb/siggen.py", line 192, in 
SignatureGeneratorOEBasicHash.get_taskhash(fn='/home/sledz/work/HIPOS.fido/meta-
fsl-arm-extra/recipes-kernel/linux/linux-boundary_3.10.53.bb', 
task='do_fetch', deps=[], dataCache=<bb.cache.CacheData object at 
0x7f62d4409fd0>):
> >              if task in dataCache.file_checksums[fn]:
> >     >            checksums =
> >     >            bb.fetch2.get_file_checksums(dataCache.file_checksums[fn
> >     >            ][task], recipename)>     >            
> >                  for (f,cs) in checksums:
> >   File "/home/sledz/work/HIPOS.fido/bitbake/lib/bb/fetch2/__init__.py",
> >   line 1077, in
> >   get_file_checksums(filelist='/home/sledz/work/HIPOS.fido/meta-hipos/rec
> >   ipes-kernel/linux/files/angstrom/defconfig:False
> >   /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/lin
> >   ux-boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/defconfig:False
> >   /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/lin
> >   ux-boundary/angstrom/defconfig:False
> >   /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/fil
> >   es/angstrom/defconfig:False
> >   /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/corte
> >   xa9t2hf-vfp-neon/defconfig:False
> >   /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/lin
> >   ux-boundary-3.10.53+gitrAUTOINC+
> >   _6c4bcab6c1/cortexa9t2hf-vfp-neon/defconfig:False
> >   /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/lin
> >   ux-boundary/cortexa9t2hf-vfp-neon/defconfig:False> 
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files/
> > cortexa9t2hf-vfp-neon/defconfig:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/defconfig:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/imx6qdl-himx0294.dtsi:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/imx6qdl-himx0294.dtsi:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/imx6qdl-himx0294.dtsi:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/imx6qdl-himx0294.dtsi:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/imx6qdl-himx0294.dtsi:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/imx6qdl-himx0294.dtsi:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/imx6qdl-himx0294.dtsi:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/imx6qdl-himx0294.dtsi:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/imx6qdl-himx0294.dtsi:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/imx6q-himx0294.dts:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/imx6q-himx0294.dts:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/imx6q-himx0294.dts:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/imx6q-himx0294.dts:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/imx6q-himx0294.dts:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/imx6q-himx0294.dts:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/imx6q-himx0294.dts:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/imx6q-himx0294.dts:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/imx6q-himx0294.dts:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/angstrom/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/himx0294/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/himx0294/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /himx0294/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6q/ml
> > b-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6q/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6q/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6q/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6dl/m
> > lb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6dl/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6dl/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6dl/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6/mlb
> > -pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/mx6/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/armv7a/
> > mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/armv7a/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/armv7a/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /armv7a/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/arm/mlb
> > -pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/arm/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/arm/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /arm/mlb-pll.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mlb-pll
> > .patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/himx0294/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/himx0294/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /himx0294/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6q/ii
> > o-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6q/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6q/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6q/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6dl/i
> > io-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6dl/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6dl/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6dl/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6/iio
> > -tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/armv7a/
> > iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/armv7a/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/armv7a/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /armv7a/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/arm/iio
> > -tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/arm/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/arm/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /arm/iio-tsl2x7x-fix-trigger.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/iio-tsl
> > 2x7x-fix-trigger.patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/himx0294/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/himx0294/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /himx0294/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6q/fe
> > c-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6q/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6q/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6q/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6dl/f
> > ec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6dl/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6dl/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6dl/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6/fec
> > -main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/armv7a/
> > fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/armv7a/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/armv7a/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /armv7a/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/arm/fec
> > -main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/arm/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/arm/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /arm/fec-main-mii-access.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/fec-mai
> > n-mii-access.patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/fec-main-simulate-phy.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/fec-main-simulate-phy.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/fec-main-simulate-phy.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/fec-main-simulate-phy.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/fec-main-simulate-phy.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/fec-main-simulate-phy.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/fec-main-simulate-phy.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/fec-main-simulate-phy.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/fec-main-simulate-phy.patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/rafi-touchscreen-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/rafi-touchscreen-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/rafi-touchscreen-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/rafi-touchscreen-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/rafi-touchscreen-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/rafi-touchscreen-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/rafi-touchscreen-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/rafi-touchscreen-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/rafi-touchscreen-support.patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/rafi-touchscreen-event-report.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/rafi-touchscreen-event-report.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/rafi-touchscreen-event-report.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/rafi-touchscreen-event-report.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/rafi-touchscreen-event-report.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/rafi-touchscreen-event-report.patch:Fal
> > se
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/rafi-touchscreen-event-report.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/rafi-touchscreen-event-report.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/rafi-touchscreen-event-report.patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/himx0294/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/himx0294/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /himx0294/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6q/te
> > lit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6q/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6q/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6q/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6dl/t
> > elit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6dl/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6dl/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6dl/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/mx6/tel
> > it-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/mx6/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/mx6/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /mx6/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/armv7a/
> > telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/armv7a/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/armv7a/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /armv7a/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/arm/tel
> > it-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/arm/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/arm/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /arm/telit-modem-support.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/telit-m
> > odem-support.patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP
> > -1131.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-11
> > 31.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:
> > False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.p
> > atch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/0001-igb-kernel-driver-i210-add-device-
> > id-0x1531-HYP-1131.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/0001-igb-kernel-driver-i210-add-device-id-
> > 0x1531-HYP-1131.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/0001-igb-kernel-driver-i210-add-device-id-0x1531-HY
> > P-1131.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/0001-igb-kernel-driver-i210-add-device-id-0x1531-HYP-1131.patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch
> > :False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:Fa
> > lse
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/cortexa9t2hf-vfp-neon/0002-igb-intel-i210-skip-eprom-error-HY
> > P-11312.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/cortexa9t2hf-vfp-neon/0002-igb-intel-i210-skip-eprom-error-HYP-1
> > 1312.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /cortexa9t2hf-vfp-neon/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patc
> > h:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx029
> > 4/0002-igb-intel-i210-skip-eprom-error-HYP-11312.patch:True
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/angstro
> > m/bpp-default-device-tree.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary-3.10.53+gitrAUTOINC+
> > _6c4bcab6c1/angstrom/bpp-default-device-tree.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux
> > -boundary/angstrom/bpp-default-device-tree.patch:False
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/files
> > /angstrom/bpp-default-device-tree.patch:False
> > /home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/cortexa
> > 9t2hf-vfp-neon/bpp-default-device-tree.patch:False> 
> > /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-kernel/linux/linux-
boundary-3.10.53+gitrAUTOINC+ _6c4bcab6c1/cortexa9t2hf-vfp-neon/bpp-default-
device-tree.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-
kernel/linux/linux-boundary/cortexa9t2hf-vfp-neon/bpp-default-device-
tree.patch:False /home/sledz/work/HIPOS.fido/meta-fsl-arm-extra/recipes-
kernel/linux/files/cortexa9t2hf-vfp-neon/bpp-default-device-tree.patch:False 
/home/sledz/work/HIPOS.fido/meta-hipos/recipes-kernel/linux/files/himx0294/bpp-
default-device-tree.patch:True  ', pn='linux-boundary'):
> >          for pth in filelist.split():
> >     >        exist = pth.split(":")[1]
> >     >        
> >              if exist == "False":
> > IndexError: list index out of range
> > -------------> snip <--------------
> > 
> > I assume the problem is the space in "3.10.53+gitrAUTOINC+ _6c4bcab6c1".
> 
> Ok. Here's my solution. :)
> 
> -------------> snip <--------------
> # use HEAD revision of special tw6869 driver
> SRCREV_FORMAT = "mydriver"
> SRCREV_mydriver = "${AUTOREV}"
> PV_append = "+gitr${SRCPV}"
> 
> SRC_URI_append = " \
> 	git://github.com/.../mydriver.git;protocol=https;destsuffix=git.mydriver;na
> me=mydriver \ "
> -------------> snap <--------------

I think the problem was you were doing SRCREV_FORMAT_append += instead of 
SRCREV_FORMAT_append = with the result that an unwanted space was inserted (+= 
adds a space). For this sort of thing I would be tempted to use .= rather than 
_append as well since .= is immediate (whereas _append and _prepend are 
deferred).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

