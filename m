Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5F7C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:19:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.11304.1741861148551022262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 03:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXo4lcdX;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: c137.marques@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43948021a45so6350355e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741861146; x=1742465946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IrEoIi7YCEyddwUcvq3ocA8GCqmShkwRVZLIztuxD4o=;
        b=fXo4lcdXcupxAuHR/5oxEROV4oBLQnkYbp+imcbA40dJyAIO6lmBTdCVKElT0ZEGZO
         Bdy6kToWfkGa2q3UCoHJ2mbgjnP+svgcM/ITywc08mMzoYjOOrwmqR4YmszuJU4EjcUy
         7aZ+1Nxomgph1fB2h9JdIUAr/f6JQSWz38uSTKkUoUIxHDq7kZJzEMGTf3mT88hxmN5J
         kjiTaF+aORYBreO9RX0QD+Wl++rd9rwe5CJyI7ibHsyR8SYDV0CLr5hw7y12mBdZaouG
         pS1ZWnl35ReSFIC1NZk37lgWiwOhdAWTQJFtYoJy9rHM+B+tM2gzjk4648mYwt5rLx8Z
         4Sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741861146; x=1742465946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IrEoIi7YCEyddwUcvq3ocA8GCqmShkwRVZLIztuxD4o=;
        b=kb+bt6faeE+1EVcDP617crSiv5tbekS820n4cSFuJzdNkEOsYO/YBKsU/xsOnuDCs7
         eJxoNKglWlYbkeuu7W2H3ywiGorjenk0AiMcYnG0zxlwcxZItZNrVZt0FFQkVIs8mbRp
         8p7O6Dr2p2l9nqTIsy2c3nPbLGeAJLwuz12kvdxd6A5doh0amPz0as0szNZTxNDBNNID
         7KTCc5cDTIkN2Ibfywmwma3zrnYG2kbjGFb+Q6mg2jhh9BA8Sv/Ca+GnXCRsCu1gh7I5
         ECw9eVXZtdhaPYbbuOhkZadpt7jqT2Ao655J50pXhm0zkhqWZsbnO9LQnDYLpTMmiYAJ
         z2OA==
X-Gm-Message-State: AOJu0Yw9JEEvElBw4tUNnFQWk4kWYBQy5V+NxV/UXAQ+BL1csV1mUSaQ
	wA8qBcJWe+UdugBqTXSVzbH4Js8+ffy4ZtfvnLhwZbA9d+moJYbrSsIBBw==
X-Gm-Gg: ASbGncunxdgdRRr5kfnmNqumr8J6OmdtJb1Sbfr0d+DELKRWEJY8t/RyjzS/jxpttTt
	MMlKieSoBUPmAhOc057uVHSstYjQzSmjUI5JmCRUE6BisMJBADSglpWh3yDlJ05PF+Xd/Z5yMBo
	8bU/oHtB6v8ih9c2lnvYv6+vmyb9nkt1vn587TirhJQwqwaPNAO4rjxvg3AjFlM3XBn2xGjNo7y
	iNcCyvfAcN1ZJWuTR9mh5rGYtZU/BrxTRzQwyJFg6d+MMwm/5tPyK2gZSNAhYFsOx8OFN4ISMf2
	JGWToZEwy+lusJc1GWkfsCi/gtAMixuQLGCCdYs=
X-Google-Smtp-Source: AGHT+IFcnoXZPPDXgK9pZjFtigqNrpNgEFHasOSIZvL4TkDpjCwl0NmHXxuuqUQYtNatLZ7SFFYnyA==
X-Received: by 2002:a05:600c:1547:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43cfceb0aedmr153677835e9.11.1741861146261;
        Thu, 13 Mar 2025 03:19:06 -0700 (PDT)
Received: from pc.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c3a3sm15302815e9.34.2025.03.13.03.19.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 03:19:04 -0700 (PDT)
From: Alexander Marques <c137.marques@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 1/1] scripts: Add clean-hashserver-database script
Date: Thu, 13 Mar 2025 10:19:03 +0000
Message-Id: <20250313101903.108271-1-c137.marques@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212755

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
    --threshold-age 60 \
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


