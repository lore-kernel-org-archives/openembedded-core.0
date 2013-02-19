Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U7iMg-0000iG-MX
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 09:15:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1J7xfXB009486
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 23:59:41 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 18 Feb 2013 23:59:40 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 15:59:40 +0800
Message-ID: <6c5df3ee0d370bc7054d53832937ce70b6c9ee57.1361260478.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1361260478.git.Qi.Chen@windriver.com>
References: <cover.1361260478.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] hwclock.sh: check for the existence of /etc/default/rcS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2013 08:15:51 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

/etc/default/rcS might be missing if the init manager is not sysvinit.
So we have to check for the existence of this file before sourcing it.

[YOCTO #3697]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/files/hwclock.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/hwclock.sh b/meta/recipes-core/busybox/files/hwclock.sh
index cc6d286..be5f94d 100644
--- a/meta/recipes-core/busybox/files/hwclock.sh
+++ b/meta/recipes-core/busybox/files/hwclock.sh
@@ -20,7 +20,7 @@
 
 [ ! -x /sbin/hwclock ] && exit 0
 
-. /etc/default/rcS
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 
 [ "$UTC" = "yes" ] && tz="--utc" || tz="--localtime"
 case "$1" in
-- 
1.7.9.5



