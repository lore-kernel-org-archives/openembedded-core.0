Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B0DC531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 05:43:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13547.1784871781770727093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 22:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pExi4YYT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cLljpVmz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f92a6019f-463e2a4b-76b4-4750-a918-96161d126894-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784871780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fX8nMf4HSClPgurfGKEbcT/G+Bu4i74FJRzL6tnz4Uk=;
	b=pExi4YYT2hggzVf5BmrqQktZgAqG+WFSw+BRTIaoGHY05T/0XmDf8l5Hjf2MYGP3
	A4cchDtISadt1EPbNtSuSGDcRB51/v9sgpgPvSGoqdguj3JydQSL6iGt9Q0b4K3KJFx
	Bknl6xq7swrwljyDwE7cwMZduWjHC7HcU4HN4f08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784871780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fX8nMf4HSClPgurfGKEbcT/G+Bu4i74FJRzL6tnz4Uk=;
	b=cLljpVmzOVg9JlZMgGjW5eGFlkJoeSFM/qvoL7dVyvwmEHZWMKp0eindxsZ5cW8V
	ZvDryfeIbax/eAh6u6+o8Gad+45TxK8q7NCDOqc2IFjJTL9kuhPDpYQMx4WfznfGrU8
	76El5eKuKb+X2Y2GOL+jECYXwsywFnI+D4d2fzDs=
Content-Type: multipart/mixed; boundary="===============5743794361965049818=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2026.94 SUCCEEDED
Message-ID: <0101019f92a6019f-463e2a4b-76b4-4750-a918-96161d126894-000000@us-west-2.amazonses.com>
Date: Fri, 24 Jul 2026 05:43:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.24-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 05:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241891

--===============5743794361965049818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dropbear* to *2026.94* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2026.92-2026.94.patch
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
From 68e220e5c9f8bbd383e3fe7567a35e2c02c52923 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 24 Jul 2026 05:16:38 +0000
Subject: [PATCH] dropbear: upgrade 2026.92 -> 2026.94

Source: CHANGES

2026.94 - 23 July 2026

- Fix scp build failure regression from 2026.93
  The new ascii_isdigit() etc wasn't linked.

- Print square brackets around ipv6 addresses with ports, eg
  [2a00:f10:400:2:1c00:bcff:fe00:1c6]:22
  Patch from Seo Suchan

- Support longer paths in scp.

- Avoid some build warnings, add increase github action coverage of
  config options.

2026.93 - 21 July 2026

Note >> for compatibility/configuration changes

- Security: Fix a use-after-free in X11 forwarding that could possibly lead
  to memory corruption. This is vulnerable to authenticated users if X11
  forwarding is enabled. By default X11 forwarding is not built.
  In 2026.89 the server is running as the authenticated user for X11
  forwarding, in earlier versions it runs as root.
  This removes X11 "single connection" which has probably never been used.
  Reported by @peter-pe
  https://github.com/mkj/dropbear/commit/882f83806d5e133037cd28e954a878984ef7b9c4

- >> "permitlisten" authorized_keys lines will now be ignored if
  the port is invalid (>65535). From Basavaraj S Maneppagol.

- >> In 2026.92, the configure option --enable-plugin-deprecated
  wasn't correctly renamed. This is now implemented.
  Patch from Alexander Dahl

- Two factor auth "-t" is no longer deprecated, it will be kept.
  The "DEPRECATED_TWO_FACTOR" option is ignored, and no longer required.

- Fix out of bounds read during utmp/wtmp log file handling, reported by
  Basavaraj S Maneppagol.

- More robust handling of ascii inputs for some platforms.
  From Basavaraj S Maneppagol

- Convert manpages to mdoc format, from shrub

  [Updated 16 July: This is no longer planned to be removed, future releases
  will ignore DEPRECATED_TWO_FACTOR and always enable it, like previously]
---
 .../dropbear/0001-urandom-xauth-changes-to-options.h.patch    | 4 ++--
 .../dropbear/dropbear/0005-dropbear-enable-pam.patch          | 4 ++--
 .../dropbear/dropbear/0006-dropbear-configuration-file.patch  | 4 ++--
 .../dropbear/{dropbear_2026.92.bb => dropbear_2026.94.bb}     | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear_2026.92.bb => dropbear_2026.94.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index b0f8e61998..48ed1570cc 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From e5f6c6e8d2b6315e509c610e7d13e7dd2b465a85 Mon Sep 17 00:00:00 2001
+From f1399f50d279e28abc028ace03f3978f6799a8cc Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Wed, 31 Aug 2005 10:45:47 +0000
 Subject: [PATCH] urandom-xauth-changes-to-options.h
@@ -9,7 +9,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index ffaf062..2eb7de1 100644
+index 2a5ebc0..3047c09 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
 @@ -347,7 +347,7 @@ group1 in Dropbear server too */
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index bfb78b1ee1..d8208ce595 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From dce5d03ed4d28c6374e593b7ef2cc4688f795fbd Mon Sep 17 00:00:00 2001
+From bf84534c2f3038db61d8a1074de15047fd394067 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: [PATCH] Enable pam
@@ -15,7 +15,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 2eb7de1..be85bee 100644
+index 3047c09..db53262 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
 @@ -240,7 +240,7 @@ group1 in Dropbear server too */
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index 7509efb88c..90bac899f2 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 50d64008f722f0f9719fc6c1b44582316022b93e Mon Sep 17 00:00:00 2001
+From 78c42d05b0a162e1a35b8e3f90d9c0abeb577d50 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
@@ -16,7 +16,7 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/svr-authpam.c b/src/svr-authpam.c
-index ec14632..026102f 100644
+index 6bbf820..d8d383d 100644
 --- a/src/svr-authpam.c
 +++ b/src/svr-authpam.c
 @@ -224,7 +224,7 @@ void svr_auth_pam(int valid_user) {
diff --git a/meta/recipes-core/dropbear/dropbear_2026.92.bb b/meta/recipes-core/dropbear/dropbear_2026.94.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2026.92.bb
rename to meta/recipes-core/dropbear/dropbear_2026.94.bb
index 4d9a9e10eb..dd9863d96d 100644
--- a/meta/recipes-core/dropbear/dropbear_2026.92.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.94.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e"
+SRC_URI[sha256sum] = "e098034a843699200c8c977a991fff73159735bf795d5f72ef672c41a6b1ae81"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
-- 
2.47.1


--===============5743794361965049818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGSIZE changed from 1940104 to 1941320 (+0%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGV changed from 2026.92 [default] to 2026.94 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PV changed from "2026.92" to "2026.94"
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PKGV changed from 2026.92 [default] to 2026.94 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PV changed from "2026.92" to "2026.94"
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PKGV changed from 2026.92 [default] to 2026.94 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PV changed from "2026.92" to "2026.94"
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PKGV changed from 2026.92 [default] to 2026.94 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PV changed from "2026.92" to "2026.94"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 2007294 to 2009024 (+0%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: FILELIST: directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/mac/hmac -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/mac/hmac, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/mac/poly1305 -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/mac/poly1305, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/misc/crypt -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/misc/crypt, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/hashes/helper -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/hashes/helper, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/ciphers/aes -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/ciphers/aes, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/misc -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/misc, directory renamed /usr/src/debug/dropbear/2026.92/libtommath -> /usr/src/debug/dropbear/2026.94/lib
 tommath, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/math -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/math, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/pk/ecc -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/pk/ecc, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/modes/ctr -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/modes/ctr, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/headers -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/headers, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/hashes/sha2 -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/hashes/sha2, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/misc/base64 -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/misc/base64, directory renamed /usr/src/debug/dropbear/2026.92/libtomcrypt/src/stream/chacha -> /usr/src/debug/dropbear/2026.94/libtomcrypt/src/stream/chacha, removed "/usr/src/debug/dr
 opbear/2026.92/src/channel.h /usr/src/debug/dropbear/2026.92/src/sk-ed25519.c /usr/src/debug/dropbear/2026.92/src/keyimport.h /usr/src/debug/dropbear/2026.92/src/svr-authpubkeyoptions.c /usr/src/debug/dropbear/2026.92/src/gened25519.c /usr/src/debug/dropbear/2026.92/src/gened25519.h /usr/src/debug/dropbear/2026.92/src/keyimport.c /usr/src/debug/dropbear/2026.92/src/sk-ed25519.h /usr/src/debug/dropbear/2026.92/src/cli-auth.c /usr/src/debug/dropbear/2026.92/src/ed25519.c /usr/src/debug/dropbear/2026.92/src/svr-auth.c /usr/src/debug/dropbear/2026.92/src/ed25519.h /usr/src/debug/dropbear/2026.92/src/kex-pqhybrid.c /usr/src/debug/dropbear/2026.92/src/dropbearconvert.c /usr/src/debug/dropbear/2026.92/src/sk-ecdsa.c /usr/src/debug/dropbear/2026.92/src/signkey.c /usr/src/debug/dropbear/2026.92/src/curve25519.c /usr/src/debug/dropbear/2026.92/src/sntrup761.c /usr/src/debug/dropbear/2026.92/src/signkey.h /usr/src/debug/dropbear/2026.92/src/sk-ecdsa.h /usr/src/debug/dropbear/2026.92/src/sntrup
 761.h /usr/src/debug/dropbear/2026.92/src/common-chansession.c /usr/src/debug/dropbear/2026.92/src/curve25519.h /usr/src/debug/dropbear/2026.92/src/mlkem768.c /usr/src/debug/dropbear/2026.92/src/loginrec.c /usr/src/debug/dropbear/2026.92/src/mlkem768.h /usr/src/debug/dropbear/2026.92/src/loginrec.h /usr/src/debug/dropbear/2026.92/src/cli-agentfwd.c /usr/src/debug/dropbear/2026.92/src/svr-agentfwd.c /usr/src/debug/dropbear/2026.92/src/crypto_desc.c /usr/src/debug/dropbear/2026.92/src/forward.h /usr/src/debug/dropbear/2026.92/src/netio.c /usr/src/debug/dropbear/2026.92/src/netio.h /usr/src/debug/dropbear/2026.92/src/crypto_desc.h /usr/src/debug/dropbear/2026.92/src/cli-chansession.c /usr/src/debug/dropbear/2026.92/src/svr-chansession.c /usr/src/debug/dropbear/2026.92/src/chachapoly.c /usr/src/debug/dropbear/2026.92/src/chachapoly.h /usr/src/debug/dropbear/2026.92/src/signkey_ossh.c /usr/src/debug/dropbear/2026.92/src/common-algo.c /usr/src/debug/dropbear/2026.92/src/signkey_ossh.h /us
 r/src/debug/dropbear/2026.92/src/sntrup761_compat.h /usr/src/debug/dropbear/2026.92/src/common-channel.c /usr/src/debug/dropbear/2026.92/src/cli-session.c /usr/src/debug/dropbear/2026.92/src/buffer.c /usr/src/debug/dropbear/2026.92/src/svr-service.c /usr/src/debug/dropbear/2026.92/src/svr-session.c /usr/src/debug/dropbear/2026.92/src/chansession.h /usr/src/debug/dropbear/2026.92/src/buffer.h /usr/src/debug/dropbear/2026.92/src/dropbearkey.c /usr/src/debug/dropbear/2026.92/src/packet.h /usr/src/debug/dropbear/2026.92/src/atomicio.h /usr/src/debug/dropbear/2026.92/src/dbmalloc.h /usr/src/debug/dropbear/2026.92/src/kex-ecdh.c /usr/src/debug/dropbear/2026.92/src/packet.c /usr/src/debug/dropbear/2026.92/src/svr-x11fwd.c /usr/src/debug/dropbear/2026.92/src/dbmalloc.c /usr/src/debug/dropbear/2026.92/src/atomicio.c /usr/src/debug/dropbear/2026.92/src/kex-dh.c /usr/src/debug/dropbear/2026.92/src/cli-kex.c /usr/src/debug/dropbear/2026.92/src/svr-kex.c /usr/src/debug/dropbear/2026.92/src/cli-a
 uthinteract.c /usr/src/debug/dropbear/2026.92/src/cli-authpasswd.c /usr/src/debug/dropbear/2026.92/src/cli-runopts.c /usr/src/debug/dropbear/2026.92/src/svr-runopts.c /usr/src/debug/dropbear/2026.92/src/svr-authpam.c /usr/src/debug/dropbear/2026.92/src/listener.h /usr/src/debug/dropbear/2026.92/src/gensignkey.h /usr/src/debug/dropbear/2026.92/src/process-packet.c /usr/src/debug/dropbear/2026.92/src/gensignkey.c /usr/src/debug/dropbear/2026.92/src/listener.c /usr/src/debug/dropbear/2026.92/src/runopts.h /usr/src/debug/dropbear/2026.92/src/cli-tcpfwd.c /usr/src/debug/dropbear/2026.92/src/svr-tcpfwd.c /usr/src/debug/dropbear/2026.92/src/cli-main.c /usr/src/debug/dropbear/2026.92/src/svr-main.c /usr/src/debug/dropbear/2026.92/src/libcrux_mlkem768_sha3.h /usr/src/debug/dropbear/2026.92/src/dbhelpers.c /usr/src/debug/dropbear/2026.92/src/dbrandom.c /usr/src/debug/dropbear/2026.92/src/dbrandom.h /usr/src/debug/dropbear/2026.92/src/dbhelpers.h /usr/src/debug/dropbear/2026.92/src/ecdsa.c /us
 r/src/debug/dropbear/2026.92/src/termcodes.c /usr/src/debug/dropbear/2026.92/src/common-kex.c /usr/src/debug/dropbear/2026.92/src/termcodes.h /usr/src/debug/dropbear/2026.92/src/ecdsa.h /usr/src/debug/dropbear/2026.92/src/common-runopts.c /usr/src/debug/dropbear/2026.92/src/ecc.h /usr/src/debug/dropbear/2026.92/src/kex.h /usr/src/debug/dropbear/2026.92/src/dbutil.c /usr/src/debug/dropbear/2026.92/src/bignum.c /usr/src/debug/dropbear/2026.92/src/ecc.c /usr/src/debug/dropbear/2026.92/src/rsa.c /usr/src/debug/dropbear/2026.92/src/rsa.h /usr/src/debug/dropbear/2026.92/src/scp.c /usr/src/debug/dropbear/2026.92/src/bignum.h /usr/src/debug/dropbear/2026.92/src/dbutil.h /usr/src/debug/dropbear/2026.92/src/svr-streamfwd.c /usr/src/debug/dropbear/2026.92/src/cli-channel.c /usr/src/debug/dropbear/2026.92/src/progressmeter.c /usr/src/debug/dropbear/2026.92/src/dbmulti.c /usr/src/debug/dropbear/2026.92/src/ltc_prng.h /usr/src/debug/dropbear/2026.92/src/ltc_prng.c /usr/src/debug/dropbear/2026.92/
 src/progressmeter.h /usr/src/debug/dropbear/2026.92/src/scpmisc.h /usr/src/debug/dropbear/2026.92/src/circbuffer.c /usr/src/debug/dropbear/2026.92/src/scpmisc.c /usr/src/debug/dropbear/2026.92/src/circbuffer.h /usr/src/debug/dropbear/2026.92/src/queue.h /usr/src/debug/dropbear/2026.92/src/agentfwd.h /usr/src/debug/dropbear/2026.92/src/queue.c /usr/src/debug/dropbear/2026.92/src/auth.h /usr/src/debug/dropbear/2026.92/src/algo.h /usr/src/debug/dropbear/2026.92/src/list.h /usr/src/debug/dropbear/2026.92/src/tcp-accept.c /usr/src/debug/dropbear/2026.92/src/list.c /usr/src/debug/dropbear/2026.92/src/dh_groups.h /usr/src/debug/dropbear/2026.92/src/kex-x25519.c /usr/src/debug/dropbear/2026.92/src/svr-forward.c /usr/src/debug/dropbear/2026.92/src/dh_groups.c /usr/src/debug/dropbear/2026.92/src/common-session.c /usr/src/debug/dropbear/2026.92/src/cli-authpubkey.c /usr/src/debug/dropbear/2026.92/src/svr-authpubkey.c /usr/src/debug/dropbear/2026.92/src/x11fwd.h /usr/src/debug/dropbear/2026.92/
 src/genrsa.h /usr/src/debug/dropbear/2026.92/src/genrsa.c /usr/src/debug/dropbear/2026.92/src/sshpty.c /usr/src/debug/dropbear/2026.92/src/sshpty.h /usr/src/debug/dropbear/2026.92/src/service.h /usr/src/debug/dropbear/2026.92/src/session.h", added "/usr/src/debug/dropbear/2026.94/src/channel.h /usr/src/debug/dropbear/2026.94/src/sk-ed25519.c /usr/src/debug/dropbear/2026.94/src/keyimport.h /usr/src/debug/dropbear/2026.94/src/svr-authpubkeyoptions.c /usr/src/debug/dropbear/2026.94/src/gened25519.c /usr/src/debug/dropbear/2026.94/src/gened25519.h /usr/src/debug/dropbear/2026.94/src/keyimport.c /usr/src/debug/dropbear/2026.94/src/sk-ed25519.h /usr/src/debug/dropbear/2026.94/src/cli-auth.c /usr/src/debug/dropbear/2026.94/src/ed25519.c /usr/src/debug/dropbear/2026.94/src/svr-auth.c /usr/src/debug/dropbear/2026.94/src/ed25519.h /usr/src/debug/dropbear/2026.94/src/kex-pqhybrid.c /usr/src/debug/dropbear/2026.94/src/dropbearconvert.c /usr/src/debug/dropbear/2026.94/src/sk-ecdsa.c /usr/src/deb
 ug/dropbear/2026.94/src/signkey.c /usr/src/debug/dropbear/2026.94/src/curve25519.c /usr/src/debug/dropbear/2026.94/src/sntrup761.c /usr/src/debug/dropbear/2026.94/src/signkey.h /usr/src/debug/dropbear/2026.94/src/sk-ecdsa.h /usr/src/debug/dropbear/2026.94/src/sntrup761.h /usr/src/debug/dropbear/2026.94/src/common-chansession.c /usr/src/debug/dropbear/2026.94/src/curve25519.h /usr/src/debug/dropbear/2026.94/src/mlkem768.c /usr/src/debug/dropbear/2026.94/src/loginrec.c /usr/src/debug/dropbear/2026.94/src/mlkem768.h /usr/src/debug/dropbear/2026.94/src/loginrec.h /usr/src/debug/dropbear/2026.94/src/cli-agentfwd.c /usr/src/debug/dropbear/2026.94/src/svr-agentfwd.c /usr/src/debug/dropbear/2026.94/src/crypto_desc.c /usr/src/debug/dropbear/2026.94/src/dbctype.c /usr/src/debug/dropbear/2026.94/src/forward.h /usr/src/debug/dropbear/2026.94/src/netio.c /usr/src/debug/dropbear/2026.94/src/netio.h /usr/src/debug/dropbear/2026.94/src/crypto_desc.h /usr/src/debug/dropbear/2026.94/src/dbctype.h /us
 r/src/debug/dropbear/2026.94/src/cli-chansession.c /usr/src/debug/dropbear/2026.94/src/svr-chansession.c /usr/src/debug/dropbear/2026.94/src/chachapoly.c /usr/src/debug/dropbear/2026.94/src/chachapoly.h /usr/src/debug/dropbear/2026.94/src/signkey_ossh.c /usr/src/debug/dropbear/2026.94/src/common-algo.c /usr/src/debug/dropbear/2026.94/src/signkey_ossh.h /usr/src/debug/dropbear/2026.94/src/sntrup761_compat.h /usr/src/debug/dropbear/2026.94/src/common-channel.c /usr/src/debug/dropbear/2026.94/src/cli-session.c /usr/src/debug/dropbear/2026.94/src/buffer.c /usr/src/debug/dropbear/2026.94/src/svr-service.c /usr/src/debug/dropbear/2026.94/src/svr-session.c /usr/src/debug/dropbear/2026.94/src/chansession.h /usr/src/debug/dropbear/2026.94/src/buffer.h /usr/src/debug/dropbear/2026.94/src/dropbearkey.c /usr/src/debug/dropbear/2026.94/src/packet.h /usr/src/debug/dropbear/2026.94/src/atomicio.h /usr/src/debug/dropbear/2026.94/src/dbmalloc.h /usr/src/debug/dropbear/2026.94/src/kex-ecdh.c /usr/src
 /debug/dropbear/2026.94/src/packet.c /usr/src/debug/dropbear/2026.94/src/svr-x11fwd.c /usr/src/debug/dropbear/2026.94/src/dbmalloc.c /usr/src/debug/dropbear/2026.94/src/atomicio.c /usr/src/debug/dropbear/2026.94/src/kex-dh.c /usr/src/debug/dropbear/2026.94/src/cli-kex.c /usr/src/debug/dropbear/2026.94/src/svr-kex.c /usr/src/debug/dropbear/2026.94/src/cli-authinteract.c /usr/src/debug/dropbear/2026.94/src/cli-authpasswd.c /usr/src/debug/dropbear/2026.94/src/cli-runopts.c /usr/src/debug/dropbear/2026.94/src/svr-runopts.c /usr/src/debug/dropbear/2026.94/src/svr-authpam.c /usr/src/debug/dropbear/2026.94/src/listener.h /usr/src/debug/dropbear/2026.94/src/gensignkey.h /usr/src/debug/dropbear/2026.94/src/process-packet.c /usr/src/debug/dropbear/2026.94/src/gensignkey.c /usr/src/debug/dropbear/2026.94/src/listener.c /usr/src/debug/dropbear/2026.94/src/runopts.h /usr/src/debug/dropbear/2026.94/src/cli-tcpfwd.c /usr/src/debug/dropbear/2026.94/src/svr-tcpfwd.c /usr/src/debug/dropbear/2026.94/s
 rc/cli-main.c /usr/src/debug/dropbear/2026.94/src/svr-main.c /usr/src/debug/dropbear/2026.94/src/libcrux_mlkem768_sha3.h /usr/src/debug/dropbear/2026.94/src/dbhelpers.c /usr/src/debug/dropbear/2026.94/src/dbrandom.c /usr/src/debug/dropbear/2026.94/src/dbrandom.h /usr/src/debug/dropbear/2026.94/src/dbhelpers.h /usr/src/debug/dropbear/2026.94/src/ecdsa.c /usr/src/debug/dropbear/2026.94/src/termcodes.c /usr/src/debug/dropbear/2026.94/src/common-kex.c /usr/src/debug/dropbear/2026.94/src/termcodes.h /usr/src/debug/dropbear/2026.94/src/ecdsa.h /usr/src/debug/dropbear/2026.94/src/common-runopts.c /usr/src/debug/dropbear/2026.94/src/ecc.h /usr/src/debug/dropbear/2026.94/src/kex.h /usr/src/debug/dropbear/2026.94/src/dbutil.c /usr/src/debug/dropbear/2026.94/src/bignum.c /usr/src/debug/dropbear/2026.94/src/ecc.c /usr/src/debug/dropbear/2026.94/src/rsa.c /usr/src/debug/dropbear/2026.94/src/rsa.h /usr/src/debug/dropbear/2026.94/src/scp.c /usr/src/debug/dropbear/2026.94/src/bignum.h /usr/src/debu
 g/dropbear/2026.94/src/dbutil.h /usr/src/debug/dropbear/2026.94/src/svr-streamfwd.c /usr/src/debug/dropbear/2026.94/src/cli-channel.c /usr/src/debug/dropbear/2026.94/src/progressmeter.c /usr/src/debug/dropbear/2026.94/src/dbmulti.c /usr/src/debug/dropbear/2026.94/src/ltc_prng.h /usr/src/debug/dropbear/2026.94/src/ltc_prng.c /usr/src/debug/dropbear/2026.94/src/progressmeter.h /usr/src/debug/dropbear/2026.94/src/scpmisc.h /usr/src/debug/dropbear/2026.94/src/circbuffer.c /usr/src/debug/dropbear/2026.94/src/scpmisc.c /usr/src/debug/dropbear/2026.94/src/circbuffer.h /usr/src/debug/dropbear/2026.94/src/queue.h /usr/src/debug/dropbear/2026.94/src/agentfwd.h /usr/src/debug/dropbear/2026.94/src/queue.c /usr/src/debug/dropbear/2026.94/src/auth.h /usr/src/debug/dropbear/2026.94/src/algo.h /usr/src/debug/dropbear/2026.94/src/list.h /usr/src/debug/dropbear/2026.94/src/tcp-accept.c /usr/src/debug/dropbear/2026.94/src/list.c /usr/src/debug/dropbear/2026.94/src/dh_groups.h /usr/src/debug/dropbear/2
 026.94/src/kex-x25519.c /usr/src/debug/dropbear/2026.94/src/svr-forward.c /usr/src/debug/dropbear/2026.94/src/dh_groups.c /usr/src/debug/dropbear/2026.94/src/common-session.c /usr/src/debug/dropbear/2026.94/src/cli-authpubkey.c /usr/src/debug/dropbear/2026.94/src/svr-authpubkey.c /usr/src/debug/dropbear/2026.94/src/x11fwd.h /usr/src/debug/dropbear/2026.94/src/genrsa.h /usr/src/debug/dropbear/2026.94/src/genrsa.c /usr/src/debug/dropbear/2026.94/src/sshpty.c /usr/src/debug/dropbear/2026.94/src/sshpty.h /usr/src/debug/dropbear/2026.94/src/service.h /usr/src/debug/dropbear/2026.94/src/session.h"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGV changed from 2026.92 [default] to 2026.94 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PV changed from "2026.92" to "2026.94"
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2026.92 [default] to 2026.94 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PV changed from "2026.92" to "2026.94"
packages/x86-64-v3-poky-linux/dropbear/dropbear: PKGV changed from 2026.92 [default] to 2026.94 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear: PV changed from "2026.92" to "2026.94"
packages/x86-64-v3-poky-linux/dropbear: PKGV changed from 2026.92 [default] to 2026.94 [default]
packages/x86-64-v3-poky-linux/dropbear: PV changed from "2026.92" to "2026.94"
packages/x86-64-v3-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2026.92.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2026.94.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear"

--===============5743794361965049818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="dropbear-changelog.txt"

Changelog for dropbear: 2026.92 -> 2026.94
Source: CHANGES

2026.94 - 23 July 2026

- Fix scp build failure regression from 2026.93
  The new ascii_isdigit() etc wasn't linked.

- Print square brackets around ipv6 addresses with ports, eg
  [2a00:f10:400:2:1c00:bcff:fe00:1c6]:22
  Patch from Seo Suchan

- Support longer paths in scp.

- Avoid some build warnings, add increase github action coverage of
  config options.

2026.93 - 21 July 2026

Note >> for compatibility/configuration changes

- Security: Fix a use-after-free in X11 forwarding that could possibly lead
  to memory corruption. This is vulnerable to authenticated users if X11
  forwarding is enabled. By default X11 forwarding is not built.
  In 2026.89 the server is running as the authenticated user for X11
  forwarding, in earlier versions it runs as root.
  This removes X11 "single connection" which has probably never been used.
  Reported by @peter-pe
  https://github.com/mkj/dropbear/commit/882f83806d5e133037cd28e954a878984ef7b9c4

- >> "permitlisten" authorized_keys lines will now be ignored if
  the port is invalid (>65535). From Basavaraj S Maneppagol.

- >> In 2026.92, the configure option --enable-plugin-deprecated
  wasn't correctly renamed. This is now implemented.
  Patch from Alexander Dahl

- Two factor auth "-t" is no longer deprecated, it will be kept.
  The "DEPRECATED_TWO_FACTOR" option is ignored, and no longer required.

- Fix out of bounds read during utmp/wtmp log file handling, reported by
  Basavaraj S Maneppagol.

- More robust handling of ascii inputs for some platforms.
  From Basavaraj S Maneppagol

- Convert manpages to mdoc format, from shrub

  [Updated 16 July: This is no longer planned to be removed, future releases
  will ignore DEPRECATED_TWO_FACTOR and always enable it, like previously]

--===============5743794361965049818==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2026.92-2026.94.patch"

RnJvbSA2OGUyMjBlNWM5ZjhiYmQzODNlM2ZlNzU2N2EzNWUyYzAyYzUyOTIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjQgSnVsIDIwMjYgMDU6MTY6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cm9wYmVhcjogdXBncmFkZSAyMDI2LjkyIC0+IDIwMjYuOTQKClNvdXJjZTogQ0hBTkdFUwoKMjAy
Ni45NCAtIDIzIEp1bHkgMjAyNgoKLSBGaXggc2NwIGJ1aWxkIGZhaWx1cmUgcmVncmVzc2lvbiBm
cm9tIDIwMjYuOTMKICBUaGUgbmV3IGFzY2lpX2lzZGlnaXQoKSBldGMgd2Fzbid0IGxpbmtlZC4K
Ci0gUHJpbnQgc3F1YXJlIGJyYWNrZXRzIGFyb3VuZCBpcHY2IGFkZHJlc3NlcyB3aXRoIHBvcnRz
LCBlZwogIFsyYTAwOmYxMDo0MDA6MjoxYzAwOmJjZmY6ZmUwMDoxYzZdOjIyCiAgUGF0Y2ggZnJv
bSBTZW8gU3VjaGFuCgotIFN1cHBvcnQgbG9uZ2VyIHBhdGhzIGluIHNjcC4KCi0gQXZvaWQgc29t
ZSBidWlsZCB3YXJuaW5ncywgYWRkIGluY3JlYXNlIGdpdGh1YiBhY3Rpb24gY292ZXJhZ2Ugb2YK
ICBjb25maWcgb3B0aW9ucy4KCjIwMjYuOTMgLSAyMSBKdWx5IDIwMjYKCk5vdGUgPj4gZm9yIGNv
bXBhdGliaWxpdHkvY29uZmlndXJhdGlvbiBjaGFuZ2VzCgotIFNlY3VyaXR5OiBGaXggYSB1c2Ut
YWZ0ZXItZnJlZSBpbiBYMTEgZm9yd2FyZGluZyB0aGF0IGNvdWxkIHBvc3NpYmx5IGxlYWQKICB0
byBtZW1vcnkgY29ycnVwdGlvbi4gVGhpcyBpcyB2dWxuZXJhYmxlIHRvIGF1dGhlbnRpY2F0ZWQg
dXNlcnMgaWYgWDExCiAgZm9yd2FyZGluZyBpcyBlbmFibGVkLiBCeSBkZWZhdWx0IFgxMSBmb3J3
YXJkaW5nIGlzIG5vdCBidWlsdC4KICBJbiAyMDI2Ljg5IHRoZSBzZXJ2ZXIgaXMgcnVubmluZyBh
cyB0aGUgYXV0aGVudGljYXRlZCB1c2VyIGZvciBYMTEKICBmb3J3YXJkaW5nLCBpbiBlYXJsaWVy
IHZlcnNpb25zIGl0IHJ1bnMgYXMgcm9vdC4KICBUaGlzIHJlbW92ZXMgWDExICJzaW5nbGUgY29u
bmVjdGlvbiIgd2hpY2ggaGFzIHByb2JhYmx5IG5ldmVyIGJlZW4gdXNlZC4KICBSZXBvcnRlZCBi
eSBAcGV0ZXItcGUKICBodHRwczovL2dpdGh1Yi5jb20vbWtqL2Ryb3BiZWFyL2NvbW1pdC84ODJm
ODM4MDZkNWUxMzMwMzdjZDI4ZTk1NGE4Nzg5ODRlZjdiOWM0CgotID4+ICJwZXJtaXRsaXN0ZW4i
IGF1dGhvcml6ZWRfa2V5cyBsaW5lcyB3aWxsIG5vdyBiZSBpZ25vcmVkIGlmCiAgdGhlIHBvcnQg
aXMgaW52YWxpZCAoPjY1NTM1KS4gRnJvbSBCYXNhdmFyYWogUyBNYW5lcHBhZ29sLgoKLSA+PiBJ
biAyMDI2LjkyLCB0aGUgY29uZmlndXJlIG9wdGlvbiAtLWVuYWJsZS1wbHVnaW4tZGVwcmVjYXRl
ZAogIHdhc24ndCBjb3JyZWN0bHkgcmVuYW1lZC4gVGhpcyBpcyBub3cgaW1wbGVtZW50ZWQuCiAg
UGF0Y2ggZnJvbSBBbGV4YW5kZXIgRGFobAoKLSBUd28gZmFjdG9yIGF1dGggIi10IiBpcyBubyBs
b25nZXIgZGVwcmVjYXRlZCwgaXQgd2lsbCBiZSBrZXB0LgogIFRoZSAiREVQUkVDQVRFRF9UV09f
RkFDVE9SIiBvcHRpb24gaXMgaWdub3JlZCwgYW5kIG5vIGxvbmdlciByZXF1aXJlZC4KCi0gRml4
IG91dCBvZiBib3VuZHMgcmVhZCBkdXJpbmcgdXRtcC93dG1wIGxvZyBmaWxlIGhhbmRsaW5nLCBy
ZXBvcnRlZCBieQogIEJhc2F2YXJhaiBTIE1hbmVwcGFnb2wuCgotIE1vcmUgcm9idXN0IGhhbmRs
aW5nIG9mIGFzY2lpIGlucHV0cyBmb3Igc29tZSBwbGF0Zm9ybXMuCiAgRnJvbSBCYXNhdmFyYWog
UyBNYW5lcHBhZ29sCgotIENvbnZlcnQgbWFucGFnZXMgdG8gbWRvYyBmb3JtYXQsIGZyb20gc2hy
dWIKCiAgW1VwZGF0ZWQgMTYgSnVseTogVGhpcyBpcyBubyBsb25nZXIgcGxhbm5lZCB0byBiZSBy
ZW1vdmVkLCBmdXR1cmUgcmVsZWFzZXMKICB3aWxsIGlnbm9yZSBERVBSRUNBVEVEX1RXT19GQUNU
T1IgYW5kIGFsd2F5cyBlbmFibGUgaXQsIGxpa2UgcHJldmlvdXNseV0KLS0tCiAuLi4vZHJvcGJl
YXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoICAgIHwgNCAr
Ky0tCiAuLi4vZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBhdGNo
ICAgICAgICAgIHwgNCArKy0tCiAuLi4vZHJvcGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9wYmVhci1j
b25maWd1cmF0aW9uLWZpbGUucGF0Y2ggIHwgNCArKy0tCiAuLi4vZHJvcGJlYXIve2Ryb3BiZWFy
XzIwMjYuOTIuYmIgPT4gZHJvcGJlYXJfMjAyNi45NC5iYn0gICAgIHwgMiArLQogNCBmaWxlcyBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWNvcmUvZHJvcGJlYXIve2Ryb3BiZWFyXzIwMjYuOTIuYmIgPT4gZHJvcGJlYXJfMjAyNi45
NC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9w
YmVhci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdl
cy10by1vcHRpb25zLmgucGF0Y2gKaW5kZXggYjBmOGU2MTk5OC4uNDhlZDE1NzBjYyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhh
dXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ry
b3BiZWFyL2Ryb3BiZWFyLzAwMDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTVmNmM2ZThkMmI2MzE1ZTUwOWM2MTBlN2QxM2U3
ZGQyYjQ2NWE4NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjEzOTlmNTBkMjc5ZTI4
YWJjMDI4YWNlMDNmMzk3OGY2Nzk5YThjYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkQG9wZW5lZGhhbmQuY29tPgogRGF0ZTogV2VkLCAzMSBB
dWcgMjAwNSAxMDo0NTo0NyArMDAwMAogU3ViamVjdDogW1BBVENIXSB1cmFuZG9tLXhhdXRoLWNo
YW5nZXMtdG8tb3B0aW9ucy5oCkBAIC05LDcgKzksNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZGVmYXVsdF9vcHRpb25zLmggYi9z
cmMvZGVmYXVsdF9vcHRpb25zLmgKLWluZGV4IGZmYWYwNjIuLjJlYjdkZTEgMTAwNjQ0CitpbmRl
eCAyYTVlYmMwLi4zMDQ3YzA5IDEwMDY0NAogLS0tIGEvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCiAr
KysgYi9zcmMvZGVmYXVsdF9vcHRpb25zLmgKIEBAIC0zNDcsNyArMzQ3LDcgQEAgZ3JvdXAxIGlu
IERyb3BiZWFyIHNlcnZlciB0b28gKi8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ry
b3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRj
aAppbmRleCBiZmI3OGIxZWUxLi5kODIwOGNlNTk1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFi
bGUtcGFtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkY2U1ZDAzZWQ0ZDI4YzYzNzRlNTkz
YjdlZjJjYzQ2ODhmNzk1ZmJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZjg0NTM0
YzJmMzAzOGRiNjFkOGExMDc0ZGUxNTA0N2ZkMzk0MDY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIERhdGU6
IFdlZCwgMiBEZWMgMjAxNSAxMTozNjowMiArMDIwMAogU3ViamVjdDogW1BBVENIXSBFbmFibGUg
cGFtCkBAIC0xNSw3ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNz
aS5rdWtrb25lbkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9kZWZhdWx0X29wdGlvbnMuaCBiL3Ny
Yy9kZWZhdWx0X29wdGlvbnMuaAotaW5kZXggMmViN2RlMS4uYmU4NWJlZSAxMDA2NDQKK2luZGV4
IDMwNDdjMDkuLmRiNTMyNjIgMTAwNjQ0CiAtLS0gYS9zcmMvZGVmYXVsdF9vcHRpb25zLmgKICsr
KyBiL3NyYy9kZWZhdWx0X29wdGlvbnMuaAogQEAgLTI0MCw3ICsyNDAsNyBAQCBncm91cDEgaW4g
RHJvcGJlYXIgc2VydmVyIHRvbyAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJv
cGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3Vy
YXRpb24tZmlsZS5wYXRjaAppbmRleCA3NTA5ZWZiODhjLi45MGJhYzg5OWYyIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZp
Z3VyYXRpb24tZmlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9w
YmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNTBkNjQwMDhmNzIyZjBmOTcxOWZjNmMxYjQ0NTgyMzE2MDIyYjkzZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzhjNDJkMDViMGExNjJlMWEzNWI4ZTNmOTBkOWMwYWJl
YjU3N2Q1MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8TWluZ2xp
Lll1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDYgU2VwIDIwMTggMTU6NTQ6MDAgKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gZHJvcGJlYXIgY29uZmlndXJhdGlvbiBmaWxlCkBAIC0xNiw3ICsx
Niw3IEBAIFNpZ25lZC1vZmYtYnk6IE1pbmdsaSBZdSA8TWluZ2xpLll1QHdpbmRyaXZlci5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9zcmMvc3ZyLWF1dGhwYW0uYyBiL3NyYy9zdnItYXV0aHBhbS5jCi1pbmRleCBlYzE0
NjMyLi4wMjYxMDJmIDEwMDY0NAoraW5kZXggNmJiZjgyMC4uZDhkMzgzZCAxMDA2NDQKIC0tLSBh
L3NyYy9zdnItYXV0aHBhbS5jCiArKysgYi9zcmMvc3ZyLWF1dGhwYW0uYwogQEAgLTIyNCw3ICsy
MjQsNyBAQCB2b2lkIHN2cl9hdXRoX3BhbShpbnQgdmFsaWRfdXNlcikgewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNi45Mi5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjYuOTQuYmIKc2ltaWxhcml0eSBpbmRleCA5
OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNi45
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNi45
NC5iYgppbmRleCA0ZDlhOWUxMGViLi5kZDk4NjNkOTZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI2LjkyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjYuOTQuYmIKQEAgLTI3LDcgKzI3LDcgQEAgU1JDX1VS
SSA9ICJodHRwOi8vbWF0dC51Y2MuYXNuLmF1L2Ryb3BiZWFyL3JlbGVhc2VzL2Ryb3BiZWFyLSR7
UFZ9LnRhci5iejIgXAogICAgICAgICAgICAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZF
QVRVUkVTJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXAogICAgICAgICAgICAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MWRjYjUyMzRkZThkZWE2OGRkODJjNTU0MTFjOWZj
OTg2YjQ1N2FiNTgzNzJhNzgwZWU4YTg3MDQxOWMyZjdlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImUwOTgwMzRhODQzNjk5MjAwYzhjOTc3YTk5MWZmZjczMTU5NzM1YmY3OTVkNWY3MmVmNjcyYzQx
YTZiMWFlODEiCiBNSVJST1JTICs9ICJodHRwOi8vbWF0dC51Y2MuYXNuLmF1L2Ryb3BiZWFyL3Jl
bGVhc2VzLyBodHRwczovL2Ryb3BiZWFyLm5sL21pcnJvci9yZWxlYXNlcy8iCiAKIFBBTV9TUkNf
VVJJID0gImZpbGU6Ly8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2ggXAotLSAKMi40Ny4x
Cgo=

--===============5743794361965049818==--

