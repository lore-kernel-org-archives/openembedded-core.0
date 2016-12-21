Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0C3D877327
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 14:19:37 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t79so160011109wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DlWKGsbQmYVepPMZeb266wQsJC/M5Ph3qI7mr27T9Jo=;
	b=E9agMaJtAJugBxM0o2cVpOnUP4tq9wsAlXZQZ07nJwGGl8iTby1pRTioLRzBz+zMoy
	cEFrwujwuUhRkWnZKKqyscdWSdyH774S28KUKmYFwFrzWqfq0t5LoQ0I2sSti06of8HS
	ydZzkQAUuZn6YjZMnRMcVfM3IbvYkvpRKzyT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DlWKGsbQmYVepPMZeb266wQsJC/M5Ph3qI7mr27T9Jo=;
	b=X4whaPwJR2ZnaGfU8CIWsdUXebbjIbehLk86TdiWes482QIBFeDFPCLEhntkd4tZ4a
	5viNJQ6INfXK8p3CcXqvBY7m8UBk6SluyMDlxWgrWojp5vYXLSjo/73qnx9vUFZa1ba7
	oHHfoUDmMgHTFGQ6xMvv5wyYWH9cS9qNewSgd+zsWkUq2pz/WXEeNcp+1ISM3UAm/GW/
	/Mve5AFb9ddE2CH4xxwMOOSLn0awkZOc4FgDf4QhaXQMn6ExKttYO6zAZNdQG6DzPqjU
	dUCDiH5pfWj/PlprHVGa0DMxr6DMsn2gnmCNP4Ub33vdCdOpKM4ZqQxn+UJDikUY4QX0
	Cdgg==
X-Gm-Message-State: AIkVDXJj/th3mexPlmtt3rNLukOcvOZ1HLmi9isRTeZOmmSVpkkrV9YQo1N0vvt3iD+euISAZ+yzz6msYwOZZNnk
X-Received: by 10.28.15.138 with SMTP id 132mr4867080wmp.41.1482329978598;
	Wed, 21 Dec 2016 06:19:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.19.69 with HTTP; Wed, 21 Dec 2016 06:19:37 -0800 (PST)
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 21 Dec 2016 16:19:37 +0200
Message-ID: <CAGNsrLAhdfQ7KGvBGCtSype2niB7AvqXGtWqFYOVd7e2GqvJfg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: "Neri, Ricardo" <ricardo.neri@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 21 Dec 2016 14:19:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 21 December 2016 at 15:11, Patrick Ohly <patrick.ohly@intel.com> wrote:
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
>
> I've discussed the usage of ovmf/iasl with Ricardo and he agreed that
> moving ovmf and iasl from meta-luv to OE-core makes sense. Ricardo,
> would you be willing to act as maintainer of it there, like you did in
> meta-luv?

fwiw, I've been maintaining acpica recipe in meta-oe, and will keep an
eye here as well.
meta-luv supports both x86* and arm*, and we have an interest in
having the same features available and working for qemuaarch64.

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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Cheers,
-- 
Fathi

