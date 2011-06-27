Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QbDlY-0008Nv-Jc
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:30:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5RFQfdk015875
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 08:26:42 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 27 Jun 2011 08:26:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2011 10:26:55 -0500
Message-ID: <cover.1309188064.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] Ensure a reasonable umask, and fix up permissions (V2)
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
X-List-Received-Date: Mon, 27 Jun 2011 15:30:25 -0000
Content-Type: text/plain

Revised the fixup_perms function in package.bbclass.  Change to using a
class based approach for the individual permissions entries.

Add support for directory linkages.

Add entries to match base-files recipe in the fs-perms.txt.

(umask commit is unchanged, resending due to time since last sent)

----

V1 log below

Add a new function that is responsible for fixing directory and file
permissions, owners and groups during the packaging process.  This will fix
various issues where two packages may create the same directory and end up
with different permissions, owner and/or group.

The issue being resolved is that if two packages conflict in their ownership
of a directory, the first installed into the rootfs sets the permissions.
This leads to a least potentially non-deterministic filesystems, at worst
security defects.

The user can specify their own settings via the configuration files
specified in FILESYSTEM_PERMS_TABLES.  If this is not defined, it will
fall back to loading files/fs-perms.txt from BBPATH.  The format of this
file is documented within the file.

By default all of the system directories, specified in bitbake.conf, will
be fixed to be 0755, root, root.

The fs-perms.txt contains a few default entries to correct documentation,
locale, headers and debug sources.  It was discovered these are often
incorrect due to being directly copied from the build user environment.

Also tweak a couple of warnings to provide more diagnostic information.

The following changes since commit 0009fa951d45c742963279b0d9740c1209b46456:

  linux-firmware: Fix file permissions (2011-06-24 13:32:21 -0500)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/perms
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/perms

Mark Hatle (3):
  Add umask task control
  classes/package.bbclass: Add fixup_perms

 meta/classes/base.bbclass                          |    4 +
 meta/classes/image.bbclass                         |    2 +
 meta/classes/package.bbclass                       |  253 +++++++++++++++++++-
 meta/classes/staging.bbclass                       |    1 +
 meta/files/fs-perms.txt                            |   69 ++++++
 .../installer/adt-installer_1.0.bb                 |    2 +
 meta/recipes-kernel/linux/linux-tools.inc          |    2 +
 7 files changed, 346 insertions(+), 14 deletions(-)
 create mode 100644 meta/files/fs-perms.txt

-- 
1.7.3.4



