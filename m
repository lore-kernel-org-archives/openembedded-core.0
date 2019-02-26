Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8771E60116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 22:52:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w2so15768536wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 14:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5kIl/hbTHxrlaVW97neyA+OgisNtpbbEaSGLIERZaPY=;
	b=Ai/3LARYIatRDz2JslS+2csmEI/32yoQnX53hb9nS4B4Ci5zQkQdTtXBLQDBV7x52f
	+c7T48//QIbE+E+8uULdlHbNtp3WAcpo0ps2KsqJ2XKTj+VAMAtGlgZrYPWp7OrOBDFZ
	eP736AJ09nfeaOijwO/Jb/eJ66aSAlVt2KH3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5kIl/hbTHxrlaVW97neyA+OgisNtpbbEaSGLIERZaPY=;
	b=OwAXv3pfXQOczxfp4mqRJbPik0qyofjRnbfhYTh6OVMdodBoVyzs+qlH4IsH9Bd55n
	ka2oKKZhileyS+nuVyxSf/cZ9fFZlGSAP8bdDebwqEov9iy01nbRN76NE5S6jBklPoQ9
	SRqMEKKyPd+ElDCaGi9BetzcwcZeCJTEFrni4dV0tp4LvYM322bBqJudayUgnVSUb+pK
	ANPZmFyLzHtZKA9uxZpEdVLxpzRdsRw5c0jKDi+idLWvmwL/Km2GRE7PQBWOo0zaNaq2
	nZdzf9f0shZ8KQ7bKYtc7U75yyoNY5l7fwNqwMJAIRPvlm8itvvUxD9OFawu1mG+925e
	GouQ==
X-Gm-Message-State: APjAAAVWOjJ7hBq8J0SoP7n3i/uqVdGqTLGsr2i/PcgJ1zt4y7+RcihM
	yntElX/DEHaARHGEwPfkAjYzxFgVfN4=
X-Google-Smtp-Source: APXvYqxkgG/rE1dkILLYPns1LSC8ykhAGPZXLcdWqEt6HN+jQfFxIC9ICgdcl+a/scLtaeWlIyxhtg==
X-Received: by 2002:a5d:6543:: with SMTP id z3mr52008wrv.200.1551221525689;
	Tue, 26 Feb 2019 14:52:05 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c17sm6900836wrs.17.2019.02.26.14.52.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Feb 2019 14:52:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2019 22:52:03 +0000
Message-Id: <20190226225203.30551-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: Disable hanging tests and other ptest fixes
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
X-List-Received-Date: Tue, 26 Feb 2019 22:52:05 -0000
Content-Transfer-Encoding: 8bit

Disable some tests which hang, blocking many other ptests.

Also add missing test artefacts to improve test pass rate and
fix failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 13bab9068eb..9d21fb00bfe 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -63,11 +63,11 @@ do_install_append () {
 }
 
 do_install_ptest () {
-    for f in Makefile tests/Makefile tests/utils/utils.sh ; do
+    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/load-42*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng ; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-    for f in config/tap-driver.sh config/test-driver ; do
+    for f in config/tap-driver.sh config/test-driver src/common/config/session.xsd src/common/mi-lttng-3.0.xsd; do
         install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
     done
 
@@ -141,8 +141,17 @@ do_install_ptest () {
         -e 's#\(^test.*LDADD.=\)#disable\1#g' \
         -i ${D}${PTEST_PATH}/tests/unit/Makefile
 
+    #
+    # Disable notification tools tests as currently
+    # these hang and cause the rest of the ptests to timeout
+    #
+    sed -e 's#tools/notification/test_notification_ust##g' \
+        -e 's#tools/notification/test_notification_kernel##g' \
+        -e 's#tools/notification/test_notification_multi_app##g' \
+        -i ${D}${PTEST_PATH}/tests/regression/Makefile
+
     # Substitute links to installed binaries.
-    for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd ; do
+    for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd lttng-crash; do
         exedir="${D}${PTEST_PATH}/src/bin/${prog}"
         install -d "$exedir"
         case "$prog" in
-- 
2.20.1


