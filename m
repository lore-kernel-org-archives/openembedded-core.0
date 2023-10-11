Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D060CD98DB
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:07 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.5120.1696982519237635875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=buT/wmzy;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.50, mailfrom: steve@sakoman.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7a25040faffso282757539f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982518; x=1697587318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLtSaBbeHsdYTCatOuF8crDbbiC/JWdmFrs7OFutmd8=;
        b=buT/wmzy9C8JeeAKU7RYifJDVmL5B49HqqyX5saLXKY3HQQiP4su8trVSjUPQN33Mm
         pOudq6ng584kxWe8PYi6FbypXjyNlAh+gIQlCSql/VVgzQBxzCTqxyrZe2+oK0IqLJu+
         8Omq1+hL+AG1+V9sPdFJFtSwOIxGlGV5Wl4F7Is0eIzjBJP7J0qtroRv83qwrhisK3PT
         mordNGW3SYiaadXAmz5XpgTUZi9lBKxEIimve8HDuPtGHoG6LRk9r/sfs8NIqQGERWBL
         UBlHaP9oD89b42uG3X1BuN0G6mqWHm6x0/kqDAzYd6BV3gLkS0MWnZU+AQY+b8m7QVZl
         rQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982518; x=1697587318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLtSaBbeHsdYTCatOuF8crDbbiC/JWdmFrs7OFutmd8=;
        b=ChrT6Gz1xI9yk9jMwtq+Lqd3bzMfZcXWRur/QIm/YB3g6buhNBK9ZUKSyPL/nOyoxx
         I96Tn+eSTcOZjp/1OIqjRir0S/pW1C9hR+4H3r3qnfSiWHPCBb1l4PeMyFYT8c1CzHcO
         BZ6EZtEZ699J08vmGgnbcaVklDYVpPk4Rz5EYOLbxZJ9aiK1ikRRzlnq9LHagGWcyw3G
         Q2blqK/dTzJhR6CDg3SI727ZD6UgPONRXjolsUwxV1bK/CyJxc3R4bqRpxnz5Yi/79Ep
         btVJN+bghHNNzdfubYK7yzn0K/qTw2x6l1E+XQHiDDupbDXKjvY2/7eL2+vJZpPtLXUP
         4enw==
X-Gm-Message-State: AOJu0YykAsMd/OegpE+O5mhXtbbAnRMMJYnLh/LXuBSvI+gh+rJgs8Aq
	3VTUJ01A8Lu1vYi+rMpNJP1OUT3wSUjo7a0fQeY=
X-Google-Smtp-Source: AGHT+IF7Jj/hBic3l+SOcHo9UH+T8wNMouhJqFxXhjLwqkaDCph/OSCXKPuXjjOT81WOoEj+x1XlKA==
X-Received: by 2002:a05:6e02:20c4:b0:34a:c61f:9e99 with SMTP id 4-20020a056e0220c400b0034ac61f9e99mr23591662ilq.9.1696982518185;
        Tue, 10 Oct 2023 17:01:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.01.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:01:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/20] linux/generate-cve-exclusions: fix mishandling of boundary values
Date: Tue, 10 Oct 2023 14:01:19 -1000
Message-Id: <a0cafa6587acf2b41f0e832d06de884ffe62fd4b.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188924

From: Yuta Hayama <hayama@lineo.co.jp>

affected_versions in kernel_cves.json does not mean "first affected version
to last affected version" but actually "first affected version to fixed
version". Therefore, the variable names, conditional expressions, and
CVE_STATUS descriptions should be fixed.

For example, when the script was run against v6.1, if affected_versions was
"xxx to 6.1", the output was "cpe-stable-backport: Backported in 6.1", but
this should be "fixed-version: Fixed from version 6.1".

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2064b2f9b92e2dff45dab633598b5ed37145d0b6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/generate-cve-exclusions.py               | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index ef47f39c1b..b52c75c18c 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -62,18 +62,18 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
             continue
 
         affected = data["affected_versions"]
-        first_affected, last_affected = re.search(r"(.+) to (.+)", affected).groups()
+        first_affected, fixed = re.search(r"(.+) to (.+)", affected).groups()
         first_affected = parse_version(first_affected)
-        last_affected = parse_version(last_affected)
+        fixed = parse_version(fixed)
 
         handled = False
-        if not last_affected:
+        if not fixed:
             print(f"# {cve} has no known resolution")
         elif first_affected and version < first_affected:
             print(f"# fixed-version: only affects {first_affected} onwards")
             handled = True
-        elif last_affected < version:
-            print(f"# fixed-version: Fixed after version {last_affected}")
+        elif fixed <= version:
+            print(f"# fixed-version: Fixed from version {fixed}")
             handled = True
         else:
             if cve in stream_data:
@@ -87,9 +87,9 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
                         # TODO print a note that the kernel needs bumping
                         print(f"# {cve} needs backporting (fixed from {backport_ver})")
                 else:
-                    print(f"# {cve} needs backporting (fixed from {last_affected})")
+                    print(f"# {cve} needs backporting (fixed from {fixed})")
             else:
-                print(f"# {cve} needs backporting (fixed from {last_affected})")
+                print(f"# {cve} needs backporting (fixed from {fixed})")
 
         if handled:
             print(f'CVE_CHECK_IGNORE += "{cve}"')
-- 
2.34.1


