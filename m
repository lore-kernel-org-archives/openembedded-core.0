Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D0DC63700
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.21639.1650136499672871247
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DPIxiesY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id k62so5862612pgd.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ica1BFGeeMFK5BB1HNkuxuk7JLlB9xAcJvw1JA5XqSg=;
        b=DPIxiesYf0PdoDxfRl+VcpbAiYCJW6TThWoh3ftK5Oi472/yq/Gt1zhfQlhGGt5o0x
         fEEB0INdhgWQc5CZ35ZlnLK9IkrA/lfN9MBqXEhToZPpH4mIHQVVk3gM02LFISjT5weJ
         BOVn0TwKaOv8v/tHuTFZFe8Eqkt3Sgm70t1y9NUpqEukfcLxxfS4tdg2MgpzYzE6lYg0
         qrRMHVRPuUsikhod6wReLYlt/Byi80iD2QjHNpewxRJFoJ+5zOLhbXfbm9420IajjCzH
         qml1a6qjPnkFZA0yaFJLGyCynIYjy7A1WfQmNnp8X4xQEwFALAydm3TQyFj0B/66U3Hd
         nJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ica1BFGeeMFK5BB1HNkuxuk7JLlB9xAcJvw1JA5XqSg=;
        b=sSj5KEOsl6/qJ6KL/5lfGGDIhiQl9y7pytfSpMpiYKLAw+5ahY50YWCs01jIR3Oiqi
         FAjtjAo+D4m7pmALAqrfTUyBcolkGNr+xP4lh0MaQAgq96UbOMCKyHWSFNkbc7J/SC8C
         GActqTJxFXw0iqJqrWZ8z0HY/0WyZeeVWAovCse3VenWtZBwmhgvV5mqbyEVhcRkOW9g
         7wnef/hPpOLHrG8RvW0Je8xZrmt7cNQ7l1iJXMtQztmRLFU/6CT22vTgbS6P7QzSepHO
         Ix7sMhPR6Dx460bKDmH3emjUNY6QVa3sj9eH6JuQea3O9+pLAO8rCLoXa11TZCJUJEVi
         vMMA==
X-Gm-Message-State: AOAM53143VDdf5u49lyeZHHpQz7EAVUo88mGOeHl4nmQoIy/7g7PJplb
	ZAabWZLxKZOSvvfTog7McSuS8o2GwGxkKnTY19k=
X-Google-Smtp-Source: 
 ABdhPJzMIv6QVdNFFfXkTvrKm+rhd4vJE2rLbxM8SZae91ThDWIurIZR5wCvL2BiNGFWrI6jlltUvQ==
X-Received: by 2002:aa7:96db:0:b0:506:1fcc:75a8 with SMTP id
 h27-20020aa796db000000b005061fcc75a8mr4624476pfq.12.1650136498321;
        Sat, 16 Apr 2022 12:14:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.14.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:14:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] xz: fix CVE-2022-1271
Date: Sat, 16 Apr 2022 09:14:22 -1000
Message-Id: 
 <da4180062f12aa855a0dd2c0dbe4f0721df67055.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164550

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Malicious filenames can make xzgrep to write to arbitrary files
or (with a GNU sed extension) lead to arbitrary code execution.

Upstream-Status: Backport [https://tukaani.org/xz/xzgrep-ZDI-CAN-16587.patch]
CVE: CVE-2022-1271

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


