Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB1FA702EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 02:58:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S2wuWO022164
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jul 2014 19:58:56 -0700 (PDT)
Received: from yow-dellw-pg2.corp.ad.wrs.com (128.224.56.7) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 27 Jul 2014 19:58:55 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 27 Jul 2014 22:58:33 -0400
Message-ID: <1406516316-30111-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.0.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] base-files/fs-perms.txt fix up odd perm inconsistencies.
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
X-List-Received-Date: Mon, 28 Jul 2014 02:59:00 -0000
Content-Type: text/plain

Originally I was aiming to fix YOCTO #6579 -- where we had drwxr-sr-x set
for /home for no particular reason (other than historical reasons; see the
commit log for details).  In doing so I also uncovered a couple other small
inconsistencies that could use a cleanup, as follows:

 -the group we called dir2775 we were chmod'ing as 2755 (7 vs 5)

 -the /var/mail from the lsb additions was incorrect perms and group

 -the grouping headings given for the lsb dirs (e.g. "dir4775") were
  completely misleading; it appears the original author used the 1st
  digit ("4") as a group counter and not part of the perms.

The last two lsb related items are in both in the last commit below,
since they end up touching the same lines.

Build tested with MACHINE="intel-corei7-64" from meta-intel with the
core-image-sato.  We can see /home does not have "s" set anymore.

poky$ls -ld build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/home/
drwxr-xr-x 4 paul paul 4096 Jul 25 20:27 build/tmp/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/home/
poky$

Bug:
	https://bugzilla.yoctoproject.org/show_bug.cgi?id=6579

Paul.
---

Paul Gortmaker (3):
  base-files: actually install 2775 dirs as 2775, not 2755
  base-files: remove strange 2775 perms from dirs like /home
  base-files: fix up misleading dir grouping names for lsb dirs

 meta/files/fs-perms.txt                           | 16 +++++++--------
 meta/recipes-core/base-files/base-files_3.0.14.bb | 24 ++++++++++++-----------
 2 files changed, 21 insertions(+), 19 deletions(-)

-- 
2.0.1


