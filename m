Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 948917F0D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 14:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46lBqJ2r6kz4S
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 16:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570198828;
	bh=ElL9YtRZUySVB7maisEi+VmXPoKvu195BvWccQlIlv4=;
	h=From:To:Subject:Date:From;
	b=dxubNN6i1x6QU3IIRO35AM2Xf4tqSAjhCipPeqYHbIGvOWzMpkMkJzrcv4fSuaTtN
	UANoAg3qgECIfZn42cT9FixresOq8h7huBSZr3fsjnIo4P5P6onJ7HXek7kRqhy/Mb
	jwt9egOklgKYdGwg06Dk9WznAQHGALSfSuW9yK+XMZDgZ31sm2PQqcWs0ZBCpzMll1
	Gsb3dZkErs58VlrO5Yk45uOpQBMVOJ2G/NybRgRbUbhzdHy6hKRSu7ipE6rgBs2S3R
	55L7FdI/e4qnsPfDBTs/GDT/6JjtXEwdmVa/nL8J5ZjCgAXXup7VRZXUhAPRKdz8tc
	0eRDdQQDcRjblY2YztSgdK7ybMP+yv/J6M9EwTI+y816PQH3/V/CM7X0sKL3fJcKR+
	HEbgtQlmozO19RLAnsV2bnLeXFjHyMsSYEc1HlzY7ITMNcfwcftucERSuS1Qwp/9yV
	ukAYWrKzdsbTCAQgEMVikNzcZ1kqLVLsOu5BJoOwY5b/m0fwBuur56kp+CG2Uyk8OO
	RiHIhai7J91o8+KnIx0fKy1HHt2JNOICSuN60nSuzQoQA3H37KT/kuxY+hqaJvYl4s
	VVzT0G2IjZSj4h//I03RDqfBFNeuKxfe3YuGgTrO3sLo4RQzDVm6pcJutvq2mLzdZt
	cYYoF/bZLca+8IqbHQEG63s0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2019 17:20:27 +0300
Message-Id: <20191004142027.27324-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Fri, 04 Oct 2019 14:20:28 -0000

This LD_PRELOAD trick is not really suitable for busybox,
so can be the only part of coreutils needed.

coreutils depends on the new package,
so nothing changes when installing coreutils.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 4a74f619af..cfeb42d579 100644
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
+FILES_${PN}-stdbuf = "${bindir}/stdbuf ${libdir}/${PN}/libstdbuf.so"
+RDEPENDS_${PN} += "${PN}-stdbuf"
+
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since coreutils has a lot of m4 files, otherwise there might
 # be an "Argument list too long" error when it is built in a long/deep
-- 
2.17.1


