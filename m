Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D0D816FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 03:51:11 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2017 19:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="51187542"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga005.jf.intel.com with ESMTP; 09 Jan 2017 19:51:11 -0800
Message-ID: <1484020271.65791.28.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 09 Jan 2017 19:51:11 -0800
In-Reply-To: <1483524628.28169.41.camel@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<12e72d8f27d856bcc2007ca5226a693a68fe2ae0.1482324587.git.patrick.ohly@intel.com>
	<1482965680.106950.67.camel@ranerica-desktop>
	<1483524628.28169.41.camel@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] ovmf_git.bb: enable Secure Boot
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
X-List-Received-Date: Tue, 10 Jan 2017 03:51:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-01-04 at 11:10 +0100, Patrick Ohly wrote:
> On Wed, 2016-12-28 at 14:54 -0800, Ricardo Neri wrote:
> > On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> > > The recipe now compiles OVMF twice, once without Secure Boot, once
> > > with. This is the same approach as in
> > > https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/edk2.spec
> > 
> > Besides the fact that Fedora does it, is there a particular reason to
> > build twice?
> 
> The ${build_dir}/FV/OVMF.fd file changes depending on the configuration.
> There's only one such file after a build.
> 
> >  On my side, I am able to build with secure boot with a
> > single build. Also, the Ubuntu documentation does not mention that two
> > builds are needed [1].
> 
> Can you build with and without secure boot in a single build? I wasn't
> sure how to achieve that, so I just copied what Fedora does.

Oh I see, I didn't understand in your commit message that you intend to
keep the secure boot and the non-secure boot images. Then it makes sense
to build twice.
> 
> > Also, I think it would be nice if we could choose between to not have
> > secure boot at all for OVMF. Maybe this could be achieved by having a
> > common ovmf.inc and two ovmf_git.bb and ovmf_sb_git.bb with the
> > different the specific things to support secure boot or not. Maybe all
> > that is needed in the secure boot recipe are the extra variables for
> > OpenSSL and a prepend to do_compile_class-target with the OpenSSL
> > patching. Something to ponder.
> 
> I think I would prefer to have a single recipe with a PACKAGECONFIG for
> secure boot. Having different recipes doesn't scale when adding more
> such options. If you agree, then I'll add that.

Yes, I agree that a PACKAGECONFIG makes more sense.
> 
> > > +    ( cd ${S}/CryptoPkg/Library/OpensslLib/ && ./Install.sh )
> > > +    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
> > > +    ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.secboot.fd
> > 
> > At this point both ${WORKDIR}/ovmf/OVMF.secboot.fd and
> > ${WORKDIR}/ovmf/OVMF.fd will be linked to the same OVMF.fd with secure
> > boot support. Maybe this could be fixed by copying the files rather than
> > creating a symbolic link.
> 
> This is intentionally a hardlink, not a symbolic link, exactly because
> of the problem you mentioned ;-)

Oh, a hardlink. I see now. Thanks for clarifying.
> 



