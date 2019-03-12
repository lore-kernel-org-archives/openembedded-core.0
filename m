Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id AF6797C69B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 21:13:45 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 01EAB134F31;
	Tue, 12 Mar 2019 17:13:47 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id Yy3POleEdesJ; Tue, 12 Mar 2019 17:13:46 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id A17BC134F2A;
	Tue, 12 Mar 2019 17:13:46 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com A17BC134F2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552425226;
	bh=s3oyO+oIVbjgJCk3Pw1n35qX4xF2vsvMFjpWNFTXaPE=;
	h=From:To:Date:Message-Id;
	b=ZOnT+ExgZQxHvd2+74g3xiZE8YyDO4lANLGrOYQtEWzIv6gQdoymGh/PHIZqAJAjz
	LmKdWefKJobGKpzDDaTQ6Ey9Dc8KOz2vT3aYhpFkjauX6T0B9HyST9WREDCZ4F0EQC
	SuPWvDmwknNEhVJbdQ3ZE6xr9/sldXIvEfrIA2DOgNC5cLJclJUGTIxqzhxWb7An6c
	kXcUmGcyZiaQxBxsaKt/JOyMbHWi9Q0j3wKQPJhhDf3RT36ylKo92vTLZoF1++Lpkk
	rzcC093jMq2CSogSHa2199oDn1f3NmCfi+nMT/8OVzUe7N06jJ/6zniI9XQsMesL+p
	Jt32dtKlbx4ng==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 2KFGMUwMrQhW; Tue, 12 Mar 2019 17:13:46 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 7DAD1134F25;
	Tue, 12 Mar 2019 17:13:46 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 21:13:30 +0000
Message-Id: <20190312211330.30850-2-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
References: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
Subject: [PATCH 2/2] lttng-tools ptest: fix test_ust-dl
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
X-List-Received-Date: Tue, 12 Mar 2019 21:13:46 -0000

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 .../lttng/lttng-tools_2.10.6.bb               | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 3324959cc3..37b6161cda 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -87,6 +87,9 @@ do_install_ptest () {
         install -d "${D}${PTEST_PATH}/tests/$d"
         find "${B}/tests/$d" -maxdepth 1 -executable -type f \
             -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
+        # Take all .py scripts for tests using the python bindings.
+        find "${B}/tests/$d" -maxdepth 1 -type f -name "*.py" \
+            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
         test -r "${B}/tests/$d/Makefile" && \
             install -t "${D}${PTEST_PATH}/tests/$d" "${B}/tests/$d/Makefile"
     done
@@ -98,11 +101,19 @@ do_install_ptest () {
                 *.so)
                     install -d ${D}${PTEST_PATH}/tests/$d/
                     ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
+                    # Remove any rpath/runpath to pass QA check.
+                    chrpath --delete ${D}${PTEST_PATH}/tests/$d/$f
                     ;;
             esac
         done
     done
 
+    #
+    # Use the versioned libs of liblttng-ust-dl.
+    #
+    sed -i -e 's!:liblttng-ust-dl.so!:liblttng-ust-dl.so.0!' \
+        "${D}${PTEST_PATH}/tests/regression/ust/ust-dl/test_ust-dl.py"
+
     install ${B}/tests/unit/ini_config/sample.ini ${D}${PTEST_PATH}/tests/unit/ini_config/
 
     # We shouldn't need to build anything in tests/regression/tools
@@ -119,16 +130,6 @@ do_install_ptest () {
         -e 's/^all-am:.*/all-am:/' \
         {} +
 
-    # These objects trigger [rpaths] QA checks; the test harness
-    # skips the associated tests if they're missing, so delete
-    # them.
-    objs=""
-    objs="$objs regression/ust/ust-dl/libbar.so"
-    objs="$objs regression/ust/ust-dl/libfoo.so"
-    for obj in $objs ; do
-        rm -f "${D}${PTEST_PATH}/tests/${obj}"
-    done
-
     find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
         touch -r "${B}/Makefile" {} +
 
-- 
2.17.1


