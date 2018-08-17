Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5FB860801
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 09:26:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H9Qr7i024025
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:26:53 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 17 Aug 2018 02:26:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 17:26:50 +0800
Message-ID: <1534498011-388674-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] sstate: Avoid indirect auto-archive-native dependencies (via SSTATE_EXCLUDEDEPS_SYSROOT)
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
X-List-Received-Date: Fri, 17 Aug 2018 09:26:52 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

remove the indirect dependcy of auto-archive-native to avoid
not needed .m4 installed into sysroot, which may cause
compile problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/layer.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index cc77d07..63346ae 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -90,6 +90,8 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->.*-initial.* \
     .*(base-passwd|shadow-sysroot)->.* \
 "
-
+# Avoid adding autoconf-archive-native to sysroot without a specific
+# dependency in the recipe. 
+SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 # We need to keep bitbake tools in PATH
 PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
-- 
2.7.4


