Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96953C32792
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.469.1660894072830837589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=esLjQIkT;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bs25so4184872wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=IT9bysPlfC5YS4TumqvEMZvAgphAAp63iDf8LqiWGko=;
        b=esLjQIkTmxM5NKqTEXXZLXLoPyossgfi7msfmvXsBfxX3gTUL1OjAUXoPLpyz55Xaw
         eFcOFO88pQXyiLZNsguaqyK13PQ5cRBn8ADS90P6h/rja3KCavWY58YDBRNij0wHN/gh
         NRpbWENEtDWDL1eh3OkNE/aRiWCm5tPc2tGJ369/B3qqyLq1KglahC3q5Lf8Z8QS7IPh
         xV23WVHUbjBb3ZDwLaA+A2BwF97Cl2qb7ypwLQh+YUXS9xb+ue7o3KIEI/w0lq0elpAm
         CJsu2dQE1ZHyMv4DUXNoE2xP//GaTFW8ln9Crw+nNPZxPrXDibAjLx0NzM07iF8TjyCv
         OaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=IT9bysPlfC5YS4TumqvEMZvAgphAAp63iDf8LqiWGko=;
        b=oIAva0Ai0t6e32Ke9ZN91kyZxY1hliXvrhULwuk1HhaYicDXfsj4r7XBeEgF6qyOUo
         DaU4YR6phcMujCxpteaRYrWIwFbGq+cR+/sPIp2dGrOXHzNTciNTfiVaJY7m7RScJNDD
         PixkMEpaT/r2RoqVe+dj5bRAdpDxIwHOl0rO4prJUM257DqZIoYIfSWM1T5rUPdXAgAV
         Cwg10ADH7YY5qCRRmY+I6Dd+orWzvHliqcmWljTPvHk7L42GhJqWPJJ12OLzUsOqv/ZH
         S9lXG8QdNY2TrpZc7xeqHWOUn/5CwT2r78RdAEHhmGLNPipdH0fAbyui9/k2mV4EXWHh
         FFwQ==
X-Gm-Message-State: ACgBeo3y5ofKIz2cNiyYScRLie0aiOPxBWIeFxO/+nmEX+HF0tNZJeHB
	bYoCyrjQUo82jPJKkYtjDN32kZcOu94=
X-Google-Smtp-Source: 
 AA6agR4mmnL53ySKM52QuUdkkWUYcwXqRzFt5XfHhGN+DIK4e+4RNVGcXCWIHHVQP/42PTcH4AAbmQ==
X-Received: by 2002:a5d:46c7:0:b0:225:2219:5e10 with SMTP id
 g7-20020a5d46c7000000b0022522195e10mr3463469wrs.115.1660894071278;
        Fri, 19 Aug 2022 00:27:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/42] xz: update 5.2.5 -> 5.2.6
Date: Fri, 19 Aug 2022 09:26:52 +0200
Message-Id: <20220819072727.2236928-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169578

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xz/xz/CVE-2022-1271.patch                 | 96 -------------------
 .../xz/{xz_5.2.5.bb => xz_5.2.6.bb}           |  7 +-
 2 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch
 rename meta/recipes-extended/xz/{xz_5.2.5.bb => xz_5.2.6.bb} (88%)

diff --git a/meta/recipes-extended/xz/xz/CVE-2022-1271.patch b/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
deleted file mode 100644
index e43e73cf12..0000000000
--- a/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From dc932a1e9c0d9f1db71be11a9b82496e3a72f112 Mon Sep 17 00:00:00 2001
-From: Lasse Collin <lasse.collin@tukaani.org>
-Date: Tue, 29 Mar 2022 19:19:12 +0300
-Subject: [PATCH] xzgrep: Fix escaping of malicious filenames (ZDI-CAN-16587).
-
-Malicious filenames can make xzgrep to write to arbitrary files
-or (with a GNU sed extension) lead to arbitrary code execution.
-
-xzgrep from XZ Utils versions up to and including 5.2.5 are
-affected. 5.3.1alpha and 5.3.2alpha are affected as well.
-This patch works for all of them.
-
-This bug was inherited from gzip's zgrep. gzip 1.12 includes
-a fix for zgrep.
-
-The issue with the old sed script is that with multiple newlines,
-the N-command will read the second line of input, then the
-s-commands will be skipped because it's not the end of the
-file yet, then a new sed cycle starts and the pattern space
-is printed and emptied. So only the last line or two get escaped.
-
-One way to fix this would be to read all lines into the pattern
-space first. However, the included fix is even simpler: All lines
-except the last line get a backslash appended at the end. To ensure
-that shell command substitution doesn't eat a possible trailing
-newline, a colon is appended to the filename before escaping.
-The colon is later used to separate the filename from the grep
-output so it is fine to add it here instead of a few lines later.
-
-The old code also wasn't POSIX compliant as it used \n in the
-replacement section of the s-command. Using \<newline> is the
-POSIX compatible method.
-
-LC_ALL=C was added to the two critical sed commands. POSIX sed
-manual recommends it when using sed to manipulate pathnames
-because in other locales invalid multibyte sequences might
-cause issues with some sed implementations. In case of GNU sed,
-these particular sed scripts wouldn't have such problems but some
-other scripts could have, see:
-
-    info '(sed)Locale Considerations'
-
-This vulnerability was discovered by:
-cleemy desu wayo working with Trend Micro Zero Day Initiative
-
-Thanks to Jim Meyering and Paul Eggert discussing the different
-ways to fix this and for coordinating the patch release schedule
-with gzip.
-
-Upstream-Status: Backport [https://tukaani.org/xz/xzgrep-ZDI-CAN-16587.patch]
-CVE: CVE-2022-1271
-
-Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
----
- src/scripts/xzgrep.in | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/src/scripts/xzgrep.in b/src/scripts/xzgrep.in
-index 9db5c3a..f64dddb 100644
---- a/src/scripts/xzgrep.in
-+++ b/src/scripts/xzgrep.in
-@@ -179,22 +179,26 @@ for i; do
-          { test $# -eq 1 || test $no_filename -eq 1; }; then
-       eval "$grep"
-     else
-+      # Append a colon so that the last character will never be a newline
-+      # which would otherwise get lost in shell command substitution.
-+      i="$i:"
-+
-+      # Escape & \ | and newlines only if such characters are present
-+      # (speed optimization).
-       case $i in
-       (*'
- '* | *'&'* | *'\'* | *'|'*)
--        i=$(printf '%s\n' "$i" |
--            sed '
--              $!N
--              $s/[&\|]/\\&/g
--              $s/\n/\\n/g
--            ');;
-+        i=$(printf '%s\n' "$i" | LC_ALL=C sed 's/[&\|]/\\&/g; $!s/$/\\/');;
-       esac
--      sed_script="s|^|$i:|"
-+
-+      # $i already ends with a colon so don't add it here.
-+      sed_script="s|^|$i|"
- 
-       # Fail if grep or sed fails.
-       r=$(
-         exec 4>&1
--        (eval "$grep" 4>&-; echo $? >&4) 3>&- | sed "$sed_script" >&3 4>&-
-+        (eval "$grep" 4>&-; echo $? >&4) 3>&- |
-+            LC_ALL=C sed "$sed_script" >&3 4>&-
-       ) || r=2
-       exit $r
-     fi >&3 5>&-
diff --git a/meta/recipes-extended/xz/xz_5.2.5.bb b/meta/recipes-extended/xz/xz_5.2.6.bb
similarity index 88%
rename from meta/recipes-extended/xz/xz_5.2.5.bb
rename to meta/recipes-extended/xz/xz_5.2.6.bb
index 720e070f4a..3482622471 100644
--- a/meta/recipes-extended/xz/xz_5.2.5.bb
+++ b/meta/recipes-extended/xz/xz_5.2.6.bb
@@ -24,11 +24,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
-           file://CVE-2022-1271.patch \
-           "
-SRC_URI[md5sum] = "0d270c997aff29708c74d53f599ef717"
-SRC_URI[sha256sum] = "f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI[sha256sum] = "a2105abee17bcd2ebd15ced31b4f5eda6e17efd6b10f921a01cda4a44c91b3a0"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.30.2


