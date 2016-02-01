Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4197723C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:36 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id o6so46539951qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ew7BykdmYgBH5y/aFs6SiUSXSqnikcekqGQfSl6uQJw=;
	b=sXDOyGc0r+8pD9mkYB6IrcSGVON7iGCHopIXhMrxbMbRQUcTmfquMH+wGI2ykJkWNF
	jH56lEcy2xS1XNyAnk8RWI2K5lFM9ffrg0nIFwdIfbmEPVtaG9Tymcj9NwPXg9h9tWmz
	NjulKjia0WpsJUBYBpCQoJ61pTseVW3PJ//2KXVQ0dsUIwi0+w0P85iQz8R5uDSlcdNk
	+cZ6rIWam2EAV0BkicTJYAsgCo1glhFJt9IBtoh57qkpXBlntn10OK7COzY2Uk6VboQH
	SApsdrZq1RQ14c8vl1P5wBEmy+x80wWSV/hrrO+xp8nGy9ikvK3SyNQ6jCEIcluKDhAl
	Em/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Ew7BykdmYgBH5y/aFs6SiUSXSqnikcekqGQfSl6uQJw=;
	b=KN0vtdkGbeJ25vAk4NaFNRmttD4v+25Y7eizaOV7z9mHyRz4P2Fkqj5Gkq2W5+NHN4
	YGMn2clmmgsyW90sTyv9bltZ/w1mnqzMwVDO0EaBvwzEYkzTCpaxgohn5fuAD0Ki1gzw
	Ovjkr0Bsn5oiMTgId8R78QvHx11sKCM5OKTUWxETNhipurSu5bYZjgOZeEdDjjGGCJtd
	zlUCesL64QJ1rPpQgSdfQUxGH7W14KGrUnGdBSj76JswfoDHnGKvm/E5rNSlbF/0PDKw
	exD22OwlrTsuyu/vOXDdvSalPCQl7k7BT704NhmAPPoWLgROnG9xQ22AWhm2OjCISa5t
	axqw==
X-Gm-Message-State: AG10YOReW9MejyQFxHeRnMefWuI+Vo/YLUNJ9cl0eWICuWphybtforv9VvdkeFl8qjBGjg==
X-Received: by 10.55.74.9 with SMTP id x9mr26353004qka.81.1454303316967;
	Sun, 31 Jan 2016 21:08:36 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	b6sm12058940qkh.12.2016.01.31.21.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:26 +0000
Message-Id: <daa108339dadf287835946b39af7a149919eed84.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
Subject: [PATCH 5/8] libtool-cross: Unset pre|post dep objects
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:36 -0000

predep_objects and postdep_objects are specifying the duplicate objects
which are better computed by gcc/g++ driver, since we want to generate
PIE, PIC and non-PIC combinations, let gcc decide on this, since it
knows best about linker options to use in each of these situations.
When we defer the linker options to driver, we also need to remove
-nostdlib from linker commandline options.

Remove duplicate directory creation for ${D}${bindir_crossscripts}/

This fixes a frequent problem we see during -fpie links e.g.

|
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64/usr/include/c++/5.3.0/iostream:74:
undefined reference to `__dso_handle'
|
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld:
.libs/cxx_channel.o: relocation R_X86_64_PC32 against undefined hidden
symbol `__dso_handle' can not be used when making a shared object
|
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld:
final link failed: Bad value

After this change libtool gets changed as below

 old_archive_from_expsyms_cmds=""

 # Commands used to build a shared archive.
-archive_cmds="\$CC \$pic_flag -shared -nostdlib \$predep_objects
\$libobjs \$deplibs \$postdep_objects \$compiler_flags \$wl-soname
\$wl\$soname -o \$lib"
-archive_expsym_cmds="\$CC \$pic_flag -shared -nostdlib \$predep_objects
\$libobjs \$deplibs \$postdep_objects \$compiler_flags \$wl-soname
\$wl\$soname \$wl-retain-symbols-file \$wl\$export_symbols -o \$lib"
+archive_cmds="\$CC \$pic_flag -shared  \$predep_objects \$libobjs
\$deplibs \$postdep_objects \$compiler_flags \$wl-soname \$wl\$soname -o
\$lib"
+archive_expsym_cmds="\$CC \$pic_flag -shared  \$predep_objects
\$libobjs \$deplibs \$postdep_objects \$compiler_flags \$wl-soname
\$wl\$soname \$wl-retain-symbols-file \$wl\$export_symbols -o \$lib"

 # Commands used to build a loadable module if different from building
 # a shared archive.
@@ -11908,8 +11908,8 @@

 # Dependencies to place before and after the objects being linked to
 # create a shared library.
-predep_objects="/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64/usr/lib/../lib/Scrt1.o
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64/usr/lib/../lib/crti.o
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64/usr/lib/../lib/x86_64-oe-linux/5.3.0/crtbeginS.o"
-postdep_objects="/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64/usr/lib/../lib/x86_64-oe-linux/5.3.0/crtendS.o
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64/usr/lib/../lib/crtn.o"
+predep_objects=""
+postdep_objects=""
 predeps=""
 postdeps="-lstdc++ -lm -lgcc_s -lgcc -lc -lgcc_s -lgcc"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
index 8478802..432f010 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
@@ -16,7 +16,11 @@ do_configure_prepend () {
 do_install () {
 	install -d ${D}${bindir_crossscripts}/
 	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
-	install -d ${D}${bindir_crossscripts}/
+	sed -e 's@^\(predep_objects="\).*@\1"@' \
+	    -e 's@^\(postdep_objects="\).*@\1"@' \
+	    -i ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
+	sed -i '/^archive_cmds=/s/\-nostdlib//g' ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
+	sed -i '@^archive_expsym_cmds=@s@-nostdlib@@g' ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
 	GREP='/bin/grep' SED='sed' ${S}/build-aux/inline-source libtoolize > ${D}${bindir_crossscripts}/libtoolize
 	chmod 0755 ${D}${bindir_crossscripts}/libtoolize
 	install -d ${D}${target_datadir}/libtool/build-aux/
-- 
2.7.0


