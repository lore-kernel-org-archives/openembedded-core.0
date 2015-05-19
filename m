Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7B4E600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 13:18:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 19 May 2015 06:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,458,1427785200"; d="scan'208";a="697136834"
Received: from bottazzini-thinkpad-t430 (HELO [10.218.98.23]) ([10.218.98.23])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2015 06:18:55 -0700
Message-ID: <1432041528.13734.8.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Tue, 19 May 2015 10:18:48 -0300
In-Reply-To: <5553D30E.9010201@opendreambox.org>
References: <1431553871-23972-1-git-send-email-bruno.bottazzini@intel.com>
	<1431553871-23972-4-git-send-email-bruno.bottazzini@intel.com>
	<5553D30E.9010201@opendreambox.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 3/3] systemd: split modules into packages
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
X-List-Received-Date: Tue, 19 May 2015 13:18:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


On Qui, 2015-05-14 at 00:41 +0200, Andreas Oberritter wrote:
> Hello Bruno,
> 
> On 13.05.2015 23:51, Bruno Bottazzini wrote:
> > +########################################################################
> > +# Aggregation of Split Packages
> > +########################################################################
> > +PACKAGES =+ "${PN}-services-base"
> > +SUMMARY_${PN}-services-base = "Base services aggregation"
> > +ALLOW_EMPTY_${PN}-services-base = "1"
> > +RDEPENDS_${PN}-services-base = " \
> 
> I think it would be better to use RRECOMMENDS, in order to support
> BAD_RECOMMENDATIONS per image. This would also remove the need to use
> bb.utils.contains, because unavailable recommended packages get ignored
> by the package managers.

I don't think if we should use RRECOMENDS. 

There are some packages described in services-base that it is not on the
default PACKAGECONFIG.

With RRECOMENDS and with out bb.utils.contains, it will install all the
packages that it is described on the recipe and this is not the behavior
we are looking for.

> 
> Besides that, I wonder whether ${PN}-services would be a better name,
> because the -base suffix suggests that it contained only the most
> important services.

Sure, we can change it.

> 
> Btw., sorry for commenting late again, but it's quite a big patch
> 
> Regards,
> Andreas
> 
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'ask-password', '${PN}-services-ask-password', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'backlight', '${PN}-services-backlight', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-services-binfmt', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-services-dbus', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'firstboot', '${PN}-services-firstboot', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'fuse', '${PN}-services-fuse', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'quota', '${PN}-services-quota', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'rfkill', '${PN}-services-rfkill', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '${PN}-services-timesyncd', '', d)}  \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'update', '${PN}-services-update', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'vconsole', '${PN}-services-vconsole', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'filesystems', '${PN}-generators-filesystems', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'preset', '${PN}-preset', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'fsck', '${PN}-services-fsck', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'journal', '${PN}-services-journal', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'modules-load', '${PN}-services-modules-load', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'randomseed', '${PN}-services-randomseed', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'sleep', '${PN}-services-sleep', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'sysctl', '${PN}-services-sysctl', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'sysusers', '${PN}-services-sysusers', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'tmpfiles', '${PN}-services-tmpfiles', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'udev', '${PN}-services-udev', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'tools', '${PN}-tools', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'bash', '${PN}-bash', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'initramfs', '${PN}-initramfs', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'kernel-install', '${PN}-kernel-install', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'rpm-macros', '${PN}-rpm-macros', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'zsh', '${PN}-zsh', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'bootchart', '${PN}-services-bootchart', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'debug', '${PN}-services-debug', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'machined', '${PN}-services-machined', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'nspawn', '${PN}-services-nspawn', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'sysvcompat', '${PN}-services-sysvcompat', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'getty', '${PN}-generators-getty', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'getty', '${PN}-services-getty', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'ldconfig', '${PN}-services-ldconfig', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${PN}-services-hostnamed', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${PN}-services-localed', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${PN}-services-logind', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${PN}-services-timedated', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PN}-pam', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '${PN}-services-networkd', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-services-networkd', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-services-journal-gatewayd', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'cryptsetup', '${PN}-services-cryptsetup', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'gudev', 'udev-dbg', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'x11', '${PN}-services-multi-seat-x', '', d)} \
> > +"
> 




