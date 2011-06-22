Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZWdo-0007wx-Ns
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 01:15:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MNBn6w018355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:11:49 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 16:11:48 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 18:23:23 -0500
Message-ID: <cover.1308784531.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/4] Ensure a reasonable umask, and fix up permissions
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
X-List-Received-Date: Wed, 22 Jun 2011 23:15:25 -0000
Content-Type: text/plain

A fairly global problem was discovered that depending on the build users
umask, the directories and files being generated ended up with different
permissions.  This lead to situations where the first package to be
installed setup the permissions and could have lead to bugs and security
issues.

This patch set resolves the problem in two ways.  First it sets the umask
to a sane value for distribution creation, 022.  Note: I intentionally left
the patches and reverted global umask in this patch set.  Without the 
corresponding changes to bitbake the "Add umask task control" won't do
anything.

The package.bbclass change is described within that specific commit.  Note
there is still one outstanding issue when one package uses a directory and
another defines the item in terms of a symlink.  I intend to enhance the
code to deal with that situation in a future commit.

The following changes since commit f40f936b3ba00e31cae49c22b2633d4deb825533:

  Revert "eglibc: Upgrade recipes from 2.13 -> 2.14" (2011-06-22 16:52:11 -0500)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/perms
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/perms

Mark Hatle (4):
  classes/base.bbclass: Add umask
  Revert "classes/base.bbclass: Add umask"
  Add umask task control
  classes/package.bbclass: Add fixup_perms

 meta/classes/base.bbclass                          |    4 +
 meta/classes/image.bbclass                         |    2 +
 meta/classes/package.bbclass                       |  168 ++++++++++++++++++--
 meta/classes/staging.bbclass                       |    1 +
 meta/files/fs-perms.txt                            |   39 +++++
 .../installer/adt-installer_1.0.bb                 |    2 +
 meta/recipes-kernel/linux/linux-tools.inc          |    2 +
 7 files changed, 208 insertions(+), 10 deletions(-)
 create mode 100644 meta/files/fs-perms.txt

-- 
1.7.3.4



