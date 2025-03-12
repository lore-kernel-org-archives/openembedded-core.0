Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFADC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 11:24:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.34794.1741778667198695135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 04:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GeZSkiEa;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: c137.marques@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso39380745e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741778665; x=1742383465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwHZlrQxqKdq83SGNNv6M0MXyEqc3mCAb0Vq14TraD0=;
        b=GeZSkiEa1KshAxR+XtieHxVsUZU4GW6TD3lY2PTJXXdU8YAuO6Ya8xp6b+jSS2eKwy
         yjcDp7OfqQH2lw5wK1+kDhvhWGyxbSI9tk4IPrccP6iXlfFynTX0N35lRY4Sg8Me2FLA
         ekJLOtiD37LGJ4tXzVk7f8xyGlhR5I6/L0OIOTaMB5Tg1HZ8Rs+Z3Byr0qj/JPeSLRuh
         1Bk0wUUWz30TKLmUMHYMaE6t+FsuVk8jbdMiTHSo3GkB9EcG8skDZMcuAarOOlnCrS7X
         nRzVFcHNc3U/0fZaetoa4as66xBCZBCMhvwshWqZr6h3Zjw1QhFBjf4U+nRNUCVr1sNu
         Pd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778665; x=1742383465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwHZlrQxqKdq83SGNNv6M0MXyEqc3mCAb0Vq14TraD0=;
        b=jmvXGF5otmhPMpnHP9ANxbXAMldv8bDwll0FsorFYivKQi2mhhmHJRkgk3dzG2Ks2S
         bMidNtqE7rGwxEZU1JBVGw4HM591I1CK1GSrmyEHqoh4OhE0BwRNhukTRtKapOUSn+3h
         pob9/Bcc+NdyVm+0vf73/JqP1Qpnnk8e8e2lVSz+6a9ZekGdsn7Ns0tKi3qpEb/AA3xx
         eHvjepBbNCwMy5PwbdshjS1Sc0kYhYpgvVSC7YO8qNB8mAXryRdm2eWdKmx5l2MB4VvI
         oYvq5lSjBNZnYiH9upFao0TReL8vfV5T8XDEOD5Dm9IXQRS4608iADdAW7ZgdKraY1A3
         HHYA==
X-Gm-Message-State: AOJu0YzvAwAx+okqYIX+0Hk5SubJrL0viCAw3E7xtvyP/ugqfSZJ/F5v
	0F1GudN+g7JKOfUjdfw+IZPpvbnjH75JrgphdVVYHNujw1qTI5uMbkFpmQ==
X-Gm-Gg: ASbGncttEKQFw37w9q/yLGR6C+X8c4fDqEX/Wgo9yphW3+3sBZf9V/rUKCgfK+zJq/e
	YfRbq/vbH+BFhYpcDNXtVq5tJAc5zzNlOoD0xXGZLxAWRjJ9bZwm48XhiTJLC3N4bHjMl41/9Sb
	oT0F2qrd/VZ3UucZlt0lf4lumHoFKULxciBBST3CdQuNQC5LIAyCNZFDRcU4tO06gKCD+rpQMit
	otHpm8NMPnlff7vwlTwf/dR39f7M8WTqhNVYTKTES0Y142uD58WsGRrZWJPvu0tnVjLLbeKG6Hn
	5vtmDfDwZPVqymD6rf6G7NBNt1ue0j1pglHKeMs=
X-Google-Smtp-Source: AGHT+IFuGACIELK0o64EfL2klqGQBr+XZWBhXR9DH1kdo1+UxtnOpewHe5W+BhD1uS8ii9TtcIdQhw==
X-Received: by 2002:a05:600c:3ba3:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43cfcbc97d3mr120933855e9.7.1741778665083;
        Wed, 12 Mar 2025 04:24:25 -0700 (PDT)
Received: from pc.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2bacsm20757586f8f.78.2025.03.12.04.24.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:24:24 -0700 (PDT)
From: Alexander Marques <c137.marques@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/1] scripts: Add clean-hashserver-database script
Date: Wed, 12 Mar 2025 11:23:51 +0000
Message-Id: <20250312112351.781019-1-c137.marques@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 11:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212644

From: Alexandre Marques <c137.marques@gmail.com>

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
    --clean-db
```

Signed-off-by: Alexander Marques <c137.marques@gmail.com>
---
 scripts/clean-hashserver-database | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100755 scripts/clean-hashserver-database

diff --git a/scripts/clean-hashserver-database b/scripts/clean-hashserver-database
new file mode 100755
index 0000000000..6eb006758e
--- /dev/null
+++ b/scripts/clean-hashserver-database
@@ -0,0 +1,73 @@
+#!/bin/bash
+set -euo pipefail
+
+SSTATE_DIR=""
+BB_HASHCLIENT=""
+BB_HASHSERVER=""
+
+ALIVE_DB_MARK="alive"
+CLEAN_DB="false"
+
+function help() {
+    cat <<HELP_TEXT
+Usage: $0 --sstate-dir path --hashclient path --hashserver-address address [--mark value] [--clean-db]
+
+Auxiliary script remove unused or no longer relevant entries from the hashequivalence database, based
+on the files available on the sstate directory.
+
+    -h | --help)               Show this help message and exit
+    -s | --sstate-dir)         Path to the sstate dir
+    -c | --hashclient)         Path to bitbake-hashclient
+    -a | --hashserver-adress)  bitbake-hashserver address
+    -m | --mark)               Marker string to mark database entries
+    --clean-db)                Remove all unmarked and unused entries from the database
+HELP_TEXT
+}
+
+function argument_parser() {
+    while [ $# -gt 0 ]; do
+        case "$1" in
+            -h | --help) help; exit 0 ;;
+            -s | --sstate-dir) SSTATE_DIR="$2"; shift ;;
+            -c | --hashclient) BB_HASHCLIENT="$2"; shift ;;
+            -a | --hashserver-address) BB_HASHSERVER="$2"; shift ;;
+            -m | --mark) ALIVE_DB_MARK="$2"; shift ;;
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
+$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream "${ALIVE_DB_MARK}"
+
+# Remove unmarked and unused entries
+if [ "$CLEAN_DB" = "true" ]; then
+    $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep "${ALIVE_DB_MARK}"
+    $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused 0
+fi
-- 
2.34.1


