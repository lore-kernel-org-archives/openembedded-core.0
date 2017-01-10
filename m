Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 897126FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 03:50:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jan 2017 19:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="28337813"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga002.jf.intel.com with ESMTP; 09 Jan 2017 19:50:54 -0800
Message-ID: <1484020254.65791.27.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 09 Jan 2017 19:50:54 -0800
In-Reply-To: <1483524116.28169.33.camel@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
	<1482961124.106950.55.camel@ranerica-desktop>
	<1483524116.28169.33.camel@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Tue, 10 Jan 2017 03:50:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-01-04 at 11:01 +0100, Patrick Ohly wrote:
> On Wed, 2016-12-28 at 13:38 -0800, Ricardo Neri wrote:
> > >  do_install_class-target() {
> > > -    OVMF_DIR_SUFFIX="X64"
> > > -    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
> > > -        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
> > > -    fi
> > > +    # Traditional location.
> > >      install -d ${D}${datadir}/ovmf
> > > +    install -m 0755 ${WORKDIR}/ovmf/OVMF.fd ${D}${datadir}/ovmf/bios.bin
> > 
> > Now that I think about it. Installing here does not sever any purpose.
> > Thus, I think this can be removed by perhaps doing do_install[noexec] =
> > "1"
> 
> I was trying not to break traditional usage patterns. If we keep the
> "bios" runqemu parameters, then we should also keep the bios.bin file.

I think OVMF is not a traditional recipe. There are two use cases to
ponder. 1) a Yocto Project disk image wants to include OVMF along with
qemu to run a VM from the YP image. 2) we want to run a YP image in a
host system. I am not sure if someone is interested in 1) and I think
your use case and LUV's is 2). I think that putting things in the deploy
directory makes more sense because, as you said, these images will be
written to. I reckon the the "bios" parameters in runqemu should look
there. This is not a must for this patchset but something nice to have.

Thanks and BR,
Ricardo


