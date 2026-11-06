Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7295.1793976111115014209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=c0CAUXBM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F93B1A14E1
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:41:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B22B5FFBC;
	Fri,  6 Nov 2026 14:41:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9444103293BA;
	Fri,  6 Nov 2026 15:41:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793976108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x8UoHukdQHxe1BPuYJ11wdpyExz7uLphMxvEyLZAiUc=;
	b=c0CAUXBM6ZgK7Te0Ue1+1k/FVtQIGKGaANs1XSwb9N7GkKHujW/uf9o09rvhvqUXPgIqm4
	awNyTLCAMIY2YtKrZ1QJrY6Krjt1TZZdbX3+H26+VlZ76+0CY/WI2Li2TcP3Tpl5sUh67E
	4HiUCZq259I1HUhntEU8y6F2mRTEbo10WHaAw1DNMzd9iigZscOh7Xq1kQC8ONBmGTkfKv
	yf4D+ih2IPLbWSiRo58rPEqSLXTd84eBUhrNYOSEAcFWbU//vjaim0wpn+HgHfVRQI5LTM
	XsCSQEqqN81Psk36X3kWYECcROyXCOdc1Rg4PLX8wT0OnziW9nzVVU8HHTAVvg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 3/7] curl: fix CVE-2026-87865
Date: Fri,  6 Nov 2026 15:41:30 +0100
Message-ID: <20261106144134.1370928-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249658

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.7.1.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-87865
[2] https://curl.se/docs/CVE-2026-87865.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-87865.patch            | 212 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 213 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-87865.patch
new file mode 100644
index 0000000000..9abc7bb427
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87865.patch
@@ -0,0 +1,212 @@
+From e86ba6bcce298c3fe5d9f4a5848311cb458dfbc0 Mon Sep 17 00:00:00 2001
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
bdf5b1988a10c0a61560666e1588149]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/vssh/libssh2.c        | 16 +++++++--
+ tests/data/Makefile.inc   |  2 +-
+ tests/data/test3500       | 47 +++++++++++++++++++++++++
+ tests/libtest/Makefile.am |  2 +-
+ tests/libtest/test3500.pl | 72 +++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 134 insertions(+), 5 deletions(-)
+ create mode 100644 tests/data/test3500
+ create mode 100755 tests/libtest/test3500.pl
+
+diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
+index 3cfbe126c6..28946cf598 100644
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -876,9 +876,19 @@ static CURLcode ssh_force_knownhost_key_type(struct=
 Curl_easy *data)
+             break;
+           }
+         }
+-        else {
+-          found =3D true;
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
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index aafd309a9d..614b6baf4b 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -262,4 +262,4 @@ test3024 test3025 test3026 test3027 test3028 test302=
9 test3030 \
+ \
+ test3100 test3101 test3102 test3103 \
+ test3200 \
+-test3201 test3202
++test3201 test3202 test3500
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
+index 8ae972a248..bb44e1745f 100644
+--- a/tests/libtest/Makefile.am
++++ b/tests/libtest/Makefile.am
+@@ -36,7 +36,7 @@ AM_CPPFLAGS =3D -I$(top_srcdir)/include        \
+               -I$(top_builddir)/lib          \
+               -I$(top_srcdir)/lib
+=20
+-EXTRA_DIST =3D test307.pl test610.pl test613.pl test1013.pl test1022.pl=
   \
++EXTRA_DIST =3D test307.pl test610.pl test613.pl test1013.pl test1022.pl=
 test3500.pl \
+   Makefile.inc notexists.pl CMakeLists.txt mk-lib1521.pl .checksrc
+=20
+ CFLAG_CURL_SYMBOL_HIDING =3D @CFLAG_CURL_SYMBOL_HIDING@
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
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index 9ca79a14fc..40de36e151 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -45,6 +45,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80230.patch \
            file://CVE-2026-86409.patch \
            file://CVE-2026-87864.patch \
+           file://CVE-2026-87865.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0

