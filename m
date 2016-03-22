Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 32AA265CB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:02:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Mar 2016 09:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,377,1455004800"; d="scan'208";a="939264138"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2016 09:01:12 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 18:01:08 +0200
Message-Id: <1458662470-20336-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH v3 0/2] Improve externalsrc task dependency tracking
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
X-List-Received-Date: Tue, 22 Mar 2016 16:02:41 -0000

This iteration of divides the patchset into two parts.

The first patch only enables file-checksums tracking for git repositories. The
functionality is now changed so that a git tree hash of the work tree content
is written into a separate file which is checksummed by bitbake. It turns out
that checksumming git index file (done in v2 of the patchset) was not reliable
as its checksum might change without any changes in the work tree.

The first patch depends on a bitbake patch which introduces BB_DONT_CACHE
variable:
http://patchwork.openembedded.org/patch/118465/

The second patch enables source files tracking for non-Git source trees.  This
part is basically unchanged from v2 of the patchset. However, in order for it
to behave nicely another bitbake patch needs to be applied:
http://patchwork.openembedded.org/patch/118463/ The reason is that without this
bitbake patch the EXTERNALSRC_SYMLINKS in the source tree are causing a failure
in checksumming which, in turn, causes the build to fail.

If so desired, the first patch can be merged independently, leaving the non-Git
support for later time.

[YOCTO #8853]

The following changes since commit 9c200760cbbe322ed884729eb395f389c863e1c8:

  oe-buildenv-internal: Correct the sed expression which updates $PATH (2016-03-21 11:57:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/fixes


Markus Lehtonen (2):
  externalsrc: do not use do_configure[nostamp] for git srctrees
  externalsrc: remove nostamp from do_configure

 meta/classes/externalsrc.bbclass | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

-- 
2.6.2


