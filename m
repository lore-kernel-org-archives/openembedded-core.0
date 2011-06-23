Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZpeD-0005AM-B9
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 21:33:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5NJTSTK019719
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 12:29:28 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 23 Jun 2011 12:29:27 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2011 14:41:07 -0500
Message-ID: <cover.1308857981.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/9] Revised patch set for fixing owners/groups (V2)
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
X-List-Received-Date: Thu, 23 Jun 2011 19:33:05 -0000
Content-Type: text/plain

Misunderstood nativesdk.  I thought it was not running under fakeroot
control.  No reason to intercept chown for nativesdk, revert that hunt.

Also removed an errant debug statement.

---

This is a revised patch set for fixing the owners/groups.  It adds a
local intercrepter routine for "chown" that runs only with native and
nativesdk packages.

Also update the rejected python patch to fix only the gobject item.


The following changes since commit ad098e40e8c57727892819e131bf18308bf244d2:

  packagedata.py: Fix read_subpkgdata_dict() (2011-06-23 16:01:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/recipe-fixup
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/recipe-fixup

Mark Hatle (9):
  native.bbclass: Add a simple chown intercept command
  resolveconf: Fix file owners
  base-passwd: Fix owners/groups
  ghostscript: Fix owner/group of /etc/cups
  libtirpc: Fix owner/group of /etc/netconfig
  tzdata: Ensure all files are owned by root:root
  gnome-doc-utils: Fix the owner/group on select files
  db: Fix file ownership
  python: Add python to the dependency to pygobject

 meta/classes/native.bbclass                        |    2 ++
 .../resolvconf/resolvconf_1.48.bb                  |    3 ++-
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   10 +++++-----
 .../python/python-pygobject_2.27.91.bb             |    4 ++--
 .../ghostscript/ghostscript_9.02.bb                |    4 +++-
 meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb   |    6 +++++-
 meta/recipes-extended/tzdata/tzdata_2011g.bb       |    4 ++--
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 ++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-support/db/db_5.1.19.bb               |    2 ++
 scripts/native-intercept/chown                     |    2 ++
 11 files changed, 28 insertions(+), 13 deletions(-)
 create mode 100755 scripts/native-intercept/chown

-- 
1.7.3.4



