Return-Path: <bruno.bottazzini@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 785556AC3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 21:57:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 May 2015 14:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,375,1427785200"; d="scan'208";a="690446628"
Received: from bottazzini-thinkpad-t430 (HELO [10.218.98.31]) ([10.218.98.31])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2015 14:57:35 -0700
Message-ID: <1430863053.29137.0.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Leandro Dorileo <leandro.maciel.dorileo@intel.com>
Date: Tue, 05 May 2015 18:57:33 -0300
In-Reply-To: <55492A4A.6010305@intel.com>
References: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>
	<1430775804-30845-4-git-send-email-bruno.bottazzini@intel.com>
	<20150505200129.GA7291@ad.chargestorm.se> <55492A4A.6010305@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 3/3] systemd: split modules into packages
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
X-List-Received-Date: Tue, 05 May 2015 21:57:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


On Ter, 2015-05-05 at 17:38 -0300, Leandro Dorileo wrote:
> On 05/05/2015 05:01 PM, Anders Darander wrote:
> > * Bruno Bottazzini <bruno.bottazzini@intel.com> [150504 23:43]:
> >
> >> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> >> index b4bff18..2da74dc 100644
> >> --- a/meta/recipes-core/systemd/systemd_219.bb
> >> +++ b/meta/recipes-core/systemd/systemd_219.bb
> >> @@ -60,9 +60,89 @@ LDFLAGS_append_libc-uclibc = " -lrt"
> >>   GTKDOC_DOCDIR = "${S}/docs/"
> >
> >>   PACKAGECONFIG ??= "xz ldconfig \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'gcrypt', 'gcrypt', "", d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'kmod', 'kmod', "", d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> >>                      ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> >> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
> >> -
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'glib', 'glib', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'kmod', 'kmod', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'smack', 'smack', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ima', 'ima', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'apparmor', 'apparmor', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'qrencode', 'qrencode', '', d)} \
> >
> > NAK.
> >
> > I like the split of systemd into smaller packages, but NAK for this
> > version. We're not going to add all this to DISTRO_FEATURES...
> >
> > Add all the PACKAGCONFIG options, but enable only those that either were
> > enabled before, or where we have a real DISTRO_FEATURE to check for.
> > Dpn't add a new DISTRO_FEATURE for every PACKAGECONFIG.
> >
> 
> Just to have it documented here via ML, Anders and I talked on IRC
> and we agreed to add PACKAGECONFIG[feature] definitions for both
> features and have the "current features" enabled by default without
> using  DISTRO_FEATURES - since we don't want to add these
> DISTRO_FEATURES.
> 
> For distros wanting to use the "new packages/features" we do so by
> adding PACKAGECONFIG_pn-systemd... on the distro side.
> 
> Regards...
> 
> --
> Dorileo

I agree with the changes as soon as everyone has reviewed I will send a
new one version.

Best Regards,

Bruno Bottazzini



