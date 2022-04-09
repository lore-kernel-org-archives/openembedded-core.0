Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F235C47095
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.2524.1649470600448807089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DxSlPlN0;
 spf=pass (domain: linaro.org, ip: 209.85.219.53,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f53.google.com with SMTP id i15so8922044qvh.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xbWzrQ/Q1xDgQ22nZ8H7q/rkWGgTP/mfwzAA+Ze8cE=;
        b=DxSlPlN0t39bdE478Q/WQ1tAGnCLobVdz5T1BBnJYVksgOzUyuOCGpG1CHvFOjEml2
         NH+EbcyWq8rsAxonOiDmsbogfuhYvQz+BJTiszzi0SIR6U2njrOExe3JnhIMFiiv7Ins
         g/b9pyIa5PKKrusenEnCgEyPp+f16O6cwotV/QCNDzXWh8WsOn9wn6WCBTDxJI/puakC
         FgjyXBPdxzbLNtuJaFgi5ZFdEueEsyEsQATuA6qklCNrlbZsooxTcTS5mDIxbZ0jjzAF
         iGxH8v0DJg9vsNdOjbpFTpe88LFUZHJjDHoGVaFwJWr9AWB8OqoPESZ+04oM8e259gAt
         l1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xbWzrQ/Q1xDgQ22nZ8H7q/rkWGgTP/mfwzAA+Ze8cE=;
        b=0frYnR+9VVpPH9zGtTHvkFY4DQDUvYmhf5mkbGXbrqe7pDeOEcyM7jEvFXyUoDiro8
         oYyqBFAkGMrGDrEYxRoPcMmpCvv1ibGzXKAgb62EYvZ6PZtluv8y61rVb9ikL6EL9uXN
         Us90y38dhkeSLPs2tdBtqWiM8gr5WEEFid9GlD674Quj6Ay89YutKv6Vd9TYZXMNPkno
         QtpAKzHXlnzLCtAgmfs/b/v9QVtpyhqes4ksW22W8JDlwFlV+Re9hokZBmsJ0er77kl/
         XgVrQ4GzvSfoYSwLS9qMhMQCsU6L2ckkRaT07H769uopLreg0agV8S5n9R+/xp5urDM9
         Di2g==
X-Gm-Message-State: AOAM532RjrYlurfcLIex4YEOP/1TK7awqO8zDinb8RDGdFRCCSOnHK+P
	8IcrtlMkTRN2jsZlCqlLR5NYTeel9s7vZA==
X-Google-Smtp-Source: 
 ABdhPJx9tUA4WXjqGIHlR1+3dgsfEjf1+Rs62Cs6MOVtXiiC5Ce0M5MFSxeG/EPf3COIYloi+/Q0vQ==
X-Received: by 2002:ad4:5968:0:b0:444:1749:a6f4 with SMTP id
 eq8-20020ad45968000000b004441749a6f4mr7949752qvb.43.1649470599502;
        Fri, 08 Apr 2022 19:16:39 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 de8-20020a05620a370800b0067ec34c9f27sm14825209qkb.129.2022.04.08.19.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 19:16:39 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] xz: fix CVE-2022-1271
Date: Fri,  8 Apr 2022 22:16:33 -0400
Message-Id: <20220409021633.201167-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164179

Malicious filenames can make xzgrep to write to arbitrary files
or (with a GNU sed extension) lead to arbitrary code execution.

Upstream-Status: Backport [https://tukaani.org/xz/xzgrep-ZDI-CAN-16587.patch]
CVE: CVE-2022-1271

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../xz/xz/CVE-2022-1271.patch                 | 96 +++++++++++++++++++
 meta/recipes-extended/xz/xz_5.2.5.bb          |  4 +-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch

diff --git a/meta/recipes-extended/xz/xz/CVE-2022-1271.patch b/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
new file mode 100644
index 0000000000..e43e73cf12
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
@@ -0,0 +1,96 @@
+From dc932a1e9c0d9f1db71be11a9b82496e3a72f112 Mon Sep 17 00:00:00 2001
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
+index 9db5c3a..f64dddb 100644
+--- a/src/scripts/xzgrep.in
++++ b/src/scripts/xzgrep.in
+@@ -179,22 +179,26 @@ for i; do
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
diff --git a/meta/recipes-extended/xz/xz_5.2.5.bb b/meta/recipes-extended/xz/xz_5.2.5.bb
index 78aa6b20ca..720e070f4a 100644
--- a/meta/recipes-extended/xz/xz_5.2.5.bb
+++ b/meta/recipes-extended/xz/xz_5.2.5.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
+           file://CVE-2022-1271.patch \
+           "
 SRC_URI[md5sum] = "0d270c997aff29708c74d53f599ef717"
 SRC_URI[sha256sum] = "f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


