Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EBC760116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 01:30:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7L1UKuE017237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 18:30:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 20 Aug 2018 18:30:19 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2018 09:30:18 +0800
Message-ID: <1534815018-138367-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V4] sstate: Avoid indirect autoconf-archive-native dependencies
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
X-List-Received-Date: Tue, 21 Aug 2018 01:30:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

remove the indirect dependcy of autoconf-archive-native via
SSTATE_EXCLUDEDEPS_SYSROOT to avoid not needed .m4 installed
into sysroot, which may cause compile problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index cc77d07..2cbe952 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -90,6 +90,9 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->.*-initial.* \
     .*(base-passwd|shadow-sysroot)->.* \
 "
+# Avoid adding autoconf-archive-native to sysroot without a specific
+# dependency in the recipe.
+SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 
 # We need to keep bitbake tools in PATH
 PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
-- 
2.7.4


