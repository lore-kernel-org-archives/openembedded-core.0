Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EAB479A69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 07:13:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9F7D3PF015325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Oct 2018 00:13:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 15 Oct 2018 00:13:03 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 15 Oct 2018 14:31:40 +0800
Message-ID: <84f2e5966b74b916e144bf09f41bc8721bcd3c5a.1539579939.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1539579939.git.kai.kang@windriver.com>
References: <cover.1539579939.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] image.bbclass: set consistent staging dirs
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
X-List-Received-Date: Mon, 15 Oct 2018 07:13:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When enable multilib, staging dirs are expanded with ${MLPREFIX} in
multilib.conf. For multilib image such as lib32-core-image-minimal, it
requires 64 bit packages at some situation. For example, it requires
syslinux, grub-efi etc when build 'wic' rootfs. But these 64 bit
packages are populated to 'recipe-sysroot' rather than
'lib32-recipe-sysroot'. And then causes do image fails.

Set consistent staging dirs for image to fix such issues.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/image.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 34fdbb0850..8e958ba919 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -603,6 +603,11 @@ MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${l
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
+# set consistent staging dirs
+RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
+STAGING_DIR_HOST = "${WORKDIR}/recipe-sysroot"
+STAGING_DIR_TARGET = "${WORKDIR}/recipe-sysroot"
+
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
-- 
2.18.0


