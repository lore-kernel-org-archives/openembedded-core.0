Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C42C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 16:27:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.14186.1741710442315323883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 09:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwf17WLx;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: c137.marques@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390f5f48eafso2830151f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710440; x=1742315240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=92WNjD1V1PR0dTu+6dHUy3i0dzFQMNiAyvqJqDe1Ig0=;
        b=kwf17WLxn3yngwJL+6ZVkt7The/9DKft5JmFxQKzJI4sRYPKZqZKyIv2kctEx9HduX
         U1qb1QrHxztF2vJweDfWKTvr0KPd27A3ScAE1Br8rWVC+OtfsHKWfzfu3cffYJdKH8qd
         xCT6IJIP8x+Ct68AoFJD0Yc0HYpPovObOIqCKNYdCLBKj/wz4G/lZT94EIqW3q6b2FDq
         cbNPeCTU4KEq2yv85tYij0G3TxNgdMvvzb/CXXPYWADVnCZGzTOiNhD+FEyoTtLGvdvB
         oaVvVPBOUpaJADqeW5fu2Pu1FZyw516di2NFmD9pMe7QlmFIT/HeNUlcmlryc+8VYA66
         QCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710440; x=1742315240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92WNjD1V1PR0dTu+6dHUy3i0dzFQMNiAyvqJqDe1Ig0=;
        b=u9iBVUbYFK/OYm8r0+FiactGASwI2czYAB6yKx1p7tcVTmxinugMRIqtzFcIfseTAD
         +Y9I923jr6g+G/uaIIZQe5HxnwWx3OnjWbPlyltElb5gooY798t9VOq8bGXhbrdEbmej
         Kp+2t7aXqb0rMVTIQyEV549Yw71SGowVNdRfNtndhvL6MMdQ/BiXPh0POrp1BTbYo27J
         8zlTgr/S1S2GPjFnM9YUJOOJ1BuSp4uqdy+HhnovaCLwH8eQuwO3eBFDLlxWLEkm4d1X
         JCvhmyTBTK+eeTDldr3Jb8JEPj1lBsKZBNCc4EJJCnx/TeE1yzPLpt8R1rfcnoNQPLF9
         SehA==
X-Gm-Message-State: AOJu0YyoajMso9QGikgFJrgDUWqVu/8Y0kVsXK7OMUg0+b5XEQZGvZq7
	txEi4K9992vae9ukf7hnD6gnJhcAuqlVpeIBzEGwiVd8Od7UUv56V1CZXA==
X-Gm-Gg: ASbGnctlDl70cTloDdFEVJwzAcCEloA6G6oI89hmxRNZ0pxAo0QpYbdqKZ6b5L0140i
	cdLbDMBky6EUGeKIla42k88qTqtNNK5AzkqyeIjrHmVR9W2YDAMf3W/Z1DZXL+SmKvBzAVl47OK
	h1lZPQ85MZ3rdPv3sMhLuXYlB+8j/dJLrDYMIrz0HnUqMrqOPfPb/jXr8GoUETv11YK7BI1ww+h
	UytiFbax9W+h1H1bBYDabAUWLjJQh3vFlk6YgYWfKS2emiGNLAxh1Q6iHMFm+xWuYyaBcjDhLFR
	li1cLQArXGwvpv0xv18/WSA5+Abd5OEy2HbHy/G+FR21SvFimg==
X-Google-Smtp-Source: AGHT+IGR1XbWF5OTIO/0kpu8udOxodkeK0kpV0cFPQnbzxdrBCH56VwjEihMZlufPO51fuYO2uwEQg==
X-Received: by 2002:a05:6000:1842:b0:391:2e97:577a with SMTP id ffacd0b85a97d-39132de2e83mr12546300f8f.55.1741710440190;
        Tue, 11 Mar 2025 09:27:20 -0700 (PDT)
Received: from pc.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm18294962f8f.3.2025.03.11.09.27.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:27:19 -0700 (PDT)
From: Alexander Marques <c137.marques@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] scripts: Add clean-hashserver-database script
Date: Tue, 11 Mar 2025 16:27:16 +0000
Message-Id: <20250311162716.448364-1-c137.marques@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 16:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212576

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
 tmp                               |  0
 2 files changed, 73 insertions(+)
 create mode 100755 scripts/clean-hashserver-database
 create mode 100644 tmp

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
diff --git a/tmp b/tmp
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.34.1


