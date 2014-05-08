Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04A3C605F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 23:24:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s48NOpE9003921
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 May 2014 16:24:51 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 8 May 2014 16:24:50 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 May 2014 18:24:50 -0500
Message-ID: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.5.3
MIME-Version: 1.0
Subject: [PATCH] base-files: Add /run/lock as a standard directory
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
X-List-Received-Date: Thu, 08 May 2014 23:24:52 -0000
Content-Type: text/plain

rpm -V -qa

Will report:

Unsatisfied dependencies for base-files-3.0.14-r73.2.0.qemux86_64:
/proc/mounts
/run/lock

The /run/lock directory was being dynamically created during package install,
but should have been owned by the base-files package.

(Note: /proc/mounts is a different issue)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6d76a2b..d38d30b 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -34,8 +34,8 @@ docdir_append = "/${P}"
 dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
 dirs2775 = "/home ${prefix}/src ${localstatedir}/local"
 dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
-           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
-           ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
+           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /run/lock \
+           /sbin ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
            ${mandir} ${datadir}/misc ${localstatedir} \
-- 
1.8.5.3


