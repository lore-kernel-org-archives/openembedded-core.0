Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C486662136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 00:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 60DED18291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xrH6RT3NtzIc
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 573251828B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 3B8471569
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 309DA1342
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 2ED8110BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2V0KD9t009514
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:20:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2V0KD0s009513
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2016 02:20:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 02:20:10 +0200
Message-Id: <cover.1459383524.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Make unneeded packages for read-only rootfs configurable
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
X-List-Received-Date: Thu, 31 Mar 2016 00:20:16 -0000

We use a read-only rootfs (i.e., we have read-only-rootfs set in
IMAGE_FEATURES). However, we mount /etc from a separate writable flash
partition. But because of how some packages are considered unneeded
and subsequently removed from the rootfs if it is read-only, we cannot
enable, e.g., shadow in our image. The list of unneeded packages is
hardcoded in lib/oe/rootfs.py, making it near impossible to override
this.

With this change the list of unneeded packages is moved to a variable
(ROOTFS_RO_UNNEEDED) in image.bbclass, which makes it easy to adopt it
as needed.

There was code in lib/oe/rootfs.py which was meant to not add
update-rc.d to the list of unneeded packages if both systemd and
sysvinit are enabled in DISTRO_FEATURES. I have removed this code
since a) it is no longer needed (as it only made sense when the
unneeded packages were removed based on whether package-management was
enabled or not), and b) it can never have worked as intended (because
the explicit addition of update-rc.d to the list of unneeded packages
was not removed when the conditional addition was introduced...)

//Peter

The following changes since commit 53b5dc0dda3fa7703e8f6a68b05b565ecee9e41f:

  gcc: Fix musl ldso name for mips64 (2016-03-30 21:24:02 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/unneeded_packages
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/unneeded_packages

Peter Kjellerstedt (1):
  image.bbclass: Make unneeded packages for a read-only rootfs
    configurable

 meta/classes/image.bbclass |  6 +++++-
 meta/lib/oe/rootfs.py      | 23 +++++------------------
 2 files changed, 10 insertions(+), 19 deletions(-)

-- 
2.1.0


