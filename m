Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD5AB71AD1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 05:29:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA55TrAt014141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Nov 2016 22:29:53 -0700 (PDT)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 4 Nov 2016 22:29:53 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 5 Nov 2016 13:29:50 +0800
Message-ID: <d0e0e5d4c0fb820f9917735e384e55eac602b587.1478323482.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1478323482.git.dengke.du@windriver.com>
References: <cover.1478323482.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] trace-cmd: fix QA warning
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
X-List-Received-Date: Sat, 05 Nov 2016 05:29:52 -0000
Content-Type: text/plain

Add PACKAGECONFIG for audit.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
index dd9a8a0..05f5f9a 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-input.c;beginline=5;endline=8;md5=3ec82f43bbe0cfb5951ff414ef4d44d0 \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[audit] = ",,audit"
+
 EXTRA_OEMAKE = "\
     'prefix=${prefix}' \
     'bindir=${bindir}' \
@@ -20,6 +23,7 @@ EXTRA_OEMAKE = "\
     'libdir=${@oe.path.relative(prefix, libdir)}' \
     \
     NO_PYTHON=1 \
+    ${@bb.utils.contains('PACKAGECONFIG', 'audit', '', 'NO_AUDIT=1', d)} \
 "
 
 do_compile_prepend() {
-- 
2.7.4


