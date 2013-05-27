Return-Path: <Samuli.Piippo@digia.com>
Received: from smtp1.digia.com (smtp1.digia.com [82.118.214.156])
	by mail.openembedded.org (Postfix) with ESMTP id AEE4561AD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 10:24:35 +0000 (UTC)
Received: from smtp1.digia.com (unknown [127.0.0.1])
	by IMSVA80 (Postfix) with ESMTP id D34E1370051
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 13:24:34 +0300 (EEST)
Received: from IT-EXCAS01-HKI.it.local (unknown [10.9.52.70])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp1.digia.com (Postfix) with ESMTP id C3FE2370041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 13:24:34 +0300 (EEST)
Received: from piippo.it.local (10.9.5.71) by IT-EXCAS01-HKI.it.local
	(10.9.52.75) with Microsoft SMTP Server (TLS) id 14.2.283.3;
	Mon, 27 May 2013 13:24:34 +0300
From: Samuli Piippo <samuli.piippo@digia.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 May 2013 13:24:45 +0300
Message-ID: <1369650285-13285-1-git-send-email-samuli.piippo@digia.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Originating-IP: [10.9.5.71]
Subject: [PATCH] gdb-cross-canadian: use correct exec-prefix path for python
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
X-List-Received-Date: Mon, 27 May 2013 10:24:36 -0000
Content-Type: text/plain

Incorrect exec-prefix path was given to gdb which leads to gdb
startup failure when SDK is not installed to its original destination.
Gdb relocates the exec-prefix path, so it will work for SDKs that
are installed to different location. PYTHONHOME env in no longer
neeeded for gdb.

[YOCTO #3839]
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index f6f515c..3cb347b 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -19,7 +19,7 @@ cat > ${WORKDIR}/python << EOF
 case "\$2" in
         --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
         --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
-        --exec-prefix) echo "${exec_prefix}/bin" ;;
+        --exec-prefix) echo "${exec_prefix}" ;;
         *) exit 1 ;;
 esac
 exit 0
-- 
1.7.10.4


