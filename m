Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 390307BD72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 09:30:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7J9UBxq025421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 02:30:22 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 19 Aug 2019 02:30:00 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Aug 2019 17:27:15 +0800
Message-ID: <20190819092715.43954-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] psplash: Avoid mount the psplash tmpfs twice
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
X-List-Received-Date: Mon, 19 Aug 2019 09:30:31 -0000
Content-Type: text/plain

The /etc/init.d/psplash.sh will be invoked both in boot and
shutdown/reboot. And the psplash tmpfs will be mounted twice. This
will trigger a bug in umount and let the system hang when
shutdown/reboot. I already made a patch [1] to fix the issue in
umount, but there is no reason for the psplash to do the twice mount.
So also fix it.

[Yocto 13461]

[1] https://lore.kernel.org/util-linux/20190819083022.12289-1-kexin.hao@windriver.com/T/#u

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-core/psplash/files/psplash-init | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index fee23e681cfb..dcb751907f41 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -25,7 +25,9 @@ done
 
 export TMPDIR=/mnt/.psplash
 [ -d $TMPDIR ] || mkdir -p $TMPDIR
-mount tmpfs -t tmpfs $TMPDIR -o,size=40k
+if [ ! mountpoint -q $TMPDIR ]; then
+	mount tmpfs -t tmpfs $TMPDIR -o,size=40k
+fi
 
 rotation=0
 if [ -e /etc/rotation ]; then
-- 
2.14.4


