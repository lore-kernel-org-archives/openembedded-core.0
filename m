Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D79CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.75710.1697319920134258197
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xPLSetEC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c9daca2b85so23829205ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319919; x=1697924719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STYOkRXdj1mYqzNXue0bPBDo2VqOqEjVj9H8q8ChGTo=;
        b=xPLSetECbHxiBEZdQF5uLXnwO0fUC0JYCE/nTnSiCQN5pxOWSMf0oevIuEy/SjGURJ
         1guM3zesVghL6lkWle92tvdelvix++jiPxEE+RmEpdJ0S6er2IdUit2OY459u51OZ+dL
         Cc/KeGwe6XNG7RN3K9zDR3ejK5eZbz2BMP6K4czMuyrX5WqhSt3epkoM4kBW3bMUuPX5
         01mjYQzvst8RTeSFKEi5Guk2D1ervVbbnYaMFd4kVmsDSZ4QirYbh+t0p+pduzjqgvjn
         Ej7LZcdxYBxsoxdZsd2ZVPlnTczGmPNXltBvWZ9mXO5eh/sIMLmiGYxMgxOoLaucy5HT
         VN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319919; x=1697924719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STYOkRXdj1mYqzNXue0bPBDo2VqOqEjVj9H8q8ChGTo=;
        b=OeHOMZCrLx6YgmH7hLnkQYAGxLAOmNDMYYk2+XrpBDzmlY0yep9qv78RlTS3R0Ozr2
         49aljhkjcZU4oPejVm27Mhyf4Nt8DfS5VEh9f690ipOvqq8J4pU8moemaSKyQ8WtfXWT
         Bsn6N/UAllXzrpLL8W93f3xXloehueTvHQNZmKeTUrn9ck2tIRKJaHvi8RmMk64qZJVK
         SOskkNIAg1Yoe704XWbJdTm7IDdgkFz9mUZGqSzEmNolfUCZqx0MuWE7CZZ603Lz7aMW
         rzCWzdUlqktSfDSTXiYBN36Io2qYiavIUqQxelHrXtCeM/oqrBTNHpo1kuOGjoEk8Tex
         As1w==
X-Gm-Message-State: AOJu0YxBBtW/SVgyliPXW+bDKvdrMD4ZMOx2LLeqidRKLZqx+gTCpHHX
	yk6G3SLRQ56+G8/HmnzXehqQUhcYNYEIQBCHBGA=
X-Google-Smtp-Source: AGHT+IFxyYXMC7Pcr4KOuCjaLfmec+lL6l4zdS/ANjH6g8tj7jDxazlovQ/UIr/KOLi5hPRJfOY4Yg==
X-Received: by 2002:a17:903:605:b0:1c9:dba6:417a with SMTP id kg5-20020a170903060500b001c9dba6417amr4453026plb.9.1697319919217;
        Sat, 14 Oct 2023 14:45:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/13] xdg-utils: Fix CVE-2022-4055
Date: Sat, 14 Oct 2023 11:44:47 -1000
Message-Id: <fc4eecb6143b2b32a374388248b41c1d95b33968.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189126

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xdg/xdg-utils/-/commit/f67c4d1f8bd2e3cbcb9eb49f5e897075e7426780

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xdg-utils/xdg-utils/CVE-2022-4055.patch   | 165 ++++++++++++++++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
new file mode 100644
index 0000000000..383634ad53
--- /dev/null
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
@@ -0,0 +1,165 @@
+From f67c4d1f8bd2e3cbcb9eb49f5e897075e7426780 Mon Sep 17 00:00:00 2001
+From: Gabriel Corona <gabriel.corona@enst-bretagne.fr>
+Date: Thu, 25 Aug 2022 23:51:45 +0200
+Subject: [PATCH] Disable special support for Thunderbird in xdg-email (fixes
+ CVE-2020-27748, CVE-2022-4055)
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/xdg-utils/-/commit/f67c4d1f8bd2e3cbcb9eb49f5e897075e7426780]
+CVE: CVE-2022-4055
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ scripts/xdg-email.in | 108 -------------------------------------------
+ 1 file changed, 108 deletions(-)
+
+diff --git a/scripts/xdg-email.in b/scripts/xdg-email.in
+index 13ba2d5..b700679 100644
+--- a/scripts/xdg-email.in
++++ b/scripts/xdg-email.in
+@@ -30,76 +30,8 @@ _USAGE
+ 
+ #@xdg-utils-common@
+ 
+-run_thunderbird()
+-{
+-    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY
+-    THUNDERBIRD="$1"
+-    MAILTO=$(echo "$2" | sed 's/^mailto://')
+-    echo "$MAILTO" | grep -qs "^?"
+-    if [ "$?" = "0" ] ; then
+-        MAILTO=$(echo "$MAILTO" | sed 's/^?//')
+-    else
+-        MAILTO=$(echo "$MAILTO" | sed 's/^/to=/' | sed 's/?/\&/')
+-    fi
+-
+-    MAILTO=$(echo "$MAILTO" | sed 's/&/\n/g')
+-    TO=$(/bin/echo -e $(echo "$MAILTO" | grep '^to=' | sed 's/^to=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
+-    CC=$(/bin/echo -e $(echo "$MAILTO" | grep '^cc=' | sed 's/^cc=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
+-    BCC=$(/bin/echo -e $(echo "$MAILTO" | grep '^bcc=' | sed 's/^bcc=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
+-    SUBJECT=$(echo "$MAILTO" | grep '^subject=' | tail -n 1)
+-    BODY=$(echo "$MAILTO" | grep '^body=' | tail -n 1)
+-
+-    if [ -z "$TO" ] ; then
+-        NEWMAILTO=
+-    else
+-        NEWMAILTO="to='$TO'"
+-    fi
+-    if [ -n "$CC" ] ; then
+-        NEWMAILTO="${NEWMAILTO},cc='$CC'"
+-    fi
+-    if [ -n "$BCC" ] ; then
+-        NEWMAILTO="${NEWMAILTO},bcc='$BCC'"
+-    fi
+-    if [ -n "$SUBJECT" ] ; then
+-        NEWMAILTO="${NEWMAILTO},$SUBJECT"
+-    fi
+-    if [ -n "$BODY" ] ; then
+-        NEWMAILTO="${NEWMAILTO},$BODY"
+-    fi
+-
+-    NEWMAILTO=$(echo "$NEWMAILTO" | sed 's/^,//')
+-    DEBUG 1 "Running $THUNDERBIRD -compose \"$NEWMAILTO\""
+-    "$THUNDERBIRD" -compose "$NEWMAILTO"
+-    if [ $? -eq 0 ]; then
+-        exit_success
+-    else
+-        exit_failure_operation_failed
+-    fi
+-}
+-
+ open_kde()
+ {
+-    if [ -n "$KDE_SESSION_VERSION" ] && [ "$KDE_SESSION_VERSION" -ge 5 ]; then
+-        local kreadconfig=kreadconfig$KDE_SESSION_VERSION
+-    else
+-        local kreadconfig=kreadconfig
+-    fi
+-
+-    if which $kreadconfig >/dev/null 2>&1; then
+-        local profile=$($kreadconfig --file emaildefaults \
+-                                     --group Defaults --key Profile)
+-        if [ -n "$profile" ]; then
+-            local client=$($kreadconfig --file emaildefaults \
+-                                        --group "PROFILE_$profile" \
+-                                        --key EmailClient \
+-                                  | cut -d ' ' -f 1)
+-
+-            if echo "$client" | grep -Eq 'thunderbird|icedove'; then
+-                run_thunderbird "$client" "$1"
+-            fi
+-        fi
+-    fi
+-
+     local command
+     case "$KDE_SESSION_VERSION" in
+         '') command=kmailservice ;;
+@@ -130,15 +62,6 @@ open_kde()
+ 
+ open_gnome3()
+ {
+-    local client
+-    local desktop
+-    desktop=`xdg-mime query default "x-scheme-handler/mailto"`
+-    client=`desktop_file_to_binary "$desktop"`
+-    echo $client | grep -E 'thunderbird|icedove' > /dev/null 2>&1
+-    if [ $? -eq 0 ] ; then
+-        run_thunderbird "$client" "$1"
+-    fi
+-
+     if gio help open 2>/dev/null 1>&2; then
+         DEBUG 1 "Running gio open \"$1\""
+         gio open "$1"
+@@ -159,13 +82,6 @@ open_gnome3()
+ 
+ open_gnome()
+ {
+-    local client
+-    client=`gconftool-2 --get /desktop/gnome/url-handlers/mailto/command | cut -d ' ' -f 1` || ""
+-    echo $client | grep -E 'thunderbird|icedove' > /dev/null 2>&1
+-    if [ $? -eq 0 ] ; then
+-        run_thunderbird "$client" "$1"
+-    fi
+-
+     if gio help open 2>/dev/null 1>&2; then
+         DEBUG 1 "Running gio open \"$1\""
+         gio open "$1"
+@@ -231,15 +147,6 @@ open_flatpak()
+ 
+ open_generic()
+ {
+-    local client
+-    local desktop
+-    desktop=`xdg-mime query default "x-scheme-handler/mailto"`
+-    client=`desktop_file_to_binary "$desktop"`
+-    echo $client | grep -E 'thunderbird|icedove' > /dev/null 2>&1
+-    if [ $? -eq 0 ] ; then
+-        run_thunderbird "$client" "$1"
+-    fi
+-
+     xdg-open "$1"
+     local ret=$?
+ 
+@@ -364,21 +271,6 @@ while [ $# -gt 0 ] ; do
+         shift
+         ;;
+ 
+-      --attach)
+-        if [ -z "$1" ] ; then
+-            exit_failure_syntax "file argument missing for --attach option"
+-        fi
+-        check_input_file "$1"
+-        file=`readlink -f "$1"` # Normalize path
+-        if [ -z "$file" ] || [ ! -f "$file" ] ; then
+-            exit_failure_file_missing "file '$1' does not exist"
+-        fi
+-
+-        url_encode "$file"
+-        options="${options}attach=${result}&"
+-        shift
+-        ;;
+-
+       -*)
+         exit_failure_syntax "unexpected option '$parm'"
+         ;;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 73acf6b744..4d93180535 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
            file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
+           file://CVE-2022-4055.patch \
           "
 
 SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
-- 
2.34.1


