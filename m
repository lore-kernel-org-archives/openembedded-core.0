Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE0FC6B18D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:29:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6C9TbIp004733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 02:29:37 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 12 Jul 2013 02:29:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2013 17:29:28 +0800
Message-ID: <158a039e2de8e6e5053891aa64c6e864cae0b34b.1373599041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373599041.git.hongxu.jia@windriver.com>
References: <cover.1373599041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] udev: fix invoking pmount failed based on sysvinit
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
X-List-Received-Date: Fri, 12 Jul 2013 09:29:36 -0000
Content-Type: text/plain

The pmount is invoked in the udev's mount.sh script, and it needs the
existence of `/var/lock', `/var/lock' is symlinked to `/run/lock'.

When the system is based on sysvinit, `/run/lock' is created by populate-
volatile.sh, if the udev service starts before populate-volatile.sh starts,
`/var/lock' will be a invalid link.

Create `/run/lock' directory at udev startup to avoid this invalid link problem.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/udev/udev/init | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index d90d446..8e9f3f8 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -53,6 +53,7 @@ case "$1" in
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
     mount -a -t tmpfs 2>/dev/null
     mkdir -p /var/volatile/tmp
+    mkdir -p /run/lock
 
     # Cache handling.
     # A list of files which are used as a criteria to judge whether the udev cache could be reused.
-- 
1.8.1.2


