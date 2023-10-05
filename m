Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A72E936FF
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 05:17:23 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.9080.1696483038116820223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 22:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dfp2Vuwv;
 spf=pass (domain: mvista.com, ip: 209.85.167.172, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3af603da0d1so388903b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 22:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696483037; x=1697087837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=an7XIA1ks79tTmKpFD6sv+MD+2reTeqpV8ZF0kNCUWw=;
        b=dfp2VuwvSxnvdN9ExQ0HZGuX/NSyhoATWJQNQm+QkVfA1e7FbT1NzSa7M9ykb3uER3
         g9p7CqjTqsDYORVhLhjsrXa/nrHAUeECjbR9tohUsZUXGC9+FCSmX4j37ljz+VIVwJM6
         3YVA5D3DYZqTEYgxzpapCdyTkVyu23qgtQ6yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696483037; x=1697087837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=an7XIA1ks79tTmKpFD6sv+MD+2reTeqpV8ZF0kNCUWw=;
        b=ZHFlzsZCBcQJnRRIGHVmCPIx/a1K+A6MXRNOwBph6EBeLZknrxP+KFAPdk/4lmqHYh
         dJW13L6c0eYxI7zjK1rn0bJQJZsPYH8j31Y2p7MjsbZihhHB4z7fOyyj5KIfzyytS6YL
         VB4+KB0vFXhAIjHzI09+PPQ5s34H/qbzXDKZtBWuMFveOYlonsOqMFoRaIxJ9PrCSd1b
         cWqLVxLTUSai5mg1ukOptbMJdoZVS19wSD2pPlAFd0WwE9tG6kSnKbqYVscYBMxSM6jY
         DFymKg6j7YMlRYMB8xrJYqhCnIfvkdLPXLxKVNJSpSZk5KZYcTwpElFMbSgROHpIGVD1
         LPNQ==
X-Gm-Message-State: AOJu0Ywfo1wNQk3XOv6eercWIALuPsYCja4VK56MNJqsf15BaNsRyYRp
	nWTkeCy06S0G1AudNAkh18tTQ0oV2RmbTQUv4459Mw==
X-Google-Smtp-Source: AGHT+IGvgp7XJm1JqoMI03vSebBMc7Akdc8UJSRHhVG9bJ0NIy7wOHPH3b4TKzUarWvnWiQC/Sp2tA==
X-Received: by 2002:a05:6358:88f:b0:143:61d:ffd3 with SMTP id m15-20020a056358088f00b00143061dffd3mr5265360rwj.4.1696483037094;
        Wed, 04 Oct 2023 22:17:17 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.242])
        by smtp.gmail.com with ESMTPSA id h8-20020a63b008000000b0057e13ed796esm467184pgf.60.2023.10.04.22.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 22:17:16 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone[PATCH] xdg-utils: Fix CVE-2022-4055
Date: Thu,  5 Oct 2023 10:47:11 +0530
Message-Id: <20231005051711.32969-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 05:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188704

Upstream-Status: Backport from https://gitlab.freedesktop.org/xdg/xdg-utils/-/commit/f67c4d1f8bd2e3cbcb9eb49f5e897075e7426780

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


