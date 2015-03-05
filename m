Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 24515738D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:29:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 05 Mar 2015 06:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,347,1422950400"; d="scan'208";a="694376862"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.51])
	([10.218.99.51])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2015 06:29:16 -0800
Message-ID: <1425565747.2831.4.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Thu, 05 Mar 2015 11:29:07 -0300
In-Reply-To: <54F863AC.1050204@opendreambox.org>
References: <bruno.bottazzini@intel.com>
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
	<1425504462-6979-2-git-send-email-bruno.bottazzini@intel.com>
	<54F83775.5040604@opendreambox.org>
	<1425561390.2707.29.camel@bottazzini-ThinkPad-T430>
	<54F863AC.1050204@opendreambox.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus: split tools package.
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
X-List-Received-Date: Thu, 05 Mar 2015 14:29:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Qui, 2015-03-05 at 15:09 +0100, Andreas Oberritter wrote:
> On 05.03.2015 14:16, Bottazzini, Bruno wrote:
> > On Qui, 2015-03-05 at 12:01 +0100, Andreas Oberritter wrote:
> >> Hello Gustavo,
> >>
> >> On 04.03.2015 22:27, Bruno Bottazzini wrote:
> >>> From: Gustavo Sverzut Barbieri <gustavo.barbieri@intel.com>
> >>>
> >>> Most tools are not required if one is launching a simple daemon.
> >>> The user will be able to exclude dbus-tool and save some space in his
> >>> build
> >>>
> >>> Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> >>> ---
> >>>  meta/recipes-core/dbus/dbus.inc | 10 ++++++++--
> >>>  1 file changed, 8 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> >>> index fb5d017..f975dc9 100644
> >>> --- a/meta/recipes-core/dbus/dbus.inc
> >>> +++ b/meta/recipes-core/dbus/dbus.inc
> >>> @@ -39,13 +39,13 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
> >>>  
> >>>  DEBIANNAME_${PN} = "dbus-1"
> >>>  
> >>> -PACKAGES =+ "${PN}-lib"
> >>> +PACKAGES =+ "${PN}-lib ${PN}-tools"
> >>>  
> >>>  OLDPKGNAME = "dbus-x11"
> >>>  OLDPKGNAME_class-nativesdk = ""
> >>>  
> >>>  # for compatibility
> >>> -RPROVIDES_${PN} = "${OLDPKGNAME}"
> >>> +RPROVIDES_${PN} = "${OLDPKGNAME} ${PN}-native-tools-native"
> >>
> >> this line seems to be wrong. What are you trying to solve with it?
> >>
> >> Regards,
> >> Andreas
> > 
> > Hello Andreas, 
> > 
> > Could you be more specific what is wrong with this line ?
> > 
> > Have you tried removing it and compile it ?
> 
> No, I haven't. What kind of problem will it raise?

I receive the following problem:
ERROR: Nothing RPROVIDES 'dbus-native-tools-native' (but
virtual:native:PATH/poky/meta/recipes-core/dbus/dbus_1.8.10.bb RDEPENDS
on or otherwise requires it

Any suggestion of how to fix it?
> 
> It looks wrong, because the package dbus doesn't provide dbus-tools, but
> dbus-tools is instead provided by dbus-tools itself (with your patch
> applied).
> 
> Furthermore, having "native" twice in a package name seems odd, but
> there's no reason for target packages to provide anything "native" in
> the first place.
> 
> Regards,
> Andreas
> 
> > Try compiling this patch and see what it provides.
> > 
> > If you want to exclude the dbus-tools just add the following at your 
> > local conf file: 
> > PACKAGE_EXCLUDE = "dbus-tools".
> > 
> > Best Regards,
> > 
> > Bruno Bottazzini
> > 
> >>
> >>>  RREPLACES_${PN} += "${OLDPKGNAME}"
> >>>  
> >>>  FILES_${PN} = "${bindir}/dbus-daemon* \
> >>> @@ -64,6 +64,12 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
> >>>  FILES_${PN}-lib = "${libdir}/lib*.so.*"
> >>>  RRECOMMENDS_${PN}-lib = "${PN}"
> >>>  FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
> >>> +FILES_${PN}-tools += "${bindir}/dbus-uuidgen \
> >>> +                      ${bindir}/dbus-cleanup-sockets \
> >>> +                      ${bindir}/dbus-monitor \
> >>> +                      ${bindir}/dbus-launch \
> >>> +                      ${bindir}/dbus-run-session"
> >>> +RRECOMMENDS_${PN} = "${PN}-tools"
> >>>  
> >>>  pkg_postinst_dbus() {
> >>>  	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
> >>>
> >>
> > 
> > 
> 



