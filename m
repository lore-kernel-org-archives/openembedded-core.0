Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <78b7ab98e425456c7e5b1e4fcfeb16596144cc41.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if DISTRO_FEATURES contains systemd
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 23 Feb 2022 12:39:20 +0000
In-Reply-To: <f7edf748-fbf3-ac39-69ec-69c9aebc79ae@weidmueller.com>
References: 
	<20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <7b788487-cfaf-7d47-2697-6ac692cb7b5e@windriver.com>
	 <7764a230-888e-f92e-538c-dcd536e300d3@weidmueller.com>
	 <2e481fb7-360c-890d-b651-4a83af7b11c6@windriver.com>
	 <f7edf748-fbf3-ac39-69ec-69c9aebc79ae@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, "Yu, Mingli" <mingli.yu@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

On Wed, 2022-02-23 at 09:13 +0100, Stefan Herbrechtsmeier wrote:
> Hi,
> 
> Am 23.02.2022 um 02:49 schrieb Yu, Mingli:
> > 
> > 
> > On 2/22/22 9:26 PM, Stefan Herbrechtsmeier wrote:
> > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > > 
> > > Hi,
> > > 
> > > Am 22.02.2022 um 10:20 schrieb Yu, Mingli:
> > > > Hi,
> > > > 
> > > > On 2/2/22 3:35 PM, Stefan Herbrechtsmeier wrote:
> > > > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > > > > 
> > > > > From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > > > > 
> > > > > Link udev shared with systemd helper to minimize the udev package size
> > > > > if DISTRO_FEATURES contains systemd.
> > > > > 
> > > > > It is only usefull to link udev static with systemd helper if udev
> > > > > should be installed without systemd.
> > > > > 
> > > > > Signed-off-by: Stefan Herbrechtsmeier
> > > > > <stefan.herbrechtsmeier@weidmueller.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > (no changes since v1)
> > > > > 
> > > > >   meta/recipes-core/systemd/systemd_249.7.bb | 1 +
> > > > >   1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/meta/recipes-core/systemd/systemd_249.7.bb
> > > > > b/meta/recipes-core/systemd/systemd_249.7.bb
> > > > > index 739f3aae86..431781e6c7 100644
> > > > > --- a/meta/recipes-core/systemd/systemd_249.7.bb
> > > > > +++ b/meta/recipes-core/systemd/systemd_249.7.bb
> > > > > @@ -66,6 +66,7 @@ PACKAGECONFIG ??= " \
> > > > >       ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig
> > > > > pam selinux smack usrmerge polkit seccomp', d)} \
> > > > >       ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', 
> > > > > d)} \
> > > > >       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '',
> > > > > d)} \
> > > > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> > > > > 'link-udev-shared', '', d)} \
> > > > 
> > > > After this change, the iso image failed to boot with below error:
> > > > Cannot find rootfs.img file in /run/media/*, dropping to a shell
> > > > 
> > > > And more detailed about the error as the attached.
> > > > 
> > > > Steps to reproduce:
> > > > 1, update conf/local.conf to use systemd as the default init manager
> > > > DISTRO_FEATURES:append = " systemd"
> > > > DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> > > > VIRTUAL-RUNTIME_init_manager = "systemd"
> > > > VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> > > > KERNEL_FEATURES:append = " cfg/systemd.scc"
> > > You have to set the INIT_MANAGER variable instead or set the
> > > VIRTUAL-RUNTIME_dev_manager variable to systemd.
> > > 
> > > > 2, bitbake core-image-minimal
> > > > 
> > > > 3, runqemu qemux86-64  core-image-minimal  iso
> > > 
> > > A revert of the commit solve your problem?
> > 
> > Yes, the issue is gone after revert the commit.
> 
> It looks like a loot of packages have a direct runtime dependency to 
> udev and after this patch udev have a runtime dependency to systemd. We 
> could revert this patch or move libsystemd-shared.so to its own package 
> to remove the dependency to systemd itself.

A separate package for it would seem like a good option and could smplify the
original issues we saw enabling this too?

Cheers,

Richard

