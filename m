Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8151B6EFA6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 21:41:24 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so29234020ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 13:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=UEz5VFM5Dl5AhqTyy1Qql1oR2yodo22LHcdmal7JrRU=;
	b=mUHK5QuBqv3kaeWmD/a2grozhLoa/hpeFo897paTprPU8tWB9S6md5WPIdWleUldcM
	V2gzcEsxNFKtl8465Uk0hiijCD8ID5DQgy6mteeksbjbsUmRB0cT4VKq78NywMem5jHn
	RSG0youLFL1xn6F6bMShz5l5Qksd9eGeSMponeVDcwCrMfF5QBV6W4/ujyKMzdEWyIps
	eyPR9IdL7w4aXiJmRr0UibNg3RYGCBXj4VwqFOZRKjqxv7H8Ix1SvxLNnjNdzw9DTYTm
	fQtt/GUkKUXW5zjfHQHpXhcJJpDiB63xTn/g2NKPNO719Xkd7yD/kHghW4Pi828JPy1Z
	V28g==
X-Received: by 10.236.98.39 with SMTP id u27mr23067067yhf.27.1392586885288;
	Sun, 16 Feb 2014 13:41:25 -0800 (PST)
Received: from localhost.localdomain ([201.53.197.242])
	by mx.google.com with ESMTPSA id n6sm41989930yha.20.2014.02.16.13.41.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Feb 2014 13:41:24 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2014 18:40:57 -0300
Message-Id: <1392586858-12205-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
References: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH v2 1/2] kernel-yocto: Add do_diffconfig task
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
X-List-Received-Date: Sun, 16 Feb 2014 21:41:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of using 'diff' command between two kernel config files,
the task diffconfig does the job creating the file
$WORKDIR/fragment.cfg that user should review and use.

[YOCTO #3862]

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 8f79932..fab5d4c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -411,3 +411,5 @@ do_kernel_link_vmlinux() {
 OE_TERMINAL_EXPORTS += "GUILT_BASE KBUILD_OUTPUT"
 GUILT_BASE = "meta"
 KBUILD_OUTPUT = "${B}"
+
+do_diffconfig[depends] += "virtual/kernel:do_kernel_configme"
-- 
1.8.3.2


