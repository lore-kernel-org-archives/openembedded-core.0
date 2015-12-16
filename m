Return-Path: <mschiffer@universe-factory.net>
X-Greylist: delayed 564 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Dec 2015 18:21:28 UTC
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 5542873182
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 18:21:28 +0000 (UTC)
Received: from avalon.neoraider.dn42 (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id E27BB180340
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:12:03 +0100 (CET)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 19:11:56 +0100
Message-Id: <cover.1450288828.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH 0/4] Implement merged /usr
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
X-List-Received-Date: Wed, 16 Dec 2015 18:21:31 -0000

Hi,
this patchset implements Fedora-style merged /usr with symlinks, and fixes
the kernel and busybox recipes to work with this. There are probably more
packages which need similar fixes.

The creation of the symlinks is controlled by the merged-usr DISTRO_FEATURE
as suggested in [YOCTO #7040]. The variables base_bindir, base_sbindir,
sbindir, base_libdir and nonarch_base_libdir need to be set explicitly in
the distro config in addition to the DISTRO_FEATURE to make this feature
as flexible as possible (see the commit message of PATCH 4/4).


Matthias Schiffer (4):
  busybox: generalize recipe to work with arbitrary install directories
  kernel: allow kernel module and firmware installation with
    ${base_libdir} != "/lib"
  base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
  base-files: create typical merged /usr symlinks if the "merged-usr"
    distro feature is set

 meta/classes/kernel-module-split.bbclass          |  4 +--
 meta/classes/kernel.bbclass                       | 25 +++++++++++-----
 meta/recipes-core/base-files/base-files_3.0.14.bb | 26 +++++++++++++++--
 meta/recipes-core/busybox/busybox.inc             | 35 ++++++++---------------
 4 files changed, 56 insertions(+), 34 deletions(-)

-- 
2.6.4


