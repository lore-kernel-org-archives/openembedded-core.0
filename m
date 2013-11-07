Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id A8EDA6D44E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 03:53:11 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id wy17so477296pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 19:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=j/P3y+7c6TUqnluJSZjrMKNEmVkXF9g32T4GG1+DLAE=;
	b=HAqypf/8SF9dV/L5rcXngxuqJ8PRMbx5V/yvpiVOE7TFk0DdPZWxK3RTtY7BpyEWkU
	akJSS4Q5wwdXjyPM+A5YlCKC8IW+KSAfVT/mQEDYVMiFBEHkinGtnj7c/V+gWMshX6et
	3lkOuU48phwvWrVHTHuVcG9hHMQLDExkhpb0ka71w/1WxzIvmVJb0PYGld2sphc/g0TO
	jEgEO4wFTr3gitg8OK4q1RMEjNU40vtFykcTjZyQaV1tm4CWe0LHY9EwbI1UFmPuM2mf
	8h/AJ726jZ1RrvGiJiImUFJDN939Isv7DBJJkurJCeLx5UpQgZMidyr8F23fePAZlmGF
	EmLw==
X-Received: by 10.68.185.68 with SMTP id fa4mr6861021pbc.136.1383796393612;
	Wed, 06 Nov 2013 19:53:13 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id vk17sm2526753pab.5.2013.11.06.19.53.12
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 19:53:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 19:52:25 -0800
Message-Id: <1383796345-16492-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] cross-canadian: Let cross-canadian packages build for uclibc
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
X-List-Received-Date: Thu, 07 Nov 2013 03:53:11 -0000

Fixes errors like

Parsing recipes...ERROR: Building cross-candian powerpc for an unknown
TARGET_SYS (powerpc-angstrom-linux-uclibc), please update
cross-canadian.bbclass
ERROR: Building cross-candian powerpc for an unknown TARGET_SYS
(powerpc-angstrom-linux-uclibc), please update cross-canadian.bbclass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 18ee724..70efee3 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -27,7 +27,7 @@ python () {
     tarch = d.getVar("TARGET_ARCH", True)
     if tarch == "powerpc":
         tos = d.getVar("TARGET_OS", True)
-        if (tos != "linux" and tos != "linux-gnuspe"):
+        if (tos != "linux" and tos != "linux-gnuspe" and tos != "linux-uclibc" and tos != "linux-uclibcspe"):
             bb.fatal("Building cross-candian powerpc for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
         # This is a bit ugly. We need to zero LIBC/ABI extension which will change TARGET_OS
         # however we need the old value in some variables. We expand those here first.
-- 
1.8.3.2


