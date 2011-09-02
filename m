Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1QzWXs-00050P-TD
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 18:24:45 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id C10D0D19AD4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 18:10:07 +0200 (CEST)
Received: from PCDEV1.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id E47AE4B0165;
	Fri,  2 Sep 2011 18:10:02 +0200 (CEST)
From: Denis Carikli <denis@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 18:09:55 +0200
Message-Id: <1314979795-13537-1-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1314970267-20365-2-git-send-email-denis@eukrea.com>
References: <1314970267-20365-2-git-send-email-denis@eukrea.com>
Subject: [RESEND] bitbake.conf: fix ubi images creation
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
X-List-Received-Date: Fri, 02 Sep 2011 16:24:46 -0000

Without that commit ubinize.cfg lack a volume name value,
  and the related ubinize.cfg line looks like that:
    vol_name=
  which result in a broken ubi image,which after beeing flashed produce
  the following error:
    UBI error: vtbl_check: volume table check failed: record 0, error 11
  wich result in a kernel panic because the rootfs can't be mounted.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 meta/conf/bitbake.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a68be07..14ee90c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -382,6 +382,8 @@ IMAGE_BASENAME = "${PN}"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 
+UBI_VOLNAME ?= "${MACHINE}-rootfs"
+
 # This option allows for a percentage overage of the actual image size rather than a
 # fixed extra space, this is space needed for initial startup and basic operations.
 IMAGE_OVERHEAD_FACTOR ?= 1.3
-- 
1.7.4.1



