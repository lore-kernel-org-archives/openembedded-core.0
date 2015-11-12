Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id E51967729F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:39:59 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so79551925pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O+CiGCTXFM6/xPOkGe+a1wddRofo484W/L+21pFEyKg=;
	b=jd3V0VDXpaeBBTFXeCFCtmAhwWuAr21SqWCOWTvtOjl1BF5Yj+c6FtNbsowp3WxxlA
	+z1ZN2Erf10hnvU+wnieJ+U3bogyJ3S5hZgFzX2IhGgI1tst7K2n3YU0f+Losf1EFB0i
	16eMp4H3cY7SPjMSQiA69lat4TNCdcy26NuMes3fz4e1TRxcxgi6d55TqDfV/qFilatC
	uji2ifydxCIy7SsCN+K6ThQQQKAN5P1kk+irNO6pl0TV5C1tXjUowxdi9vm5JeDjBIdd
	HjFm+zHYLGV3ewRdXJSR0KfchwQ06ZxsmDnQ1SyFcGRQGZ3XY1CSV+atS8Dv2WcqOaPG
	Lxrw==
X-Received: by 10.66.160.229 with SMTP id xn5mr27141251pab.0.1447371599846;
	Thu, 12 Nov 2015 15:39:59 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.39.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:39:58 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:18 -0700
Message-Id: <847d1559aa1fd42a0ba850fc9679a265a03bc6dd.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 07/11] systemd: chown hwdb.bin to root:root for do_rootfs
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:00 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is created by qemu for the do_rootfs case, which bypasses pseudo, so we
need to correct the ownership. This fixes a warning issued by
rootfs_check_host_user_contaminated.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 18c2448..9b0503d 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -401,6 +401,7 @@ pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
 		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
 			--root $D
+		chown root:root $D${sysconfdir}/udev/hwdb.bin
 	else
 		udevadm hwdb --update
 	fi
-- 
2.2.1


