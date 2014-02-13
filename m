Return-Path: <andreea.b.proca@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 63DEA6ECD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 15:25:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Feb 2014 07:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,839,1384329600"; d="scan'208";a="410674893"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 13 Feb 2014 07:25:05 -0800
Received: from andreea-Vostro-460.rb.intel.com (unknown [10.237.112.104])
	by linux.intel.com (Postfix) with ESMTP id AC57D6A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 07:24:55 -0800 (PST)
From: Andreea Proca <andreea.b.proca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 17:28:50 +0200
Message-Id: <cover.1392303990.git.andreea.b.proca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Error reporting tool
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
X-List-Received-Date: Thu, 13 Feb 2014 15:25:05 -0000


Hello,

This patch together with the web app from git://git.yoctoproject.org/error-report-web 
form an error reporting system similar to kernel-oops service.
This tool proposes a way of keeping track of the errors appeared during builds
by dumping the debug information of the build into a database which can be analyzed.

The data collected consists of the log file of the tasks that failed and common configuration variables
(such as machine, distro, host distro, etc as well as the version of the build system - branch/commit id, which
is commonly missing from bug reports :) ).
The project will benefit from the multitude of build results published by quickly identifying the issues and the areas of interest for the contributors.
The objectives of the application were achieved by creating a client-server system. The client (basically this bitbake class) collects all the information needed
for solving the errors and the server receives that data and saves in a database (see the Django web app at git://git.yoctoproject.org/error-report-web).

All the debug information collected during a build which failed is stored on the user's machine, in a JSON format and its path is displayed
in the output of the build as well as the command that the contributor can run a script to send the error report file to the server. The
script will give the user a link corresponding to his entry in the database. The scripts accepts a parameter which is the hostname
to the web app instance (by default it's localhost).
Contributors can search by certain configurations (e.g. machine, component, error, task) and see statistics through the web interface.


Thanks,
Andreea


The following changes since commit abf22bed20870e6283853674a51a39f44af93936:

  Revert "nss: avoid to use the hardcode kernel version" (2014-02-13 12:06:01 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib andreeap/report-poky
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=andreeap/report-poky

Andreea Proca (1):
  report-error.bbclass: new class to save build information when errors
    occur

 meta/classes/report-error.bbclass |   67 +++++++++++++++++++++++++++++++
 scripts/send-error-report         |   78 +++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 meta/classes/report-error.bbclass
 create mode 100755 scripts/send-error-report

-- 
1.7.9.5


