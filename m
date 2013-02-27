Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTu-0000TD-NI
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56jft025905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:45 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:45 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:36 -0500
Message-ID: <d2e776bf3d05bf8005f30f32d24750093ce2efa0.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361940628.git.bruce.ashfield@windriver.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] v86d: compile against userspace safe kernel headers
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
X-List-Received-Date: Wed, 27 Feb 2013 05:23:26 -0000
Content-Type: text/plain

v86d was building directly against the staged kernel in the target
sysroot. This has been fine in the past, but with recent (3.7) changes
to user headers into the "uapi" include structure, there are no longer

Without the preprocesor protection, v86d fails to build against any
kernel with uapi header files.

v86d doesn't actually need the whole kernel tree, the exported headers
are enough to build a working binary. This change sets the v86d variable
to ${STAGING_DIR_HOST}/usr, and once the v86d build adds "include" to the
end of KDIR, we have a valid include path to the target sysroot headers.

This also works for pre-uapi kernel headers, so the change is safe for
most (if not all) kernel's with properly exported headers.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 51829a3..2dbfbb5 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -27,7 +27,7 @@ do_configure () {
 }
 
 do_compile () {
-	KDIR="${STAGING_KERNEL_DIR}" make
+	KDIR="${STAGING_DIR_HOST}/usr" make
 }
 
 do_install () {
-- 
1.7.10.4



