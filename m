Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZeml-0003WR-PS
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:06:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r479mDER004140
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 02:48:13 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 02:48:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <dvhart@linux.intel.com>
Date: Tue, 7 May 2013 05:48:05 -0400
Message-ID: <19419be97c26c48879d4b148e01922e39088327d.1367919920.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367919920.git.liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] e2fsprogs: the max length of debugfs argument is too short
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
X-List-Received-Date: Tue, 07 May 2013 10:06:50 -0000
X-List-Received-Date: Tue, 07 May 2013 10:06:50 -0000
X-List-Received-Date: Tue, 07 May 2013 10:06:50 -0000
Content-Type: text/plain

The max length of debugfs argument is 256 which is too short, the
arguments are two paths, the PATH_MAX is 4096 according to
/usr/include/linux/limits.h, use 2048 (4096 / 2) is a reasonable value.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs-1.42.7/debugfs-too-short.patch       |   28 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
new file mode 100644
index 0000000..db6814d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
@@ -0,0 +1,28 @@
+debugfs.c: the max length of debugfs argument is too short
+
+The max length of debugfs argument is 256 which is too short, the
+arguments are two paths, the PATH_MAX is 4096 according to
+/usr/include/linux/limits.h, use 2048 (4096 / 2) is a reasonable value.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ debugfs/debugfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -2282,7 +2282,7 @@ void do_dump_mmp(int argc EXT2FS_ATTR((unused)), char *argv[])
+ static int source_file(const char *cmd_file, int ss_idx)
+ {
+ 	FILE		*f;
+-	char		buf[256];
++	char		buf[2048];
+ 	char		*cp;
+ 	int		exit_status = 0;
+ 	int		retval;
+-- 
+1.7.11.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
index 3a4f5a8..898ee88 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
@@ -4,6 +4,7 @@ PR = "r0"
 
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
+            file://debugfs-too-short.patch \
 "
 
 SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
-- 
1.7.10.4



