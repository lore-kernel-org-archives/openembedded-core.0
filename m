Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1695672BC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:55:59 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so14393355wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w72458mQstuZeaZ0Zy/JgToTp9dM55ItyVcOE+CB9ms=;
	b=V4X37cwAGKZobWzy6MukBeLMgM3e7Ks2mxkuUKCQ/EDG82KTe/LaGYw0hfjcfKP+Ip
	5sMcvlzSHv23JlEv/AiSHhfwQ/+rhId6deoDiHyiDREZz/XuovM4NGg8ucMPWfkKhoFL
	XLSuB3e0IFARqkZr0sQFNtDgUvNBt/PtL0z+uxYItTywDL3RggfzDn5hyBBsQjDmwuh5
	s6MXS2YaPY6/O0P+sWjlSNZHtrSDio2FJlYRPggUZKnPzGewLfc7tz4896xG5NQyfTHK
	T6ZZ4eE3rrRD7lvtR9uuCRB6m23nIEV6eKyMscpHz3Seq/U02OHVKa8v5IurwOQNFjbD
	NmNw==
X-Gm-Message-State: ALoCoQkKlKrq87XlX5RB4/kxY5fJ5GGp/Ec8zXAsh37vhZYnKb0xqKvu8M6cHQeFuWn15YdJclAN
X-Received: by 10.194.235.165 with SMTP id un5mr17743842wjc.1.1421322959914;
	Thu, 15 Jan 2015 03:55:59 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm1798509wjc.12.2015.01.15.03.55.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:55:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:54:18 +0000
Message-Id: <1421322860-12652-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
References: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 6/8] kernel-devsrc: Depend on virtual/kernel:do_compile
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
X-List-Received-Date: Thu, 15 Jan 2015 11:56:00 -0000

From: Darren Hart <dvhart@linux.intel.com>

Since virtual/kernel do_compile modifies ${B}, we need to wait for
do_compile to copy everything across in order to ensure a deterministic
file set.

Currently, we race against the build and can see .debug directories, and
the do_compile dependency we will always see them. Add .debug to the
find path pruning.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index a7395c4..e36de1b 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -14,10 +14,11 @@ inherit linux-kernel-base
 inherit module-base
 
 # We need the kernel to be staged (unpacked, patched and configured) before
-# we can grab the source and make the kernel-devsrc package
+# we can grab the source and make the source package. We also need the bits from
+# ${B} not to change while we install, so virtual/kernel must finish do_compile.
 do_install[depends] += "virtual/kernel:do_shared_workdir"
 # Need the source, not just the output of populate_sysroot
-do_install[depends] += "virtual/kernel:do_configure"
+do_install[depends] += "virtual/kernel:do_compile"
 
 # There's nothing to do here, except install the source where we can package it
 do_fetch[noexec] = "1"
@@ -47,7 +48,7 @@ do_install() {
         # artifacts afterwards, and the extra i/o is not significant
         #
         cd ${B}
-        find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
+        find . -type d -name '.git*' -prune -o -path '.debug' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
         cd ${S}
         find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
 
-- 
1.7.10.4


