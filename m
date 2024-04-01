Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC31CD1299
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1989.1711994601287783114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TIDicLMr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SQ+FfGbb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e9ad47b31-3b52345d-7a97-4c51-b595-91de7c946dad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=cO3+3JvZbQzstecL3cBoWkCX0ENY7rrfgGGy37CbXbk=;
	b=TIDicLMr7QdzDCPyH8M2kQXu5vpMgnJ5lxfTFbMLDhn6+WU9KUYD+Z5SDE7ftlDV
	N8yXX4ZjT33uLO8EbcnGRGKrf1xyrzu8mD+aDucocNWg2Ac+mFw3Wac7dSOXoyTvvRa
	V8E5KaJsrjvHTzzRnb+4FZyaSrKbcv2AisVN80tk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=cO3+3JvZbQzstecL3cBoWkCX0ENY7rrfgGGy37CbXbk=;
	b=SQ+FfGbbDMcwIq8BzUvqCOA5aINBLO8tszyXQebfJcSXlFUWiILe9ZAD9CjqKOpf
	iSWuy51rgCGKViIkzY6XTwkBTYB5U01vKa/pfcmCqQ/aXKwk8KhckDaaHbhjchnfsJX
	hFBSBWPRkVOA7Yhukco80JuO2tMfHi6fVxM+a9i4=
Content-Type: multipart/mixed; boundary="===============3492027772874926256=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 9.7p1 SUCCEEDED
Message-ID: <0101018e9ad47b31-3b52345d-7a97-4c51-b595-91de7c946dad-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197702

--===============3492027772874926256==
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
From db9c9962e5a6cf8fb57b209a7d560785eb90ceb1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 06:03:28 +0000
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
index 8763f30f4b..fc91c53dfa 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
+From 9aeeb7854d26d67c2a635056089705696e16ce94 Mon Sep 17 00:00:00 2001
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
index acda8f1ce9..7aa7d6aebe 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -1,4 +1,4 @@
-From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
+From 40c268703317153cff34115ec2fd30afcbf231d1 Mon Sep 17 00:00:00 2001
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
index b8402a4dee..3de93fd667 100644
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
@@ -1,16 +1,24 @@
-Adjust test cases to work with busybox.
+From 824919898ef57ae711461ae1fc473cf96efd7c62 Mon Sep 17 00:00:00 2001
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
index 20036da931..73ee2b3bbd 100644
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
+++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
@@ -1,4 +1,4 @@
-From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
+From 84fde6297211945cb675745d3f704438140c60a0 Mon Sep 17 00:00:00 2001
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


--===============3492027772874926256==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-9.6p1-9.7p1.patch"

RnJvbSBkYjljOTk2MmU1YTZjZjhmYjU3YjIwOWE3ZDU2MDc4NWViOTBjZWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNjowMzoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgOS42cDEgLT4gOS43cDEKCi0tLQogLi4uaC1sb2ctaW5wdXQtYW5kLW91
dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIHwgIDcgKy0tCiAuLi50aW9uYWwtc3VwcG9ydC1mb3It
c3lzdGVtZC1zZF9ub3RpZnkucGF0Y2ggfCAxNyArKystLS0KIC4uLi9hZGQtdGVzdC1zdXBwb3J0
LWZvci1idXN5Ym94LnBhdGNoICAgICAgICB8IDU2ICsrKysrKysrKysrLS0tLS0tLS0KIC4uLmln
bmVkLW92ZXJmbG93LWluLXBvaW50ZXItYXJpdGhtYXRpYy5wYXRjaCB8ICA1ICstCiAuLi4ve29w
ZW5zc2hfOS42cDEuYmIgPT4gb3BlbnNzaF85LjdwMS5iYn0gICAgfCAgMiArLQogNSBmaWxlcyBj
aGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gve29wZW5zc2hfOS42cDEuYmIgPT4gb3BlbnNzaF85
LjdwMS5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0
LWZpbGVzLW9uLWVycm8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gv
b3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVz
LW9uLWVycm8ucGF0Y2gKaW5kZXggODc2M2YzMGY0Yi4uZmM5MWM1M2RmYSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJh
bm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5u
ZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gZjVhNGRhY2M5ODdjYTU0OGZjODY1NzdjMmRiYTEyMWM4NmRhM2MzNCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWFlZWI3ODU0ZDI2ZDY3YzJhNjM1MDU2MDg5NzA1
Njk2ZTE2Y2U5NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pa2tvIFJhcGVsaSA8
bWlra28ucmFwZWxpQGxpbmFyby5vcmc+CiBEYXRlOiBNb24sIDExIFNlcCAyMDIzIDA5OjU1OjIx
ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlZ3Jlc3MvYmFubmVyLnNoOiBsb2cgaW5wdXQgYW5k
IG91dHB1dCBmaWxlcyBvbiBlcnJvcgpAQCAtNDIsNyArNDIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBN
aWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5hcm8ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3JlZ3Jlc3MvYmFu
bmVyLnNoIGIvcmVncmVzcy9iYW5uZXIuc2gKLWluZGV4IGE4NGZlYjVhLi5kZTg0OTU3YSAxMDA2
NDQKK2luZGV4IGE4NGZlYjUuLmRlODQ5NTcgMTAwNjQ0CiAtLS0gYS9yZWdyZXNzL2Jhbm5lci5z
aAogKysrIGIvcmVncmVzcy9iYW5uZXIuc2gKIEBAIC0zMiw3ICszMiw5IEBAIGZvciBzIGluIDAg
MTAgMTAwIDEwMDAgMTAwMDAgMTAwMDAwIDsgZG8KQEAgLTU2LDYgKzU2LDMgQEAgaW5kZXggYTg0
ZmViNWEuLmRlODQ5NTdhIDEwMDY0NAogIGRvbmUKICAKICB0cmFjZSAidGVzdCBzdXBwcmVzcyBi
YW5uZXIgKC1xKSIKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtc3lzdGVtZC1BZGQtb3B0aW9uYWwtc3VwcG9y
dC1mb3Itc3lzdGVtZC1zZF9ub3RpZnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaC8wMDAxLXN5c3RlbWQtQWRkLW9wdGlvbmFsLXN1cHBvcnQtZm9yLXN5
c3RlbWQtc2Rfbm90aWZ5LnBhdGNoCmluZGV4IGFjZGE4ZjFjZTkuLjdhYTdkNmFlYmUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtc3lz
dGVtZC1BZGQtb3B0aW9uYWwtc3VwcG9ydC1mb3Itc3lzdGVtZC1zZF9ub3RpZnkucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1zeXN0ZW1k
LUFkZC1vcHRpb25hbC1zdXBwb3J0LWZvci1zeXN0ZW1kLXNkX25vdGlmeS5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYmUxODc0MzU5MTFjZGU2Y2MzY2VmNjk4MmE1MDgyNjEwNzRmMWU1NiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDBjMjY4NzAzMzE3MTUzY2ZmMzQxMTVlYzJm
ZDMwYWZjYmYyMzFkMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hdHQgSm9sbHkg
PE1hdHQuSm9sbHlAZm9vdGNsYW4ubmluamE+CiBEYXRlOiBUaHUsIDIgRmViIDIwMjMgMjE6MDU6
NDAgKzExMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3lzdGVtZDogQWRkIG9wdGlvbmFsIHN1cHBvcnQg
Zm9yIHN5c3RlbWQgYHNkX25vdGlmeWAKQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBYaWFuZ3l1IENoZW4gPHhpYW5neXUuY2hlbkB3aW5kcml2ZXIuY29tPgogIDIgZmlsZXMgY2hh
bmdlZCwgMzcgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29u
ZmlndXJlLmFjCi1pbmRleCAyMmZlZTcwZi4uNDg2YzE4OWYgMTAwNjQ0CitpbmRleCA4MmU4YmI3
Li5kMTE0NWQzIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMK
LUBAIC00ODM1LDYgKzQ4MzUsMjkgQEAgQUNfU1VCU1QoW0dTU0xJQlNdKQorQEAgLTQ4NzAsNiAr
NDg3MCwyOSBAQCBBQ19TVUJTVChbR1NTTElCU10pCiAgQUNfU1VCU1QoW0s1TElCU10pCiAgQUNf
U1VCU1QoW0NIQU5ORUxMSUJTXSkKICAKQEAgLTQ4LDcgKzQ4LDcgQEAgaW5kZXggMjJmZWU3MGYu
LjQ4NmMxODlmIDEwMDY0NAogICMgTG9va2luZyBmb3IgcHJvZ3JhbXMsIHBhdGhzIGFuZCBmaWxl
cwogIAogIFBSSVZTRVBfUEFUSD0vdmFyL2VtcHR5Ci1AQCAtNTYzNCw2ICs1NjU3LDcgQEAgZWNo
byAiICAgICAgICAgICAgICAgICAgIGxpYmxkbnMgc3VwcG9ydDogJExETlNfTVNHIgorQEAgLTU2
ODgsNiArNTcxMSw3IEBAIGVjaG8gIiAgICAgICAgICAgICAgICAgICBsaWJsZG5zIHN1cHBvcnQ6
ICRMRE5TX01TRyIKICBlY2hvICIgIFNvbGFyaXMgcHJvY2VzcyBjb250cmFjdCBzdXBwb3J0OiAk
U1BDX01TRyIKICBlY2hvICIgICAgICAgICAgIFNvbGFyaXMgcHJvamVjdCBzdXBwb3J0OiAkU1Bf
TVNHIgogIGVjaG8gIiAgICAgICAgIFNvbGFyaXMgcHJpdmlsZWdlIHN1cHBvcnQ6ICRTUFBfTVNH
IgpAQCAtNTcsNyArNTcsNyBAQCBpbmRleCAyMmZlZTcwZi4uNDg2YzE4OWYgMTAwNjQ0CiAgZWNo
byAiICAgICAgICAgICBUcmFuc2xhdGUgdjQgaW4gdjYgaGFjazogJElQVjRfSU42X0hBQ0tfTVNH
IgogIGVjaG8gIiAgICAgICAgICAgICAgICAgIEJTRCBBdXRoIHN1cHBvcnQ6ICRCU0RfQVVUSF9N
U0ciCiBkaWZmIC0tZ2l0IGEvc3NoZC5jIGIvc3NoZC5jCi1pbmRleCA2MzIxOTM2Yy4uODU5ZDZh
MGIgMTAwNjQ0CitpbmRleCBiNGYyYjk3Li42ODIwYTQxIDEwMDY0NAogLS0tIGEvc3NoZC5jCiAr
KysgYi9zc2hkLmMKIEBAIC04OCw2ICs4OCwxMCBAQApAQCAtNzEsNyArNzEsNyBAQCBpbmRleCA2
MzIxOTM2Yy4uODU5ZDZhMGIgMTAwNjQ0CiAgI2luY2x1ZGUgInhtYWxsb2MuaCIKICAjaW5jbHVk
ZSAic3NoLmgiCiAgI2luY2x1ZGUgInNzaDIuaCIKLUBAIC0zMTAsNiArMzE0LDEwIEBAIHN0YXRp
YyB2b2lkCitAQCAtMzA4LDYgKzMxMiwxMCBAQCBzdGF0aWMgdm9pZAogIHNpZ2h1cF9yZXN0YXJ0
KHZvaWQpCiAgewogIAlsb2dpdCgiUmVjZWl2ZWQgU0lHSFVQOyByZXN0YXJ0aW5nLiIpOwpAQCAt
ODIsNyArODIsNyBAQCBpbmRleCA2MzIxOTM2Yy4uODU5ZDZhMGIgMTAwNjQ0CiAgCWlmIChvcHRp
b25zLnBpZF9maWxlICE9IE5VTEwpCiAgCQl1bmxpbmsob3B0aW9ucy5waWRfZmlsZSk7CiAgCXBs
YXRmb3JtX3ByZV9yZXN0YXJ0KCk7Ci1AQCAtMjA4Niw2ICsyMDk0LDExIEBAIG1haW4oaW50IGFj
LCBjaGFyICoqYXYpCitAQCAtMjA5Myw2ICsyMTAxLDExIEBAIG1haW4oaW50IGFjLCBjaGFyICoq
YXYpCiAgCQkJfQogIAkJfQogIApAQCAtOTQsNiArOTQsMyBAQCBpbmRleCA2MzIxOTM2Yy4uODU5
ZDZhMGIgMTAwNjQ0CiAgCQkvKiBBY2NlcHQgYSBjb25uZWN0aW9uIGFuZCByZXR1cm4gaW4gYSBm
b3JrZWQgY2hpbGQgKi8KICAJCXNlcnZlcl9hY2NlcHRfbG9vcCgmc29ja19pbiwgJnNvY2tfb3V0
LAogIAkJICAgICZuZXdzb2NrLCBjb25maWdfcyk7Ci0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9hZGQtdGVzdC1zdXBw
b3J0LWZvci1idXN5Ym94LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2gvYWRkLXRlc3Qtc3VwcG9ydC1mb3ItYnVzeWJveC5wYXRjaAppbmRleCBiODQwMmE0
ZGVlLi4zZGU5M2ZkNjY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaC9hZGQtdGVzdC1zdXBwb3J0LWZvci1idXN5Ym94LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL2FkZC10ZXN0LXN1cHBvcnQt
Zm9yLWJ1c3lib3gucGF0Y2gKQEAgLTEsMTYgKzEsMjQgQEAKLUFkanVzdCB0ZXN0IGNhc2VzIHRv
IHdvcmsgd2l0aCBidXN5Ym94LgorRnJvbSA4MjQ5MTk4OThlZjU3YWU3MTE0NjFhZTFmYzQ3M2Nm
OTZlZmQ3YzYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogIk1heGluIEIuIEpvaG4i
IDxtYXhpbi5qb2huQGVuZWEuY29tPgorRGF0ZTogVGh1LCAyNCBBcHIgMjAxNCAxODowMDoyMiAr
MDIwMAorU3ViamVjdDogW1BBVENIXSBBZGp1c3QgdGVzdCBjYXNlcyB0byB3b3JrIHdpdGggYnVz
eWJveC4KIAogLSBSZXBsYWNlIGRkIHBhcmFtZXRlciAib2JzIiB3aXRoICJicyIuCiAtIFJlcGxh
Y2UgImhlYWQgLTxudW0+IiB3aXRoICJoZWFkIC1uIDxudW0+Ii4KIAogU2lnbmVkLW9mZi1ieTog
TWF4aW4gQi4gSm9obiA8bWF4aW4uam9obkBlbmVhLmNvbT4KIFVwc3RyZWFtLVN0YXR1czogUGVu
ZGluZworLS0tCisgcmVncmVzcy9jaXBoZXItc3BlZWQuc2ggfCAyICstCisgcmVncmVzcy9rZXkt
b3B0aW9ucy5zaCAgfCAyICstCisgcmVncmVzcy90cmFuc2Zlci5zaCAgICAgfCAyICstCisgMyBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKLUluZGV4OiBv
cGVuc3NoLTcuNnAxL3JlZ3Jlc3MvY2lwaGVyLXNwZWVkLnNoCi09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gb3Bl
bnNzaC03LjZwMS5vcmlnL3JlZ3Jlc3MvY2lwaGVyLXNwZWVkLnNoCi0rKysgb3BlbnNzaC03LjZw
MS9yZWdyZXNzL2NpcGhlci1zcGVlZC5zaAotQEAgLTE3LDcgKzE3LDcgQEAgZm9yIGMgaW4gYCR7
U1NIfSAtUSBjaXBoZXJgOyBkbyBuPTA7IGZvcgorZGlmZiAtLWdpdCBhL3JlZ3Jlc3MvY2lwaGVy
LXNwZWVkLnNoIGIvcmVncmVzcy9jaXBoZXItc3BlZWQuc2gKK2luZGV4IDEzNDBiZDEuLjg3NzA3
NTcgMTAwNjQ0CistLS0gYS9yZWdyZXNzL2NpcGhlci1zcGVlZC5zaAorKysrIGIvcmVncmVzcy9j
aXBoZXItc3BlZWQuc2gKK0BAIC0yNyw3ICsyNyw3IEBAIGZvciBjIGluIGAke1NTSH0gLVEgY2lw
aGVyYDsgZG8gbj0wOyBmb3IgbSBpbiBgJHtTU0h9IC1RIG1hY2A7IGRvCiAgCQlwcmludGYgIiUt
NjBzIiAiJGMvJG06IgogIAkJKCAke1NTSH0gLW8gJ2NvbXByZXNzaW9uIG5vJyBcCiAgCQkJLUYg
JE9CSi9zc2hfcHJveHkgLW0gJG0gLWMgJGMgc29tZWhvc3QgXApAQCAtMTksMjQgKzI3LDExIEBA
IEluZGV4OiBvcGVuc3NoLTcuNnAxL3JlZ3Jlc3MvY2lwaGVyLXNwZWVkLnNoCiAgCQk8ICR7REFU
QX0gKSAyPiYxIHwgZ2V0Ynl0ZXMKICAKICAJCWlmIFsgJD8gLW5lIDAgXTsgdGhlbgotSW5kZXg6
IG9wZW5zc2gtNy42cDEvcmVncmVzcy90cmFuc2Zlci5zaAotPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIG9wZW5z
c2gtNy42cDEub3JpZy9yZWdyZXNzL3RyYW5zZmVyLnNoCi0rKysgb3BlbnNzaC03LjZwMS9yZWdy
ZXNzL3RyYW5zZmVyLnNoCi1AQCAtMTMsNyArMTMsNyBAQCBjbXAgJHtEQVRBfSAke0NPUFl9CQl8
fCBmYWlsICJjb3JydXB0ZWQKLSBmb3IgcyBpbiAxMCAxMDAgMWsgMzJrIDY0ayAxMjhrIDI1Nms7
IGRvCi0gCXRyYWNlICJkZC1zaXplICR7c30iCi0gCXJtIC1mICR7Q09QWX0KLS0JZGQgaWY9JERB
VEEgb2JzPSR7c30gMj4gL2Rldi9udWxsIHwgXAotKwlkZCBpZj0kREFUQSBicz0ke3N9IDI+IC9k
ZXYvbnVsbCB8IFwKLSAJCSR7U1NIfSAtcSAtRiAkT0JKL3NzaF9wcm94eSBzb21laG9zdCAiY2F0
ID4gJHtDT1BZfSIKLSAJaWYgWyAkPyAtbmUgMCBdOyB0aGVuCi0gCQlmYWlsICJzc2ggY2F0ICRE
QVRBIGZhaWxlZCIKLUluZGV4OiBvcGVuc3NoLTcuNnAxL3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2gK
LT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KLS0tLSBvcGVuc3NoLTcuNnAxLm9yaWcvcmVncmVzcy9rZXktb3B0aW9ucy5z
aAotKysrIG9wZW5zc2gtNy42cDEvcmVncmVzcy9rZXktb3B0aW9ucy5zaAotQEAgLTQ3LDcgKzQ3
LDcgQEAgZm9yIGYgaW4gMTI3LjAuMC4xICcxMjcuMC4wLjBcLzgnOyBkbworZGlmZiAtLWdpdCBh
L3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2ggYi9yZWdyZXNzL2tleS1vcHRpb25zLnNoCitpbmRleCAy
ZjNkNjZlLi43ZjgxNjZkIDEwMDY0NAorLS0tIGEvcmVncmVzcy9rZXktb3B0aW9ucy5zaAorKysr
IGIvcmVncmVzcy9rZXktb3B0aW9ucy5zaAorQEAgLTkwLDcgKzkwLDcgQEAgZm9yIGYgaW4gMTI3
LjAuMC4xICcxMjcuMC4wLjBcLzgnOyBkbwogIAlmaQogIAogIAlzZWQgJ3MvLiovZnJvbT0iJyIk
ZiInIiAmLycgJG9yaWdrZXlzID4kYXV0aGtleXMKQEAgLTQ1LDMgKzQwLDE2IEBAIEluZGV4OiBv
cGVuc3NoLTcuNnAxL3JlZ3Jlc3Mva2V5LW9wdGlvbnMuc2gKICAJdmVyYm9zZSAia2V5IG9wdGlv
biAkZnJvbSIKICAJcj1gJHtTU0h9IC1xIC1GICRPQkovc3NoX3Byb3h5IHNvbWVob3N0ICdlY2hv
IHRydWUnYAogIAlpZiBbICIkciIgPSAidHJ1ZSIgXTsgdGhlbgorZGlmZiAtLWdpdCBhL3JlZ3Jl
c3MvdHJhbnNmZXIuc2ggYi9yZWdyZXNzL3RyYW5zZmVyLnNoCitpbmRleCBjZjE3NGEwLi40MWNm
ZGM3IDEwMDY0NAorLS0tIGEvcmVncmVzcy90cmFuc2Zlci5zaAorKysrIGIvcmVncmVzcy90cmFu
c2Zlci5zaAorQEAgLTEzLDcgKzEzLDcgQEAgY21wICR7REFUQX0gJHtDT1BZfQkJfHwgZmFpbCAi
Y29ycnVwdGVkIGNvcHkiCisgZm9yIHMgaW4gMTAgMTAwIDFrIDMyayA2NGsgMTI4ayAyNTZrOyBk
bworIAl0cmFjZSAiZGQtc2l6ZSAke3N9IgorIAlybSAtZiAke0NPUFl9CistCWRkIGlmPSREQVRB
IG9icz0ke3N9IDI+IC9kZXYvbnVsbCB8IFwKKysJZGQgaWY9JERBVEEgYnM9JHtzfSAyPiAvZGV2
L251bGwgfCBcCisgCQkke1NTSH0gLXEgLUYgJE9CSi9zc2hfcHJveHkgc29tZWhvc3QgImNhdCA+
ICR7Q09QWX0iCisgCWlmIFsgJD8gLW5lIDAgXTsgdGhlbgorIAkJZmFpbCAic3NoIGNhdCAkREFU
QSBmYWlsZWQiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gv
b3BlbnNzaC9maXgtcG90ZW50aWFsLXNpZ25lZC1vdmVyZmxvdy1pbi1wb2ludGVyLWFyaXRobWF0
aWMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9maXgt
cG90ZW50aWFsLXNpZ25lZC1vdmVyZmxvdy1pbi1wb2ludGVyLWFyaXRobWF0aWMucGF0Y2gKaW5k
ZXggMjAwMzZkYTkzMS4uNzNlZTJiM2JiZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvZml4LXBvdGVudGlhbC1zaWduZWQtb3ZlcmZsb3ctaW4t
cG9pbnRlci1hcml0aG1hdGljLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoL2ZpeC1wb3RlbnRpYWwtc2lnbmVkLW92ZXJmbG93LWluLXBvaW50ZXIt
YXJpdGhtYXRpYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzMyOGU5OGJjYmYyOTMwY2Q3
ZWVhM2U2YzkyYWQ1ZGNiZGY0Nzk0ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODRm
ZGU2Mjk3MjExOTQ1Y2I2NzU3NDVkM2Y3MDQ0MzgxNDBjNjBhMCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFl1YW5qaWUgSHVhbmcgPHl1YW5qaWUuaHVhbmdAd2luZHJpdmVyLmNvbT4K
IERhdGU6IFdlZCwgMjQgQXVnIDIwMTYgMDM6MTU6NDMgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
Rml4IHBvdGVudGlhbCBzaWduZWQgb3ZlcmZsb3cgaW4gcG9pbnRlciBhcml0aG1hdGljCkBAIC0x
MDYsNiArMTA2LDMgQEAgaW5kZXggN2FkMzU3My4uNzA0MGYxZiAxMDA2NDQKICsJcmV0dXJuIChz
aXplX3QpKCh1aW50cHRyX3QpY3AgLSAodWludHB0cl90KXN0cik7CiAgfQogICNlbmRpZgotLS0g
Ci0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2hfOS42cDEuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3Bl
bnNzaF85LjdwMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF85LjZwMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS43cDEuYmIKaW5kZXggZWRkOGU4
YzJkMS4uM2IwYjQ3MDk3YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2hfOS42cDEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2hfOS43cDEuYmIKQEAgLTI4LDcgKzI4LDcgQEAgU1JDX1VSSSA9ICJodHRw
Oi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUvb3BlbnNzaC0k
e1BWfS50YXIKICAgICAgICAgICAgZmlsZTovLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlu
cHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLXN5c3RlbWQtQWRkLW9wdGlvbmFsLXN1cHBvcnQtZm9yLXN5c3RlbWQtc2Rfbm90aWZ5LnBh
dGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkxMDIxMWMwNzI1NWE4
YzVhZDY1NDM5MWI0MGVlNTk4MDA3MTBkZDgxMTlkZDUzNjJkZTA5Mzg1YWE3YTc3N2MiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNDkwNDI2Zjc2NmQ4MmEyNzYzZmNhY2Q4ZDgzZWEzZDcwNzk4NzUw
YzdiZDJhZmYyZTU3ZGM1NjYwZjc3M2ZmZCIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAwNy0yNzY4XSA9
ICJub3QtYXBwbGljYWJsZS1jb25maWc6IFRoaXMgQ1ZFIGlzIHNwZWNpZmljIHRvIE9wZW5TU0gg
d2l0aCB0aGUgcGFtIG9waWUgd2hpY2ggd2UgZG9uJ3QgYnVpbGQvdXNlIGhlcmUuIgogCi0tIAoy
LjQyLjAKCg==

--===============3492027772874926256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/openssh: SRC_URI changed from "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.6p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch" to "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.7p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch file://
 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch"
packages/core2-64-poky-linux/openssh: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 22334184 to 22369056 (+0%)
packages/core2-64-poky-linux/openssh/openssh-dbg: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-dbg: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-dev: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-dev: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-doc: PKGSIZE changed from 339983 to 340919 (+0%)
packages/core2-64-poky-linux/openssh/openssh-doc: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-doc: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-keygen: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-keygen: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-locale: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-locale: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-misc: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-misc: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 6203196 to 6211392 (+0%)
packages/core2-64-poky-linux/openssh/openssh-ptest: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-ptest: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-scp: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-scp: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-sftp-server: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sftp: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-sftp: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-src: PKGSIZE changed from 3738151 to 3744144 (+0%)
packages/core2-64-poky-linux/openssh/openssh-src: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-src: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-ssh: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-ssh: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 1642666 to 1650858 (+0%)
packages/core2-64-poky-linux/openssh/openssh-sshd: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-sshd: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh-staticdev: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh-staticdev: PKGV changed from 9.6p1 [default] to 9.7p1 [default]
packages/core2-64-poky-linux/openssh/openssh: PV changed from "9.6p1" to "9.7p1"
packages/core2-64-poky-linux/openssh/openssh: PKGV changed from 9.6p1 [default] to 9.7p1 [default]

--===============3492027772874926256==--

