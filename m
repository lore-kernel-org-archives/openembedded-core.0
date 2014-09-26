Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7578E65D53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 11:36:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8QBa5gk000348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 04:36:06 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Sep 2014 04:36:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Sep 2014 19:36:00 +0800
Message-ID: <cover.1411730802.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] fix smart install with --attempt failed
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
X-List-Received-Date: Fri, 26 Sep 2014 11:36:10 -0000
Content-Type: text/plain

Test steps:

1. vim local.conf
...
IMAGE_INSTALL_append = "shadow man-pages hdparm"
EXTRA_IMAGE_FEATURES += "doc-pkgs"
...

2. bitbake core-image-minimal
...
|WARNING: Unable attempt to install packages. Command '...'
returned 1:
|error: file /usr/share/man/man5/passwd.5 from install of
shadow-doc-4.2.1-r0.i586 conflicts with file from package
man-pages-3.71-r0.i586
|error: file /usr/share/man/man3/getspnam.3 from install
of shadow-doc-4.2.1-r0.i586 conflicts with file from package
man-pages-3.71-r0.i586


|WARNING: Attempt to install again:...
|NOTE: Tasks Summary: Attempted 2198 tasks of which 2172 didn't
need to be rerun and all succeeded.
...

The rest doc packages installed successfully.

//Hongxu

The following changes since commit 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3:

  build-appliance-image: Update to dizzy head revision (2014-09-23 22:10:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-attempt-install
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-attempt-install

Hongxu Jia (2):
  rootfs.py: catch inner warn message
  package_manager.py: ignore failed smart install with --attempt

 meta/lib/oe/package_manager.py | 38 +++++++++++++++++++++++++++++++++++++-
 meta/lib/oe/rootfs.py          | 20 +++++++++++++++++++-
 2 files changed, 56 insertions(+), 2 deletions(-)

-- 
1.9.1


