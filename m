Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 675746011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 20:59:37 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t26so32463156ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 12:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N1c5kjqZK0qyge4G/Mqx2n6vqA8L82xvbv/q70WRtHg=;
	b=TaOdUs8JWkvVsSg5B99UKZIi9RMSBPeqTWkhLHYwr1q56WRNir34vLg+jiWMNwNVSo
	IreUb1ZtgLMrPU+SPew29aKBU+fALY90N9YrvZb1PGuovYgToUYhhtAPC/TW2n2OvL8L
	P19aGcreQqSi2YOlTJgKT4tj5zwMNugWRLWo7ygN2gC3/tKv7umDYt42DNF7KbzmSN+n
	Qth6+Zx1Pg64E8iKMH2ieDp8jes8V133O4YzFtA2SrNHpXiKjWvdeL8TR5tauDO9Eb22
	GqPwVp/xOsAGFBaL3DGkvXYKuYK2KzQId5UDosQwpVybNFQ+83/aRG0YL+N5gVqASMKE
	P/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N1c5kjqZK0qyge4G/Mqx2n6vqA8L82xvbv/q70WRtHg=;
	b=OgHtdktvbUp/DVvlyIIQoQK2g5LSVsEh8N7cQHxFaOPffLo27mbxJFzofRnf+lIjXo
	CJ9+fmSDuQq+dAZVj80lqnU6SBi3pMqJxXeCqIfSgMUQMGKYoS14fugO3L6oAGXzGfd5
	8IpcO8D+a0xuK8/lc31WTmPqtxZ1wWaPQWF7KT2BfSGOBnUw8Ek4ILVKLvuYj68ZkMiC
	O5NHKLfHzLS+iRsZdvsMsnzeovtrcZiZmSQLoCYEKjyZ5MVNuVl7IbFbPOwXAvNZVVJe
	vS8cPt0PVq3F5EIFjtj1+Jn6poVZLR3t+joWidaxbj//34q6hXYjE4MUDgKkYZbSZRr7
	XscQ==
X-Gm-Message-State: APjAAAWoqquL1CSeCWx+DLwlnPUPpu9Y+4O0ct4c6XbQe1C/H8zZlxpk
	s9WjdBtZaL7Ctt+mmkkLk58HXpcR
X-Google-Smtp-Source: APXvYqwq3dQf21h+JatFC6dmbf99PFXrc8O7S0qyQ3whGUnvm2mjArfeSgeHP2oi+h5npt4BrDPgOQ==
X-Received: by 2002:a5e:d617:: with SMTP id w23mr43868163iom.98.1577739577969; 
	Mon, 30 Dec 2019 12:59:37 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id x25sm9704247iol.6.2019.12.30.12.59.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 12:59:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 14:59:29 -0600
Message-Id: <20191230205929.1878113-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] classes/image_types_wic: Depend on do_image_complete tasks
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
X-List-Received-Date: Mon, 30 Dec 2019 20:59:37 -0000
Content-Transfer-Encoding: 8bit

do_image_wic now depends on the do_image_complete tasks from all it's
dependencies. This allows images recipes specified in WKS_FILE_DEPENDS
(for example, if a machine wants to put a initrd into a boot partition)
to correctly trigger rebuilds for the wic image.

Note that recrdeptask can't be used as was done for do_deploy because
this would cause circular task dependency errors. This shouldn't be
necessary anyway if the dependencies specified in WKS_FILE_DEPENDS are
complete.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/image_types_wic.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index f350dc2723..7d5ebe1cb0 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -46,6 +46,7 @@ do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r
 
 # We ensure all artfacts are deployed (e.g virtual/bootloader)
 do_image_wic[recrdeptask] += "do_deploy"
+do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
-- 
2.23.0


