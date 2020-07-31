Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.18976.1596204051872124214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2020 07:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cWFnA4dh;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id r12so25381870ilh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2020 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t9deL55XnhDq9Fsg7tOAyDIDEpA3YzIKVSMLy4zTXH8=;
        b=cWFnA4dhoL4nsPQN9//pEACBdfWf4jAqWsTFz78ed2xsJ9g/vqo8+FvsDaIdtVb7pZ
         hcszLRlQQlDbS7IjiVJXUH95uii8FdP0SnqODDcsl9ZJGdEL869WXjdsrUjEUx3UEN5m
         DKF7oj+FIQHvw+GBhaG1XbK+sF79+YgwS93eztxh9zjNUP8U0JPy0JBv9VK8vE1Yo/4u
         /Rp9D7a4MrCfQjv4t0s251p7rc0AENu3/2WHGtk/axbtWEXUdFJy78lNNyu1iKhOUe4g
         epvFBYwBSAFTG5gVMSGZwqpaXa7KMneaPVG7uHeqOFORgTVC6XHBvZgUIU//OE6zH/zw
         8bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t9deL55XnhDq9Fsg7tOAyDIDEpA3YzIKVSMLy4zTXH8=;
        b=HaEfnG2IHOaQPdgOhbX+Tlk/xGD3cWOdFOGiQGnpOiPNxEAss2YQKnoGxLjSr1K2Kw
         7hi6m1TWEJQGvyq6fDTewhuuF1dnn7TWX9jnvl9I9qG5DirVJ715JyNOvo7dBI3v5eLd
         LhvZn4taP888sU01+/1XXWY0telCrIDKfwWxUpPynLJFDJwUzAiBrav6ajoY20egxNMN
         UVFhW4AAKKflcnQvFH41XZfF4epo1G6XtjkFvQYtNQBx4GOOw7fYi2nTPVLD+SsTdI2O
         9YvEUTUoBhk7jrP3/69JjycWaEdIcnG8fofpT0Av62Sd8XgOM92Yt9h0sF9GC+fzTN9o
         h9Vg==
X-Gm-Message-State: AOAM533Re19LD1bwh6Kbp+qTCUMktSpyYqwM6zomq9s+Wtz9DF7EGita
	1d5dwSkMPFM6rgJ0nFsDPpUJBpsx
X-Google-Smtp-Source: ABdhPJxO/IVqNk0e8Y1kBFDsTpwaKe6VuKUDSebiPJta1vHmpPKIxac2MwzgrpZr4N53Ya21BH1BaQ==
X-Received: by 2002:a92:9687:: with SMTP id g129mr3681420ilh.219.1596204050948;
        Fri, 31 Jul 2020 07:00:50 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:d55f:99d9:fd3b:7490])
        by smtp.gmail.com with ESMTPSA id 82sm4329097ioc.34.2020.07.31.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:00:50 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [pseudo][PATCH] db: Use WAL mode for on-disk database
Date: Fri, 31 Jul 2020 09:00:43 -0500
Message-Id: <20200731140043.29659-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the in-memory database is not being used, enable WAL mode on the
database to ensure that the database is resilient to pseudo shutting
down unexpectedly (or being terminated by the OS). This allows projects
to make the reliability vs. performance tradeoff: If they want
performance they can use the in-memory database; if they want resilience
they can disable the in-memory database and WAL will prevent database
corruption.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 pseudo_db.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/pseudo_db.c b/pseudo_db.c
index 92e4f50..ebf6e08 100644
--- a/pseudo_db.c
+++ b/pseudo_db.c
@@ -158,11 +158,24 @@ static struct sql_index {
 
 static char *file_pragmas[] = {
 	"PRAGMA legacy_file_format = OFF;",
-	"PRAGMA journal_mode = OFF;",
+#ifdef USE_MEMORY_DB
 	/* the default page size produces painfully bad behavior
 	 * for memory databases with some versions of sqlite.
 	 */
 	"PRAGMA page_size = 8192;",
+	"PRAGMA journal_mode = OFF;",
+#else
+        /* Use WAL mode when using the on-disk database. If user care about
+         * performance, they can use the in-memory database, but if they care
+         * more about resilience, they can disable it and WAL mode will prevent
+         * corruption of the on-disk database (for a slight performance
+         * penalty). Note that the database still keeps synchronous to OFF,
+         * meaning its resilient to the pseudo process crashing or being killed
+         * unexpectedly, but not to the OS crashing and losing buffered disk
+         * state
+         */
+	"PRAGMA journal_mode = WAL;",
+#endif
 	"PRAGMA locking_mode = EXCLUSIVE;",
 	/* Setting this to NORMAL makes pseudo noticably slower
 	 * than fakeroot, but is perhaps more secure.  However,
-- 
2.27.0

