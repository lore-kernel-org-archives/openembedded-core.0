Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 415EF745C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:01:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7TE1hYj024020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Aug 2018 07:01:43 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 29 Aug 2018 07:01:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 22:01:40 +0800
Message-ID: <1535551300-9964-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535533498-36841-2-git-send-email-hongxu.jia@windriver.com>
References: <1535533498-36841-2-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] security_flags.inc: add var-SECURITY_STACK_PROTECTOR to improve variable OVERRIDES
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
X-List-Received-Date: Wed, 29 Aug 2018 14:01:44 -0000
Content-Type: text/plain

There are var-SECURITY_PIE_CFLAGS, var-lcl_maybe_fortify and
var-SECURITY_STRINGFORMAT which are helpful for OVERRIDES.

Also add var-SECURITY_STACK_PROTECTOR, and drop hardcoded `_remove'
overrides. Such as `4ca946c security_flags: use -fstack-protector-strong',
it s/-fstack-protector-all/-fstack-protector-strong/, only tweak
var-SECURITY_STACK_PROTECTOR is sufficient.

The fix does not have any side affect on SECURITY_CFLAGS of glibc/
glibc-initial/gcc-runtime, these three directly assigned with "".
...
SECURITY_CFLAGS_pn-glibc = ""
SECURITY_CFLAGS_pn-glibc-initial = ""
SECURITY_CFLAGS_pn-gcc-runtime = ""
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/security_flags.inc | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e113f99..620978a 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -21,11 +21,13 @@ SECURITY_PIE_CFLAGS ?= "${@'' if '${GCCPIE}' else '-pie -fPIE'}"
 
 SECURITY_NOPIE_CFLAGS ?= "-no-pie -fno-PIE"
 
-SECURITY_CFLAGS ?= "-fstack-protector-strong ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
-SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+SECURITY_STACK_PROTECTOR ?= "-fstack-protector-strong"
 
-SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
-SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
+SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+
+SECURITY_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro,-z,now"
+SECURITY_X_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
 GCCPIE_powerpc = ""
@@ -56,9 +58,9 @@ SECURITY_STRINGFORMAT_pn-gcc = ""
 TARGET_CC_ARCH_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 
-SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
-SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
-SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
+SECURITY_STACK_PROTECTOR_pn-gcc-runtime = ""
+SECURITY_STACK_PROTECTOR_pn-glibc = ""
+SECURITY_STACK_PROTECTOR_pn-glibc-initial = ""
 # All xorg module drivers need to be linked this way as well and are
 # handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
-- 
2.7.4


