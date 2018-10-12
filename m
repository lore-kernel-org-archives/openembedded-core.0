Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD73060596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:20:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9C2JJsH014949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:19:29 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 19:19:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Oct 2018 10:24:51 +0800
Message-ID: <aef25553a12c8d7c896b4a99272e5d8064cae260.1539310768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1539310768.git.Qi.Chen@windriver.com>
References: <cover.1539310768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-core-lsb/-full-cmdline: add bzip2
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
X-List-Received-Date: Fri, 12 Oct 2018 02:20:08 -0000
Content-Type: text/plain

We are having the following error when using 'tar' from tar
recipe to decompress .tar.bz2 files.

  tar (child): bzip2: Cannot exec: No such file or directory
  tar (child): Error is not recoverable: exiting now
  tar: Child returned status 2
  tar: Error is not recoverable: exiting now

The tar package is introduced by these two packagegroups into image.

From the README file from tar's source codes:

  """
  ** gzip and bzip2.

  GNU tar uses the gzip and bzip2 programs to read and write compressed
  archives.  If you don't have these programs already, you need to
  install them.
  """

So we'd better cluster gzip and bzip2 with tar. These two packagegroups
already get 'gzip', so we also add 'bzip2'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb | 1 +
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index e86168802..ffa8388 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -125,6 +125,7 @@ RDEPENDS_packagegroup-core-full-cmdline-initscripts = "\
     "
 
 RDEPENDS_packagegroup-core-full-cmdline-multiuser = "\
+    bzip2 \
     cracklib \
     gzip \
     shadow \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 933864a..6631547 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -136,6 +136,7 @@ RDEPENDS_packagegroup-core-lsb-core = "\
     bc \
     binutils \
     binutils-symlinks \
+    bzip2 \
     coreutils \
     cpio \
     cronie \
-- 
1.9.1


