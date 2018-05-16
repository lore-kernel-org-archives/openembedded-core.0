Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 3F48D748AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 09:13:59 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id BE9555C1B03;
	Wed, 16 May 2018 11:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1526462040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=dwU2hF1ogJxOriL2fg3Isrg6itKYCdBzPwJ1ff2jx40=;
	b=bVgBFcETNtXUe2DX1TpRIqWm1KEygevun2vhEKbbjKS6aoqTgf9hHew+Z6E50frQyuQnDv
	hVxiEKlJ4cP/ZRsSpmaKnujrR3dge+WDQCd7QrJqf7tJ1aufyKDSBRlvEZ/wIXkEJ76eTn
	WYd3xOVvyOzLk8X63I8/6FY+XSyurIU=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org, alexander.kanavin@linux.intel.com
Date: Wed, 16 May 2018 11:13:52 +0200
Message-Id: <20180516091352.29279-4-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180516091352.29279-1-stefan@agner.ch>
References: <20180516091352.29279-1-stefan@agner.ch>
X-Spamd-Result: default: False [0.90 / 15.00]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	BAYES_HAM(-0.00)[12.64%]; MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[];
	TO_DN_SOME(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
	MID_CONTAINS_FROM(1.00)[];
	ASN(0.00)[asn:6830, ipnet:46.140.0.0/17, country:AT];
	RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2 3/3] rootfs.py: for dpkg/opkg, don't install postinsts if package management is present
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
X-List-Received-Date: Wed, 16 May 2018 09:14:00 -0000

From: Stefan Agner <stefan.agner@toradex.com>

If package management is present opkg/dpkg will bring the original
copy of the postinsts scripts with the metadata and will be able to
handle postinsts just fine. In fact, it is preferred to let package
management handle the postinsts scripts in this case since it will
keep the package managers database up-to-date too. The run-postinsts
scripts will make sure the package manager gets invoked instead of
the scripts directly.

Note: Before commit 5aae19959a44 ("rootfs.py: Change logic to
unistall packages") rootfs.py did not install /etc/$pm-postinsts
too. It is not clear whether that change was intentionally or just
a bug. This commit fixes/reverts that aspect of the commit.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/lib/oe/rootfs.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f8f717c050..0a57d87f71 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -560,6 +560,9 @@ class DpkgOpkgRootfs(Rootfs):
         return pkg_list
 
     def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
+        if bb.utils.contains("IMAGE_FEATURES", "package-management",
+                         True, False, self.d):
+            return
         num = 0
         for p in self._get_delayed_postinsts():
             bb.utils.mkdirhier(dst_postinst_dir)
-- 
2.13.6


