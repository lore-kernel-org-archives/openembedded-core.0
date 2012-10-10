Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TLkg2-00055b-Eg
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 03:01:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Oct 2012 17:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,562,1344236400"; d="scan'208";a="202577303"
Received: from unknown (HELO localhost) ([10.255.13.229])
	by azsmga001.ch.intel.com with ESMTP; 09 Oct 2012 17:48:24 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2012 19:48:22 -0500
Message-Id: <cover.1349829329.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/2] perl: fix @INC, v2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 01:01:34 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This fixes the bug reported by Kang Kai in a way that allows
perf scripting to continue to work.

Before this patch, @INC on the target would contain a native path:

   @INC:
     /etc/perl
     /usr/lib/perl/site_perl/5.14.2/
     /usr/lib/perl/site_perl/5.14.2
     /usr/lib/perl/vendor_perl/5.14.2/
     /usr/lib/perl/vendor_perl/5.14.2
     /mnt/sda10/poky-all-platform/build-qemuppc/tmp/sysroots/qemuppc/usr/lib/perl/5.14.2/
     /usr/lib/perl/5.14.2
     /usr/local/lib/site_perl
     /usr/lib/perl/5.14.2
     .

Kang Kai's patch reverted the problem that caused the native path
to appear, but also caused perf to report that scripting wasn't
supported.

With this patchset, the native path is gone:

  Built under linux
  Compiled at Oct  9 2012 18:40:15
  @INC:
    /etc/perl
    /usr/lib/perl/site_perl/5.14.2/
    /usr/lib/perl/site_perl/5.14.2
    /usr/lib/perl/vendor_perl/5.14.2/
    /usr/lib/perl/vendor_perl/5.14.2
    /usr/lib/perl/5.14.2/
    /usr/lib/perl/5.14.2
    /usr/local/lib/site_perl
    /usr/lib/perl/5.14.2
    .

and the perf Perl binding continues to work:

root@crownbay:~# perf script rwtop

read counts by pid:

   pid                  comm     # reads   bytes_req  bytes_read
------  --------------------  ----------  ----------  ----------
  1524  perf                        5629      213712      213648
  1508  dropbear                       8      131000         607

write counts by pid:

   pid                  comm    # writes  bytes_written
------  --------------------  ----------  -------------
  1522  perf                          11         845320
  1508  dropbear                       8            944

Tested on qemux86 and crownbay.

The following changes since commit 2c3e8280e67721d42d4be48a8e2c1e9ce9bb89fd:

  bitbake: hob/imageconfigurationpage: a 'hob-image' appears listed in the base image combo box (2012-10-08 16:23:34 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/bug-3099-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/bug-3099-fix

Tom Zanussi (2):
  perl: add archlib_exp variable used to generate ARCHLIB_EXP in
    config.h
  perl: use archlib_exp config.sh variable

 meta/recipes-devtools/perl/perl-5.14.2/config.sh          |  1 +
 .../perl/perl-5.14.2/perl-archlib-exp.patch               | 15 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.14.2.bb                 |  3 ++-
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch

-- 
1.7.11.4



