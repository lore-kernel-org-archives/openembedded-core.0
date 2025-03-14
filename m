Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138B1C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 10:14:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.10653.1741947262176605476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 03:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QlJ6dRHI;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: c137.marques@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so18176915e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741947260; x=1742552060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc7GnCSApgc3XbUsf3dc8L8C/fLygXHmK6dSfbeP5+M=;
        b=QlJ6dRHI2bkUI1vmAuHDqX5VPnN5qABLmDOaFhT96ddfrGTL9ulXMIffa8sm+FSYo7
         lsIV/k7bRQ5IzAmF2Y4Ly5VyU7gDJx80wvW7fjQmfT3Kf7nKw/QMowboSQ2JGUGTVmT1
         HfbCmI8DyMMw3MjBCQ+R/ty1blLZqcRkgq6c3scPMOdqxR1pWup10MAe6uM1ezvE2to3
         haYamdVkyy8Ux2FzTFoCDtulpWKQWib6KkDUj8QKfE36laEUTNZJMzFDibrb22OrInAl
         XPJUx0PyHP0JrcDBc3yB3Rff+EupY37Kz0Y8TW5iywI9HH3stMCxEnN6/p/8uWq52YFe
         Ie3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947260; x=1742552060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc7GnCSApgc3XbUsf3dc8L8C/fLygXHmK6dSfbeP5+M=;
        b=YocoxIXyn3JfvlIvk7m44dyGLve2hYEx6P9uhBeDlgvm7zXTHHraEbU3doZ71NadFK
         Apv2VpJ4DwDpynWSh1WdKOFZpHazbhjieklMN2hnIrACr+ccL6dMA8Y3ek0hPJtdD8mW
         tBI8/5UMlm7voq9Wx1eHSiw00/OkeXaZ+0uSvUfNM0d1NWfRnWcUcMky36v7Ck4nqoa/
         fsDa5e2VB1Jt+XLLQPN1s7spfmtoT2IibcXTj+MIJiNjoeydXyLHI2ioA097V41gpBDm
         BM/51erQgPiLL56vVTe158L/YJuZfwA3fKV/t41ZCZ7h7UxQQgDj8/Gcs5WVXLEHUYgL
         cnug==
X-Gm-Message-State: AOJu0YyUOtNz91PkO4p2HcAsMLQOAtOINAs8v7Y1zd/vUqJTyNwtb6W/
	On8ncpsPccJKvZ2hIsuZ8bKo+pWC2UOE6Un//UReIZRIRLOeN1Lg8iYMQQ==
X-Gm-Gg: ASbGncs292bHut5HqPtI0TM4iiWaamgKVQAfYfYiF6qfGn5b+kwVAElKhBClHwZDez4
	ZcbtZkODWY9ByzuE8SEIuuXjxBiCsxPUSsi1cNcsMpTdOnZ9RqAQAUpI4YtnY+7NUwytT7TJxyg
	+Qjks2Wc4xPKJdxg6/U7GlaflCW1FkNoJsa2pTcYtmzZfpjx3ErkV5BZ3JR0XY2EVo7oMQ3Xsr+
	vooG7TB64kmoimW3b/xhZLyDfSzlO0z5cQycRSQCniniTUc055/zd6BW/WPtq6nPLfYRX6UWpGc
	dUhNmslAFW5BAJKab+d62LUgcS1co8l5nz3gOUQ=
X-Google-Smtp-Source: AGHT+IF6uKh28hPwJbCS3paMNn1eQJYnIsNDOOMDTmw/i8Thho+AEjxNIaYf6OOokXfNJRLDxDfIpA==
X-Received: by 2002:a05:600c:4ed3:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43d1ebfc1c7mr26428675e9.0.1741947260048;
        Fri, 14 Mar 2025 03:14:20 -0700 (PDT)
Received: from pc.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdd0sm5051206f8f.77.2025.03.14.03.14.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:14:19 -0700 (PDT)
From: Alexandre Marques <c137.marques@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 1/1] scripts: Add clean-hashserver-database script
Date: Fri, 14 Mar 2025 10:14:17 +0000
Message-Id: <20250314101417.91026-1-c137.marques@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 10:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212828

Auxiliary script to clean the hashserver database based on the files
available in the sstate directory.

It makes used of the new "hashclient gc-mark-stream" command to mark all sstate
relevant hashes as "alive" and removes everything else from the
database.

Usage example:
```
./scripts/clean-hashserver-database \
    --sstate-dir ~/build/sstate-cache \
    --hashclient ./bitbake/bin/bitabke-hashclient \
    --hashserver-address "ws://localhost:8688/ws" \
    --mark "alive" \
    --threshold-age 60 \
    --clean-db
```

Signed-off-by: Alexander Marques <c137.marques@gmail.com>
---
 scripts/clean-hashserver-database | 76 +++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100755 scripts/clean-hashserver-database

diff --git a/scripts/clean-hashserver-database b/scripts/clean-hashserver-database
new file mode 100755
index 0000000000..46b99e0af4
--- /dev/null
+++ b/scripts/clean-hashserver-database
@@ -0,0 +1,76 @@
+#!/bin/bash
+set -euo pipefail
+
+SSTATE_DIR=""
+BB_HASHCLIENT=""
+BB_HASHSERVER=""
+
+ALIVE_DB_MARK="alive"
+CLEAN_DB="false"
+THRESHOLD_AGE="3600"
+
+function help() {
+    cat <<HELP_TEXT
+Usage: $0 --sstate-dir path --hashclient path --hashserver-address address [--mark value] [--clean-db]
+
+Auxiliary script remove unused or no longer relevant entries from the hashequivalence database, based
+on the files available on the sstate directory.
+
+    -h | --help)               Show this help message and exit
+    -a | --hashserver-adress)  bitbake-hashserver address
+    -c | --hashclient)         Path to bitbake-hashclient
+    -m | --mark)               Marker string to mark database entries
+    -s | --sstate-dir)         Path to the sstate dir
+    -t | --threshold-age)      Remove unused entries older than SECONDS old (default: 3600)
+    --clean-db)                Remove all unmarked and unused entries from the database
+HELP_TEXT
+}
+
+function argument_parser() {
+    while [ $# -gt 0 ]; do
+        case "$1" in
+            -h | --help) help; exit 0 ;;
+            -a | --hashserver-address) BB_HASHSERVER="$2"; shift ;;
+            -c | --hashclient) BB_HASHCLIENT="$2"; shift ;;
+            -m | --mark) ALIVE_DB_MARK="$2"; shift ;;
+            -s | --sstate-dir) SSTATE_DIR="$2"; shift ;;
+            -t | --threshold-age) THRESHOLD_AGE="$2"; shift ;;
+            --clean-db) CLEAN_DB="true";;
+            *)
+                echo "Argument '$1' is not supported" >&2
+                help >&2
+                exit 1
+                ;;
+        esac
+        shift
+    done
+
+    function validate_mandatory_argument() {
+        local var_value="$1"
+        local error_message="$2"
+
+        if [ -z "$var_value" ]; then
+            echo "$error_message"
+            help >&2
+            exit 1
+        fi
+    }
+
+    validate_mandatory_argument "$SSTATE_DIR" "Please provide the path to the sstate dir."
+    validate_mandatory_argument "$BB_HASHCLIENT" "Please provide the path to bitbake-hashclient."
+    validate_mandatory_argument "$BB_HASHSERVER" "Please provide the address of bitbake-hashserver."
+}
+
+# -- main code --
+argument_parser $@
+
+# Mark all db sstate hashes
+find "$SSTATE_DIR" -name "*.tar.zst" | \
+sed 's/.*:\([^_]*\)_.*/unihash \1/' | \
+$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream "$ALIVE_DB_MARK"
+
+# Remove unmarked and unused entries
+if [ "$CLEAN_DB" = "true" ]; then
+    $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep "$ALIVE_DB_MARK"
+    $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused "$THRESHOLD_AGE"
+fi
-- 
2.34.1


