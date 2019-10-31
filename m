Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D6C797F808
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 12:28:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 473l3M2nclz2Y
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 13:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572524895;
	bh=dcBsQwnLMSOzJYdHM6+MmO1ccd1FomHuvwZl+btiBVI=;
	h=From:To:Subject:Date:From;
	b=QSTBF/EExmhYuGeQNnKfAnnTq2LXvjSWWo4S2hddKOYgYiniefJt/xz8wY0uQOqS4
	9vMY22fzylU+3q3rEvndeiTEYtZcFJWqZ9bdkuMyf0CAmnh3frpcTY66DdHj+E8Oi+
	cs6u3x/B8ewArQqS97rL+OwDyb3sizCjvg5rigMvRXG0roVbVcy5P+32lLFGFT9MN/
	Txq2CkRD8ZZrcXCRt0qz6Euaz4Hg1VkFErfsBhJ0JNjZ9eKZX/Cgic1pdGPiup2Nh3
	/RyePo5gdnHjGL6/VFS+20uXucOuqD15LMd5w0PxxKM8nTfPpDTb+wOR6JftuSXhbS
	QJgvXX38QBBHMmD2Gpn/i9Ysqydtz4BGDJ3ZWpuNwLA3EPfjmRYsLeTCpVFvc2IbXI
	bP97/p5oNrzTHcluISyIW7bZleEDPOA68vIxH9Joeo2+J0Uz6sdiDHDAQa2VyhyxOP
	4W8D9KbXI2sa+VLmQsI0Li4m7UaWoMnbyK9qitE7VvQelMLXqD1OxVAwcqVI9TLxMF
	U3QPqCs3fLLewNEeNlWvJkw7egsq/B7yjrjo1ffYbAGRjZWuRuVxuJ9l8uiNg0vy3V
	TjGfxuIMVe9o1ox5Qoil6nkPQeSqrL3OkcpCBJzv+54SOLTq5BZsIJJr4VbYNOl7Lc
	MsAp8BhyPthnFsXxARmWqrjQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 14:28:14 +0200
Message-Id: <20191031122814.21435-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v5] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Thu, 31 Oct 2019 12:28:17 -0000

The coreutils implementation of stdbuf uses LD_PRELOAD
to dynamically load libstdbuf which calls setvbuf().
This can't be implemented simply in busybox since it produces
one or two statically linked executables. Therefore, stdbuf
should be packaged separately for people who are using busybox
instead of coreutils for the other tools.

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


