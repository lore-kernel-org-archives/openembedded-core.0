Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C15887894F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 09:33:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w089XEIm009557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jan 2018 01:33:14 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 8 Jan 2018 01:33:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jan 2018 17:33:08 +0800
Message-ID: <93aceef120e6bbb1234a46b1aab697b2df41f474.1515403603.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1515403603.git.liezhi.yang@windriver.com>
References: <cover.1515403603.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] multilib.bbclass: deltask populate_sdk and populate_sdk_ext
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
X-List-Received-Date: Mon, 08 Jan 2018 09:33:12 -0000
Content-Type: text/plain

The "bitbake image -cpopulate_sdk/ext" generates SDK/eSDK for all multilib
variants, so "bitbake lib32-image -cpopulate_sdk/ext" is not needed, and it
doesn't work well, for example:

MACHINE ?= "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake lib32-core-image-minimal -cpopulate_sdk_ext
[snip]
Exception: FileExistsError: [Errno 17] File exists: '/buildarea/lyang1/test_q64/tmp/sysroots-components/core2-64/openssl/sysroot-providers/openssl10' -> '/buildarea/lyang1/test_q64/tmp/work/qemux86_64-pokymllib32-linux/lib32-core-image-minimal/1.0-r0/lib32-recipe-sysroot/sysroot-providers/openssl10'
[snip]

The problem is populate_sdk_ext installs all multilib variants, and
extend_recipe_sysroot() handles foo-image depends lib32-foo-image, but doesn't
handle lib32-foo-image depends foo-image, we can use a lot of trick ways to make
it work:
1) Get foo-image's RECIPE_SYSROOT when build lib32-foo-image
2) Handle conflicts with foo-image.do_rootfs
3) Handle conflicts when "bitbake lib32-foo-image foo-image -cpopulate_sdk_ext"

And maybe other potential problems, this looks painful, so just delete the task.

[YOCTO #12210]
---
 meta/classes/multilib.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 770863f..13ba030 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -145,3 +145,6 @@ python do_package_qa_multilib() {
         check_mlprefix(pkg, 'RREPLACES', ml)
         check_mlprefix(pkg, 'RCONFLICTS', ml)
 }
+
+deltask do_populate_sdk
+deltask do_populate_sdk_ext
-- 
2.7.4


