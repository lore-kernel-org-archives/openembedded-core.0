Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPqXh-0003e5-2B
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 08:29:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2011 23:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="9785501"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 23:25:51 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:31:48 +0800
Message-Id: <cover.1306477652.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 00/11] Add PR service and integrate PKGV/PKGR from OE
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
X-List-Received-Date: Fri, 27 May 2011 06:29:05 -0000

This is a modification of the original patch to enable network based PR service. 

The main difference between this series of patch to the original one is that 
this one uses the PKGR/PKGV during the package feed creation, and use EXTENDPKGV 
instead of EXTENDPV for package dependencies.

It also made the PR service disabled by default(by leaving the PRSERV_HOST and 
PRSERV_PORT commented out) and revised some function names.

The following features from the previous patch comments are not included in this 
series:
1) automatically launch PR service in localhost use case.
2) respect OVERIDE to allow setting PRSERV_HOST/PORT per recipe basis
3) write permission control in the PR service.
4) way to sync up local PR database witht the central server.
5) added proxy support for PR service.

I'll continue to work on some of those features. But I'd like to send this patch 
now to meet the schedule time window, and anyone interested can experiment and 
provide some comments.

Below is the excerpt from my last series of patch.
---------------BEGIN of last patch message------------------------------------
This series of 5 patches implemented the network based PR service and enabled 
the poky to use it during the task do_package and do_package_write_xxx. By 
using the network based PR service and the basichash for BB_SIGNATURE_HANDLER, 
the poky user may not need to bump the PR manually everytime he/she changes 
the recipe. The package will get automatically rebuilt and new revision number 
reflecting the change will be included in the package feed.

The first patch "[PATCH 1/5] Added the PR service." implemented the network 
based PR service on the server side. It is a XMLRPC server with the sqlite3 
as the backend database. The users query an automated value from this service 
by giving  a tuple of (version, checksum). The returned value will 
be used as a part of the package revision value during the package feed 
creation process. The following algorihtm is used so this PR service could give 
multiple build servers new values for the new index tuple and same values for 
the same index tuple:

IF the index tuple(version, checksum) is found,  THEN
    return the value.
ELSE 
    find the max value in the database with the same version. 
    increment it and save it into the database along with the index tuple.
    return the incremented value. 
    (Note: If no matching version is found, save and return the value of 0).
ENDIF
 
To start the network based PR service daemon, run the following command after 
"sourcing" the environment file oe-init-build-env:

  bitbake-prserv --start

See bitbake-prserv --help to see a detailed description of the options.

The remaining 4 patches enable the poky to use the PR service. In order to use 
it, the user needs to set 2 varialbes of PRSERV_HOST and PRSERV_PORT (which 
specify the PR service ip address and port, default is "localhost" and "8585" 
respectively) in the file conf/local.conf under the building directory. 
Leaving these 2 variables commented out would disable the poky to use the PR 
service, so the poky would behave exactly like what is now.
------------------END of last patch message----------------------------------

The following changes since commit 9bccbc5fbc71b331911b558a2ba15e0a6d0046b4:
  Nitin A Kamble (1):
        tcmode-default: workaround for gcc 4.6.0 failure on beagleboard

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib llu/PR-service
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/PR-service

Lianhao Lu (11):
  Added the PR service.
  conf/bitbake.conf: Added variables for PR service.
  meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.
  classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.
  classes/package_xxx.class: Use PKGE/PKGV/PKGR.
  udev: use EXTENDPKGV instead of EXTENDPV.
  xcb: use EXTENDPKGV instead of EXTENDPV.
  xorg-proto: use EXTENDPKGV instead of EXTENDPV.
  xorg-util/util-macros: use EXTENDPKGV instead of EXTENDPV.
  linux-libc-headers: use EXTENDPKGV instead of EXTENDPV.
  conf/bitbake.conf: Removed EXTENDPV and EXTENDPEVER.

 bitbake/bin/bitbake-prserv                         |   53 ++++++
 bitbake/lib/prserv/__init__.py                     |   11 +
 bitbake/lib/prserv/db.py                           |  100 ++++++++++
 bitbake/lib/prserv/serv.py                         |  198 ++++++++++++++++++++
 meta-yocto/conf/local.conf.sample                  |    5 +
 meta/classes/package.bbclass                       |   51 ++++--
 meta/classes/package_deb.bbclass                   |    8 +-
 meta/classes/package_ipk.bbclass                   |    8 +-
 meta/classes/package_rpm.bbclass                   |   14 +-
 meta/classes/package_tar.bbclass                   |    4 +-
 meta/classes/prserv.bbclass                        |   29 +++
 meta/conf/bitbake.conf                             |   23 ++-
 meta/recipes-core/udev/udev-new.inc                |    2 +-
 meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb  |    2 +-
 meta/recipes-graphics/xcb/xcb-proto.inc            |    2 +-
 .../xorg-proto/xorg-proto-common.inc               |    2 +-
 .../xorg-util/util-macros_1.13.0.bb                |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |    2 +-
 18 files changed, 473 insertions(+), 43 deletions(-)
 create mode 100755 bitbake/bin/bitbake-prserv
 create mode 100644 bitbake/lib/prserv/__init__.py
 create mode 100644 bitbake/lib/prserv/db.py
 create mode 100644 bitbake/lib/prserv/serv.py
 create mode 100644 meta/classes/prserv.bbclass



