Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 49CF360745
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 09:02:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2016 02:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,470,1464678000"; d="scan'208";a="1008236798"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2016 02:02:14 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2016 12:02:10 +0300
Message-Id: <1470301332-6878-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
MIME-Version: 1.0
Subject: [PATCH 0/2] package.bbclass: better handling of directory symlinks
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
X-List-Received-Date: Thu, 04 Aug 2016 09:02:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FILES specifications that list files under directory symlinks can be
problematic in packaging. Packaging fails if you specify a file within a
symlinked directory but the real target directory is not included. The behavior
on files like this is currently non-deterministic, even for valid
configurations. Packaging may succeed or fail, depending on the order that
files are specified in FILES. This patchset addresses the situation.

The first patch checks FILES for specs that point to files that reside under
symlinked directories. It then handles these separately, failing gracefully if
packaging is not possible (because the real target directory is not included in
the pkg). The second patch simply adds a warning if it finds FILE
specifications that point to files undert symlinked directories.

Basically, these problematic FILE specifications should not be used at all -
files should be specified by their real path. It would probably be best to just
fail if such constructs are found. However, making such a change might have
unwanted consecuences by breaking existing builds. The first patch is not
particularly beautiful but it should make handling of symlinks deterministic
without breaking anything. Printing a warning hopefully courages to fix
potentially problematic recipes. At some point in the future the first patch
could be essentially reverted and the warning turned into an error.

[YOCTO #9827]

The following changes since commit 986f7fbe37a48d050611f08f7160ed96755ac3dc:

  foomatic-filters: Security fixes CVE-2015-8327 (2016-08-01 12:11:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9827
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9827


Markus Lehtonen (2):
  package.bbclass: better handling of middle-path dir symlinks
  package.bbclass: warn about files under symlinked directories

 meta/classes/package.bbclass | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

-- 
2.6.6


