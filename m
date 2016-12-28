Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 943016FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 02:55:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 27 Dec 2016 18:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,420,1477983600"; d="scan'208";a="47041775"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga005.jf.intel.com with ESMTP; 27 Dec 2016 18:55:37 -0800
Message-ID: <1482893737.106950.41.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 27 Dec 2016 18:55:37 -0800
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Wed, 28 Dec 2016 02:55:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> There seems to be a consensus that supporting UEFI in OE-core for qemu
> would be valuable, and there have been some (stalled) attempts to add
> it. For reference, see:
>    [OE-core] [PATCH V3 0/3] Add UEFI firmware for qemux86*
>    [OE-core] Add ovmf-native to make qemu-native/runqemu support boot UEFI image?
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=5654
>    https://github.com/01org/luv-yocto/issues/38
> 
> This patch set includes the necessary recipes (ovmf and iasl from
> meta-luv), some improvements to them (in particular, enabling Secure
> Boot), and changes to runqemu to make it easier to boot with UEFI. A
> special image recipes builds an image which can be used to lock down a
> virtual machine by enrolling the "normal" pre-installed certificates.
> 
> I decided to keep the setup simple and use just a single file for UEFI
> code and variables because that makes the usage via runqemu very
> easy. See the "runqemu: support UEFI with OVMF firmware" patch for
> details. The downside is that the firmware can't be updated without
> loosing variables. I don't see a big need for long-lived virtual
> machine instances, but would like to hear from others about that.
> 
> What's missing is automated testing of this new feature. I'm open for
> suggestions here; right now I don't know enough about the automated
> testing in the AB to propose something.

I guess that tests could be written for buildbot. In the LUV buildbot,
we build OVMF as part of our sanity tests for LUV. We do it mostly
because we need to boot some UEFI firmware in qemu, though. We don't
extensively test OVMF. We also build OVMF with Secure Boot separately.
Now that you have kindly written the recipe, we want to leverage it. :)
> 
> I've discussed the usage of ovmf/iasl with Ricardo and he agreed that
> moving ovmf and iasl from meta-luv to OE-core makes sense. Ricardo,
> would you be willing to act as maintainer of it there, like you did in
> meta-luv?

Yes, I can keep doing the same work I did in meta-luv for OVMF now in
OE-core.

Thanks and BR,
Ricardo
> 
> Beware that "git am --keep-cr" must be used to import the ovmf patches
> correctly.
> 
> The following changes since commit 5e21afc9395060b489156d3f90505a372b713f37:
> 
>   Revert "selftest/wic: extending test coverage for WIC script options" (2016-12-20 17:06:01 +0000)
> 
> are available in the git repository at:
> 
>   git://github.com/pohly/openembedded-core secure-boot
>   https://github.com/pohly/openembedded-core/tree/secure-boot
> 
> Patrick Ohly (7):
>   ovmf: explicitly depend on nasm-native
>   ovmf: deploy firmware in image directory
>   ovmf_git.bb: enable parallel compilation
>   ovmf_git.bb: enable Secure Boot
>   runqemu: let command line parameters override defaults
>   runqemu: support UEFI with OVMF firmware
>   ovmf: build image which enrolls standard keys
> 
> meta-luv (2):
>   ovmf: move from meta-luv to OE-core
>   iasl: move from meta-luv to OE-core
> 
>  meta/recipes-core/ovmf/ovmf-shell-image.bb         |   22 +
>  ...s-Force-tools-variables-to-host-toolchain.patch |   48 +
>  .../ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch    |  110 ++
>  ...0002-ovmf-update-path-to-native-BaseTools.patch |   32 +
>  ...makefile-adjust-to-build-in-under-bitbake.patch |   39 +
>  ...ollDefaultKeys-application-for-enrolling-.patch | 1123 ++++++++++++++++++++
>  meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks   |    4 +
>  meta/recipes-core/ovmf/ovmf_git.bb                 |  178 ++++
>  meta/recipes-extended/iasl/iasl_20120215.bb        |   27 +
>  meta/recipes-extended/iasl/iasl_20150410.bb        |   27 +
>  meta/recipes-extended/iasl/iasl_20150515.bb        |   27 +
>  scripts/runqemu                                    |   37 +-
>  12 files changed, 1673 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/ovmf/ovmf-shell-image.bb
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks
>  create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb
>  create mode 100644 meta/recipes-extended/iasl/iasl_20120215.bb
>  create mode 100644 meta/recipes-extended/iasl/iasl_20150410.bb
>  create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb
> 
> -- 
> 2.1.4
> 



