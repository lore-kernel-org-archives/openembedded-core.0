Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 179DE60290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:32:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6I3WnD9017337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 20:32:50 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jul 2016 20:32:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jul 2016 20:32:40 -0700
Message-ID: <cover.1468811788.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/9 V2] packagefeed-stability: add class to help reduce package feed churn
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
X-List-Received-Date: Mon, 18 Jul 2016 03:32:51 -0000
Content-Type: text/plain

* V2
  - Make ipk and deb work, now all of rpm, ipk and deb work well.
  - World rebuild testing:
    1) bitbake world
    2) Edit base_do_configure()
    3) bitbake world
    There are 667 recipes *rebuilt*:
    a) For rpm: 61 recipes' PR have been bumped (less than 10%)
    b) For ipk and deb: 55 recipes' PR have been bumped (less than 10%)

    The result is better than I expected. I've check these packages, some of
    the PR bump are caused by pseudo's permission issues. For the others,
    they are caused by dbg, ptest of elf different.

* V1
  - This work is based on Paul's packagefeed-stability, thanks Paul. It is
    aimed for reducing PR bumps for binary packages when use PRServer. 
    It works well for rpm:
    1) Afer bumped rpm-native's PR and rebuild world, less than 20 recipes'
       Packages bumped PR, they are because of pseudo, I had sent email
       before:
       http://lists.openembedded.org/pipermail/openembedded-core/2016-July/123511.html
    2) When elf files are rebuilt, it will bump the PR.

  - Sent build-compare' patches to upstream.

// Robert

The following changes since commit da7a2c7b00b40a8759dbe9f4ab6df3e337e3d6b6:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:11:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/feed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/feed

Paul Eggleton (1):
  packagefeed-stability: add class to help reduce package feed churn

Robert Yang (8):
  rpm: make --nosignature work
  build-compare: remove space at head
  build-compare: make pkg-diff.sh 75% faster
  build-compare: fix checking for named pipe and others
  build-compare: improve deb and ipk checking
  package_deb.bbclass/package_ipk.bbclass: sort RPROVIDES
  packagefeed-stability.bbclass: minor fixes
  packagefeed-stability.bbclass: copy all packages of a recipe

 meta/classes/package_deb.bbclass                   |   2 +
 meta/classes/package_ipk.bbclass                   |   2 +
 meta/classes/packagefeed-stability.bbclass         | 239 ++++++++++++++
 .../build-compare/build-compare_git.bb             |   6 +
 ...001-Add-support-for-deb-and-ipk-packaging.patch |   4 +-
 ...functions.sh-improve-deb-and-ipk-checking.patch | 117 +++++++
 .../files/functions.sh-remove-space-at-head.patch  |  41 +++
 ...nctions.sh-run-rpm-once-to-make-it-faster.patch | 361 +++++++++++++++++++++
 .../pkg-diff.sh-check-for-fifo-named-pipe.patch    |  35 ++
 ...-check_single_file-return-at-once-when-sa.patch |  37 +++
 ...diff.sh-remove-space-in-the-end-for-ftype.patch |  32 ++
 ...0001-system.h-query.c-support-nosignature.patch |  64 ++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   1 +
 13 files changed, 939 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/packagefeed-stability.bbclass
 create mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch
 create mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch
 create mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-run-rpm-once-to-make-it-faster.patch
 create mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-check-for-fifo-named-pipe.patch
 create mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-check_single_file-return-at-once-when-sa.patch
 create mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-remove-space-in-the-end-for-ftype.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch

-- 
2.9.0


