Received: from huawei.com (huawei.com [45.249.212.35])
 by mx.groups.io with SMTP id smtpd.web10.14612.1591193364444190991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 07:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: huawei.com, ip: 45.249.212.35, mailfrom: zhengjunling@huawei.com)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 1937099C5D05E4BD5577
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2020 22:09:20 +0800 (CST)
Received: from HULK-Android.huawei.com (10.113.189.218) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 3 Jun 2020 22:08:42 +0800
From: "Junling Zheng" <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
CC: <zhengjunling@huawei.com>, <fanyiming@huawei.com>
Subject: [OE-core] [PATCH] security_flags: Remove stack protector flag from LDFLAGS
Date: Wed, 3 Jun 2020 22:08:41 +0800
Message-ID: <20200603140841.1321-1-zhengjunling@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.113.189.218]
X-CFilter-Loop: Reflected
Content-Type: text/plain

SECURITY_LDFLAGS contains stack protector flag inappropriately, which
has already be contained in SECURITY_CFLAGS. Let's remove it from
SECURITY_LDFLAGS.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/conf/distro/include/security_flags.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 568d03693c..a9e5b311af 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -26,8 +26,8 @@ SECURITY_STACK_PROTECTOR ?= "-fstack-protector-strong"
 SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
-SECURITY_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro,-z,now"
-SECURITY_X_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro"
+SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
+SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
 GCCPIE_powerpc = ""
-- 
2.17.1

