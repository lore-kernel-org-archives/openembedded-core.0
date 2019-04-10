Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 095CE7D42C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 22:56:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t17so4753945wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pjfC2oyi1Lr/IDUly6tKo+2DfT4n+/gcb7Msu3yORyE=;
	b=Lja3bgqtMPvlBGoBCcTKOSRrmrbL0OuCt0LPPGqqygAwp9OaswZXG0aDCCo5f7uBJz
	mDL2r00FT6rgiyG/1oiuaSmhhsV08Ajm0QTJoMc/yCbKx21RMZWKwq2vdSTKXLgA5jOh
	O5p8yQUk0FF5lZoc8Tx/9J8PqxFYneL9ijqBD+Q4FhCG3JwncyypLJMGTTG8M/br/nZG
	eYLvhC24Fl4rWwu0lmgtmu0f38+gSRQnkrhQAMa5MSDLenJSMYZaceqwJhBnujVY1SFn
	YhhdaZFOIUrgs5HlfM4MrhGhFunymzfzsXhYX3ZpnLMl3RSLwWBOdGxoNj1mXYGJV1Mx
	yB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pjfC2oyi1Lr/IDUly6tKo+2DfT4n+/gcb7Msu3yORyE=;
	b=SbwOZBhSdQ2p0srFjXo7Vi20YF8ZiYCnwbvau0ZguOnHko4DyNMGn08+LK58vPuHvz
	6xqgyCteCDLjOwbcXbx1fNnkAENkbPMJNyZd1CZ45UnGjI+fNp0KA7zEkeRZHpFdO1Ll
	mBgtSeftsa/1YoniQHaRLmjExajQ6aEp3NDyTRQ2//eu4/JUTRxAyhOGk/Fj72NEYiLv
	vSCZq9CLQ/F1IBsBTyihjjWQF2u6la2alq4YS2NsA0EBke+BZWak+t9iaPuy/2EgHKsa
	sJvDXYxkQA+nVoPJPLf27hmvwrOQPOTzc3T5YyqUpdMMuc/DxvXi1PSNxSacEqzmahU8
	LEJg==
X-Gm-Message-State: APjAAAUctG4J/xo8xjsfYMujX8aYB+rBkwSOrL4Qxt0vzpCFI3ceCt9I
	yMlYQBd5B6VdsZXNjZ2pC+Ms1yHMxmk=
X-Google-Smtp-Source: APXvYqwojvrFLwW++uXJ1PLvM+s6M7DJ79F+qtrGrIyisxUPUbFXbnkWC7Ts8/ng2ZYuNc7Dw9x7cA==
X-Received: by 2002:adf:f803:: with SMTP id s3mr10085366wrp.54.1554936991567; 
	Wed, 10 Apr 2019 15:56:31 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-180.residential.rdsnet.ro.
	[5.13.211.180]) by smtp.gmail.com with ESMTPSA id
	y17sm42694360wrh.60.2019.04.10.15.56.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Apr 2019 15:56:31 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
X-Google-Original-From: Beniamin Sandu <beniamin.sandu@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 01:55:24 +0300
Message-Id: <20190410225524.7489-1-beniamin.sandu@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kernel-devsrc: check for localversion files in the kernel source tree
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
X-List-Received-Date: Wed, 10 Apr 2019 22:56:31 -0000

The kernel-devsrc rework doesn't take into account localversion
files in the kernel source tree. This might result in modules with an
incomplete version magic when building out-of-tree using the SDK.

Before:
root@qemux86:~# insmod hello.ko
[   42.000212] hello: version magic '5.0.3-yocto-standard SMP preempt
mod_unload PENTIUMM ' should be '5.0.3-my-custom-release-yocto-standard
SMP preempt mod_unload PENTIUMM '
[   42.008200] hello: version magic '5.0.3-yocto-standard SMP preempt
mod_unload PENTIUMM ' should be '5.0.3-my-custom-release-yocto-standard
SMP preempt mod_unload PENTIUMM '
insmod: can't insert 'hello.ko': invalid module format

After:
root@qemux86:~# insmod hello.ko
[   39.094288] hello: loading out-of-tree module taints kernel.
[   39.108044] Hello World!

Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 69a8eaef81..ed265f702d 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -228,6 +228,11 @@ do_install() {
 
         # required to build scripts/selinux/genheaders/genheaders
         cp -a --parents security/selinux/include/* $kerneldir/build/
+
+	# check for any localversion files
+	if [ -f localversion* ]; then
+	   cp localversion* $kerneldir/build/
+	fi
     )
 
     # Make sure the Makefile and version.h have a matching timestamp so that
-- 
2.17.1


