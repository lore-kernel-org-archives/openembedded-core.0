Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8426F78869
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 09:05:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7T958HU006696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Aug 2018 02:05:08 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 29 Aug 2018 02:05:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 17:04:57 +0800
Message-ID: <1535533498-36841-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] security_flags.inc: use `?=' to set a default var-lcl_maybe_fortify
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
X-List-Received-Date: Wed, 29 Aug 2018 09:05:10 -0000
Content-Type: text/plain

- Since poky enable security flags+pie by default, tweak comments
to sync with it.
[poky commit]
491082c poky.conf: Enable security flags+pie by default
29d76b3 poky-lsb: Remove including security_flags.inc
[poky commit]

- Use `?=' to set a default lcl_maybe_fortify, it is helpful for
variable OVERRIDES.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/security_flags.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 4e20a4d..e113f99 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -3,14 +3,14 @@
 # or both so a blacklist is maintained here. The idea would be over
 # time to reduce this list to nothing.
 # From a Yocto Project perspective, this file is included and tested
-# in the DISTRO="poky-lsb" configuration.
+# in the DISTRO="poky" configuration.
 
 GCCPIE ?= "--enable-default-pie"
 # If static PIE is known to work well, GLIBCPIE="--enable-static-pie" can be set
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
-lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
+lcl_maybe_fortify ?= "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
 
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
-- 
2.7.4


