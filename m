Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SWMTo-0008C9-Dk
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 08:52:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 May 2012 23:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="145574239"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2012 23:42:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 23:42:15 -0700
Message-Id: <cover.1337581961.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [RFC v1 0/1] Reorder ${PN} and ${PN}-dev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 06:52:32 -0000

This RFC is the first pass at reordering the above 2 items in 
the PACKAGES list. This is in part an out cropping of the bug
#2367 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=2367),
which show the miss packaged pcap-config file.

A number of the changes below are PR bumps since I also changed
the contents of binconfig.bbclass (which would really go away in 
favor of .pc files, but we need a step-wise approach.)

This change set is still evolving, I am using the buildhistory
to compare the results and at this time most of the changes are
correct.  The major difference is that it requires more specific 
enumeration of files, especially when delivered to /usr/lib/${BPN}

And yes, I have thought about how I can break this up, but I am not
sure it can be since once I change the bitbake.conf, numerous erros 
and warnings are created.

This will most likley require some changes in meta-oe and other layers.

Comments suggested, improvemts always welcome!

Sau!


The following changes since commit 326563d5a897ae2dba7cfd8d73579d3d979d72c8:

  sstate.bbclass: Make sure we don't have an empty fixmepath file (2012-05-18 15:24:45 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/pkg-reorder
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/pkg-reorder

Saul Wold (1):
  Reorder  and -dev

 meta/classes/binconfig.bbclass                     |    2 ++
 meta/conf/bitbake.conf                             |    8 +++++---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |   10 ++++++++++
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    3 ++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 +++-
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |    2 +-
 meta/recipes-extended/cups/cups14.inc              |    1 +
 meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |    4 +++-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    4 ++--
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   14 ++++++++++----
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |   12 ++++++++----
 meta/recipes-graphics/directfb/directfb_1.4.15.bb  |    2 +-
 meta/recipes-graphics/freetype/freetype_2.4.8.bb   |    5 +----
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |    6 ++++--
 meta/recipes-multimedia/libpng/libpng_1.2.49.bb    |    4 +---
 meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
 meta/recipes-support/apr/apr_1.4.6.bb              |    2 +-
 meta/recipes-support/curl/curl_7.24.0.bb           |    2 +-
 meta/recipes-support/db/db_5.1.19.bb               |    1 +
 meta/recipes-support/gnutls/gnutls.inc             |    5 ++---
 meta/recipes-support/gnutls/libtasn1_2.12.bb       |    2 +-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    5 ++---
 meta/recipes-support/icu/icu-3.6.inc               |    2 ++
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 meta/recipes-support/libassuan/libassuan_2.0.3.bb  |    1 +
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 ----
 .../libgpg-error/libgpg-error_1.10.bb              |    6 +-----
 meta/recipes-support/libksba/libksba_1.2.0.bb      |    1 +
 meta/recipes-support/libpcre/libpcre_8.21.bb       |    5 +----
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 ++-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    4 +---
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.6.bb           |    2 +-
 meta/recipes-support/pth/pth_2.0.7.bb              |    5 +----
 meta/recipes-support/taglib/taglib_1.6.3.bb        |    3 +--
 41 files changed, 83 insertions(+), 69 deletions(-)

-- 
1.7.7.6



