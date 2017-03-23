Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD4D577AF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:16:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z133so16280613wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6+cQl4uCgW2SvuA3YzcSznj03EMqqy3Rsk5vFp36L3M=;
	b=J7nRiZudGSxlgRraPd1S79+1hj7MIe2gcLySA3Mh/aMy9/mWqYSaMdlow2ZDdqKeUs
	XHXw/tFyb8gGJg+kZd1Yz/4JFXJz7bqFWLn1T0giC4mAk2zoSpOQq0qAb9qKVrp+mO49
	zGjLkz2PkpTJQoajEjGXVppDWjSjOsvExIsGiaz0CsrlFI+0gv9wjLvE6Nl9o3mvXbqT
	kThcH9L9RkUGh2zUyqrD5Qnumcx+m1vdZYVrVhbGoXwBoF3Fkey8wWHMPcWn7AM2pEno
	Lvs/vM+//nFPtxmucTJEDgxFWSZGlUeeBeZNC/hEhj8nn6QEGXgDiehG4SCCMxC//xb2
	WNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6+cQl4uCgW2SvuA3YzcSznj03EMqqy3Rsk5vFp36L3M=;
	b=ZGROHwHXCUoRc7mqh2IQpT+WwWVGvcK+gLlnX/g4ORe8dPQWBuQWaPWWILv60Kstj+
	VNAQR0zcJw357C9qBK6FI9FHn9NfUpTz3Mj5YmMuMy4QcF+g3nxh1SEoqUsgJmD0dDTD
	X/v6iLFdFV0reojuXdl50Zjy9bgVsl8Cp8RoyKo9ByH85xmdK5iSlxXsB4M0m5la58Wa
	nIq1aDeuS27qkAESRrsMQsF3aa/gVD3MNqNgXW6hDAA1QKcQKtP0Zf1KI4uv0tw8oSAY
	dhH3fAVhomx6jHNhieAKxRStiQo2MX5K7+bADy8ljA2SinHUH5GOyFwal+hSqkz4irNO
	/7AQ==
X-Gm-Message-State: AFeK/H0iB7ke8E6s45D3WDvJGR/+PRYb8GuBvGJDb+BR2WqYaXW4aLtMe00pGO69+chrZQ==
X-Received: by 10.28.88.129 with SMTP id m123mr2770631wmb.28.1490271386427;
	Thu, 23 Mar 2017 05:16:26 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 82sm1135279wmg.0.2017.03.23.05.16.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 05:16:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:16:29 +0100
Message-Id: <a659511ad2e9309b9ed625f1cebda2af229fd67b.1490271349.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490271349.git.Martin.Jansa@gmail.com>
References: <cover.1490271349.git.Martin.Jansa@gmail.com>
Subject: [PATCH][morty 1/2] rootfs.py: Respect OPKGLIBDIR variable
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
X-List-Received-Date: Thu, 23 Mar 2017 12:16:28 -0000

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
index ed40b23ee4..c4a5086bec 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -949,7 +949,9 @@ class OpkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl'])
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR', True)
+        opkg_dir = os.path.join(opkg_lib_dir, 'opkg')
+        self._setup_dbg_rootfs(['/etc', opkg_dir, '/usr/lib/ssl'])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
 
-- 
2.12.0


