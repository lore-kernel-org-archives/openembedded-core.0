Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E09A77E514
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 12:21:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5PCKlZv027983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 05:21:02 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Tue, 25 Jun 2019 05:20:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2019 20:44:49 +0800
Message-ID: <cover.1561465895.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2 0/2] meta: Fixes for update-alternatives.bbclass and gtk-icon-cache.bbclass
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
X-List-Received-Date: Tue, 25 Jun 2019 12:21:12 -0000
Content-Type: text/plain

* V2
  - The patch for update-alternatives.bbclass makes update-alternatives runs firstly
    before other postinst scripts, since other postinst may run the tool which is
    installed by the package itself (e.g., newaliases is installed as
    newaliases.postfix, and update-alternatives will update it to newaliases). But this
    broke busybox' on target install, since update-alternatives requires some
    basic tools such as sed, there was a neat way in busybox' postinst to fix
    this problem, the v2 makes busybox' postinst script run firstly before
    update-alternatives.

Testinfo:
MACHINE = "qemux86"
PACKAGE_CLASSES = "package_ipk package_rpm" (or "package_rpm package_ipk")
TESTIMAGE_AUTO = "1"
$ bitbake core-image-sato core-image-minimal

The tests are OK.

* V1
  - Initial version

// Robert

The following changes since commit 4bb3e8f98e2bbfcb20f1b32d2b7674d1a6cb47be:

  local.conf.sample.extended: remove redundant RUNTIMETARGET assignment (2019-06-24 17:32:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/post
  http://cgit.openembedded.org//log/?h=rbt/post

Robert Yang (2):
  update-alternatives.bbclass: run update-alternatives firstly in
    postinst script
  gtk-icon-cache.bbclass: Depends on gtk+3

 meta/classes/gtk-icon-cache.bbclass      | 14 ++++++++++----
 meta/classes/update-alternatives.bbclass | 13 +++++++++++--
 2 files changed, 21 insertions(+), 6 deletions(-)

-- 
2.7.4


