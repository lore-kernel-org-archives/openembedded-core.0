Return-Path: <anibal.limon@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anibal Limon" <anibal.limon@linaro.org>
Subject: [PATCH][dunfell] lttng-modules: do not search in non-existing folder during install
Date: Wed,  8 Dec 2021 14:21:18 -0600
Message-Id: <20211208202118.2624929-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, richard.purdie@linuxfoundation.org, Andrey Zhizhikin <andrey.z@gmail.com>, =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>

From: Andrey Zhizhikin <andrey.z@gmail.com>

When CONFIG_TRACEPOINTS is not enabled in kernel config - module
compilation is skipped, which causes the ${D}/${nonarch_base_libdir} not
to be created.

This fails later in do_install:append() due to the fact that find
command in executed for non-existing folder.

Check for folder existence before find command in executed.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de0aa1700ed4e6f04b0a233eb1f6d2ac598e7ed8)
Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
index 3fdc8094e9..3145f0298c 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
@@ -39,7 +39,9 @@ EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
 
 do_install_append() {
 	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
+	if [ -d ${D}/${nonarch_base_libdir} ]; then
+		find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
+	fi
 }
 
 python do_package_prepend() {
-- 
2.34.1

