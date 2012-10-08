Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TL219-00084S-It
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 03:20:23 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so3147176pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Oct 2012 18:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=QiS4QO9JOh6tCNGRZFe4G7deFVQMrpsVEhKZsMX29gE=;
	b=fashzj1xsp49SH4kF7ABQ8mkcfXJfWeIjMXxmMxWnOmi3X/ZKV5nTLiTIFCs4ozapd
	pzcd5mac5GgIlBH7sK2ByfmtZaAbZXbfBj/7ziyeuBfWfPgBb8GAowA++bGM97Er8Opl
	Yyv+3HkJPWmkMHK0L8Kk7bzSua4FxaXIPCezs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=QiS4QO9JOh6tCNGRZFe4G7deFVQMrpsVEhKZsMX29gE=;
	b=IWQqz0oPz+09XglCkq88JGT6DG0YCKV6y7WU9I345f3ACYyYXhzFCzoOCoHIHTTd4Y
	mcPoT4vioFKIzez5qOq/S+JiDojAitW/Zjirmv9+YvjegkG3GEgxuQF6Jv/WJ87OU+OY
	PQZKL77/63mxyiVx6OgPsvFZ1TDOSpTnk36ZkbugWfhAmgJBSEVsffjiLxBNtNpPJmnk
	QjdK2OZ2KLh6yVFIGvMY2iQvw/cUOgwfRdkVNJ7hp2PMZhrHzCprZagn2Rynws0UpIZY
	Pklv2aZH2o2ty9g1abgK842C9kOI3fYRzj/n6ACWYKXfXz380Vqvl9eASWCCS+RFP+AF
	A1qw==
Received: by 10.68.226.136 with SMTP id rs8mr8884624pbc.153.1349658437184;
	Sun, 07 Oct 2012 18:07:17 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id wl4sm9815259pbc.17.2012.10.07.18.07.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 07 Oct 2012 18:07:16 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Oct 2012 18:07:11 -0700
Message-Id: <1349658431-18779-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk4wMR3C9Yzk6RTbai6zfk2o9Cc4L3iVzC/wlZuGppV5qGmtavJx07R0THOR1KrhH+iiyF4
Subject: [PATCH] nfs-export-root: add explict no_subtree-check to suppress warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 01:20:24 -0000

exportfs: /etc/exports [1]: Neither 'subtree_check' or 'no_subtree_check' specified for export "*:/".
  Assuming default behaviour ('no_subtree_check').
  NOTE: this default has changed since nfs-utils version 1.0.x

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../devel-config/nfs-export-root.bb                |    2 ++
 .../devel-config/nfs-export-root/exports           |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
index 41259ac..fff60ca 100644
--- a/meta/recipes-devtools/devel-config/nfs-export-root.bb
+++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
@@ -3,6 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+PR = "r1"
+
 SRC_URI = "file://exports"
 
 S = "${WORKDIR}"
diff --git a/meta/recipes-devtools/devel-config/nfs-export-root/exports b/meta/recipes-devtools/devel-config/nfs-export-root/exports
index b7257aa..1353c5a 100644
--- a/meta/recipes-devtools/devel-config/nfs-export-root/exports
+++ b/meta/recipes-devtools/devel-config/nfs-export-root/exports
@@ -1 +1 @@
-/ *(rw,no_root_squash,async)
+/ *(rw,no_root_squash,async,no_subtree_check)
-- 
1.7.9.5



