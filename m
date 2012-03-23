Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SAwUT-0006u4-Mu
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:52:41 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 2DD3F2FD1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 00:43:42 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 21:43:40 -0700
Message-Id: <cover.1332453478.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 2DD3F2FD1D.E70C6
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/2] Two useradd fixes
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
X-List-Received-Date: Fri, 23 Mar 2012 04:52:41 -0000

Hello,

This pull request fixes two race conditions related to the useradd code.

Yocto bug #2127 describes how when using the RPM package manager, the
order of package installation during generatin of the rootfs did not
guarantee that base-passwd and shadow would be installed before other
packages which need to install custom users/groups in their postinstall
functions. This fix ensures that when base-passwd and/or shadow are
part of an image, they will be installed first during image generation.

The second race condition is described in Yocto bug #1794, and can occur
if two build steps try to update the sysroot passwd/group files at the
same time. Since the shadow utilities enforce file locking, the commands
will fail to run. The fix for this involves checking for failure and
retrying the commands up to 10 times, with a 1s delay between attempts
before giving up.

Verifying these fixes involved creating numerous images and useradd-based
packages repeatedly on a build host with high parallelism, and also doing
so from a pre-populated sstate-cache. I was able to reliably simulate the
file locking behavior by making the passwd/group files read only when
developing the fix for #1794. 

Scott

The following changes since commit 87e581bb7da9f1530d190cd023fcf892c8b858f5:

  ddimage: Add script for writing images to boot media (2012-03-22 19:17:54 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/useradd-lock-fix-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-lock-fix-oe

Scott Garman (2):
  package_rpm.bbclass: ensure base-passwd and shadow get installed
    first
  useradd.bbclass: retry useradd/groupadd commands to avoid lock race
    issues

 meta/classes/package_rpm.bbclass |    9 ++++++++-
 meta/classes/useradd.bbclass     |   36 ++++++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 3 deletions(-)

-- 
1.7.5.4



