Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EDEE92FE1
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 04:41:25 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.5997.1696567276380438688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 21:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fMtomM14;
 spf=pass (domain: mvista.com, ip: 209.85.160.50, mailfrom: hprajapati@mvista.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1e10507a4d6so1233571fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 21:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696567275; x=1697172075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp6WCFG0hiFNmAujgVXbVGvHsjcIzsJTxxExrDhIgQw=;
        b=fMtomM14h7xk3Wb3rR6+PffFjb7RiJd0lsCnKrLuDpW7cw8dBsGzoLtAWdXkNOE0bR
         XVjy16AxkUMi58nG3kFPen0x/OwECmKtALGPAIKV4QE6UdcZPGjkCXO63P/JZqs5OUYT
         yiu+UcKo1f160IlQKkbNbw6/gNiyVqIpw2d50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696567275; x=1697172075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cp6WCFG0hiFNmAujgVXbVGvHsjcIzsJTxxExrDhIgQw=;
        b=brjlSJcLvheAcai7ivwEIwfsPv5NkpaebcsVTfAJdYuOpZTIdILOmqVrWjoKmFCvf0
         6SGzZu3kqdBncY//B4rdc4fpr590uIEuLnoOmzFv6Zo0WH48xn7SmRFBy95K0ILDwY9w
         S14W9P6HIfOPWM6NLaoN0+GsFtHsYCwbjsS/KwMDvneD7Q515ckEhKXxeU16LhumILZF
         aTn1LVoEQIQ1pTrMlte2lPxeKM64FoxPNFOMRr2RdKxupmzc1/9Ni+5GlKBNLJ+2DSkX
         4SIvw37C/yP68o4esoeKmqBINnmqmQSFCWK3ribxgCrEqGcXAYB+Xm4yolvZLlecpRm6
         GhBg==
X-Gm-Message-State: AOJu0Yx3gnDPGgxeSGxbjO0dhmnJiOhic92sDSnwZFiznGcK35NijvCI
	pm5nls3+jtrul0MnZURXI7Ygsr4l5GbS9yFdp3Vq5w==
X-Google-Smtp-Source: AGHT+IFJ6XVNq3lZvImunVT6xD8IFLrJ5FB8yhINyIfhy+/EO24yxglBtNdRZhi+SOAACmAt3c83nw==
X-Received: by 2002:a05:6870:b604:b0:1d7:1ad1:3f8c with SMTP id cm4-20020a056870b60400b001d71ad13f8cmr7788595oab.49.1696567275374;
        Thu, 05 Oct 2023 21:41:15 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.218])
        by smtp.gmail.com with ESMTPSA id p12-20020a62ab0c000000b006933822e7a6sm448026pff.66.2023.10.05.21.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 21:41:15 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell[PATCH] xdg-utils: Fix CVE-2022-4055
Date: Fri,  6 Oct 2023 10:11:08 +0530
Message-Id: <20231006044108.27527-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 04:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188742

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
index 41b74b8598..f6989430f5 100644
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


