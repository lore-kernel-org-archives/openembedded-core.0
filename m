Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C92EC48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:50:42 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.3690.1706813434659027501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=ABi+mC8f;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E21B6240104
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 19:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1706813432; bh=TQGe2lxBkBfxigoecoZQofzgaA2OvHxZIL+EILOiQ8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ABi+mC8fbnEONLecTQp50JVb/ic2lnUn8eI0yjSpI3f6G8ASLFeFiSR6r+xhHXpA9
	 2bTYlrqARMuevUgqQBgGVM9n09GRCGh/zZATuoePTSVfqD607uZKRF2cA/VpzIvPZ0
	 JN4ZE6DqUZmTz9e6rLSjmZ7Zc5euk/fLLcIPcvuJX4Q/3CJ6r/eo4CyjnqS0VY4cmp
	 haTaOmCO98qxazBRar6AHQYb4xZ4P4KidjrwkZRqVi/4nWIp9N0B7+NZQhMuZhtpyx
	 UFautXmHroB6js7wSOH7mSvJ5E7vQ4/EC05MbMPQOxGAnkd7R+chhVvT0u8cuWouLv
	 88nNChRD8KarQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TQnzD0Kmrz9rxG;
	Thu,  1 Feb 2024 19:50:31 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
Date: Thu,  1 Feb 2024 18:50:23 +0000
Message-Id: <20240201185023.32642-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194733

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

- Checked the pacth from AUH
- Added upstream status for patches again
- performed basic sanity test with ptest image

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 ...h-log-input-and-output-files-on-erro.patch |  8 +--
 ...tional-support-for-systemd-sd_notify.patch | 18 +++---
 .../add-test-support-for-busybox.patch        | 57 +++++++++++--------
 ...igned-overflow-in-pointer-arithmatic.patch |  6 +-
 .../{openssh_9.5p1.bb =3D> openssh_9.6p1.bb}    |  2 +-
 5 files changed, 47 insertions(+), 44 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb =3D> openssh_=
9.6p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banne=
r.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity=
/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-err=
o.patch
index 2c14014fed..b572eaccfb 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-lo=
g-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-lo=
g-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
+From 8032d3093fbe1f815ebdd6e66f841469069a1d5d Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
@@ -35,6 +35,7 @@ return value: 1
 See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
=20
 Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
 ---
  regress/banner.sh | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
@@ -42,7 +43,7 @@ Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
 Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pul=
l/437]
=20
 diff --git a/regress/banner.sh b/regress/banner.sh
-index a84feb5a..de84957a 100644
+index a84feb5..de84957 100644
 --- a/regress/banner.sh
 +++ b/regress/banner.sh
 @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
@@ -56,6 +57,3 @@ index a84feb5a..de84957a 100644
  done
 =20
  trace "test suppress banner (-q)"
---=20
-2.34.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-o=
ptional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/o=
penssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.pa=
tch
index acda8f1ce9..7e318b83a3 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional=
-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional=
-support-for-systemd-sd_notify.patch
@@ -1,4 +1,4 @@
-From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
+From 563e9b910984ec8ad5bddb88c02e24411d98e80e Mon Sep 17 00:00:00 2001
 From: Matt Jolly <Matt.Jolly@footclan.ninja>
 Date: Thu, 2 Feb 2023 21:05:40 +1100
 Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
@@ -9,16 +9,17 @@ patch based on Jakub Jelen's <jjelen@redhat.com> origin=
al patch
 Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/=
pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
=20
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
 ---
  configure.ac | 24 ++++++++++++++++++++++++
  sshd.c       | 13 +++++++++++++
  2 files changed, 37 insertions(+)
=20
 diff --git a/configure.ac b/configure.ac
-index 22fee70f..486c189f 100644
+index 379cd74..a7d0e92 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])
+@@ -4842,6 +4842,29 @@ AC_SUBST([GSSLIBS])
  AC_SUBST([K5LIBS])
  AC_SUBST([CHANNELLIBS])
 =20
@@ -48,7 +49,7 @@ index 22fee70f..486c189f 100644
  # Looking for programs, paths and files
 =20
  PRIVSEP_PATH=3D/var/empty
-@@ -5634,6 +5657,7 @@ echo "                   libldns support: $LDNS_MS=
G"
+@@ -5650,6 +5673,7 @@ echo "                   libldns support: $LDNS_MS=
G"
  echo "  Solaris process contract support: $SPC_MSG"
  echo "           Solaris project support: $SP_MSG"
  echo "         Solaris privilege support: $SPP_MSG"
@@ -57,7 +58,7 @@ index 22fee70f..486c189f 100644
  echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
  echo "                  BSD Auth support: $BSD_AUTH_MSG"
 diff --git a/sshd.c b/sshd.c
-index 6321936c..859d6a0b 100644
+index 9cbe922..4b342c5 100644
 --- a/sshd.c
 +++ b/sshd.c
 @@ -88,6 +88,10 @@
@@ -71,7 +72,7 @@ index 6321936c..859d6a0b 100644
  #include "xmalloc.h"
  #include "ssh.h"
  #include "ssh2.h"
-@@ -310,6 +314,10 @@ static void
+@@ -308,6 +312,10 @@ static void
  sighup_restart(void)
  {
  	logit("Received SIGHUP; restarting.");
@@ -82,7 +83,7 @@ index 6321936c..859d6a0b 100644
  	if (options.pid_file !=3D NULL)
  		unlink(options.pid_file);
  	platform_pre_restart();
-@@ -2086,6 +2094,11 @@ main(int ac, char **av)
+@@ -2093,6 +2101,11 @@ main(int ac, char **av)
  			}
  		}
 =20
@@ -94,6 +95,3 @@ index 6321936c..859d6a0b 100644
  		/* Accept a connection and return in a forked child */
  		server_accept_loop(&sock_in, &sock_out,
  		    &newsock, config_s);
---=20
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-f=
or-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-sup=
port-for-busybox.patch
index b8402a4dee..61b98c3d72 100644
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busy=
box.patch
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busy=
box.patch
@@ -1,4 +1,7 @@
-Adjust test cases to work with busybox.
+From 7979cbf4b422445c801726283b08abaed8c44b70 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@enea.com>
+Date: Thu, 24 Apr 2014 18:00:22 +0200
+Subject: [PATCH] Adjust test cases to work with busybox.
=20
 - Replace dd parameter "obs" with "bs".
 - Replace "head -<num>" with "head -n <num>".
@@ -6,11 +9,17 @@ Adjust test cases to work with busybox.
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
=20
-Index: openssh-7.6p1/regress/cipher-speed.sh
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openssh-7.6p1.orig/regress/cipher-speed.sh
-+++ openssh-7.6p1/regress/cipher-speed.sh
-@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=3D0; for
+---
+ regress/cipher-speed.sh | 2 +-
+ regress/key-options.sh  | 2 +-
+ regress/transfer.sh     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/regress/cipher-speed.sh b/regress/cipher-speed.sh
+index 1340bd1..8770757 100644
+--- a/regress/cipher-speed.sh
++++ b/regress/cipher-speed.sh
+@@ -27,7 +27,7 @@ for c in `${SSH} -Q cipher`; do n=3D0; for m in `${SSH=
} -Q mac`; do
  		printf "%-60s" "$c/$m:"
  		( ${SSH} -o 'compression no' \
  			-F $OBJ/ssh_proxy -m $m -c $c somehost \
@@ -19,24 +28,11 @@ Index: openssh-7.6p1/regress/cipher-speed.sh
  		< ${DATA} ) 2>&1 | getbytes
 =20
  		if [ $? -ne 0 ]; then
-Index: openssh-7.6p1/regress/transfer.sh
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openssh-7.6p1.orig/regress/transfer.sh
-+++ openssh-7.6p1/regress/transfer.sh
-@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}		|| fail "corrupted
- for s in 10 100 1k 32k 64k 128k 256k; do
- 	trace "dd-size ${s}"
- 	rm -f ${COPY}
--	dd if=3D$DATA obs=3D${s} 2> /dev/null | \
-+	dd if=3D$DATA bs=3D${s} 2> /dev/null | \
- 		${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
- 	if [ $? -ne 0 ]; then
- 		fail "ssh cat $DATA failed"
-Index: openssh-7.6p1/regress/key-options.sh
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openssh-7.6p1.orig/regress/key-options.sh
-+++ openssh-7.6p1/regress/key-options.sh
-@@ -47,7 +47,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
+diff --git a/regress/key-options.sh b/regress/key-options.sh
+index 2f3d66e..7f8166d 100644
+--- a/regress/key-options.sh
++++ b/regress/key-options.sh
+@@ -90,7 +90,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
  	fi
 =20
  	sed 's/.*/from=3D"'"$f"'" &/' $origkeys >$authkeys
@@ -45,3 +41,16 @@ Index: openssh-7.6p1/regress/key-options.sh
  	verbose "key option $from"
  	r=3D`${SSH} -q -F $OBJ/ssh_proxy somehost 'echo true'`
  	if [ "$r" =3D "true" ]; then
+diff --git a/regress/transfer.sh b/regress/transfer.sh
+index cf174a0..41cfdc7 100644
+--- a/regress/transfer.sh
++++ b/regress/transfer.sh
+@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}		|| fail "corrupted copy"
+ for s in 10 100 1k 32k 64k 128k 256k; do
+ 	trace "dd-size ${s}"
+ 	rm -f ${COPY}
+-	dd if=3D$DATA obs=3D${s} 2> /dev/null | \
++	dd if=3D$DATA bs=3D${s} 2> /dev/null | \
+ 		${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
+ 	if [ $? -ne 0 ]; then
+ 		fail "ssh cat $DATA failed"
diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-sign=
ed-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/opens=
sh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
index 20036da931..2e18bba758 100644
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-over=
flow-in-pointer-arithmatic.patch
+++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-over=
flow-in-pointer-arithmatic.patch
@@ -1,4 +1,4 @@
-From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
+From 12242caa163b212ba18fded3b51aefede2856af9 Mon Sep 17 00:00:00 2001
 From: Yuanjie Huang <yuanjie.huang@windriver.com>
 Date: Wed, 24 Aug 2016 03:15:43 +0000
 Subject: [PATCH] Fix potential signed overflow in pointer arithmatic
@@ -14,6 +14,7 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.c=
om>
=20
 Complete the fix
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  openbsd-compat/strlcat.c | 10 +++++++---
  openbsd-compat/strlcpy.c |  8 ++++++--
@@ -106,6 +107,3 @@ index 7ad3573..7040f1f 100644
 +	return (size_t)((uintptr_t)cp - (uintptr_t)str);
  }
  #endif
---=20
-2.17.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 0312d5bd66..6366cefdf9 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -28,7 +28,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-e=
rro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notif=
y.patch \
            "
-SRC_URI[sha256sum] =3D "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f=
6ca603672686086b"
+SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd536=
2de09385aa7a777c"
=20
 CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specif=
ic to OpenSSH with the pam opie which we don't build/use here."
=20
--=20
2.39.2


