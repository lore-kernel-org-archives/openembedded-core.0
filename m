Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52475C54E9E
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1235.1710522010786895544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CKQ0svd4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=J2KiRXZu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e430e8953-bfd33ad1-dd42-4d9b-85a8-25cf0c8e81d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522010;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=vAcTKQF/Ke8col7bRy7P5Ll6YXNM8YjXM/wXufKZob4=;
	b=CKQ0svd4fOrR/+81Oj/RCyQrMyBPNdFpbzoXJQX63Q+LZ+/clihCUTqDHlmDG7o0
	oe3+fbch7w7XSjKEtXiBtaqwtlHmUZpn7d7djRMcpgAPdVH03+NIoLZ5fAl4cYRn6bY
	Db3Q+tr+XenFtyU0VcGvfGlHUClkHaONeMWtYv0Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522010;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=vAcTKQF/Ke8col7bRy7P5Ll6YXNM8YjXM/wXufKZob4=;
	b=J2KiRXZuSmZUQaYs4BSyIn/nWxxBQGsz4HNvo2+NMGpDn657ePMTrWhAxE33J9fd
	toEoPNTAwuQLUGaEcVcJf/1NFAf+/HtSBL8z7nPjrZONQiGkLenJp7eAHHsWm/uYgGl
	j6E/KLYB8P7g+1G2l7xCZvljnk5H4gfVl3Nldm7g=
Content-Type: multipart/mixed; boundary="===============7166276056144794091=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 9.7p1 SUCCEEDED
Message-ID: <0101018e430e8953-bfd33ad1-dd42-4d9b-85a8-25cf0c8e81d0-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197148

--===============7166276056144794091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *9.7p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-9.6p1-9.7p1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 7695e918465eec677d726010b1298c96c43e5835 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 05:22:18 +0000
Subject: [PATCH] openssh: upgrade 9.6p1 -> 9.7p1

---
 ...h-log-input-and-output-files-on-erro.patch |  7 +--
 ...tional-support-for-systemd-sd_notify.patch | 17 +++---
 .../add-test-support-for-busybox.patch        | 56 +++++++++++--------
 ...igned-overflow-in-pointer-arithmatic.patch |  5 +-
 .../{openssh_9.6p1.bb => openssh_9.7p1.bb}    |  2 +-
 5 files changed, 43 insertions(+), 44 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.6p1.bb => openssh_9.7p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index 8763f30f4b..ccdcbace6f 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
+From 17f266d67abb34fb8a6674eca16c8bd1b36869d5 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
@@ -42,7 +42,7 @@ Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/regress/banner.sh b/regress/banner.sh
-index a84feb5a..de84957a 100644
+index a84feb5..de84957 100644
 --- a/regress/banner.sh
 +++ b/regress/banner.sh
 @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
@@ -56,6 +56,3 @@ index a84feb5a..de84957a 100644
  done
  
  trace "test suppress banner (-q)"
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
index acda8f1ce9..bd91269000 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -1,4 +1,4 @@
-From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
+From 96796f59cf27b5bd40634bbe4abe03090395453c Mon Sep 17 00:00:00 2001
 From: Matt Jolly <Matt.Jolly@footclan.ninja>
 Date: Thu, 2 Feb 2023 21:05:40 +1100
 Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
@@ -15,10 +15,10 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
  2 files changed, 37 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 22fee70f..486c189f 100644
+index 82e8bb7..d1145d3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])
+@@ -4870,6 +4870,29 @@ AC_SUBST([GSSLIBS])
  AC_SUBST([K5LIBS])
  AC_SUBST([CHANNELLIBS])
  
@@ -48,7 +48,7 @@ index 22fee70f..486c189f 100644
  # Looking for programs, paths and files
  
  PRIVSEP_PATH=/var/empty
-@@ -5634,6 +5657,7 @@ echo "                   libldns support: $LDNS_MSG"
+@@ -5688,6 +5711,7 @@ echo "                   libldns support: $LDNS_MSG"
  echo "  Solaris process contract support: $SPC_MSG"
  echo "           Solaris project support: $SP_MSG"
  echo "         Solaris privilege support: $SPP_MSG"
@@ -57,7 +57,7 @@ index 22fee70f..486c189f 100644
  echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
  echo "                  BSD Auth support: $BSD_AUTH_MSG"
 diff --git a/sshd.c b/sshd.c
-index 6321936c..859d6a0b 100644
+index b4f2b97..6820a41 100644
 --- a/sshd.c
 +++ b/sshd.c
 @@ -88,6 +88,10 @@
@@ -71,7 +71,7 @@ index 6321936c..859d6a0b 100644
  #include "xmalloc.h"
  #include "ssh.h"
  #include "ssh2.h"
-@@ -310,6 +314,10 @@ static void
+@@ -308,6 +312,10 @@ static void
  sighup_restart(void)
  {
  	logit("Received SIGHUP; restarting.");
@@ -82,7 +82,7 @@ index 6321936c..859d6a0b 100644
  	if (options.pid_file != NULL)
  		unlink(options.pid_file);
  	platform_pre_restart();
-@@ -2086,6 +2094,11 @@ main(int ac, char **av)
+@@ -2093,6 +2101,11 @@ main(int ac, char **av)
  			}
  		}
  
@@ -94,6 +94,3 @@ index 6321936c..859d6a0b 100644
  		/* Accept a connection and return in a forked child */
  		server_accept_loop(&sock_in, &sock_out,
  		    &newsock, config_s);
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
index b8402a4dee..5d207e11e8 100644
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
@@ -1,16 +1,24 @@
-Adjust test cases to work with busybox.
+From f402e1f259e2782e2575cd6b894e61c25d953b7c Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@enea.com>
+Date: Thu, 24 Apr 2014 18:00:22 +0200
+Subject: [PATCH] Adjust test cases to work with busybox.
 
 - Replace dd parameter "obs" with "bs".
 - Replace "head -<num>" with "head -n <num>".
 
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
+---
+ regress/cipher-speed.sh | 2 +-
+ regress/key-options.sh  | 2 +-
+ regress/transfer.sh     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
 
-Index: openssh-7.6p1/regress/cipher-speed.sh
-===================================================================
---- openssh-7.6p1.orig/regress/cipher-speed.sh
-+++ openssh-7.6p1/regress/cipher-speed.sh
-@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
+diff --git a/regress/cipher-speed.sh b/regress/cipher-speed.sh
+index 1340bd1..8770757 100644
+--- a/regress/cipher-speed.sh
++++ b/regress/cipher-speed.sh
+@@ -27,7 +27,7 @@ for c in `${SSH} -Q cipher`; do n=0; for m in `${SSH} -Q mac`; do
  		printf "%-60s" "$c/$m:"
  		( ${SSH} -o 'compression no' \
  			-F $OBJ/ssh_proxy -m $m -c $c somehost \
@@ -19,24 +27,11 @@ Index: openssh-7.6p1/regress/cipher-speed.sh
  		< ${DATA} ) 2>&1 | getbytes
  
  		if [ $? -ne 0 ]; then
-Index: openssh-7.6p1/regress/transfer.sh
-===================================================================
---- openssh-7.6p1.orig/regress/transfer.sh
-+++ openssh-7.6p1/regress/transfer.sh
-@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}		|| fail "corrupted
- for s in 10 100 1k 32k 64k 128k 256k; do
- 	trace "dd-size ${s}"
- 	rm -f ${COPY}
--	dd if=$DATA obs=${s} 2> /dev/null | \
-+	dd if=$DATA bs=${s} 2> /dev/null | \
- 		${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
- 	if [ $? -ne 0 ]; then
- 		fail "ssh cat $DATA failed"
-Index: openssh-7.6p1/regress/key-options.sh
-===================================================================
---- openssh-7.6p1.orig/regress/key-options.sh
-+++ openssh-7.6p1/regress/key-options.sh
-@@ -47,7 +47,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
+diff --git a/regress/key-options.sh b/regress/key-options.sh
+index 2f3d66e..7f8166d 100644
+--- a/regress/key-options.sh
++++ b/regress/key-options.sh
+@@ -90,7 +90,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
  	fi
  
  	sed 's/.*/from="'"$f"'" &/' $origkeys >$authkeys
@@ -45,3 +40,16 @@ Index: openssh-7.6p1/regress/key-options.sh
  	verbose "key option $from"
  	r=`${SSH} -q -F $OBJ/ssh_proxy somehost 'echo true'`
  	if [ "$r" = "true" ]; then
+diff --git a/regress/transfer.sh b/regress/transfer.sh
+index cf174a0..41cfdc7 100644
+--- a/regress/transfer.sh
++++ b/regress/transfer.sh
+@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}		|| fail "corrupted copy"
+ for s in 10 100 1k 32k 64k 128k 256k; do
+ 	trace "dd-size ${s}"
+ 	rm -f ${COPY}
+-	dd if=$DATA obs=${s} 2> /dev/null | \
++	dd if=$DATA bs=${s} 2> /dev/null | \
+ 		${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
+ 	if [ $? -ne 0 ]; then
+ 		fail "ssh cat $DATA failed"
diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
index 20036da931..b7fb354e23 100644
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
+++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
@@ -1,4 +1,4 @@
-From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
+From 3fc03b6822f411bd0caf52920666baf6ce2caa78 Mon Sep 17 00:00:00 2001
 From: Yuanjie Huang <yuanjie.huang@windriver.com>
 Date: Wed, 24 Aug 2016 03:15:43 +0000
 Subject: [PATCH] Fix potential signed overflow in pointer arithmatic
@@ -106,6 +106,3 @@ index 7ad3573..7040f1f 100644
 +	return (size_t)((uintptr_t)cp - (uintptr_t)str);
  }
  #endif
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index edd8e8c2d1..3b0b47097c 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            "
-SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
+SRC_URI[sha256sum] = "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.42.0


--===============7166276056144794091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/openssh: SRC_URI changed from "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.6p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch" to "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.7p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch file://
 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch"
packages/core2-64-poky-linux/openssh: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-dbg: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 22334184 to 22369056 (+0%)
packages/core2-64-poky-linux/openssh/openssh-dev: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-dev: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-doc: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-doc: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-doc: PKGSIZE changed from 339983 to 340919 (+0%)
packages/core2-64-poky-linux/openssh/openssh-keygen: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-keygen: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-locale: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-locale: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-misc: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-misc: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-ptest: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 6203196 to 6211392 (+0%)
packages/core2-64-poky-linux/openssh/openssh-scp: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-scp: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-sftp: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-src: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-src: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-src: PKGSIZE changed from 3738151 to 3744144 (+0%)
packages/core2-64-poky-linux/openssh/openssh-ssh: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-ssh: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sshd: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 1642666 to 1650858 (+0%)
packages/core2-64-poky-linux/openssh/openssh-staticdev: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-staticdev: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh: PKGV changed from 9.6p1 [default] to 9.7p1 [default]

--===============7166276056144794091==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-9.6p1-9.7p1.patch"

RnJvbSA3Njk1ZTkxODQ2NWVlYzY3N2Q3MjYwMTBiMTI5OGM5NmM0M2U1ODM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDU6MjI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NoOiB1cGdyYWRlIDkuNnAxIC0+IDkuN3AxCgotLS0KIC4uLmgtbG9nLWlucHV0LWFuZC1v
dXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCB8ICA3ICstLQogLi4udGlvbmFsLXN1cHBvcnQtZm9y
LXN5c3RlbWQtc2Rfbm90aWZ5LnBhdGNoIHwgMTcgKysrLS0tCiAuLi4vYWRkLXRlc3Qtc3VwcG9y
dC1mb3ItYnVzeWJveC5wYXRjaCAgICAgICAgfCA1NiArKysrKysrKysrKy0tLS0tLS0tCiAuLi5p
Z25lZC1vdmVyZmxvdy1pbi1wb2ludGVyLWFyaXRobWF0aWMucGF0Y2ggfCAgNSArLQogLi4uL3tv
cGVuc3NoXzkuNnAxLmJiID0+IG9wZW5zc2hfOS43cDEuYmJ9ICAgIHwgIDIgKy0KIDUgZmlsZXMg
Y2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL3tvcGVuc3NoXzkuNnAxLmJiID0+IG9wZW5zc2hf
OS43cDEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1
dC1maWxlcy1vbi1lcnJvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxl
cy1vbi1lcnJvLnBhdGNoCmluZGV4IDg3NjNmMzBmNGIuLmNjZGNiYWNlNmYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1i
YW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFu
bmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGY1YTRkYWNjOTg3Y2E1NDhmYzg2NTc3YzJkYmExMjFjODZkYTNjMzQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE3ZjI2NmQ2N2FiYjM0ZmI4YTY2NzRlY2ExNmM4
YmQxYjM2ODY5ZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaWtrbyBSYXBlbGkg
PG1pa2tvLnJhcGVsaUBsaW5hcm8ub3JnPgogRGF0ZTogTW9uLCAxMSBTZXAgMjAyMyAwOTo1NToy
MSArMDEwMAogU3ViamVjdDogW1BBVENIXSByZWdyZXNzL2Jhbm5lci5zaDogbG9nIGlucHV0IGFu
ZCBvdXRwdXQgZmlsZXMgb24gZXJyb3IKQEAgLTQyLDcgKzQyLDcgQEAgU2lnbmVkLW9mZi1ieTog
TWlra28gUmFwZWxpIDxtaWtrby5yYXBlbGlAbGluYXJvLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9yZWdyZXNzL2Jh
bm5lci5zaCBiL3JlZ3Jlc3MvYmFubmVyLnNoCi1pbmRleCBhODRmZWI1YS4uZGU4NDk1N2EgMTAw
NjQ0CitpbmRleCBhODRmZWI1Li5kZTg0OTU3IDEwMDY0NAogLS0tIGEvcmVncmVzcy9iYW5uZXIu
c2gKICsrKyBiL3JlZ3Jlc3MvYmFubmVyLnNoCiBAQCAtMzIsNyArMzIsOSBAQCBmb3IgcyBpbiAw
IDEwIDEwMCAxMDAwIDEwMDAwIDEwMDAwMCA7IGRvCkBAIC01Niw2ICs1NiwzIEBAIGluZGV4IGE4
NGZlYjVhLi5kZTg0OTU3YSAxMDA2NDQKICBkb25lCiAgCiAgdHJhY2UgInRlc3Qgc3VwcHJlc3Mg
YmFubmVyICgtcSkiCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXN5c3RlbWQtQWRkLW9wdGlvbmFsLXN1cHBv
cnQtZm9yLXN5c3RlbWQtc2Rfbm90aWZ5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1zeXN0ZW1kLUFkZC1vcHRpb25hbC1zdXBwb3J0LWZvci1z
eXN0ZW1kLXNkX25vdGlmeS5wYXRjaAppbmRleCBhY2RhOGYxY2U5Li5iZDkxMjY5MDAwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXN5
c3RlbWQtQWRkLW9wdGlvbmFsLXN1cHBvcnQtZm9yLXN5c3RlbWQtc2Rfbm90aWZ5LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtc3lzdGVt
ZC1BZGQtb3B0aW9uYWwtc3VwcG9ydC1mb3Itc3lzdGVtZC1zZF9ub3RpZnkucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGJlMTg3NDM1OTExY2RlNmNjM2NlZjY5ODJhNTA4MjYxMDc0ZjFlNTYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk2Nzk2ZjU5Y2YyN2I1YmQ0MDYzNGJiZTRh
YmUwMzA5MDM5NTQ1M2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXR0IEpvbGx5
IDxNYXR0LkpvbGx5QGZvb3RjbGFuLm5pbmphPgogRGF0ZTogVGh1LCAyIEZlYiAyMDIzIDIxOjA1
OjQwICsxMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN5c3RlbWQ6IEFkZCBvcHRpb25hbCBzdXBwb3J0
IGZvciBzeXN0ZW1kIGBzZF9ub3RpZnlgCkBAIC0xNSwxMCArMTUsMTAgQEAgU2lnbmVkLW9mZi1i
eTogWGlhbmd5dSBDaGVuIDx4aWFuZ3l1LmNoZW5Ad2luZHJpdmVyLmNvbT4KICAyIGZpbGVzIGNo
YW5nZWQsIDM3IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2Nv
bmZpZ3VyZS5hYwotaW5kZXggMjJmZWU3MGYuLjQ4NmMxODlmIDEwMDY0NAoraW5kZXggODJlOGJi
Ny4uZDExNDVkMyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFj
Ci1AQCAtNDgzNSw2ICs0ODM1LDI5IEBAIEFDX1NVQlNUKFtHU1NMSUJTXSkKK0BAIC00ODcwLDYg
KzQ4NzAsMjkgQEAgQUNfU1VCU1QoW0dTU0xJQlNdKQogIEFDX1NVQlNUKFtLNUxJQlNdKQogIEFD
X1NVQlNUKFtDSEFOTkVMTElCU10pCiAgCkBAIC00OCw3ICs0OCw3IEBAIGluZGV4IDIyZmVlNzBm
Li40ODZjMTg5ZiAxMDA2NDQKICAjIExvb2tpbmcgZm9yIHByb2dyYW1zLCBwYXRocyBhbmQgZmls
ZXMKICAKICBQUklWU0VQX1BBVEg9L3Zhci9lbXB0eQotQEAgLTU2MzQsNiArNTY1Nyw3IEBAIGVj
aG8gIiAgICAgICAgICAgICAgICAgICBsaWJsZG5zIHN1cHBvcnQ6ICRMRE5TX01TRyIKK0BAIC01
Njg4LDYgKzU3MTEsNyBAQCBlY2hvICIgICAgICAgICAgICAgICAgICAgbGlibGRucyBzdXBwb3J0
OiAkTEROU19NU0ciCiAgZWNobyAiICBTb2xhcmlzIHByb2Nlc3MgY29udHJhY3Qgc3VwcG9ydDog
JFNQQ19NU0ciCiAgZWNobyAiICAgICAgICAgICBTb2xhcmlzIHByb2plY3Qgc3VwcG9ydDogJFNQ
X01TRyIKICBlY2hvICIgICAgICAgICBTb2xhcmlzIHByaXZpbGVnZSBzdXBwb3J0OiAkU1BQX01T
RyIKQEAgLTU3LDcgKzU3LDcgQEAgaW5kZXggMjJmZWU3MGYuLjQ4NmMxODlmIDEwMDY0NAogIGVj
aG8gIiAgICAgICAgICAgVHJhbnNsYXRlIHY0IGluIHY2IGhhY2s6ICRJUFY0X0lONl9IQUNLX01T
RyIKICBlY2hvICIgICAgICAgICAgICAgICAgICBCU0QgQXV0aCBzdXBwb3J0OiAkQlNEX0FVVEhf
TVNHIgogZGlmZiAtLWdpdCBhL3NzaGQuYyBiL3NzaGQuYwotaW5kZXggNjMyMTkzNmMuLjg1OWQ2
YTBiIDEwMDY0NAoraW5kZXggYjRmMmI5Ny4uNjgyMGE0MSAxMDA2NDQKIC0tLSBhL3NzaGQuYwog
KysrIGIvc3NoZC5jCiBAQCAtODgsNiArODgsMTAgQEAKQEAgLTcxLDcgKzcxLDcgQEAgaW5kZXgg
NjMyMTkzNmMuLjg1OWQ2YTBiIDEwMDY0NAogICNpbmNsdWRlICJ4bWFsbG9jLmgiCiAgI2luY2x1
ZGUgInNzaC5oIgogICNpbmNsdWRlICJzc2gyLmgiCi1AQCAtMzEwLDYgKzMxNCwxMCBAQCBzdGF0
aWMgdm9pZAorQEAgLTMwOCw2ICszMTIsMTAgQEAgc3RhdGljIHZvaWQKICBzaWdodXBfcmVzdGFy
dCh2b2lkKQogIHsKICAJbG9naXQoIlJlY2VpdmVkIFNJR0hVUDsgcmVzdGFydGluZy4iKTsKQEAg
LTgyLDcgKzgyLDcgQEAgaW5kZXggNjMyMTkzNmMuLjg1OWQ2YTBiIDEwMDY0NAogIAlpZiAob3B0
aW9ucy5waWRfZmlsZSAhPSBOVUxMKQogIAkJdW5saW5rKG9wdGlvbnMucGlkX2ZpbGUpOwogIAlw
bGF0Zm9ybV9wcmVfcmVzdGFydCgpOwotQEAgLTIwODYsNiArMjA5NCwxMSBAQCBtYWluKGludCBh
YywgY2hhciAqKmF2KQorQEAgLTIwOTMsNiArMjEwMSwxMSBAQCBtYWluKGludCBhYywgY2hhciAq
KmF2KQogIAkJCX0KICAJCX0KICAKQEAgLTk0LDYgKzk0LDMgQEAgaW5kZXggNjMyMTkzNmMuLjg1
OWQ2YTBiIDEwMDY0NAogIAkJLyogQWNjZXB0IGEgY29ubmVjdGlvbiBhbmQgcmV0dXJuIGluIGEg
Zm9ya2VkIGNoaWxkICovCiAgCQlzZXJ2ZXJfYWNjZXB0X2xvb3AoJnNvY2tfaW4sICZzb2NrX291
dCwKICAJCSAgICAmbmV3c29jaywgY29uZmlnX3MpOwotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvYWRkLXRlc3Qtc3Vw
cG9ydC1mb3ItYnVzeWJveC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoL2FkZC10ZXN0LXN1cHBvcnQtZm9yLWJ1c3lib3gucGF0Y2gKaW5kZXggYjg0MDJh
NGRlZS4uNWQyMDdlMTFlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2gvYWRkLXRlc3Qtc3VwcG9ydC1mb3ItYnVzeWJveC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9hZGQtdGVzdC1zdXBwb3J0
LWZvci1idXN5Ym94LnBhdGNoCkBAIC0xLDE2ICsxLDI0IEBACi1BZGp1c3QgdGVzdCBjYXNlcyB0
byB3b3JrIHdpdGggYnVzeWJveC4KK0Zyb20gZjQwMmUxZjI1OWUyNzgyZTI1NzVjZDZiODk0ZTYx
YzI1ZDk1M2I3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206ICJNYXhpbiBCLiBKb2hu
IiA8bWF4aW4uam9obkBlbmVhLmNvbT4KK0RhdGU6IFRodSwgMjQgQXByIDIwMTQgMTg6MDA6MjIg
KzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gQWRqdXN0IHRlc3QgY2FzZXMgdG8gd29yayB3aXRoIGJ1
c3lib3guCiAKIC0gUmVwbGFjZSBkZCBwYXJhbWV0ZXIgIm9icyIgd2l0aCAiYnMiLgogLSBSZXBs
YWNlICJoZWFkIC08bnVtPiIgd2l0aCAiaGVhZCAtbiA8bnVtPiIuCiAKIFNpZ25lZC1vZmYtYnk6
IE1heGluIEIuIEpvaG4gPG1heGluLmpvaG5AZW5lYS5jb20+CiBVcHN0cmVhbS1TdGF0dXM6IFBl
bmRpbmcKKy0tLQorIHJlZ3Jlc3MvY2lwaGVyLXNwZWVkLnNoIHwgMiArLQorIHJlZ3Jlc3Mva2V5
LW9wdGlvbnMuc2ggIHwgMiArLQorIHJlZ3Jlc3MvdHJhbnNmZXIuc2ggICAgIHwgMiArLQorIDMg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCi1JbmRleDog
b3BlbnNzaC03LjZwMS9yZWdyZXNzL2NpcGhlci1zcGVlZC5zaAotPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIG9w
ZW5zc2gtNy42cDEub3JpZy9yZWdyZXNzL2NpcGhlci1zcGVlZC5zaAotKysrIG9wZW5zc2gtNy42
cDEvcmVncmVzcy9jaXBoZXItc3BlZWQuc2gKLUBAIC0xNyw3ICsxNyw3IEBAIGZvciBjIGluIGAk
e1NTSH0gLVEgY2lwaGVyYDsgZG8gbj0wOyBmb3IKK2RpZmYgLS1naXQgYS9yZWdyZXNzL2NpcGhl
ci1zcGVlZC5zaCBiL3JlZ3Jlc3MvY2lwaGVyLXNwZWVkLnNoCitpbmRleCAxMzQwYmQxLi44Nzcw
NzU3IDEwMDY0NAorLS0tIGEvcmVncmVzcy9jaXBoZXItc3BlZWQuc2gKKysrKyBiL3JlZ3Jlc3Mv
Y2lwaGVyLXNwZWVkLnNoCitAQCAtMjcsNyArMjcsNyBAQCBmb3IgYyBpbiBgJHtTU0h9IC1RIGNp
cGhlcmA7IGRvIG49MDsgZm9yIG0gaW4gYCR7U1NIfSAtUSBtYWNgOyBkbwogIAkJcHJpbnRmICIl
LTYwcyIgIiRjLyRtOiIKICAJCSggJHtTU0h9IC1vICdjb21wcmVzc2lvbiBubycgXAogIAkJCS1G
ICRPQkovc3NoX3Byb3h5IC1tICRtIC1jICRjIHNvbWVob3N0IFwKQEAgLTE5LDI0ICsyNywxMSBA
QCBJbmRleDogb3BlbnNzaC03LjZwMS9yZWdyZXNzL2NpcGhlci1zcGVlZC5zaAogIAkJPCAke0RB
VEF9ICkgMj4mMSB8IGdldGJ5dGVzCiAgCiAgCQlpZiBbICQ/IC1uZSAwIF07IHRoZW4KLUluZGV4
OiBvcGVuc3NoLTcuNnAxL3JlZ3Jlc3MvdHJhbnNmZXIuc2gKLT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBvcGVu
c3NoLTcuNnAxLm9yaWcvcmVncmVzcy90cmFuc2Zlci5zaAotKysrIG9wZW5zc2gtNy42cDEvcmVn
cmVzcy90cmFuc2Zlci5zaAotQEAgLTEzLDcgKzEzLDcgQEAgY21wICR7REFUQX0gJHtDT1BZfQkJ
fHwgZmFpbCAiY29ycnVwdGVkCi0gZm9yIHMgaW4gMTAgMTAwIDFrIDMyayA2NGsgMTI4ayAyNTZr
OyBkbwotIAl0cmFjZSAiZGQtc2l6ZSAke3N9IgotIAlybSAtZiAke0NPUFl9Ci0tCWRkIGlmPSRE
QVRBIG9icz0ke3N9IDI+IC9kZXYvbnVsbCB8IFwKLSsJZGQgaWY9JERBVEEgYnM9JHtzfSAyPiAv
ZGV2L251bGwgfCBcCi0gCQkke1NTSH0gLXEgLUYgJE9CSi9zc2hfcHJveHkgc29tZWhvc3QgImNh
dCA+ICR7Q09QWX0iCi0gCWlmIFsgJD8gLW5lIDAgXTsgdGhlbgotIAkJZmFpbCAic3NoIGNhdCAk
REFUQSBmYWlsZWQiCi1JbmRleDogb3BlbnNzaC03LjZwMS9yZWdyZXNzL2tleS1vcHRpb25zLnNo
Ci09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Ci0tLS0gb3BlbnNzaC03LjZwMS5vcmlnL3JlZ3Jlc3Mva2V5LW9wdGlvbnMu
c2gKLSsrKyBvcGVuc3NoLTcuNnAxL3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2gKLUBAIC00Nyw3ICs0
Nyw3IEBAIGZvciBmIGluIDEyNy4wLjAuMSAnMTI3LjAuMC4wXC84JzsgZG8KK2RpZmYgLS1naXQg
YS9yZWdyZXNzL2tleS1vcHRpb25zLnNoIGIvcmVncmVzcy9rZXktb3B0aW9ucy5zaAoraW5kZXgg
MmYzZDY2ZS4uN2Y4MTY2ZCAxMDA2NDQKKy0tLSBhL3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2gKKysr
KyBiL3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2gKK0BAIC05MCw3ICs5MCw3IEBAIGZvciBmIGluIDEy
Ny4wLjAuMSAnMTI3LjAuMC4wXC84JzsgZG8KICAJZmkKICAKICAJc2VkICdzLy4qL2Zyb209Iici
JGYiJyIgJi8nICRvcmlna2V5cyA+JGF1dGhrZXlzCkBAIC00NSwzICs0MCwxNiBAQCBJbmRleDog
b3BlbnNzaC03LjZwMS9yZWdyZXNzL2tleS1vcHRpb25zLnNoCiAgCXZlcmJvc2UgImtleSBvcHRp
b24gJGZyb20iCiAgCXI9YCR7U1NIfSAtcSAtRiAkT0JKL3NzaF9wcm94eSBzb21laG9zdCAnZWNo
byB0cnVlJ2AKICAJaWYgWyAiJHIiID0gInRydWUiIF07IHRoZW4KK2RpZmYgLS1naXQgYS9yZWdy
ZXNzL3RyYW5zZmVyLnNoIGIvcmVncmVzcy90cmFuc2Zlci5zaAoraW5kZXggY2YxNzRhMC4uNDFj
ZmRjNyAxMDA2NDQKKy0tLSBhL3JlZ3Jlc3MvdHJhbnNmZXIuc2gKKysrKyBiL3JlZ3Jlc3MvdHJh
bnNmZXIuc2gKK0BAIC0xMyw3ICsxMyw3IEBAIGNtcCAke0RBVEF9ICR7Q09QWX0JCXx8IGZhaWwg
ImNvcnJ1cHRlZCBjb3B5IgorIGZvciBzIGluIDEwIDEwMCAxayAzMmsgNjRrIDEyOGsgMjU2azsg
ZG8KKyAJdHJhY2UgImRkLXNpemUgJHtzfSIKKyAJcm0gLWYgJHtDT1BZfQorLQlkZCBpZj0kREFU
QSBvYnM9JHtzfSAyPiAvZGV2L251bGwgfCBcCisrCWRkIGlmPSREQVRBIGJzPSR7c30gMj4gL2Rl
di9udWxsIHwgXAorIAkJJHtTU0h9IC1xIC1GICRPQkovc3NoX3Byb3h5IHNvbWVob3N0ICJjYXQg
PiAke0NPUFl9IgorIAlpZiBbICQ/IC1uZSAwIF07IHRoZW4KKyAJCWZhaWwgInNzaCBjYXQgJERB
VEEgZmFpbGVkIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2gvZml4LXBvdGVudGlhbC1zaWduZWQtb3ZlcmZsb3ctaW4tcG9pbnRlci1hcml0aG1h
dGljLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvZml4
LXBvdGVudGlhbC1zaWduZWQtb3ZlcmZsb3ctaW4tcG9pbnRlci1hcml0aG1hdGljLnBhdGNoCmlu
ZGV4IDIwMDM2ZGE5MzEuLmI3ZmIzNTRlMjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL2ZpeC1wb3RlbnRpYWwtc2lnbmVkLW92ZXJmbG93LWlu
LXBvaW50ZXItYXJpdGhtYXRpYy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaC9maXgtcG90ZW50aWFsLXNpZ25lZC1vdmVyZmxvdy1pbi1wb2ludGVy
LWFyaXRobWF0aWMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMzMjhlOThiY2JmMjkzMGNk
N2VlYTNlNmM5MmFkNWRjYmRmNDc5NGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNm
YzAzYjY4MjJmNDExYmQwY2FmNTI5MjA2NjZiYWY2Y2UyY2FhNzggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBZdWFuamllIEh1YW5nIDx5dWFuamllLmh1YW5nQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBXZWQsIDI0IEF1ZyAyMDE2IDAzOjE1OjQzICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IEZpeCBwb3RlbnRpYWwgc2lnbmVkIG92ZXJmbG93IGluIHBvaW50ZXIgYXJpdGhtYXRpYwpAQCAt
MTA2LDYgKzEwNiwzIEBAIGluZGV4IDdhZDM1NzMuLjcwNDBmMWYgMTAwNjQ0CiArCXJldHVybiAo
c2l6ZV90KSgodWludHB0cl90KWNwIC0gKHVpbnRwdHJfdClzdHIpOwogIH0KICAjZW5kaWYKLS0t
IAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoXzkuNnAxLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29w
ZW5zc2hfOS43cDEuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS42cDEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzkuN3AxLmJiCmluZGV4IGVkZDhl
OGMyZDEuLjNiMGI0NzA5N2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoXzkuNnAxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoXzkuN3AxLmJiCkBAIC0yOCw3ICsyOCw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Z0cC5vcGVuYnNkLm9yZy9wdWIvT3BlbkJTRC9PcGVuU1NIL3BvcnRhYmxlL29wZW5zc2gt
JHtQVn0udGFyCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1p
bnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1zeXN0ZW1kLUFkZC1vcHRpb25hbC1zdXBwb3J0LWZvci1zeXN0ZW1kLXNkX25vdGlmeS5w
YXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MTAyMTFjMDcyNTVh
OGM1YWQ2NTQzOTFiNDBlZTU5ODAwNzEwZGQ4MTE5ZGQ1MzYyZGUwOTM4NWFhN2E3NzdjIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjQ5MDQyNmY3NjZkODJhMjc2M2ZjYWNkOGQ4M2VhM2Q3MDc5ODc1
MGM3YmQyYWZmMmU1N2RjNTY2MGY3NzNmZmQiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMDctMjc2OF0g
PSAibm90LWFwcGxpY2FibGUtY29uZmlnOiBUaGlzIENWRSBpcyBzcGVjaWZpYyB0byBPcGVuU1NI
IHdpdGggdGhlIHBhbSBvcGllIHdoaWNoIHdlIGRvbid0IGJ1aWxkL3VzZSBoZXJlLiIKIAotLSAK
Mi40Mi4wCgo=

--===============7166276056144794091==--

