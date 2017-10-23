Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 827B16FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:43:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9NAhXux003305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 03:43:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 23 Oct 2017 03:43:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Oct 2017 18:44:32 +0800
Message-ID: <4f1aa881f21424b71dd9fda2c47240c14166c471.1508748511.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1508748511.git.Qi.Chen@windriver.com>
References: <cover.1508748511.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix strange behaviour on qemumips64
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
X-List-Received-Date: Mon, 23 Oct 2017 10:43:32 -0000
Content-Type: text/plain

On qemumips64, `systemctl status <unit>' would have the output of
`systemctl show <unit>'. This is incorrect.

However, it's not the code logic that cause such problem. It's the
compilation flags.

Looking back the history, we had problem with systemd on qemumips64
which is also related to compilation flags. We solved that by using
tweaking FULL_OPTIMIZATION for mips64 to have "-fno-tree-switch-conversion
-fno-tree-tail-merge".

Now systemd has been upgraded to 234, and we don't have the above problem
any more. However, a new problem appears, and that is the output of `systemctl
status <unit>'.

Hence, we set '-O0' flag for mips64 when building systemd to avoid potential
strange problems.

[YOCTO #12266]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 36fd3f8..b294604 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -158,8 +158,8 @@ CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', ''
 # disable problematic GCC 5.2 optimizations [YOCTO #8291]
 FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
 
-# Avoid login failure on qemumips64 when pam is enabled
-FULL_OPTIMIZATION_append_mips64 = " -fno-tree-switch-conversion -fno-tree-tail-merge"
+# Disable optimization on qemumips64 to avoid strange behaviour
+FULL_OPTIMIZATION_append_mips64 = " -O0"
 
 COMPILER_NM ?= "${HOST_PREFIX}gcc-nm"
 COMPILER_AR ?= "${HOST_PREFIX}gcc-ar"
-- 
1.9.1


