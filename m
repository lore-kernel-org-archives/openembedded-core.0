Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 23F116BC44
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 17:24:16 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id n18so6247583lfh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 09:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZsL9UIRaHIYXEryzzcTMmG81Io5tCn/U6H2o9jwfxzw=;
	b=e+bj4hamInSZGstBT5kj0ewIE2bSxQelowTrOZ8SPo1e79J1NjhKQkXnMND0hP1lDb
	MwzUrBPzJzz15RqjdN1Z4faZacQ4kge8+sgivbFWR+pFci0pVwI8CDTJy6qk2WjyErvN
	9tcal/R0GpU5JhLCH+awDpK9FuXtcrzmKUCwTWyE041cypOw9Eg1tlmeFxLpj2H2OPu3
	scojt95C2gIrLxnf1N40VUt5EFg3sOgElRK0GD/Tdoe8BbPTtJxq8SybbGrvPoiCPz+3
	xmFQmmJKcaQIkJIwm7JpPd2y++WWuDhiUXR3S567jWW4h/bE3sM/qiRBFwVNk+/82Qgz
	zUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZsL9UIRaHIYXEryzzcTMmG81Io5tCn/U6H2o9jwfxzw=;
	b=De8akGovvgVv38TZd1S7BS+5g2S0t5yr8HyWj2Amt6sCaYDUn/MQ0Zqul9ZBT6rK9/
	1IakvdU66zRLWdsob7z27K0Vu5UJxsYfajL+Fp67V7AmodOo5/ob5yPz/fluBvMu3fUt
	yNKXywXTtpkI9zpGG0PimEukgNKgzih4cvU+VqfNBMNMBpisbs9c56yJzTFFpPxKnXOX
	PlUBCvAfisHe279oYNz02gaSkab6B9sVqRibSbfZCUmT0LOFqoWj3oV+bmB58s6naUj0
	YmWs0xyCLSYTZwkHC6WaPOEQ8diiO1QGFnKOjNPY4+aZTLQoI83TZdvDBD25WImd32rG
	vlWg==
X-Gm-Message-State: AJcUukfvdcGSagnVuLCdyxitwg0Pv/qAmf3JwkgRJBAJgE+F5DBdzUsb
	3xpVu5bEMpbS5ybHkb4cNRhqaBle5Y0=
X-Google-Smtp-Source: ALg8bN5Wk0wDkBhUq+gEELnGFoO/RCX/ij9aJI9lFZdbmEXq9YBtYGGGRb9cTv3cqb/5eosh+QGNEg==
X-Received: by 2002:a19:7111:: with SMTP id m17mr3900232lfc.64.1547054656376; 
	Wed, 09 Jan 2019 09:24:16 -0800 (PST)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	h22-v6sm14796552ljg.24.2019.01.09.09.24.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Jan 2019 09:24:15 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 18:24:13 +0100
Message-Id: <1547054653-32439-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] meta: clean up IMAGE_ROOTFS/IMGDEPLOYDIR creation code
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
X-List-Received-Date: Wed, 09 Jan 2019 17:24:16 -0000

From: Ming Liu <liu.ming50@gmail.com>

It is not necessary to create IMAGE_ROOTFS/IMGDEPLOYDIR in rootfs.py,
they could be handled by do_rootfs[dirs], in a cleaner way.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 meta/lib/oe/rootfs.py      | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 11927f3..7f447d0 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -251,7 +251,7 @@ fakeroot python do_rootfs () {
 
     progress_reporter.finish()
 }
-do_rootfs[dirs] = "${TOPDIR}"
+do_rootfs[dirs] = "${IMAGE_ROOTFS} ${IMGDEPLOYDIR} ${TOPDIR}"
 do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
 do_rootfs[umask] = "022"
 do_rootfs[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4273891..945c769 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -19,7 +19,6 @@ class Rootfs(object, metaclass=ABCMeta):
         self.d = d
         self.pm = None
         self.image_rootfs = self.d.getVar('IMAGE_ROOTFS')
-        self.deploydir = self.d.getVar('IMGDEPLOYDIR')
         self.progress_reporter = progress_reporter
         self.logcatcher = logcatcher
 
@@ -188,10 +187,6 @@ class Rootfs(object, metaclass=ABCMeta):
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND")
         rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND')
 
-        bb.utils.mkdirhier(self.image_rootfs)
-
-        bb.utils.mkdirhier(self.deploydir)
-
         execute_pre_post_process(self.d, pre_process_cmds)
 
         if self.progress_reporter:
-- 
2.7.4


