Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QN0Sw-000625-IV
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:28:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 May 2011 03:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,236,1304319600"; 
   d="scan'208";a="3912419"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2011 03:24:20 -0700
Message-Id: <cover.1305800693.git.lianhao.lu@intel.com>
Old-Date: Thu, 19 May 2011 18:24:53 +0800
Date: Thu, 19 May 2011 18:29:22 +0800
To: openembedded-core@lists.openembedded.org
From: Lianhao Lu <lianhao.lu@intel.com>
Subject: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 10:28:26 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

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
Unsetting these 2 variables would disable the poky to use the PR service for 
backward compatibility.

The following important new variables are introduced in bitbake.conf:

PRFORMAT: The final value goes into the package revision. Default is something 
like PR.PRAUTO, where PRAUTO is the value returned by the PR service.

PRAUTOINX: The version part of the index tuple for the PR service. Default is PF. 
The checksum of that tuple is the task checksum of do_package.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: llu/PR-service
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/PR-service

Thanks,
    Lianhao Lu <lianhao.lu@intel.com>
---


Lianhao Lu (5):
  Added the PR service.
  conf/bitbake.conf: Added variables for PR service.
  classes/package(prserv).bbclass: Added PR service support.
  classes/package_xxx.class: Added PR service support.
  meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.

 bitbake/bin/bitbake-prserv        |   53 ++++++++++
 bitbake/lib/prserv/__init__.py    |   11 ++
 bitbake/lib/prserv/db.py          |  100 +++++++++++++++++++
 bitbake/lib/prserv/serv.py        |  198 +++++++++++++++++++++++++++++++++++++
 meta-yocto/conf/local.conf.sample |    5 +
 meta/classes/package.bbclass      |   36 +++++--
 meta/classes/package_deb.bbclass  |    6 +-
 meta/classes/package_ipk.bbclass  |    6 +-
 meta/classes/package_rpm.bbclass  |    4 +-
 meta/classes/package_tar.bbclass  |    4 +-
 meta/classes/prserv.bbclass       |   29 ++++++
 meta/conf/bitbake.conf            |   14 +++-
 12 files changed, 443 insertions(+), 23 deletions(-)
 create mode 100755 bitbake/bin/bitbake-prserv
 create mode 100644 bitbake/lib/prserv/__init__.py
 create mode 100644 bitbake/lib/prserv/db.py
 create mode 100644 bitbake/lib/prserv/serv.py
 create mode 100644 meta/classes/prserv.bbclass



