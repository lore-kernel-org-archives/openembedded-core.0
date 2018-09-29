Return-Path: <Kexin.Hao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF913799A7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:09:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T79daR003661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:09:40 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 00:09:39 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 15:01:45 +0800
Message-ID: <20180929070147.88203-3-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180929070147.88203-1-kexin.hao@windriver.com>
References: <20180929070147.88203-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] wic: isoimage-isohybrid: Drop the unnecessary reference of STAGING_DATADIR
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
X-List-Received-Date: Sat, 29 Sep 2018 07:09:39 -0000
Content-Type: text/plain

Actually the bootimg_dir is the value of the STAGING_DATADIR, so we
can use it directly.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 170077c22c21..d9c7b55f03c5 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -360,11 +360,6 @@ class IsoImagePlugin(SourcePlugin):
             chmod_cmd = "chmod 644 %s" % bootimg
             exec_cmd(chmod_cmd)
 
-        # Prepare files for legacy boot
-        syslinux_dir = get_bitbake_var("STAGING_DATADIR")
-        if not syslinux_dir:
-            raise WicError("Couldn't find STAGING_DATADIR, exiting.")
-
         if os.path.exists("%s/isolinux" % isodir):
             shutil.rmtree("%s/isolinux" % isodir)
 
@@ -373,19 +368,19 @@ class IsoImagePlugin(SourcePlugin):
 
         cls.do_configure_syslinux(creator, cr_workdir)
 
-        install_cmd = "install -m 444 %s/syslinux/ldlinux.sys " % syslinux_dir
+        install_cmd = "install -m 444 %s/syslinux/ldlinux.sys " % bootimg_dir
         install_cmd += "%s/isolinux/ldlinux.sys" % isodir
         exec_cmd(install_cmd)
 
-        install_cmd = "install -m 444 %s/syslinux/isohdpfx.bin " % syslinux_dir
+        install_cmd = "install -m 444 %s/syslinux/isohdpfx.bin " % bootimg_dir
         install_cmd += "%s/isolinux/isohdpfx.bin" % isodir
         exec_cmd(install_cmd)
 
-        install_cmd = "install -m 644 %s/syslinux/isolinux.bin " % syslinux_dir
+        install_cmd = "install -m 644 %s/syslinux/isolinux.bin " % bootimg_dir
         install_cmd += "%s/isolinux/isolinux.bin" % isodir
         exec_cmd(install_cmd)
 
-        install_cmd = "install -m 644 %s/syslinux/ldlinux.c32 " % syslinux_dir
+        install_cmd = "install -m 644 %s/syslinux/ldlinux.c32 " % bootimg_dir
         install_cmd += "%s/isolinux/ldlinux.c32" % isodir
         exec_cmd(install_cmd)
 
-- 
2.14.4


