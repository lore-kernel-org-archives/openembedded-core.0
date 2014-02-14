Return-Path: <andreea.b.proca@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9466EC47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 11:54:55 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Feb 2014 03:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,844,1384329600"; d="scan'208";a="341020283"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Feb 2014 03:54:54 -0800
Received: from andreea-Vostro-460.rb.intel.com (unknown [10.237.112.104])
	by linux.intel.com (Postfix) with ESMTP id D3D666A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 03:54:45 -0800 (PST)
From: Andreea Proca <andreea.b.proca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 13:58:42 +0200
Message-Id: <cover.1392378926.git.andreea.b.proca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCHv2 0/1] Error reporting tool
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
X-List-Received-Date: Fri, 14 Feb 2014 11:54:55 -0000


Changes in v2:
   - address RP's comments (rename methods, handler and add an eventmask)


Hello,

This patch together with the web app from git://git.yoctoproject.org/error-report-web.
form an error reporting system similar to kernel-oops service.
This tool proposes a way of keeping track of the errors appeared during builds
by dumping the debug information of the build into a database which can be analyzed.

The project will benefit from the multitude of build results published by quickly identifying the issues and the areas of interest for the contributors.
The objectives of the application were achieved by creating a client-server system. The client (basically this bitbake class) collects all the information needed
for solving the errors and the server receives that data and saves in a database (see the Django web app at git://git.yoctoproject.org/error-report-web).
The data collected consists of the log file of the tasks that failed and common configuration variables
(such as machine, distro, host distro, etc as well as the version of the build system - branch/commit id, which
is commonly missing from bug reports :) ).

All the debug information collected during a build which failed is stored on the user's machine, in a JSON format and its path is displayed
in the output of the build as well as the command that the contributor can run to send the error report file to the server. The
script will give the user a link corresponding to his entry in the database. The scripts accepts a parameter which is the hostname
to the web app instance (by default it's localhost).
Contributors can search by certain configurations (e.g. machine, component, error, task) and see statistics through the web interface.


Thanks,
Andreea


The following changes since commit ee151ed6bc16312733c67b91bbf65959309b640d:

  lib/oe/rootfs.py: fix RPM multilib issue (2014-02-13 12:06:01 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib andreeap/report-poky
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=andreeap/report-poky

Andreea Proca (1):
  report-error.bbclass: new class to save build information when errors
    occur

 meta/classes/report-error.bbclass |   66 +++++++++++++++++++++++++++++++
 scripts/send-error-report         |   78 +++++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta/classes/report-error.bbclass
 create mode 100755 scripts/send-error-report

-- 
1.7.9.5


