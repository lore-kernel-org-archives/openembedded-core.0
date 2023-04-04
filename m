Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A55C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 13:04:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.100850.1680613460152416129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 06:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CQJjTU/r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id p34so18975724wms.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680613458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DRTiOns9WOxXG5QblRD6fkVQ7bOC0fC2t6aGdcjNc24=;
        b=CQJjTU/rir74fT9BtFuBH77noniG4QbngzmIKyGANtrLaNYOl3rEjTp+80s+8imHNp
         Acb3hdmc/gb+DpDkHLwGq2E4MNfEYQca/d7MXTshiu9U/3lShCsivrDvsgXaUyqLBSqN
         jhF8LqK6W4G/a6SMtzWa05FOtuz+pMv/1QttU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRTiOns9WOxXG5QblRD6fkVQ7bOC0fC2t6aGdcjNc24=;
        b=WnSVSxAA0B6dDguvGWX3EuKr1eHeDNtsNzGNf6SfcVcZ01s78eIUtikxEBWohDqnaO
         LexZesNyev5BaoLamAFhPuOOjQb6VqCz2ecN+rqwyKZH4+uHzpIGzAHxVnPjCsxdXtko
         8GadQ1p8I28d8P9Q+IasGxSAtxO+7MOYjuij4QUrzrA3lNrr1RGCfqGjTvZwkA1QOZcV
         D53y6bLPUYJJ6RApvXaLTTCznRKlItxU9QEe2OYwb2nXGyTyDCiMY0QhnHcxehoNbJ1N
         79fJZqhEouWtS3XOuCkWZWbJA2X+eHGaP1uqbfH56NB12xKPkAqQ+tUJjuvd6v7Eb9rp
         re7w==
X-Gm-Message-State: AAQBX9ep2uD4FuAukYUVy09YIvjwpCGd4jdzLxKogh1lzKtpnpJDRsbp
	dx0Rj3pYrzIWG0V2Nehe6pkEY1Z0VG6jeiLTFN8=
X-Google-Smtp-Source: AKy350bfU4rEmAvzXRGWJ2RwvK2Y+74Vb5ZXNr6HDK9+sj88kGX9iW5PS9qm286sQviuOGS7S5elTg==
X-Received: by 2002:a05:600c:ad2:b0:3dc:5b88:e6dd with SMTP id c18-20020a05600c0ad200b003dc5b88e6ddmr2244302wmr.10.1680613458087;
        Tue, 04 Apr 2023 06:04:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:abd7:fd2a:3a94:1363])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003f046ad52efsm13967231wmq.31.2023.04.04.06.04.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:04:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xdg-utils: Add a patch for CVE-2020-27748
Date: Tue,  4 Apr 2023 14:04:16 +0100
Message-Id: <20230404130416.386926-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 13:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179688

Take a patch submitted upstream for the issue while upstream decide what
to do. We don't use thunderbird integration so this isn't an issue for us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xdg-utils/xdg-utils/CVE-2020-27748.patch  | 145 ++++++++++++++++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch
new file mode 100644
index 00000000000..ec3605e1586
--- /dev/null
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch
@@ -0,0 +1,145 @@
+xdg-email does not parse mailto uris properly for thunderbird
+
+When using thunderbird as mailto handler xdg-email translates mailto uris into an 'thunderbird -compose' argument. While to, cc and bcc values are properly enclosed in single quotes this is not the case for subject or body. This breaks functionality and allows to use all thunderbird -compose arguments within a mailto uri, e.g.
+
+xdg-email 'mailto:test@example.com?subject=Test,attachment=~/.thunderbird/profiles.ini,message=/home/test/test.txt'
+
+translates into
+
+thunderbird -compose to='test@example.com,',subject=Test,attachment=~/.thunderbird/profiles.ini,message=/home/test/test.txt
+
+with working attachment and message. (And, yes, ~ expands to the home directory.)
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xdg/xdg-utils/-/issues/205]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+CVE: CVE-2020-27748
+
+
+Index: xdg-utils-1.1.3/scripts/xdg-email.in
+===================================================================
+--- xdg-utils-1.1.3.orig/scripts/xdg-email.in
++++ xdg-utils-1.1.3/scripts/xdg-email.in
+@@ -30,53 +30,6 @@ _USAGE
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
+     if [ -n "$KDE_SESSION_VERSION" ] && [ "$KDE_SESSION_VERSION" -ge 5 ]; then
+@@ -130,15 +83,6 @@ open_kde()
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
+@@ -159,13 +103,6 @@ open_gnome3()
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
+@@ -231,15 +168,6 @@ open_flatpak()
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
+@@ -364,21 +292,6 @@ while [ $# -gt 0 ] ; do
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
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 73acf6b744e..d95bcccd2a5 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
            file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
+           file://CVE-2020-27748.patch \
           "
 
 SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
-- 
2.39.2


