Return-Path: <bruno.bottazzini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 042B371144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 19:37:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2015 11:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,443,1418112000"; d="scan'208";a="673638793"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO
	bottazzini-ThinkPad-T430) ([10.218.99.144])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2015 11:37:11 -0800
Date: Wed, 21 Jan 2015 17:36:28 -0200
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150121173628.718a55e6@bottazzini-ThinkPad-T430>
Organization: Intel
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Removing support for udev cdrom
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
X-List-Received-Date: Wed, 21 Jan 2015 19:37:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello there,

I'd like to remove "udev-rules-cdrom" support in our recipe. 

For some reasons this package is not needed at all.

When I include the following in our recipe:
PACKAGE_EXCLUDE = "udev-rules-cdrom"

I receive the following error:
Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-boot:
 * 	udev-rules-cdrom * 
 * opkg_install_cmd: Cannot install package packagegroup-core-boot

So, I went to the packagegroup-core-boot.bb and I saw this dependencies:
RDEPENDS_${PN} = "\
    base-files \
    base-passwd \
    busybox \
    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit",
"${SYSVINIT_SCRIPTS}", "", d)} \
    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard",
"${VIRTUAL-RUNTIME_keymaps}", "", d)} \
    netbase \
    ${VIRTUAL-RUNTIME_login_manager} \
    ${VIRTUAL-RUNTIME_init_manager} \
    ${VIRTUAL-RUNTIME_dev_manager} \
    ${VIRTUAL-RUNTIME_update-alternatives} \
    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

As you can see there is no udev-rules-cdrom, at least not explicitly.

Is there any way that I could remove this cdrom support from udev ?

Best Regards,

Bruno Bottazzini

