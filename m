Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE6E72F11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 10:34:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n11so15623066wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=B/PJElGdM0uWZCwEto3PI9uKLRwYdD+oQffwxTw/l5g=;
	b=k6cxK7bTMRpUtmmxU6AUuT6Uo9gqbaJ2AQo9r90apjM/RGar7FJSPgZju75J3Z28i4
	g0gpT/lD9YfS2p1qyegtXNUPxWa68ffkFgp9pBTpFVkChXpuWlVw/+HzCTNA/M+32k0C
	rCSKcs9xfocVk+On02d5+2GHFnTCcWQ3RORnXifjzc+LKgBUBysIgDitt8ID82ofTm3a
	7P7SKJ83/qNLhDuGHUvjiGSZiloPy5lPV6r5vNtQZ+GTE1a6dEXvImMllVotVZyJtNv9
	lEXoBm841mshNoGT4PmHs34wrNCOOD6NKeprmV+kYoVQnpBAPGDSFuVhApylixCYu9T1
	gQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=B/PJElGdM0uWZCwEto3PI9uKLRwYdD+oQffwxTw/l5g=;
	b=KQIW6PmaWFJLkrIxos7HSQJGoro3w+BTUWpbb8l3tj+kGsb+S4bWWEYLd68l36Xppv
	MpL0Ebk9qkpNE+6mxqeKG3SiOlnm+Ex+uTStWWo+RECac52O77vXfZhDwSNWJQPN193y
	Td7hS0XMQhBefMtzwXvxmjBL6zgCLiXX02y+NdJz8AMixXCmWvXYY5zU6w7mZDzEPlXZ
	2WU8+fWXHSY10wazwDABM3sui9Wsf89KZxZjwOLMbYBa+X1EQegA/VO91hLB7cZeIaNE
	yrOBDuKIaghWSqJDGwsZlqPu6tqNBzDz1ZrY2R8o1UD0thYRafpHxEqrkRsSSxbrxMtI
	HQ0A==
X-Gm-Message-State: AFeK/H2CBvkH6FpJQx6ts1dyfUbMfkXWSNWIPe65gXWBdJc67Xy8uH38rJA2ly/VT/k+EA==
X-Received: by 10.28.186.65 with SMTP id k62mr182936wmf.0.1490265260293;
	Thu, 23 Mar 2017 03:34:20 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u145sm3841899wmu.1.2017.03.23.03.34.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 03:34:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 11:34:22 +0100
Message-Id: <3d7e2a0b6f99a996eb981c0fb64a9954247002d2.1490265213.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490265213.git.Martin.Jansa@gmail.com>
References: <cover.1490265213.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] rootfs.py: Respect OPKGLIBDIR variable
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
X-List-Received-Date: Thu, 23 Mar 2017 10:34:19 -0000

* when OPKGLIBDIR doesn't have the default /var/lib value it will
  silently fail to copy package database from normal rootfs to debugfs
  rootfs and then when trying to install *-dbg complimentary packages
  it won't install anything, because installed_pkgs.txt file generated
  from debugfs is empty

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5e1c09762a..068b784c51 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -946,7 +946,9 @@ class OpkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/var/lib/opkg'])
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR', True)
+        opkg_dir = os.path.join(opkg_lib_dir, 'opkg')
+        self._setup_dbg_rootfs([opkg_dir])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
 
-- 
2.12.0


