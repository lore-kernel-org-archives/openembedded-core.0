Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA62C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 10:22:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10739.1741947735817453240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 03:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=INsK/Csn;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: c137.marques@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so1120509f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741947734; x=1742552534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVd4ge1cWPchqTF4c8llDqSuVGrye0P1Giq9fe+/lrs=;
        b=INsK/CsnSUP/LOi1PKuDgupQ4NZm5aEhYEVY+GmSHkjK6dDma2RaZZKbJHk25coa8y
         w2+wh07/slOAB/pz6KkruLHTVKW7BMH3rDFQYPbONvfFNMDG/i4Tu9dS/QIddrKP2H8X
         THEqXjlHzTDBRBLULHMrjm7mS2HNP8Iin+UsW3mByhs+WWjZa6FdXozYJa9MO2YCxL0I
         94AC2d/0dUgSX//bdfeEnmiH3sM+KuZ8bb48HAbcQ3GSKFYH/dBUt0BthiZJKM61GmOk
         CXyLh8esl4n2GdvCiH60MecCBXyU5UU/6A2DxH5C0oDjZQp+V6Oy1bZLWz5lFjJ42qtq
         +1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947734; x=1742552534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVd4ge1cWPchqTF4c8llDqSuVGrye0P1Giq9fe+/lrs=;
        b=lw8Mp1qJt7pEdRl0yTrEilqPGLEIaflndsF2xqts2kL1mvD3wOwMB5jNbPOgFkHvO3
         62w5adEJG7Ue7N/wfVAKfeSM57/1Mu3dU/5Hr01LVziq7n0pcSAPhPczR0O2Ht69TqTf
         noDNl3WIBP1TPB2YCDlDPbUj9hiRx6GPwcg0OiwEXsF/5f4nuWVpApZ6MaHE5jiuuVHu
         fkIcsMLzIn6wHxJqptlTmjUOYvw9WcP8aBLy9Sl7gExtOwuYWIWpFneSE1pCFD1E/Q+L
         yK4iYGOk9x+S24GGl3bOd0IgXpPXhKOczp5fFXjA8rJ18/oSeOndgJQEHVllilDaIArD
         9UQw==
X-Gm-Message-State: AOJu0YxDKaI0GXn8h0xMSO3l8Ah5KtMkTD1n5pZmSLSkTYbwVJQw5Wrp
	8CXbrQq5ZUSL3nIvZUENPzzi160nbvb+Hn3rg132H4ghPtV4X1mgD9Fhtg==
X-Gm-Gg: ASbGncuhHFztD4YOLRQJWX/7KpZ9VW7cqtBxf7sl7K+6XaL9IHCojHyx6v4ngUBgl2t
	7v5R3WcfpCIRtxockcrmRQmR++mehowqfzQmirxm6jYetYuFBJI3TUfr6pyZJnOOKQHRI21x0N5
	GvcC8cJvLRpjgTw27lu9bu/WO0eeN29PW015hGYxTEFTH9zTUHVtTIg0T5dDcjkWzbhq9hlYxXY
	goFpXZugR9NnxaYcYvGPWkpVCZi8gevdLu7ldVddjzD6T8JOXxO7KazOGiPy0EuNPup7YXJ6hEX
	PhGdGc+FSxYMsfGs3iYT/C+DmbcYmmZX1tvzhMUMO3dlkFEaqw==
X-Google-Smtp-Source: AGHT+IGX2ac8ETHi6X78k7Y/O70ysHYkRRaDGOjujeRDC2u5Jxq/MjAYM6nPXtj3swCJMfy1Oa1XKg==
X-Received: by 2002:adf:9bd0:0:b0:391:3094:d696 with SMTP id ffacd0b85a97d-397200ac6e2mr1944360f8f.54.1741947733648;
        Fri, 14 Mar 2025 03:22:13 -0700 (PDT)
Received: from pc.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a1csm4996815f8f.28.2025.03.14.03.22.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:22:13 -0700 (PDT)
From: Alexandre Marques <c137.marques@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 1/1] scripts: Add clean-hashserver-database script
Date: Fri, 14 Mar 2025 10:22:12 +0000
Message-Id: <20250314102212.98353-1-c137.marques@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 10:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212831

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
 scripts/clean-hashserver-database | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100755 scripts/clean-hashserver-database

diff --git a/scripts/clean-hashserver-database b/scripts/clean-hashserver-database
new file mode 100755
index 0000000000..9fa162c981
--- /dev/null
+++ b/scripts/clean-hashserver-database
@@ -0,0 +1,77 @@
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
+Usage: $0 --sstate-dir path --hashclient path --hashserver-address address \
+[--mark value] [--clean-db] [--threshold-age seconds]
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


