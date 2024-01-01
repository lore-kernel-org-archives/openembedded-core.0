Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BF5C531B8
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4579.1704114718986679490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MioIrJqY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Rs+P86i4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018cc52705ab-abeb2915-dec9-4b31-b005-e436c94c6e07-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=RoFzA/tWki8ap6M8ttRZdM5ncgx7DFqddX6OU3dGib4=;
	b=MioIrJqYWmwIXMdM2z4JVPqd1P7+0VJHS6uWt0Lso8wx9N0kr7z8jv0SrWOo2+/A
	F1OLRqPwmAtsh1o0ve0ZuYpHhz6hjwh6MNOfEwuZGsDoiSsg8N80LFkY3VBPgKK0FYV
	G1oMOVdWMlYLO8KQBZvxVEkQGrtchZADBhMqQtnE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=RoFzA/tWki8ap6M8ttRZdM5ncgx7DFqddX6OU3dGib4=;
	b=Rs+P86i4ktUTfRWsE6SYQ6L8W5iZLpV5a9hihrt1OgZr8UkjtKruDAxZ13FQaDzh
	aLJxVbL0UhAzz+NP+kpVwncvdLdgX+a0dAuoYCoWXTSy9nWuNEr0ZHKxGQPcqdmkrea
	YoG6FwgaPJ8XEKzMNzQrxCfDcOzjx9Cfp1olisoE=
Content-Type: multipart/mixed; boundary="===============7311876281284663854=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 9.6p1 FAILED
Message-ID: <0101018cc52705ab-abeb2915-dec9-4b31-b005-e436c94c6e07-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193100

--===============7311876281284663854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *9.6p1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-openssh-upgrade-9.5p1-9.6p1.patch
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
From 82b1c4089f2dfade956a5ff71f1409d11101bcf2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 05:18:54 +0000
Subject: [PATCH] openssh: upgrade 9.5p1 -> 9.6p1

---
 ...h-log-input-and-output-files-on-erro.patch | 10 +---
 ...tional-support-for-systemd-sd_notify.patch | 18 +++---
 .../add-test-support-for-busybox.patch        | 57 +++++++++++--------
 ...igned-overflow-in-pointer-arithmatic.patch |  6 +-
 .../{openssh_9.5p1.bb => openssh_9.6p1.bb}    |  2 +-
 5 files changed, 47 insertions(+), 46 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb => openssh_9.6p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index 2c14014fed..e9efe4fbb5 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
+From dc232dec5b3e2986e2450f8454b248e827330c4d Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
@@ -35,14 +35,13 @@ return value: 1
 See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
 
 Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
 ---
  regress/banner.sh | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
-
 diff --git a/regress/banner.sh b/regress/banner.sh
-index a84feb5a..de84957a 100644
+index a84feb5..de84957 100644
 --- a/regress/banner.sh
 +++ b/regress/banner.sh
 @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
@@ -56,6 +55,3 @@ index a84feb5a..de84957a 100644
  done
  
  trace "test suppress banner (-q)"
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
index acda8f1ce9..d8bea0d6d3 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -1,4 +1,4 @@
-From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
+From 38f0418c7fda61019ba1956a1464b22eaf49ec0a Mon Sep 17 00:00:00 2001
 From: Matt Jolly <Matt.Jolly@footclan.ninja>
 Date: Thu, 2 Feb 2023 21:05:40 +1100
 Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
@@ -9,16 +9,17 @@ patch based on Jakub Jelen's <jjelen@redhat.com> original patch
 Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
 
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
 ---
  configure.ac | 24 ++++++++++++++++++++++++
  sshd.c       | 13 +++++++++++++
  2 files changed, 37 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 22fee70f..486c189f 100644
+index 379cd74..a7d0e92 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])
+@@ -4842,6 +4842,29 @@ AC_SUBST([GSSLIBS])
  AC_SUBST([K5LIBS])
  AC_SUBST([CHANNELLIBS])
  
@@ -48,7 +49,7 @@ index 22fee70f..486c189f 100644
  # Looking for programs, paths and files
  
  PRIVSEP_PATH=/var/empty
-@@ -5634,6 +5657,7 @@ echo "                   libldns support: $LDNS_MSG"
+@@ -5650,6 +5673,7 @@ echo "                   libldns support: $LDNS_MSG"
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
  	if (options.pid_file != NULL)
  		unlink(options.pid_file);
  	platform_pre_restart();
-@@ -2086,6 +2094,11 @@ main(int ac, char **av)
+@@ -2093,6 +2101,11 @@ main(int ac, char **av)
  			}
  		}
  
@@ -94,6 +95,3 @@ index 6321936c..859d6a0b 100644
  		/* Accept a connection and return in a forked child */
  		server_accept_loop(&sock_in, &sock_out,
  		    &newsock, config_s);
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
index b8402a4dee..af52ebd76b 100644
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
@@ -1,4 +1,7 @@
-Adjust test cases to work with busybox.
+From 49085e7bab0fe94bf66af431f7b3feee2a0922a3 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@enea.com>
+Date: Thu, 24 Apr 2014 18:00:22 +0200
+Subject: [PATCH] Adjust test cases to work with busybox.
 
 - Replace dd parameter "obs" with "bs".
 - Replace "head -<num>" with "head -n <num>".
@@ -6,11 +9,17 @@ Adjust test cases to work with busybox.
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
 
-Index: openssh-7.6p1/regress/cipher-speed.sh
-===================================================================
---- openssh-7.6p1.orig/regress/cipher-speed.sh
-+++ openssh-7.6p1/regress/cipher-speed.sh
-@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
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
+@@ -27,7 +27,7 @@ for c in `${SSH} -Q cipher`; do n=0; for m in `${SSH} -Q mac`; do
  		printf "%-60s" "$c/$m:"
  		( ${SSH} -o 'compression no' \
  			-F $OBJ/ssh_proxy -m $m -c $c somehost \
@@ -19,24 +28,11 @@ Index: openssh-7.6p1/regress/cipher-speed.sh
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
@@ -45,3 +41,16 @@ Index: openssh-7.6p1/regress/key-options.sh
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
index 20036da931..1ae328cb43 100644
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
+++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
@@ -1,4 +1,4 @@
-From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
+From 6e81e658fe420e5b4809bd78e50becdb3128217c Mon Sep 17 00:00:00 2001
 From: Yuanjie Huang <yuanjie.huang@windriver.com>
 Date: Wed, 24 Aug 2016 03:15:43 +0000
 Subject: [PATCH] Fix potential signed overflow in pointer arithmatic
@@ -14,6 +14,7 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
 
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
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index bbb8fb091a..fa44eb0bd4 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            "
-SRC_URI[sha256sum] = "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
+SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.42.0


--===============7311876281284663854==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-9.5p1-9.6p1.patch"

RnJvbSA4MmIxYzQwODlmMmRmYWRlOTU2YTVmZjcxZjE0MDlkMTExMDFiY2YyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNToxODo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgOS41cDEgLT4gOS42cDEKCi0tLQogLi4uaC1sb2ctaW5wdXQtYW5kLW91
dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIHwgMTAgKy0tLQogLi4udGlvbmFsLXN1cHBvcnQtZm9y
LXN5c3RlbWQtc2Rfbm90aWZ5LnBhdGNoIHwgMTggKysrLS0tCiAuLi4vYWRkLXRlc3Qtc3VwcG9y
dC1mb3ItYnVzeWJveC5wYXRjaCAgICAgICAgfCA1NyArKysrKysrKysrKy0tLS0tLS0tCiAuLi5p
Z25lZC1vdmVyZmxvdy1pbi1wb2ludGVyLWFyaXRobWF0aWMucGF0Y2ggfCAgNiArLQogLi4uL3tv
cGVuc3NoXzkuNXAxLmJiID0+IG9wZW5zc2hfOS42cDEuYmJ9ICAgIHwgIDIgKy0KIDUgZmlsZXMg
Y2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL3tvcGVuc3NoXzkuNXAxLmJiID0+IG9wZW5zc2hf
OS42cDEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1
dC1maWxlcy1vbi1lcnJvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxl
cy1vbi1lcnJvLnBhdGNoCmluZGV4IDJjMTQwMTRmZWQuLmU5ZWZlNGZiYjUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1i
YW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFu
bmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGY1YTRkYWNjOTg3Y2E1NDhmYzg2NTc3YzJkYmExMjFjODZkYTNjMzQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRjMjMyZGVjNWIzZTI5ODZlMjQ1MGY4NDU0YjI0
OGU4MjczMzBjNGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaWtrbyBSYXBlbGkg
PG1pa2tvLnJhcGVsaUBsaW5hcm8ub3JnPgogRGF0ZTogTW9uLCAxMSBTZXAgMjAyMyAwOTo1NToy
MSArMDEwMAogU3ViamVjdDogW1BBVENIXSByZWdyZXNzL2Jhbm5lci5zaDogbG9nIGlucHV0IGFu
ZCBvdXRwdXQgZmlsZXMgb24gZXJyb3IKQEAgLTM1LDE0ICszNSwxMyBAQCByZXR1cm4gdmFsdWU6
IDEKIFNlZTogaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xNTE3OAogCiBTaWduZWQtb2ZmLWJ5OiBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPgorCiAtLS0KICByZWdyZXNzL2Jhbm5lci5zaCB8IDQgKysrLQogIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAotVXBzdHJlYW0tU3RhdHVzOiBE
ZW5pZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NoL29wZW5zc2gtcG9ydGFibGUvcHVsbC80
MzddCi0KIGRpZmYgLS1naXQgYS9yZWdyZXNzL2Jhbm5lci5zaCBiL3JlZ3Jlc3MvYmFubmVyLnNo
Ci1pbmRleCBhODRmZWI1YS4uZGU4NDk1N2EgMTAwNjQ0CitpbmRleCBhODRmZWI1Li5kZTg0OTU3
IDEwMDY0NAogLS0tIGEvcmVncmVzcy9iYW5uZXIuc2gKICsrKyBiL3JlZ3Jlc3MvYmFubmVyLnNo
CiBAQCAtMzIsNyArMzIsOSBAQCBmb3IgcyBpbiAwIDEwIDEwMCAxMDAwIDEwMDAwIDEwMDAwMCA7
IGRvCkBAIC01Niw2ICs1NSwzIEBAIGluZGV4IGE4NGZlYjVhLi5kZTg0OTU3YSAxMDA2NDQKICBk
b25lCiAgCiAgdHJhY2UgInRlc3Qgc3VwcHJlc3MgYmFubmVyICgtcSkiCi0tLSAKLTIuMzQuMQot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8w
MDAxLXN5c3RlbWQtQWRkLW9wdGlvbmFsLXN1cHBvcnQtZm9yLXN5c3RlbWQtc2Rfbm90aWZ5LnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1zeXN0
ZW1kLUFkZC1vcHRpb25hbC1zdXBwb3J0LWZvci1zeXN0ZW1kLXNkX25vdGlmeS5wYXRjaAppbmRl
eCBhY2RhOGYxY2U5Li5kOGJlYTBkNmQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXN5c3RlbWQtQWRkLW9wdGlvbmFsLXN1cHBvcnQt
Zm9yLXN5c3RlbWQtc2Rfbm90aWZ5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtc3lzdGVtZC1BZGQtb3B0aW9uYWwtc3VwcG9ydC1mb3It
c3lzdGVtZC1zZF9ub3RpZnkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJlMTg3NDM1OTEx
Y2RlNmNjM2NlZjY5ODJhNTA4MjYxMDc0ZjFlNTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDM4ZjA0MThjN2ZkYTYxMDE5YmExOTU2YTE0NjRiMjJlYWY0OWVjMGEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBNYXR0IEpvbGx5IDxNYXR0LkpvbGx5QGZvb3RjbGFuLm5pbmph
PgogRGF0ZTogVGh1LCAyIEZlYiAyMDIzIDIxOjA1OjQwICsxMTAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHN5c3RlbWQ6IEFkZCBvcHRpb25hbCBzdXBwb3J0IGZvciBzeXN0ZW1kIGBzZF9ub3RpZnlgCkBA
IC05LDE2ICs5LDE3IEBAIHBhdGNoIGJhc2VkIG9uIEpha3ViIEplbGVuJ3MgPGpqZWxlbkByZWRo
YXQuY29tPiBvcmlnaW5hbCBwYXRjaAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuc3NoL29wZW5zc2gtcG9ydGFibGUvcHVsbC8zNzUvY29tbWl0cy9i
ZTE4NzQzNTkxMWNkZTZjYzNjZWY2OTgyYTUwODI2MTA3NGYxZTU2XQogCiBTaWduZWQtb2ZmLWJ5
OiBYaWFuZ3l1IENoZW4gPHhpYW5neXUuY2hlbkB3aW5kcml2ZXIuY29tPgorCiAtLS0KICBjb25m
aWd1cmUuYWMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKICBzc2hkLmMgICAgICAgfCAx
MyArKysrKysrKysrKysrCiAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCiAKIGRp
ZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDIyZmVlNzBmLi40
ODZjMTg5ZiAxMDA2NDQKK2luZGV4IDM3OWNkNzQuLmE3ZDBlOTIgMTAwNjQ0CiAtLS0gYS9jb25m
aWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTQ4MzUsNiArNDgzNSwyOSBAQCBBQ19T
VUJTVChbR1NTTElCU10pCitAQCAtNDg0Miw2ICs0ODQyLDI5IEBAIEFDX1NVQlNUKFtHU1NMSUJT
XSkKICBBQ19TVUJTVChbSzVMSUJTXSkKICBBQ19TVUJTVChbQ0hBTk5FTExJQlNdKQogIApAQCAt
NDgsNyArNDksNyBAQCBpbmRleCAyMmZlZTcwZi4uNDg2YzE4OWYgMTAwNjQ0CiAgIyBMb29raW5n
IGZvciBwcm9ncmFtcywgcGF0aHMgYW5kIGZpbGVzCiAgCiAgUFJJVlNFUF9QQVRIPS92YXIvZW1w
dHkKLUBAIC01NjM0LDYgKzU2NTcsNyBAQCBlY2hvICIgICAgICAgICAgICAgICAgICAgbGlibGRu
cyBzdXBwb3J0OiAkTEROU19NU0ciCitAQCAtNTY1MCw2ICs1NjczLDcgQEAgZWNobyAiICAgICAg
ICAgICAgICAgICAgIGxpYmxkbnMgc3VwcG9ydDogJExETlNfTVNHIgogIGVjaG8gIiAgU29sYXJp
cyBwcm9jZXNzIGNvbnRyYWN0IHN1cHBvcnQ6ICRTUENfTVNHIgogIGVjaG8gIiAgICAgICAgICAg
U29sYXJpcyBwcm9qZWN0IHN1cHBvcnQ6ICRTUF9NU0ciCiAgZWNobyAiICAgICAgICAgU29sYXJp
cyBwcml2aWxlZ2Ugc3VwcG9ydDogJFNQUF9NU0ciCkBAIC01Nyw3ICs1OCw3IEBAIGluZGV4IDIy
ZmVlNzBmLi40ODZjMTg5ZiAxMDA2NDQKICBlY2hvICIgICAgICAgICAgIFRyYW5zbGF0ZSB2NCBp
biB2NiBoYWNrOiAkSVBWNF9JTjZfSEFDS19NU0ciCiAgZWNobyAiICAgICAgICAgICAgICAgICAg
QlNEIEF1dGggc3VwcG9ydDogJEJTRF9BVVRIX01TRyIKIGRpZmYgLS1naXQgYS9zc2hkLmMgYi9z
c2hkLmMKLWluZGV4IDYzMjE5MzZjLi44NTlkNmEwYiAxMDA2NDQKK2luZGV4IDljYmU5MjIuLjRi
MzQyYzUgMTAwNjQ0CiAtLS0gYS9zc2hkLmMKICsrKyBiL3NzaGQuYwogQEAgLTg4LDYgKzg4LDEw
IEBACkBAIC03MSw3ICs3Miw3IEBAIGluZGV4IDYzMjE5MzZjLi44NTlkNmEwYiAxMDA2NDQKICAj
aW5jbHVkZSAieG1hbGxvYy5oIgogICNpbmNsdWRlICJzc2guaCIKICAjaW5jbHVkZSAic3NoMi5o
IgotQEAgLTMxMCw2ICszMTQsMTAgQEAgc3RhdGljIHZvaWQKK0BAIC0zMDgsNiArMzEyLDEwIEBA
IHN0YXRpYyB2b2lkCiAgc2lnaHVwX3Jlc3RhcnQodm9pZCkKICB7CiAgCWxvZ2l0KCJSZWNlaXZl
ZCBTSUdIVVA7IHJlc3RhcnRpbmcuIik7CkBAIC04Miw3ICs4Myw3IEBAIGluZGV4IDYzMjE5MzZj
Li44NTlkNmEwYiAxMDA2NDQKICAJaWYgKG9wdGlvbnMucGlkX2ZpbGUgIT0gTlVMTCkKICAJCXVu
bGluayhvcHRpb25zLnBpZF9maWxlKTsKICAJcGxhdGZvcm1fcHJlX3Jlc3RhcnQoKTsKLUBAIC0y
MDg2LDYgKzIwOTQsMTEgQEAgbWFpbihpbnQgYWMsIGNoYXIgKiphdikKK0BAIC0yMDkzLDYgKzIx
MDEsMTEgQEAgbWFpbihpbnQgYWMsIGNoYXIgKiphdikKICAJCQl9CiAgCQl9CiAgCkBAIC05NCw2
ICs5NSwzIEBAIGluZGV4IDYzMjE5MzZjLi44NTlkNmEwYiAxMDA2NDQKICAJCS8qIEFjY2VwdCBh
IGNvbm5lY3Rpb24gYW5kIHJldHVybiBpbiBhIGZvcmtlZCBjaGlsZCAqLwogIAkJc2VydmVyX2Fj
Y2VwdF9sb29wKCZzb2NrX2luLCAmc29ja19vdXQsCiAgCQkgICAgJm5ld3NvY2ssIGNvbmZpZ19z
KTsKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoL2FkZC10ZXN0LXN1cHBvcnQtZm9yLWJ1c3lib3gucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9hZGQtdGVzdC1zdXBwb3J0LWZv
ci1idXN5Ym94LnBhdGNoCmluZGV4IGI4NDAyYTRkZWUuLmFmNTJlYmQ3NmIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL2FkZC10ZXN0LXN1cHBv
cnQtZm9yLWJ1c3lib3gucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL29wZW5zc2gvYWRkLXRlc3Qtc3VwcG9ydC1mb3ItYnVzeWJveC5wYXRjaApAQCAtMSw0ICsx
LDcgQEAKLUFkanVzdCB0ZXN0IGNhc2VzIHRvIHdvcmsgd2l0aCBidXN5Ym94LgorRnJvbSA0OTA4
NWU3YmFiMGZlOTRiZjY2YWY0MzFmN2IzZmVlZTJhMDkyMmEzIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbTogIk1heGluIEIuIEpvaG4iIDxtYXhpbi5qb2huQGVuZWEuY29tPgorRGF0ZTog
VGh1LCAyNCBBcHIgMjAxNCAxODowMDoyMiArMDIwMAorU3ViamVjdDogW1BBVENIXSBBZGp1c3Qg
dGVzdCBjYXNlcyB0byB3b3JrIHdpdGggYnVzeWJveC4KIAogLSBSZXBsYWNlIGRkIHBhcmFtZXRl
ciAib2JzIiB3aXRoICJicyIuCiAtIFJlcGxhY2UgImhlYWQgLTxudW0+IiB3aXRoICJoZWFkIC1u
IDxudW0+Ii4KQEAgLTYsMTEgKzksMTcgQEAgQWRqdXN0IHRlc3QgY2FzZXMgdG8gd29yayB3aXRo
IGJ1c3lib3guCiBTaWduZWQtb2ZmLWJ5OiBNYXhpbiBCLiBKb2huIDxtYXhpbi5qb2huQGVuZWEu
Y29tPgogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKLUluZGV4OiBvcGVuc3NoLTcuNnAxL3Jl
Z3Jlc3MvY2lwaGVyLXNwZWVkLnNoCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gb3BlbnNzaC03LjZwMS5vcmln
L3JlZ3Jlc3MvY2lwaGVyLXNwZWVkLnNoCi0rKysgb3BlbnNzaC03LjZwMS9yZWdyZXNzL2NpcGhl
ci1zcGVlZC5zaAotQEAgLTE3LDcgKzE3LDcgQEAgZm9yIGMgaW4gYCR7U1NIfSAtUSBjaXBoZXJg
OyBkbyBuPTA7IGZvcgorLS0tCisgcmVncmVzcy9jaXBoZXItc3BlZWQuc2ggfCAyICstCisgcmVn
cmVzcy9rZXktb3B0aW9ucy5zaCAgfCAyICstCisgcmVncmVzcy90cmFuc2Zlci5zaCAgICAgfCAy
ICstCisgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCisK
K2RpZmYgLS1naXQgYS9yZWdyZXNzL2NpcGhlci1zcGVlZC5zaCBiL3JlZ3Jlc3MvY2lwaGVyLXNw
ZWVkLnNoCitpbmRleCAxMzQwYmQxLi44NzcwNzU3IDEwMDY0NAorLS0tIGEvcmVncmVzcy9jaXBo
ZXItc3BlZWQuc2gKKysrKyBiL3JlZ3Jlc3MvY2lwaGVyLXNwZWVkLnNoCitAQCAtMjcsNyArMjcs
NyBAQCBmb3IgYyBpbiBgJHtTU0h9IC1RIGNpcGhlcmA7IGRvIG49MDsgZm9yIG0gaW4gYCR7U1NI
fSAtUSBtYWNgOyBkbwogIAkJcHJpbnRmICIlLTYwcyIgIiRjLyRtOiIKICAJCSggJHtTU0h9IC1v
ICdjb21wcmVzc2lvbiBubycgXAogIAkJCS1GICRPQkovc3NoX3Byb3h5IC1tICRtIC1jICRjIHNv
bWVob3N0IFwKQEAgLTE5LDI0ICsyOCwxMSBAQCBJbmRleDogb3BlbnNzaC03LjZwMS9yZWdyZXNz
L2NpcGhlci1zcGVlZC5zaAogIAkJPCAke0RBVEF9ICkgMj4mMSB8IGdldGJ5dGVzCiAgCiAgCQlp
ZiBbICQ/IC1uZSAwIF07IHRoZW4KLUluZGV4OiBvcGVuc3NoLTcuNnAxL3JlZ3Jlc3MvdHJhbnNm
ZXIuc2gKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KLS0tLSBvcGVuc3NoLTcuNnAxLm9yaWcvcmVncmVzcy90cmFuc2Zl
ci5zaAotKysrIG9wZW5zc2gtNy42cDEvcmVncmVzcy90cmFuc2Zlci5zaAotQEAgLTEzLDcgKzEz
LDcgQEAgY21wICR7REFUQX0gJHtDT1BZfQkJfHwgZmFpbCAiY29ycnVwdGVkCi0gZm9yIHMgaW4g
MTAgMTAwIDFrIDMyayA2NGsgMTI4ayAyNTZrOyBkbwotIAl0cmFjZSAiZGQtc2l6ZSAke3N9Igot
IAlybSAtZiAke0NPUFl9Ci0tCWRkIGlmPSREQVRBIG9icz0ke3N9IDI+IC9kZXYvbnVsbCB8IFwK
LSsJZGQgaWY9JERBVEEgYnM9JHtzfSAyPiAvZGV2L251bGwgfCBcCi0gCQkke1NTSH0gLXEgLUYg
JE9CSi9zc2hfcHJveHkgc29tZWhvc3QgImNhdCA+ICR7Q09QWX0iCi0gCWlmIFsgJD8gLW5lIDAg
XTsgdGhlbgotIAkJZmFpbCAic3NoIGNhdCAkREFUQSBmYWlsZWQiCi1JbmRleDogb3BlbnNzaC03
LjZwMS9yZWdyZXNzL2tleS1vcHRpb25zLnNoCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gb3BlbnNzaC03LjZw
MS5vcmlnL3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2gKLSsrKyBvcGVuc3NoLTcuNnAxL3JlZ3Jlc3Mv
a2V5LW9wdGlvbnMuc2gKLUBAIC00Nyw3ICs0Nyw3IEBAIGZvciBmIGluIDEyNy4wLjAuMSAnMTI3
LjAuMC4wXC84JzsgZG8KK2RpZmYgLS1naXQgYS9yZWdyZXNzL2tleS1vcHRpb25zLnNoIGIvcmVn
cmVzcy9rZXktb3B0aW9ucy5zaAoraW5kZXggMmYzZDY2ZS4uN2Y4MTY2ZCAxMDA2NDQKKy0tLSBh
L3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2gKKysrKyBiL3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2gKK0BA
IC05MCw3ICs5MCw3IEBAIGZvciBmIGluIDEyNy4wLjAuMSAnMTI3LjAuMC4wXC84JzsgZG8KICAJ
ZmkKICAKICAJc2VkICdzLy4qL2Zyb209IiciJGYiJyIgJi8nICRvcmlna2V5cyA+JGF1dGhrZXlz
CkBAIC00NSwzICs0MSwxNiBAQCBJbmRleDogb3BlbnNzaC03LjZwMS9yZWdyZXNzL2tleS1vcHRp
b25zLnNoCiAgCXZlcmJvc2UgImtleSBvcHRpb24gJGZyb20iCiAgCXI9YCR7U1NIfSAtcSAtRiAk
T0JKL3NzaF9wcm94eSBzb21laG9zdCAnZWNobyB0cnVlJ2AKICAJaWYgWyAiJHIiID0gInRydWUi
IF07IHRoZW4KK2RpZmYgLS1naXQgYS9yZWdyZXNzL3RyYW5zZmVyLnNoIGIvcmVncmVzcy90cmFu
c2Zlci5zaAoraW5kZXggY2YxNzRhMC4uNDFjZmRjNyAxMDA2NDQKKy0tLSBhL3JlZ3Jlc3MvdHJh
bnNmZXIuc2gKKysrKyBiL3JlZ3Jlc3MvdHJhbnNmZXIuc2gKK0BAIC0xMyw3ICsxMyw3IEBAIGNt
cCAke0RBVEF9ICR7Q09QWX0JCXx8IGZhaWwgImNvcnJ1cHRlZCBjb3B5IgorIGZvciBzIGluIDEw
IDEwMCAxayAzMmsgNjRrIDEyOGsgMjU2azsgZG8KKyAJdHJhY2UgImRkLXNpemUgJHtzfSIKKyAJ
cm0gLWYgJHtDT1BZfQorLQlkZCBpZj0kREFUQSBvYnM9JHtzfSAyPiAvZGV2L251bGwgfCBcCisr
CWRkIGlmPSREQVRBIGJzPSR7c30gMj4gL2Rldi9udWxsIHwgXAorIAkJJHtTU0h9IC1xIC1GICRP
Qkovc3NoX3Byb3h5IHNvbWVob3N0ICJjYXQgPiAke0NPUFl9IgorIAlpZiBbICQ/IC1uZSAwIF07
IHRoZW4KKyAJCWZhaWwgInNzaCBjYXQgJERBVEEgZmFpbGVkIgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvZml4LXBvdGVudGlhbC1zaWduZWQt
b3ZlcmZsb3ctaW4tcG9pbnRlci1hcml0aG1hdGljLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvZml4LXBvdGVudGlhbC1zaWduZWQtb3ZlcmZsb3ctaW4t
cG9pbnRlci1hcml0aG1hdGljLnBhdGNoCmluZGV4IDIwMDM2ZGE5MzEuLjFhZTMyOGNiNDMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL2ZpeC1w
b3RlbnRpYWwtc2lnbmVkLW92ZXJmbG93LWluLXBvaW50ZXItYXJpdGhtYXRpYy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9maXgtcG90ZW50aWFs
LXNpZ25lZC1vdmVyZmxvdy1pbi1wb2ludGVyLWFyaXRobWF0aWMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDMzMjhlOThiY2JmMjkzMGNkN2VlYTNlNmM5MmFkNWRjYmRmNDc5NGYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZlODFlNjU4ZmU0MjBlNWI0ODA5YmQ3OGU1MGJlY2Ri
MzEyODIxN2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBZdWFuamllIEh1YW5nIDx5
dWFuamllLmh1YW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI0IEF1ZyAyMDE2IDAzOjE1
OjQzICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBwb3RlbnRpYWwgc2lnbmVkIG92ZXJmbG93
IGluIHBvaW50ZXIgYXJpdGhtYXRpYwpAQCAtMTQsNiArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBZ
dWFuamllIEh1YW5nIDx5dWFuamllLmh1YW5nQHdpbmRyaXZlci5jb20+CiAKIENvbXBsZXRlIHRo
ZSBmaXgKIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNv
bT4KKwogLS0tCiAgb3BlbmJzZC1jb21wYXQvc3RybGNhdC5jIHwgMTAgKysrKysrKy0tLQogIG9w
ZW5ic2QtY29tcGF0L3N0cmxjcHkuYyB8ICA4ICsrKysrKy0tCkBAIC0xMDYsNiArMTA3LDMgQEAg
aW5kZXggN2FkMzU3My4uNzA0MGYxZiAxMDA2NDQKICsJcmV0dXJuIChzaXplX3QpKCh1aW50cHRy
X3QpY3AgLSAodWludHB0cl90KXN0cik7CiAgfQogICNlbmRpZgotLS0gCi0yLjE3LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS41cDEu
YmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF85LjZwMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaF85LjVwMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NoL29wZW5zc2hfOS42cDEuYmIKaW5kZXggYmJiOGZiMDkxYS4uZmE0NGViMGJk
NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hf
OS41cDEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hf
OS42cDEuYmIKQEAgLTI4LDcgKzI4LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vZnRwLm9wZW5ic2Qu
b3JnL3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUvb3BlbnNzaC0ke1BWfS50YXIKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQt
ZmlsZXMtb24tZXJyby5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXN5c3RlbWQtQWRk
LW9wdGlvbmFsLXN1cHBvcnQtZm9yLXN5c3RlbWQtc2Rfbm90aWZ5LnBhdGNoIFwKICAgICAgICAg
ICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYwMjZlN2I3OWJhN2ZiNTQwZjc1MTgyYWY5NmRj
OGE4ZjFkYjM5NWY5MjJiYmM5ZjZjYTYwMzY3MjY4NjA4NmIiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOTEwMjExYzA3MjU1YThjNWFkNjU0MzkxYjQwZWU1OTgwMDcxMGRkODExOWRkNTM2MmRlMDkz
ODVhYTdhNzc3YyIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAwNy0yNzY4XSA9ICJub3QtYXBwbGljYWJs
ZS1jb25maWc6IFRoaXMgQ1ZFIGlzIHNwZWNpZmljIHRvIE9wZW5TU0ggd2l0aCB0aGUgcGFtIG9w
aWUgd2hpY2ggd2UgZG9uJ3QgYnVpbGQvdXNlIGhlcmUuIgogCi0tIAoyLjQyLjAKCg==

--===============7311876281284663854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (912 cached, 1 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-124b4848b29ca319e3c84ab8bbf47f69c655fab4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:124b4848b29ca319e3c84ab8bbf47f69c655fab4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 355 Local 343 Mirrors 0 Missed 12 Current 397 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1446 of 2078 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_recipe_qa)
NOTE: recipe openssh-9.6p1-r0: task do_recipe_qa: Started
NOTE: recipe openssh-9.6p1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2056 of 2078 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_fetch)
NOTE: recipe openssh-9.6p1-r0: task do_fetch: Started
NOTE: recipe openssh-9.6p1-r0: task do_fetch: Succeeded
NOTE: Running task 2057 of 2078 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_unpack)
NOTE: Running task 2058 of 2078 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-9.6p1-r0: task do_unpack: Started
NOTE: recipe openssh-9.6p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssh-9.6p1-r0: task do_unpack: Succeeded
NOTE: Running task 2059 of 2078 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_patch)
NOTE: Running task 2060 of 2078 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_collect_spdx_deps)
NOTE: recipe openssh-9.6p1-r0: task do_patch: Started
NOTE: recipe openssh-9.6p1-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssh-9.6p1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssh-9.6p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssh-9.6p1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2060 tasks of which 2054 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101051834.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101051834.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: openssh-9.6p1-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: openssh-9.6p1-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/9.6p1/temp/log.do_patch.1773482
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_patch) failed with exit code '1'

--===============7311876281284663854==--

