Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 163BA7719D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 03:34:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A3Y3KK022588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2016 20:34:03 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 9 Aug 2016 20:34:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 11:19:44 +0800
Message-ID: <20160810031944.20136-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: Fix missing check for permission denied.
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
X-List-Received-Date: Wed, 10 Aug 2016 03:34:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

If the path to "ROOT_SYSCONFDIR /mke2fs.conf" has a permission denied problem,
then the get_dirlist() call will return EACCES. But the code in profile_init
will treat that as a fatal error and all executions will fail with:
      Couldn't init profile successfully (error: 13).

But the problem should not really be visible for the target package as the path
then will be "/etc/mke2fs.conf", and it is not likely that a user have no
permission to read /etc.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...s-fix-missing-check-for-permission-denied.patch | 32 ++++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb  |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
new file mode 100644
index 0000000..33054c6
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -0,0 +1,32 @@
+Subject: [PATCH] Fix missing check for permission denied.
+
+If the path to "ROOT_SYSCONFDIR/mke2fs.conf" has a permission denied problem,
+then the get_dirlist() call will return EACCES. But the code in profile_init
+will treat that as a fatal error and all executions will fail with:
+      Couldn't init profile successfully (error: 13).
+
+Upstream-Status: Pending
+
+Written-by: Henrik Wallin <henrik.b.wallin@ericsson.com>
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ lib/support/profile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/support/profile.c b/lib/support/profile.c
+index 51a3314..1c1039f 100644
+--- a/lib/support/profile.c
++++ b/lib/support/profile.c
+@@ -335,7 +335,7 @@ profile_init(const char **files, profile_t *ret_profile)
+ 				*last = new_file;
+ 				last = &new_file->next;
+ 			}
+-		} else if ((retval != ENOTDIR) &&
++		} else if ((retval != ENOTDIR) && (retval != EACCES) &&
+ 			   strcmp(*fs, default_filename))
+ 			goto errout;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
index e82124b..837224c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
@@ -11,6 +11,8 @@ SRC_URI += "file://acinclude.m4 \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
 "
 
+SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
+
 SRCREV = "d6adf070b0e85f209c0d7f310188b134b5cb7180"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
-- 
2.7.4


