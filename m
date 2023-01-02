Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E10C4167B
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 07:03:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.30694.1672643024931596495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 23:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JUaoVfAs;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bn26so6123520wrb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 23:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MfmoWgyf1XPBqNg37Ick/eoG4m71y3SFoQp5YHRb6f8=;
        b=JUaoVfAsLYLSWySC7gbliWBJftqFu7Od73gcmEEziWfaBib1v/CCKEgl/pceCL9xXS
         rnQRZPjeA2u0bCUdx+njeDurxNmzNYNtk5bfO18sJzkzkt03g4xzYdmnPrjQxogPRIG7
         D3Po68JoX1sLZ70v8Gmjnn5gt6ICTQkgLOs5byNUsxZrszGHG8cRRweIQkrXjO0pcJbV
         mRuepIOFtV5yf1Wd+Uv2GfouNjIC0+JQGqzWg0nstFRa+SMQNLOlyQ3B5HnnaST5M+P9
         5DlzkxiToPz90WlN1G0K1VM6or0kSxINK/TKcujKRTDwRTxJ/7LOK+rSLkqb56Fd6Lbp
         FVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfmoWgyf1XPBqNg37Ick/eoG4m71y3SFoQp5YHRb6f8=;
        b=mCTliAy02IvmO2sJ9C2YFz90knu6LYmtcOXoLRjXiZjBBvh4Ly53KwzBT4cIzMKtDM
         RXIaQW4ay5tefLyylPv3T8Ll7KonnXI7OMDJmQdpdgwxdUTATFwslpbtWIj1jiVowKP9
         Ikg3hjX/8JIxKVI1BJ8gzeQOnzsvFGByQkpjbOUN1VZjT0GNBH420+yrHvKt7xd03saM
         gfuGd9AxHCav43BsCXoRqNtNJCAhBVv7atUUTMayqZO1rFOKK8iLfutHUbOVXsNfs4hj
         6PYyY4Nq0d50XUkAqonHG2OScmJnowsh3nWeJ0Cft+2+wdlA/nsUJYO1oehBXM0kOiwe
         F+ZQ==
X-Gm-Message-State: AFqh2krEOUtFJsME/XhxNyRlrh6JJ6tWS1SX8G95g3cgMOwKW9kncw+P
	Q68/Kvw2hHG1WL2V/AdF98yGHckN7hs=
X-Google-Smtp-Source: AMrXdXujjijCOC7c3bBOIN2Gi8PdRvJYc6WKVTiWAaPwPkCJgDzrGhAN7yQJQPwhyqrRoz5rj61YgA==
X-Received: by 2002:adf:9788:0:b0:242:4a49:f7d7 with SMTP id s8-20020adf9788000000b002424a49f7d7mr21937093wrb.2.1672643022773;
        Sun, 01 Jan 2023 23:03:42 -0800 (PST)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id l7-20020adfc787000000b002238ea5750csm33587582wrg.72.2023.01.01.23.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 23:03:42 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@linaro.org>
Subject: [PATCH 1/2] cve-update-db-native: move download cleanup to a function
Date: Mon,  2 Jan 2023 08:03:26 +0100
Message-Id: <20230102070327.55373-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 07:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175313

Move cleanup of the database after a failed download to a separate
function. This will be useful when we have more actions to do in
that situation.

Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 9b9dbbd75f..642fda5395 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -44,13 +44,7 @@ python do_fetch() {
 
     cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
 
-    if os.path.exists("{0}-journal".format(db_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_file))
-
-        if os.path.exists(db_file):
-            os.remove(db_file)
+    cleanup_db_download(db_file)
 
     # The NVD database changes once a day, so no need to update more frequently
     # Allow the user to force-update
@@ -134,6 +128,15 @@ do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
 do_fetch[file-checksums] = ""
 do_fetch[vardeps] = ""
 
+def cleanup_db_download(db_file):
+    if os.path.exists("{0}-journal".format(db_file)):
+        # If a journal is present the last update might have been interrupted. In that case,
+        # just wipe any leftovers and force the DB to be recreated.
+        os.remove("{0}-journal".format(db_file))
+
+        if os.path.exists(db_file):
+            os.remove(db_file)
+
 def initialize_db(conn):
     with conn:
         c = conn.cursor()
-- 
2.35.1


