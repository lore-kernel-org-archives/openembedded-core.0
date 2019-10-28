Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F3E267FA84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 22:13:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4728B62Y4bz4Q
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:13:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572300814;
	bh=uhtorODrn7iklT6S9IY1gzqzcCbBhOIafiptuUD3uOk=;
	h=From:To:Subject:Date:From;
	b=YC0nCJIr/P3P5h6LSobdmYy3ozEg2xjSve/VIfjS8YCC8zspvaAMxnp6Wyiga+tCJ
	PaK8+eXEzQrfROp+Ipn+0PTcY9MqaztcPsZ3nFiEaCSE3zEX1FonBK64KIVE7tEwJ0
	8bBeieJKLxfumc2A14e7ERRFZOFoudhKqqNyyhdtp9sxJpljX8Ov7AQTf6kwuvtzDW
	Nz+RYpUDAv8SfUfefl3oBt0+LLkMcy2yMb3bptZqz1uilfqCmUSw47GmiZ54HRSQ8T
	SQLxOW0z8C6iYVpI3vA+V6eOFnjYko2LTWlWYOix4UFwLpHszL0vuJ2JL0skACuOsR
	sbQJvTttJ0BWFeb//f1q0P+VCJHyY9GYsH2i23eumXoVZ1qovIO2QPG2LMuREKA2lO
	VS4hztiE4+dmi7lZ5PSfDjbLPgoy8txi6Xn06eVlqquSiy7/bwOwlURJuTXgtQmW74
	b67bgdK9pYI2JnGRaFekxNp9oSNUIU5VcHJjJ77pD+hueq3/UsTHVipiLhsVI1SHIa
	Od2DZjK0lPAM9mpsL19y9e1yP+JxEtLm/ZGCvcpIGecrK6ZVA8Ej/oyBkEA1C2sst4
	8jU2I0mjRJm4KLxWPbJLzzI6v3cZuUErouGR/GQm9HF2NIqEnNrEaaNZpQuryi0jyR
	Gk3GfIhUVh/GSgey2Q8ljlz0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 00:13:28 +0200
Message-Id: <20191028221328.15756-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v4] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Mon, 28 Oct 2019 22:13:34 -0000

This LD_PRELOAD trick is not really suitable for busybox,
so can be the only part of coreutils needed.

coreutils depends on the new package,
so nothing changes when installing coreutils.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 4a74f619af..57b2c1bdba 100644
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
 
+PACKAGE_BEFORE_PN_class-target += "coreutils-stdbuf"
+FILES_coreutils-stdbuf = "${bindir}/stdbuf ${libdir}/coreutils/libstdbuf.so"
+RDEPENDS_coreutils_class-target += "coreutils-stdbuf"
+
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since coreutils has a lot of m4 files, otherwise there might
 # be an "Argument list too long" error when it is built in a long/deep
-- 
2.17.1


