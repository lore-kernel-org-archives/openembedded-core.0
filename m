Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41716.1795613241642793140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 05:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yNDdltV8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4E61AC69149
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D9EB60480;
	Wed, 25 Nov 2026 13:27:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1AEE11E6963E;
	Wed, 25 Nov 2026 14:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795613239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kKggwv7j79Wx9jcIe9GQ6PPIOXzYO5Vc0Nh8W1EFcPg=;
	b=yNDdltV8rxThCw7UcGGS884aoc6iR/27dKeY5Q1QYpPB2Vr7p7a2ukO9zOIPoSyU+mFGnV
	8r8Gw6MwOj8h+3a5M7/JcZBGq/5JII83zKk5T5VtTDcGH9ZhXZXbRCI5bOapFx80Te5+mU
	qYRBk6VOjyoDkMSMdgyyoXL4jA4XQFIXuffmAMKHZISVgKAfNiAacg8jnBpMkR2aK9paq6
	R1/knpzhMb/tSlN3bCAqR6+elfn+kCmr9BgOGKyqpiRtWOpxLu8KOk9lrvcgL9nvUXw2ON
	Xcco/9BZGwVq3z7IwqcyoiGuZo2BRTD2z3BUAn615TbKC8t1hY2RScYujLYAtg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH v2 1/4] curl: fix CVE-2026-87865
Date: Wed, 25 Nov 2026 14:26:16 +0100
Message-ID: <20261125132619.3518022-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
References: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251184

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.22.0.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-87865
[2] https://curl.se/docs/CVE-2026-87865.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-87865.patch            | 216 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-87865.patch
new file mode 100644
index 0000000000..32a7441c95
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87865.patch
@@ -0,0 +1,216 @@
+From a7622dc02ccc01f7438227f1920db08268a6ccb0 Mon Sep 17 00:00:00 2001
+From: Bobbeh Rhino <bobbeh@rhino.Rhino>
+Date: Tue, 8 Sep 2026 06:33:27 -0400
+Subject: [PATCH] libssh2: match hashed known_hosts entries by host
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+libssh2 does not expose the plaintext name for hashed entries. Check
+each entry key against the requested hostname before using its key type.
+Otherwise an unrelated hashed entry can select the wrong algorithm.
+
+Add an SFTP regression test 3500 with an unrelated hashed entry before
+the requested host.
+
+Closes #22874
+
+CVE: CVE-2026-87865
+Upstream-Status: Backport [https://github.com/curl/curl/commit/323c184b6=
bdf5b1988a10c0a61560]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/vssh/libssh2.c        | 16 +++++++--
+ tests/data/Makefile.am    |  2 ++
+ tests/data/test3500       | 47 +++++++++++++++++++++++++
+ tests/libtest/Makefile.am |  3 +-
+ tests/libtest/test3500.pl | 72 +++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 136 insertions(+), 4 deletions(-)
+ create mode 100644 tests/data/test3500
+ create mode 100755 tests/libtest/test3500.pl
+
+diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
+index 24a651d30e..cd28cde76f 100644
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -685,9 +685,19 @@ static CURLcode ssh_force_knownhost_key_type(struct=
 Curl_easy *data,
+             break;
+           }
+         }
+-        else {
+-          found =3D TRUE;
+-          break;
++        else if(store->key) {
++          int keycheck =3D libssh2_knownhost_checkp(
++            sshc->kh, conn->origin->hostname,
++            (conn->origin->port !=3D PORT_SSH) ? conn->origin->port : -=
1,
++            store->key, strlen(store->key),
++            LIBSSH2_KNOWNHOST_TYPE_PLAIN |
++              LIBSSH2_KNOWNHOST_KEYENC_BASE64 |
++              (store->typemask & LIBSSH2_KNOWNHOST_KEY_MASK),
++            NULL);
++          if(keycheck =3D=3D LIBSSH2_KNOWNHOST_CHECK_MATCH) {
++            found =3D TRUE;
++            break;
++          }
+         }
+       }
+     }
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 3b32fce7bb..4a27927b1c 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -2090,6 +2090,8 @@ TESTCASES =3D \
+   test3400 \
+   test3401 \
+   \
++  test3500 \
++  \
+   test4000 \
+   test4001 \
+   \
+diff --git a/tests/data/test3500 b/tests/data/test3500
+new file mode 100644
+index 0000000000..1bcf3bc17d
+--- /dev/null
++++ b/tests/data/test3500
+@@ -0,0 +1,47 @@
++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++SFTP
++known_hosts
++libssh2
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data>
++Test data
++for hashed known hosts
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++sftp
++</server>
++<features>
++sftp
++libssh2
++!badlibssh
++</features>
++<precheck>
++%PERL %SRCDIR/libtest/test3500.pl %LOGDIR/server/curl_host_key.pub %LOG=
DIR/known%TESTNUMBER "[%HOSTIP]:%SSHPORT"
++</precheck>
++<name>
++SFTP matches requested hashed known_hosts entry
++</name>
++<command>
++--knownhosts %LOGDIR/known%TESTNUMBER --key %LOGDIR/server/curl_client_=
key --pubkey %LOGDIR/server/curl_client_key.pub -u %USER: sftp://%HOSTIP:=
%SSHPORT%SFTP_PWD/%LOGDIR/file%TESTNUMBER.txt
++</command>
++<file name=3D"%LOGDIR/file%TESTNUMBER.txt">
++Test data
++for hashed known hosts
++</file>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.am b/tests/libtest/Makefile.am
+index 74eb150742..8fdf484b55 100644
+--- a/tests/libtest/Makefile.am
++++ b/tests/libtest/Makefile.am
+@@ -49,7 +49,8 @@ EXTRA_DIST =3D CMakeLists.txt $(FIRST_C) $(FIRST_H) $(=
UTILS_C) $(UTILS_H) $(TESTS_
+   test1022.pl \
+   test307.pl \
+   test610.pl \
+-  test613.pl
++  test613.pl \
++  test3500.pl
+=20
+ CFLAGS +=3D @CURL_CFLAG_EXTRAS@
+=20
+diff --git a/tests/libtest/test3500.pl b/tests/libtest/test3500.pl
+new file mode 100755
+index 0000000000..d95f54cecf
+--- /dev/null
++++ b/tests/libtest/test3500.pl
+@@ -0,0 +1,72 @@
++#!/usr/bin/env perl
++#**********************************************************************=
*****
++#                                  _   _ ____  _
++#  Project                     ___| | | |  _ \| |
++#                             / __| | | | |_) | |
++#                            | (__| |_| |  _ <| |___
++#                             \___|\___/|_| \_\_____|
++#
++# Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
++#
++# This software is licensed as described in the file COPYING, which
++# you should have received as part of this distribution. The terms
++# are also available at https://curl.se/docs/copyright.html.
++#
++# You may opt to use, copy, modify, merge, publish, distribute and/or s=
ell
++# copies of the Software, and permit persons to whom the Software is
++# furnished to do so, under the terms of the COPYING file.
++#
++# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF=
 ANY
++# KIND, either express or implied.
++#
++# SPDX-License-Identifier: curl
++#
++#######################################################################=
####
++use strict;
++use warnings;
++
++use Digest::SHA qw(hmac_sha1);
++use MIME::Base64 qw(encode_base64);
++
++sub errout {
++    print $_[0] . "\n";
++    exit 1;
++}
++
++if(@ARGV !=3D 3) {
++    errout "Usage: $0 host-public-key known-hosts-file target";
++}
++
++my ($hostkey_file, $knownhosts_file, $target) =3D @ARGV;
++open(my $hostkey, "<", $hostkey_file) or errout "$!";
++my $hostkey_line =3D <$hostkey>;
++close($hostkey) or errout "$!";
++
++my ($hostkey_algo, $hostkey_data) =3D split(/\s+/, $hostkey_line);
++if(!$hostkey_algo || !$hostkey_data) {
++    errout "Failed parsing SSH host public key";
++}
++
++my $rsa_key =3D
++    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgSyqrUP2xhqLqkyopVapoKeucYI=
p" .
++    "ZXeUqj+Q9WLWyXka5re62Y3R/lxZUXtkJjlpdD2LNMFenNlDQvPaXH5Utllt+c3z" =
.
++    "wOkOLy7RXX5S37SfQFm/0fPkZqoZfMDB6XDcwA4cakjCRn4oZyKs8dWAxoNaTtYc" =
.
++    "nKKMJ6rmc8PttykJw9fwiKAjPyYf21/BMvWIzu9req+TrDA/Jcd2UAug94CikJIX" =
.
++    "uwKmSYleAOo4eJWx8GyujgEgZn05eq+K1LSg9RqRVIxOdqjoE5K3abBfs0rmUuLd" =
.
++    "MFh7nHseTFXYbKzpz46V7iZMfFuoyURrzVsqGUm+/m7dxBM98In12kOm3";
++my $ed25519_key =3D
++    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqmXRY8k+W9GtpWxYru6ELAXYHdXq=
" .
++    "jf33ziITGTiJUN";
++my $other_key =3D $hostkey_algo eq "ssh-ed25519" ? $rsa_key : $ed25519_=
key;
++
++my $salt =3D "curl-knownhosts-test";
++my $salt64 =3D encode_base64($salt, "");
++my $hash64 =3D encode_base64(hmac_sha1("unrelated.invalid", $salt), "")=
;
++my $target_hash64 =3D encode_base64(hmac_sha1($target, $salt), "");
++
++open(my $knownhosts, ">", $knownhosts_file) or errout "$!";
++print $knownhosts "|1|$salt64|$hash64 $other_key\n";
++print $knownhosts "|1|$salt64|$target_hash64 $hostkey_algo $hostkey_dat=
a\n";
++close($knownhosts) or errout "$!";
++
++exit 0;
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-supp=
ort/curl/curl_8.22.0.bb
index 95d5801ad5..979e416249 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D " \
     file://CVE-2026-92388-1.patch \
     file://CVE-2026-92388-2.patch \
     file://CVE-2026-92389.patch \
+    file://CVE-2026-87865.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0

