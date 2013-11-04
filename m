Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA1C6D3C3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 07:14:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA47E44G019980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 23:14:05 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 23:14:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2013 15:13:54 +0800
Message-ID: <fa0a2c84f0b4e6b88d70bb869b24c07a2f70c574.1383549031.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383549031.git.hongxu.jia@windriver.com>
References: <cover.1383549031.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/4] kmod: fix QA issue
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
X-List-Received-Date: Mon, 04 Nov 2013 07:14:03 -0000
Content-Type: text/plain

The commit 7163ebd92a799b8f000b2b6f303b20de468b5f90
Revert "kmod: Use base_libdir for installing libkmod"

It caused a QA Issue WARNING:
...
WARNING: QA Issue: kmod: /bin/kmod, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libkmod.so.2 => /usr/lib64/libkmod.so.2 (0x00000000dead1000)
...

But we did this reasonably, we should skip the qa check explicitly.

[YOCTO #5142]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index f90b9aa..b370016 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -15,6 +15,7 @@ RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod
 bindir = "${base_bindir}"
 sbindir = "${base_sbindir}"
 # libdir = "${base_libdir}"
+INSANE_SKIP_${PN} = "unsafe-ref-bin"
 
 do_install_append () {
         install -dm755 ${D}${base_bindir}
-- 
1.8.1.2


