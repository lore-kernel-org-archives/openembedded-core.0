Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41FDA6010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:29:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3B7TQkV000571
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 00:29:26 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 00:29:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 00:29:12 -0700
Message-ID: <47db1a7652c701f5556afd3abedad7b9b8d5498f.1460359568.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460359568.git.liezhi.yang@windriver.com>
References: <cover.1460359568.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/14] systemd: chown hwdb.bin to root:root for do_rootfs
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
X-List-Received-Date: Mon, 11 Apr 2016 07:29:25 -0000
Content-Type: text/plain

From: Christopher Larson <chris_larson@mentor.com>

This is created by qemu for the do_rootfs case, which bypasses pseudo, so we
need to correct the ownership. This fixes a warning issued by
rootfs_check_host_user_contaminated.

(From OE-Core master rev: 4ff6b8cadec10e17dbf884a873a227e29944f5d1)

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 7c66ba2..9346260 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -402,6 +402,7 @@ pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
 		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
 			--root $D
+		chown root:root $D${sysconfdir}/udev/hwdb.bin
 	else
 		udevadm hwdb --update
 	fi
-- 
2.7.4


