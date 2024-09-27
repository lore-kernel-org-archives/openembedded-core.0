Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF33CDD1C3
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:53:15 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.72641.1727452389938468215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 08:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W56C+18R;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5dfad5a9c21so1260063eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727452388; x=1728057188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFHl+XZT/DuAQZ2A92ga43e027S+TiGjJyLSRSjCQ0s=;
        b=W56C+18Rop4dkDlQQgtBOVWv99AyftVVUgePkEHrRDDc33AM70B47hX3sqF41HWomb
         jKUHgGlRQecScl+NidpzLNuGyu9hxxJGw2W2gcj5nBkHEX5xAAWZot6atT4xV+dozI/Z
         I6xhIiRkHiqdN6JSMmwJY5B+aQlEpFKTxRdlR3UtRTCAsbPbIeqwtyGPM10Kr1H09sds
         i77IURuKkEitVeZId9niqnM2sUTIBWCjvFTcuj97oUNlluEKta/tTRwXw0Jo29tr2ckN
         EBHgGbnCyASFSimps1CUT+ztBN5FoXINnl0E97Egj9fo++wqdjfn91PncrO2h1cz6obY
         CIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727452388; x=1728057188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFHl+XZT/DuAQZ2A92ga43e027S+TiGjJyLSRSjCQ0s=;
        b=rvMleltfuFwSabVUQ9B5NbDYuYJwwJKvGmX6UvYHmbe0WZfJ08bSkqi42MMlZMdqO9
         Nox85YiSpmyKHpIBeU47y7WbVDV4GjNY3Um8OBshRLKRE7ZzilWtrK+b7GdGyXIbpT6d
         1YirOyKYQVhTXu9VQlBreXlDWa3eR8so6XH2HJVAbQeRKG6rjBB6e0xvoNw8jeJQKiR6
         aMbhyNXKxcRH2cZxIWb2jmIX9tF2uWHFZuM1HI80zZ3yufUeGRnMxQEVIi6Nq9/AYy2g
         Os1wb79VK3hMW+VPnoOF1xxEqB3lkzvfZfln8/ldLEwoAf1S92ZDZ7nypuWgCmTIo4Qd
         lybg==
X-Gm-Message-State: AOJu0Yy2pJSveCMIUXAADPDBMjZiOaBzuFrQJnBtNvxp/6JlkqGhnA2a
	5qa1jX+O65HzM6PmVdDc29BHb6+qJD3pfqIkGIQZHw+sgC1PrOlpt6gsNQ==
X-Google-Smtp-Source: AGHT+IGVOdYw1/Jx38jYtbKjdSiR4aIi//Re3rIS5lmnVd9rTeRxDGFDI485+iIouqc/4zobgC+z5Q==
X-Received: by 2002:a05:6870:3281:b0:277:d16e:1425 with SMTP id 586e51a60fabf-28710ab1749mr3867893fac.20.1727452388618;
        Fri, 27 Sep 2024 08:53:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8a23])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2870f778f1bsm698589fac.1.2024.09.27.08.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:53:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 4/4] Add script to make SPDX bindings
Date: Fri, 27 Sep 2024 09:51:57 -0600
Message-ID: <20240927155247.1012846-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240927155247.1012846-1-JPEWhacker@gmail.com>
References: <20240927155247.1012846-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 15:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205034

Adds a script to generate the SPDX code bindings

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/contrib/make-spdx-bindings.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100755 scripts/contrib/make-spdx-bindings.sh

diff --git a/scripts/contrib/make-spdx-bindings.sh b/scripts/contrib/make-spdx-bindings.sh
new file mode 100755
index 00000000000..31caaf339d3
--- /dev/null
+++ b/scripts/contrib/make-spdx-bindings.sh
@@ -0,0 +1,12 @@
+#! /bin/sh
+#
+# SPDX-License-Identifier: MIT
+
+THIS_DIR="$(dirname "$0")"
+
+VERSION="3.0.1"
+
+shacl2code generate --input https://spdx.org/rdf/$VERSION/spdx-model.ttl \
+    --input https://spdx.org/rdf/$VERSION/spdx-json-serialize-annotations.ttl \
+    --context https://spdx.org/rdf/$VERSION/spdx-context.jsonld \
+    python -o $THIS_DIR/../../meta/lib/oe/spdx30.py
-- 
2.46.0


