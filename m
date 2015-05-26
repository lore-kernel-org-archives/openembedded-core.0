Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id D157775666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 23:04:40 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so71305506igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 16:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=H2V6tfCWHiN2hwvjtBVAobLvxMCJ7Vd39FMTI8wyi5w=;
	b=LQtNfohxfImFIkUeceKFxjDYZfmspPU3px1l+HsAEuwXWXpBSkSmqvQylOMKRi+//s
	rYUvRy+FGx6ZXZuzyo2gZXPsYHDBsTmroDfwGkFt9n2pYlqJc7QAo6feYRz9jtyL05vk
	znhRKs8Iav2RNwXeQMOq63Hux1O+Q0Z81x4vwtcttzqHRIcJbR+mEJ3vp5wIKNWfIjU7
	8FiKNRvE6Lon7a3ld4M6IS1zvxF80DPtj3t98FL+CNJhezLtv09KdbG7N1/zXs1lzX28
	mF37WUfs7vDgLtcg8pX6v1ujRrob55mZ1smetOuC+8I1vCaTSEAHFBJqDrETdJ6FajUq
	Scqg==
X-Received: by 10.43.5.74 with SMTP id of10mr81694icb.67.1432681481252;
	Tue, 26 May 2015 16:04:41 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id qh1sm430573igb.17.2015.05.26.16.04.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 May 2015 16:04:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 May 2015 16:04:31 -0700
Message-Id: <1432681471-18514-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc-source.inc: set PATH for gnu-configize, not for cd
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
X-List-Received-Date: Tue, 26 May 2015 23:04:43 -0000

Setting OE's PATH for the 'cd' command has no real effect.

In the normal case it has no effect for the gnu-configize command
either (since OE's PATH is already set in the context which runs
do_preconfigure) but it may be useful when manually re-running a
failed gnu-configize commandline copied from an error log, etc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index a4b27c8..529b8e0 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -24,7 +24,7 @@ PACKAGES = ""
 
 python do_preconfigure () {
     import subprocess
-    cmd = d.expand('PATH=${PATH} cd ${S} && gnu-configize')
+    cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
     # See 0044-gengtypes.patch, we need to regenerate this file
     bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
-- 
1.9.1


