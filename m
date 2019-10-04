Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 11A5F7E648
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 14:17:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46lBll5HD1z4S
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 16:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570198643;
	bh=lWosT+XZ2U9joYZdTX0fyWOQcErUlMO/899rZFJ67lk=;
	h=From:To:Subject:Date:From;
	b=tCeMocwPX0Bew+Q7UW1O+nVOhGFHzCM5B7uxG1XqeY2ShCRVcxN2F1zubVSN0A1sK
	EM7tif9GGynpjzdDLRgVNjCUWxmb+WpuD3V0VmuFur9S4NGR0nKD8TWDlEf9ForRFp
	D/AknUlasBe6W4gx4Nf+fvcY0UP3fS26KHZFaETtFvLmWxx634M4td8WLmu9eDPuWM
	YF+ddIUm8nuHSrnu+tvyAhXki7rPJ2HvDorBjzJ5Koz+9DrsbNbWLSAzrsiQRckkxi
	0K6+fstzjpnXsGE6W4umrrgoxWoOWw/VDkWPGBJksyam1lqGd8OTL6cIagGoKh/K22
	u1kmVaWcRqfkGSktRpxvs/WaLXukqCo+URmp8/HZZ7muNnk4BDmViGd4qjE5bDDQoo
	CkNl9p/mvjsOJ4/SjA5BuoF6Vpo8it3n0eqsyZYai2xE0IlQep87b4+ZQL4N5oGiKb
	NTyeG01NKMz5D71ip7CLWSLX2nogtYmTjVSZw6jIl8NRnMqXUdjFRmZd8BZp60YQY6
	eFPqpL3I7E1Zk0JWJI4l/z4IIal/NIn9DLq+0mj20a2YHUCNRXprmecUYNsV7XR7/l
	qMojaWWY1ocU1Tsq17+vRG/hSIsmZl6csHjyQdbQQjg3+pPNWAfeLUtbcccber2R8y
	Xc8e7W2lXBF6iD/7ExNOzen4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2019 17:17:22 +0300
Message-Id: <20191004141722.27828-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Fri, 04 Oct 2019 14:17:26 -0000

This LD_PRELOAD trick is not really suitable for busybox,
so can be the only part of coreutils needed.

coreutils depends on the new package,
so nothing changes when installing coreutils.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 4a74f619af..5c0a4a96a8 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -49,7 +49,7 @@ bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
                 pinky pr printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
-                sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout \
+                sha384sum sha512sum shred shuf sort split sum tac tail tee test timeout \
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 
 # hostname gets a special treatment and is not included in this
@@ -58,6 +58,10 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill l
 
 sbindir_progs= "chroot"
 
+PACKAGE_BEFORE_PN += "${PN}-stdbuf"
+FILES_${PN}-stdbuf = "${bindir}/stdbuf ${libdir}/${PN}"
+RDEPENDS_${PN} += "${PN}-stdbuf"
+
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since coreutils has a lot of m4 files, otherwise there might
 # be an "Argument list too long" error when it is built in a long/deep
-- 
2.17.1


