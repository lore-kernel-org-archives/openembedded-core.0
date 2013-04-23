Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UUVAN-0008D5-Ln
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 06:49:24 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3N4VbhE001491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 21:31:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 22 Apr 2013 21:31:37 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Apr 2013 12:31:40 +0800
Message-ID: <454e42299f8d61a1c681a48e27e828c2a8572aa1.1366687285.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366687285.git.Qi.Chen@windriver.com>
References: <cover.1366687285.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] udev: create /var/volatile/tmp to avoid dead link
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
X-List-Received-Date: Tue, 23 Apr 2013 04:49:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If it's not first boot, /tmp has already been symlinked to /var/volatile/tmp.
But the udev service starts before populate-volatile.sh starts. This leads to
a dead link at /tmp. As a result, trying to create any file under /tmp will
fail.

If a USB is plugged in before the populate-volatile.sh script starts, the
/tmp/.automount-$name file will not be created correctly. As a result, when
the USB is unplugged, the /media/$name directory is not removed.

So we create /var/volatile/tmp directory in the udev script to avoid this dead
link problem.

[YOCTO #3404]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev/init |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 1f871da..cd87f50 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -51,6 +51,7 @@ case "$1" in
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
     mount -a -t tmpfs 2>/dev/null
     mkdir -p /var/volatile/run
+    mkdir -p /var/volatile/tmp
 
     # cache handling
     if [ "$DEVCACHE" != "" ]; then
-- 
1.7.9.5



