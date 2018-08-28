Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 377F178F6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 14:44:06 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id h33-v6so1574236edb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=90+R5jv+DALpHHmq6pZEXBv81chQzemjShZ1qzehVE8=;
	b=BqSqORw7h2FgkV0KwNvBqzyrkC/G3l4bKHs3fRTpMlmPXVOQ1dftzJMkYsoomAEswJ
	BIDo5jorLC2OayE5iVyA0RbYrJi8GMOUOsseTtRBhBRyvRQYw+uYhq5Gu1OY0qLESkQ6
	wpLztGm3c21aOUCeLqj5wLCD7climiXAAmRaSLWUGFrNQA30UuQruPzTuTUDOaodUHvY
	LDg6jq7kJ85xJf/4xdxJ9NwPptI1I/c6Jmxz/8E0KTQE8uwBi7DnMmpdj+SFGbzB/qlv
	gD4PphllOxo8y3ocmfAfx+wdMro/ovLRJi4iAIdIji6VJF80gaJUNq8Ni2VSAnHJYoYV
	kLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=90+R5jv+DALpHHmq6pZEXBv81chQzemjShZ1qzehVE8=;
	b=jzSTDc2vTnzpUCXj6OYlOU07QNNIKS5e/6Hl+oV20daPxbjBQHWSnCHamiY43Xqo5b
	nIzTunGu1747OeF7LU17sa+rK7/fN1dKgswnEoAuSvIFjSIHXYLCSIYpfsoKVs8hYP0q
	IH8YnM3HMxfWJLtK0FmApx2IVmSfTsk9yd5IzT8zDU0qJDDicPatm5rF8+6/z2n5GjRM
	9cN2gDMIn4zkztyaARRfHqDhTw0POi2WTOcyE3+AvhLEHqIpeky+5lBXhzY7tJaFE5vl
	Bq5U7s6VebUFkIsX5ewjRiRTaBfgwW5ag/mRa5VZb9ZcN0V9SHpotyExn/cCyaUNxyB1
	9q6w==
X-Gm-Message-State: APzg51C0HOeMS126y0YObtgK1aoHJicfcCZgMxxmO+1N+o8xMrkmXHyV
	39kY8udJcSNMPFNaUT+fcY92tatg
X-Google-Smtp-Source: ANB0VdbQ4SmzQJpKJWAPbHKoo2wI8isorjXBWg0yW/5r84NSDW3OHn5KDiQfEl/PLGaCyEwVPfvbHg==
X-Received: by 2002:a50:ef1a:: with SMTP id
	m26-v6mr2856107eds.136.1535467446591; 
	Tue, 28 Aug 2018 07:44:06 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	g39-v6sm844865edg.63.2018.08.28.07.44.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 07:44:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 16:43:58 +0200
Message-Id: <1535467439-14475-1-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] kmod: do not reset $bindir/sbindir, use EXTRA_OECONF instead
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
X-List-Received-Date: Tue, 28 Aug 2018 14:44:06 -0000

This was causing issues with classes that use $bindir to find
already installed binaries in rootfs (manpages class in particular).

$bindir needs to be the same for all recipes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index 69185b2..b256793 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -13,9 +13,7 @@ RREPLACES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod mod
 RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 
 # autotools set prefix to /usr, however we want them in /bin and /sbin
-bindir = "${base_bindir}"
-sbindir = "${base_sbindir}"
-# libdir = "${base_libdir}"
+EXTRA_OECONF += " --bindir=${base_bindir} --sbindir=${base_sbindir}"
 
 do_install_append () {
         install -dm755 ${D}${base_bindir}
-- 
2.7.4


