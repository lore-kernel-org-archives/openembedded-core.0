Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C9DC76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:06 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.162506.1680796922262100891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xKrzI6P4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id q2so1811696pll.7
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796921; x=1683388921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBPyuz6fAzAgSWagEh0hoS4OG7ikz5s0xRsc81gcWQA=;
        b=xKrzI6P41XExGipTTm/pHk6Qhvqf7uDz2s1B9VX6m6YJbY8h3lqNa2F3AhwKD+9Jgn
         3mKtDeKBODe1qH/R26d6IFYz4B8dTSauLjH7oMzhhbYe+2FkV4SBDM6vFUVo2CzTEfR+
         uqqyQss9pEk2+h3rFM8dfYBZyBlSJlaikt5/VBgLWbuVsEK40rFr28iRqga6tbRHDOaG
         ZLdbvoGOvr90NngqQ2sQpQzErYrBsottcbCVspsNDVbIdwB6IkBLxytscbkbAbitoxuN
         up7LFBXqkpuoxubcn95yF0myHD2OakevSJQt5nThsrH0zmK5gxgU1u42KDkijm1fpYvh
         csVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796921; x=1683388921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBPyuz6fAzAgSWagEh0hoS4OG7ikz5s0xRsc81gcWQA=;
        b=w0dAS3zFuohQ71osoJbOGFyDFimx+z5GRNVM+RNUPX7cDuh2k0tf0nG1QV3+y2CTc5
         4jhgDZG5vtMrmPymUq8iAVdZNOw/asZ608VC5iBDofTQKcRNOBlx/P2rCGAZrwJR/LM0
         +rXFFY3d0O7p04/n6Qiuy39NZyyNmxYA8KVOmCOfb2TP/BAkiTbGwllBhJI2AvjuBMg1
         QuUxG6GOCmXC7+QS7g4j6nxy1mJwqkEHb5T1tdav+dVZ4sleW9nEWTsHOL4Jhau0y9Cp
         108mq4cxihEcHZ3zOsblzPefNbeDGxyKNf1MuBeWfiN69lgWV1GD8kXM0F93hc/iIpWr
         Tl9Q==
X-Gm-Message-State: AAQBX9cKs5UMcbqG5RO8mdhbgTVguWGZVAdFPHpiLmO338838xHFuUHP
	To/RzX9HSM9QtaSRT9ZYDfiQqAm8MtdB2apRaGk=
X-Google-Smtp-Source: AKy350bnPbltYeQThPbGTTijxVLPtp7B/izE4k1Juv3mhONFJ2IFhmlSlymTsgDJG/+wsjnp0a/ZmA==
X-Received: by 2002:a05:6a20:4d83:b0:d9:840f:79c2 with SMTP id gj3-20020a056a204d8300b000d9840f79c2mr88136pzb.2.1680796921178;
        Thu, 06 Apr 2023 09:02:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/26] xdg-utils: Add a patch for CVE-2020-27748
Date: Thu,  6 Apr 2023 06:01:28 -1000
Message-Id: <5b14528e7bfe2f0a29cc2d40253e49be5202efcf.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179779

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Take a patch submitted upstream for the issue while upstream decide what
to do. We don't use thunderbird integration so this isn't an issue for us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b85b7714a44caa70beb2f115483ee52745aa1b97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xdg-utils/xdg-utils/CVE-2020-27748.patch  | 145 ++++++++++++++++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch
new file mode 100644
index 0000000000..ec3605e158
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
index 73acf6b744..d95bcccd2a 100644
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
2.34.1


