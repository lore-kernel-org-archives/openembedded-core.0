Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB73CC4743E
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.2518.1649470639223964649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VyjbOW+4;
 spf=pass (domain: linaro.org, ip: 209.85.222.175,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f175.google.com with SMTP id 75so3415682qkk.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MgL4kOBZPwE5DnybnzlyEtdhznwgSWaeO07kFTSXDfc=;
        b=VyjbOW+4YqkfFUZBywxl62diXA8wsFQ9o7n5qCl7qRJb6BdktISSdkSa2/pEdub/mI
         O9m8vV2il92S/D1bQh02xX6J2aJQt8aje9l9jjtNjShhHAwnDLVr6wDhbUHeLQ0vknrq
         EAfzbYBAROrHpl8m17ANWaYiPcsVN2z+zEPXEK9NXGlRUmwopYaMLE5LVfX6CvfLi8eI
         ba/S8zGhRy5AxVeyYwOwG4VfkKmU6o5z+Rol0bMzw0/7pSSh34Z7Rs3Icc+yK0BvfAUM
         0kOG9dXfU1Avxek/HaUXNgljB510fs25YZeL1mKFhKeZle7xEtgr1WuauQz/+O05v7Xc
         LyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MgL4kOBZPwE5DnybnzlyEtdhznwgSWaeO07kFTSXDfc=;
        b=zjwgw0UaJTq6eiwwLJM1vM8HGsc2QrQ+UNO4c/eFLM3O+Lz/esU7EzTa2c8+dKTv4m
         OOvQDOBTfVAhIarfepQTaHC9cYsUhfqW/xNS3rCr67tReX72/p11c2u3JUm/NWboitCa
         NnCJTk47ceNNY8jwW31VyJHxdSoKLmFr7mL0kiodRVUCsTeWLNfDm6d7KatYDeVVRu9H
         SZAQ4+RIUMNc4wHGcVBPiBVj2dZl3AZ9klgkjIzsalZSih/7HmnY/y6t36FgT8bTkHve
         dXZ6n/0xBlvkKaSCMVQ925O9PxdJy0r8nr87SEzjudbCBAViFUQK/DwL5ewFRCyBvAh7
         wcwA==
X-Gm-Message-State: AOAM532GAnOtCLzxyOTMwkiegqrhuQZp2GPtddsp27xlyvAEHueOcqeN
	mV/XCtH4f+Ff4wlhGPQtHAzbzDNNEMnpSg==
X-Google-Smtp-Source: 
 ABdhPJyjmJU5CBy/Za/xzayJU5h2OZxB2h2nrnC/QrYVprNFBrFUTF9TsnuPaC5NVrKvbiY84BnxBQ==
X-Received: by 2002:ae9:e854:0:b0:69b:f41c:7f5f with SMTP id
 a81-20020ae9e854000000b0069bf41c7f5fmr1580749qkg.155.1649470638324;
        Fri, 08 Apr 2022 19:17:18 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 d6-20020ac85d86000000b002e1e20444b6sm18846317qtx.57.2022.04.08.19.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 19:17:18 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] xz: fix CVE-2022-1271
Date: Fri,  8 Apr 2022 22:17:15 -0400
Message-Id: <20220409021715.201321-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164181

Malicious filenames can make xzgrep to write to arbitrary files
or (with a GNU sed extension) lead to arbitrary code execution.

Upstream-Status: Backport [https://tukaani.org/xz/xzgrep-ZDI-CAN-16587.patch]
CVE: CVE-2022-1271

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../xz/xz/CVE-2022-1271.patch                 | 96 +++++++++++++++++++
 meta/recipes-extended/xz/xz_5.2.4.bb          |  4 +-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch

diff --git a/meta/recipes-extended/xz/xz/CVE-2022-1271.patch b/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
new file mode 100644
index 0000000000..7841a534d3
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
@@ -0,0 +1,96 @@
+From 6bb2369742f9ff0451c245e8ca9b9dfac0cc88ba Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Tue, 29 Mar 2022 19:19:12 +0300
+Subject: [PATCH] xzgrep: Fix escaping of malicious filenames (ZDI-CAN-16587).
+
+Malicious filenames can make xzgrep to write to arbitrary files
+or (with a GNU sed extension) lead to arbitrary code execution.
+
+xzgrep from XZ Utils versions up to and including 5.2.5 are
+affected. 5.3.1alpha and 5.3.2alpha are affected as well.
+This patch works for all of them.
+
+This bug was inherited from gzip's zgrep. gzip 1.12 includes
+a fix for zgrep.
+
+The issue with the old sed script is that with multiple newlines,
+the N-command will read the second line of input, then the
+s-commands will be skipped because it's not the end of the
+file yet, then a new sed cycle starts and the pattern space
+is printed and emptied. So only the last line or two get escaped.
+
+One way to fix this would be to read all lines into the pattern
+space first. However, the included fix is even simpler: All lines
+except the last line get a backslash appended at the end. To ensure
+that shell command substitution doesn't eat a possible trailing
+newline, a colon is appended to the filename before escaping.
+The colon is later used to separate the filename from the grep
+output so it is fine to add it here instead of a few lines later.
+
+The old code also wasn't POSIX compliant as it used \n in the
+replacement section of the s-command. Using \<newline> is the
+POSIX compatible method.
+
+LC_ALL=C was added to the two critical sed commands. POSIX sed
+manual recommends it when using sed to manipulate pathnames
+because in other locales invalid multibyte sequences might
+cause issues with some sed implementations. In case of GNU sed,
+these particular sed scripts wouldn't have such problems but some
+other scripts could have, see:
+
+    info '(sed)Locale Considerations'
+
+This vulnerability was discovered by:
+cleemy desu wayo working with Trend Micro Zero Day Initiative
+
+Thanks to Jim Meyering and Paul Eggert discussing the different
+ways to fix this and for coordinating the patch release schedule
+with gzip.
+
+Upstream-Status: Backport [https://tukaani.org/xz/xzgrep-ZDI-CAN-16587.patch]
+CVE: CVE-2022-1271
+
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+---
+ src/scripts/xzgrep.in | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/src/scripts/xzgrep.in b/src/scripts/xzgrep.in
+index a1fd19c..da1e65b 100644
+--- a/src/scripts/xzgrep.in
++++ b/src/scripts/xzgrep.in
+@@ -178,22 +178,26 @@ for i; do
+          { test $# -eq 1 || test $no_filename -eq 1; }; then
+       eval "$grep"
+     else
++      # Append a colon so that the last character will never be a newline
++      # which would otherwise get lost in shell command substitution.
++      i="$i:"
++
++      # Escape & \ | and newlines only if such characters are present
++      # (speed optimization).
+       case $i in
+       (*'
+ '* | *'&'* | *'\'* | *'|'*)
+-        i=$(printf '%s\n' "$i" |
+-            sed '
+-              $!N
+-              $s/[&\|]/\\&/g
+-              $s/\n/\\n/g
+-            ');;
++        i=$(printf '%s\n' "$i" | LC_ALL=C sed 's/[&\|]/\\&/g; $!s/$/\\/');;
+       esac
+-      sed_script="s|^|$i:|"
++
++      # $i already ends with a colon so don't add it here.
++      sed_script="s|^|$i|"
+ 
+       # Fail if grep or sed fails.
+       r=$(
+         exec 4>&1
+-        (eval "$grep" 4>&-; echo $? >&4) 3>&- | sed "$sed_script" >&3 4>&-
++        (eval "$grep" 4>&-; echo $? >&4) 3>&- |
++            LC_ALL=C sed "$sed_script" >&3 4>&-
+       ) || r=2
+       exit $r
+     fi >&3 5>&-
diff --git a/meta/recipes-extended/xz/xz_5.2.4.bb b/meta/recipes-extended/xz/xz_5.2.4.bb
index 67a6cbd569..6d80a4f2e9 100644
--- a/meta/recipes-extended/xz/xz_5.2.4.bb
+++ b/meta/recipes-extended/xz/xz_5.2.4.bb
@@ -23,7 +23,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
+           file://CVE-2022-1271.patch \
+           "
 SRC_URI[md5sum] = "5ace3264bdd00c65eeec2891346f65e6"
 SRC_URI[sha256sum] = "b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


