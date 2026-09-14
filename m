Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FDBC88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:08:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18492.1789387695044150545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ksFYMFZm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF3321576
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:08:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39DA83F86F
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789387694; bh=MgjXOlIuqwvKD4X7/SSXSGVf37KgW7PTW8e432vB9To=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ksFYMFZmEcZuWqHWdv5hvZeI8iIiqOy5IGe9Lz5zLDNhv+EWZDD2Yc39gybf1oFWG
	 JM5g5eQP1W5+iD6QdDKtrh1Dpl6Hm7ksA4xZPk4V5FnisDshrp2uuYNQFbH1cQzBiE
	 UEqIzrsgOLEDTUkPkZrlNvj0jSU3xJq3q/cJN978=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] xdg-utils: upgrade 1.1.3 -> 1.2.1
Date: Mon, 14 Sep 2026 13:08:06 +0100
Message-ID: <20260914120807.2162673-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914120807.2162673-1-ross.burton@arm.com>
References: <20260914120807.2162673-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245769

Upstream release notes:
* xdg-icon-resource: Fix for incorrect syntax
* better support for Plasma6, Deepin, LXQt
* partial support for WSL / flatpak's
* Numerous other fixes and improvements

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xdg-utils/xdg-utils/CVE-2022-4055.patch   | 76 ++++++++++---------
 ...{xdg-utils_1.1.3.bb =3D> xdg-utils_1.2.1.bb} |  4 +-
 2 files changed, 41 insertions(+), 39 deletions(-)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.1.3.bb =3D> xdg-util=
s_1.2.1.bb} (90%)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patc=
h b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
index 85f32035fcd..6adce1fa40b 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
@@ -15,12 +15,14 @@ Upstream-Status: Submitted [https://gitlab.freedeskto=
p.org/xdg/xdg-utils/-/issue
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
 CVE: CVE-2022-4055
+---
+ scripts/xdg-email.in | 89 --------------------------------------------
+ 1 file changed, 89 deletions(-)
=20
-
-diff --git c/scripts/xdg-email.in w/scripts/xdg-email.in
-index 3614776..8bdb5a9 100644
---- c/scripts/xdg-email.in
-+++ w/scripts/xdg-email.in
+diff --git a/scripts/xdg-email.in b/scripts/xdg-email.in
+index 73898a4..4fe901e 100644
+--- a/scripts/xdg-email.in
++++ b/scripts/xdg-email.in
 @@ -30,58 +30,6 @@ _USAGE
 =20
  #@xdg-utils-common@
@@ -29,21 +31,21 @@ index 3614776..8bdb5a9 100644
 -{
 -    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY ATTACH
 -    THUNDERBIRD=3D"$1"
--    MAILTO=3D$(echo "$2" | sed 's/^mailto://')
+-    MAILTO=3D"$(echo "$2" | sed 's/^mailto://')"
 -    echo "$MAILTO" | grep -qs "^?"
 -    if [ "$?" =3D "0" ] ; then
--        MAILTO=3D$(echo "$MAILTO" | sed 's/^?//')
+-        MAILTO=3D"$(echo "$MAILTO" | sed 's/^?//')"
 -    else
--        MAILTO=3D$(echo "$MAILTO" | sed 's/^/to=3D/' | sed 's/?/\&/')
+-        MAILTO=3D"$(echo "$MAILTO" | sed 's/^/to=3D/' | sed 's/?/\&/')"
 -    fi
 -
--    MAILTO=3D$(echo "$MAILTO" | sed 's/&/\n/g')
--    TO=3D$(/bin/echo -e $(echo "$MAILTO" | grep '^to=3D' | sed 's/^to=3D=
//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
--    CC=3D$(/bin/echo -e $(echo "$MAILTO" | grep '^cc=3D' | sed 's/^cc=3D=
//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
--    BCC=3D$(/bin/echo -e $(echo "$MAILTO" | grep '^bcc=3D' | sed 's/^bc=
c=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
--    SUBJECT=3D$(echo "$MAILTO" | grep '^subject=3D' | tail -n 1)
--    BODY=3D$(echo "$MAILTO" | grep '^body=3D' | tail -n 1)
--    ATTACH=3D$(/bin/echo -e $(echo "$MAILTO" | grep '^attach=3D' | sed =
's/^attach=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }' | sed 's/,=
$//'))
+-    MAILTO=3D"$(echo "$MAILTO" | sed 's/&/\n/g')"
+-    TO=3D"$(/bin/echo -e "$(echo "$MAILTO" | grep '^to=3D' | sed 's/^to=
=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }')")"
+-    CC=3D"$(/bin/echo -e "$(echo "$MAILTO" | grep '^cc=3D' | sed 's/^cc=
=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }')")"
+-    BCC=3D"$(/bin/echo -e "$(echo "$MAILTO" | grep '^bcc=3D' | sed 's/^=
bcc=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }')")"
+-    SUBJECT=3D"$(echo "$MAILTO" | grep '^subject=3D' | tail -n 1)"
+-    BODY=3D"$(echo "$MAILTO" | grep '^body=3D' | tail -n 1)"
+-    ATTACH=3D"$(/bin/echo -e "$(echo "$MAILTO" | grep '^attach=3D' | se=
d 's/^attach=3D//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }' | sed 's=
/,$//')")"
 -
 -    if [ -z "$TO" ] ; then
 -        NEWMAILTO=3D
@@ -79,54 +81,51 @@ index 3614776..8bdb5a9 100644
 -
  open_kde()
  {
-     if [ -n "$KDE_SESSION_VERSION" ] && [ "$KDE_SESSION_VERSION" -ge 5 =
]; then
-@@ -135,15 +83,6 @@ open_kde()
+     local kreadconfig profile client
+@@ -139,14 +87,6 @@ open_kde()
 =20
  open_gnome3()
  {
 -    local client
 -    local desktop
--    desktop=3D`xdg-mime query default "x-scheme-handler/mailto"`
--    client=3D`desktop_file_to_binary "$desktop"`
--    echo $client | grep -E 'thunderbird|icedove' > /dev/null 2>&1
--    if [ $? -eq 0 ] ; then
+-    desktop=3D"$(xdg-mime query default "x-scheme-handler/mailto")"
+-    client=3D"$(desktop_file_to_binary "$desktop")"
+-    case "$client" in *thunderbird*|*icedove*)
 -        run_thunderbird "$client" "$1"
--    fi
+-    esac
 -
      if gio help open 2>/dev/null 1>&2; then
          DEBUG 1 "Running gio open \"$1\""
          gio open "$1"
-@@ -164,13 +103,6 @@ open_gnome3()
+@@ -167,12 +107,6 @@ open_gnome3()
 =20
  open_gnome()
  {
 -    local client
--    client=3D`gconftool-2 --get /desktop/gnome/url-handlers/mailto/comm=
and | cut -d ' ' -f 1` || ""
--    echo $client | grep -E 'thunderbird|icedove' > /dev/null 2>&1
--    if [ $? -eq 0 ] ; then
+-    client=3D"$(gconftool-2 --get /desktop/gnome/url-handlers/mailto/co=
mmand | cut -d ' ' -f 1)"
+-    case "$client" in *thunderbird*|*icedove*)
 -        run_thunderbird "$client" "$1"
--    fi
+-    esac
 -
      if gio help open 2>/dev/null 1>&2; then
          DEBUG 1 "Running gio open \"$1\""
          gio open "$1"
-@@ -236,15 +168,6 @@ open_flatpak()
+@@ -263,14 +197,6 @@ open_flatpak()
 =20
  open_generic()
  {
 -    local client
 -    local desktop
--    desktop=3D`xdg-mime query default "x-scheme-handler/mailto"`
--    client=3D`desktop_file_to_binary "$desktop"`
--    echo $client | grep -E 'thunderbird|icedove' > /dev/null 2>&1
--    if [ $? -eq 0 ] ; then
+-    desktop=3D"$(xdg-mime query default "x-scheme-handler/mailto")"
+-    client=3D"$(desktop_file_to_binary "$desktop")"
+-    case "$client" in *thunderbird*|*icedove*)
 -        run_thunderbird "$client" "$1"
--    fi
+-    esac
 -
      xdg-open "$1"
-     local ret=3D$?
-=20
-@@ -369,21 +292,6 @@ while [ $# -gt 0 ] ; do
+     exit $?
+ }
+@@ -372,21 +298,6 @@ while [ $# -gt 0 ] ; do
          shift
          ;;
 =20
@@ -135,7 +134,7 @@ index 3614776..8bdb5a9 100644
 -            exit_failure_syntax "file argument missing for --attach opt=
ion"
 -        fi
 -        check_input_file "$1"
--        file=3D`readlink -f "$1"` # Normalize path
+-        file=3D"$(xdg_realpath "$1")" # Normalize path
 -        if [ -z "$file" ] || [ ! -f "$file" ] ; then
 -            exit_failure_file_missing "file '$1' does not exist"
 -        fi
@@ -148,3 +147,6 @@ index 3614776..8bdb5a9 100644
        -*)
          exit_failure_syntax "unexpected option '$parm'"
          ;;
+--=20
+2.43.0
+
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/re=
cipes-extended/xdg-utils/xdg-utils_1.2.1.bb
similarity index 90%
rename from meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
rename to meta/recipes-extended/xdg-utils/xdg-utils_1.2.1.bb
index 7141a72dd53..f76735a91ba 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.2.1.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da5367a909340=
98d6b05af3b746405014"
=20
 DEPENDS =3D "xmlto-native libxslt-native"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/xdg/xdg-utils.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3Dv${PV} \
+SRC_URI =3D "git://gitlab.freedesktop.org/xdg/xdg-utils.git;protocol=3Dh=
ttps;branch=3Dv1.2.X;tag=3Dv${PV} \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
            file://CVE-2022-4055.patch \
           "
=20
-SRCREV =3D "159fc37075db2decf446f453fe1a796da6921aad"
+SRCREV =3D "356c380ad6fecc9ce6bea1f6a77986ba67402c80"
=20
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep
--=20
2.43.0


