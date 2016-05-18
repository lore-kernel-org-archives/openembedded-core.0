Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D60EA6FF60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 21:30:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4ILUmEN014912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 14:30:48 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 14:30:47 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 16:30:46 -0500
Message-ID: <cover.1463606862.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] improvements to acl-ptest
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
X-List-Received-Date: Wed, 18 May 2016 21:30:50 -0000
Content-Type: text/plain

The acl tests assume that umask is 022 (or similar) by default
for some of the permissions tests. The existing run-ptest script
also assumes availability of gpasswd, which we tend to remove by
default, and that the current filesystem supports ACLs. Fix
this by adding a line to the test script for the umask, and making
run-ptest use direct sed to alter /etc/group (it really does need
to) and use a temporary filesystem. (This creates a requirement for
mkfs.ext3, which may be a problem, but it works in our usual
environment, so I figure I'll leave it that way for now?)

The following changes since commit 2fef37fab6967410aff33744c8843bcae028de56:

  gcc: Security fix CVE-2016-4490 (2016-05-17 14:42:18 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/aclptest
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/aclptest

Peter Seebach (1):
  acl.inc, run-ptest: improve ptest functionality on limited rootfs

 meta/recipes-support/attr/acl.inc                  |    1 +
 meta/recipes-support/attr/acl/run-ptest            |   67 ++++++++++++++++++--
 .../attr/acl/test-fix-directory-permissions.patch  |   24 +++++++
 3 files changed, 87 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/attr/acl/test-fix-directory-permissions.patch


