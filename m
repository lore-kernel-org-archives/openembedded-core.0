Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE59C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 14:58:20 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.8230.1648652299275586773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 07:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uYYi67mg;
 spf=pass (domain: linaro.org, ip: 209.85.219.46,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f46.google.com with SMTP id b17so7361950qvf.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NSZFYDxztgQ2HdPKYzz53uFvLI7eEmSNPFkXUdyByeg=;
        b=uYYi67mgqeyoIwFJIEuyJRR/BwfGSeJwwbsYyJbuhdCg+s3yVJ7gAi0jXvjWztiJgG
         IFqNNV/hPxXAD/tz0PNARSwOCCrzK5vd9xtPOz103e+6+QsDAxpuqvzaT6FScK7ykXN7
         fTQ1+naTJ3MgYXjeX5VnWylopdll4zJXvD9gQncmCX/Nl/8kNO+KsFSXPaBB1soB5Hdw
         60oCQi/6yi1EraNV3OP3j9vNE3APOtAMruuAQEIuTnhgOiBDdBlqdmMey7GTe8IT1ZTR
         2RlK/MIEv4dbzBXJb+PrF/2ZCglZ1tsqSyaIH1qwCovSzL1iDk2Qp3QgJ8jMiD6Id3WS
         6wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NSZFYDxztgQ2HdPKYzz53uFvLI7eEmSNPFkXUdyByeg=;
        b=k039hgdX3qUfWtrYSDNaYTlZmGOQtekEgfTV5dtFERVmiF/KbMW0UwKgylPQ3h0BLQ
         qydUQWV14RgVDycbTRtf03R4gKrTokWzaXXM/VAi5gxX3fJ2bViKRGhk50FGQeymcysT
         AmjSUrlSCHyXq3c/YVaD9UsZewfvd1idNFd70Wov2qOWgx60fbP198NdHor2hplVHt8m
         YTYbscAjn/fDT24lw8rPGOZKVmJIMun/zoFnoD/oNAzmiHhAt62GitIp/UCoP1i0q2eA
         b3YC0NI7RgIFrmLwQhuBqy83uvHjzaE3EXOvlzi77kpeLQyre1afBTD/0v0R9vj/H2TZ
         3+IA==
X-Gm-Message-State: AOAM531Y2oEdk1UyUDYG9gkLjDkMGfB2SfARfomVuS8oapvpOp4/g12/
	MlLZU/4ok+9nhi5xXpf3m75StxFoNtj9gw==
X-Google-Smtp-Source: 
 ABdhPJylyw8PnS9SPkgQsMg7WGIFArk55J+cVO4ffBs1sIGgW6BDeq2N3enAyZLU6hAvxM5SezFyVQ==
X-Received: by 2002:a05:6214:2422:b0:441:2f0f:4739 with SMTP id
 gy2-20020a056214242200b004412f0f4739mr32049540qvb.44.1648652298431;
        Wed, 30 Mar 2022 07:58:18 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 a9-20020ac85b89000000b002e2072c9dedsm18471428qta.67.2022.03.30.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 07:58:18 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [RFC PATCH] cve-check: ensure database is closed on error
Date: Wed, 30 Mar 2022 10:58:16 -0400
Message-Id: <20220330145816.1574902-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 14:58:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163786

In case of an error during download or parse of NVD JSON files, the
previously opened sqlite3 database should be closed. Also any pending
transactions should be flushed using conn.commit(). Otherwise there can
be a "hot journal" left behind, which can cause a subsequent read-only
connection to fail.

So instead of doing "return" to bail out early, instead "break" out of
the loop. The existing conn.commit() and conn.close() will be called.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---

I'm not entirely confident in this, would appreciate a review by folks
more knowledgeable with python and its sqlite3 binding.

Some further backround information:
- occasionally the cve-check process fails with a traceback error of
  "attempt to write a readonly database" (see BZ #14110)
- the following commit was added to mitigate:
  440f07d211 cve-check: get_cve_info should open the database read-only
- but evidently the original error still occurs sometimes

Current speculation is as follows:
- the database update fails for unrelated reason (network issue)
- this leaves the connection open, potentially with some updates
  queued (NVD data is fetched with a separate request for each year)
- if a subsequent read-only client tries to access the database, it
  can fail because there is a "hot journal" from the pending
  not-yet-committed changes, which cannot be processed since the
  connection is read-only [1]

[1] https://stackoverflow.com/questions/30082008/attempt-to-write-a-readonly-database-but-im-not

Therefore we should ensure to commit() and close() the database
  connection during NVD update, even when there are errors.

 meta/recipes-core/meta/cve-update-db-native.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e5822cee58..19863c059d 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -75,7 +75,7 @@ python do_fetch() {
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e.reason)
-                return
+                break
 
             if response:
                 for l in response.read().decode("utf-8").splitlines():
@@ -85,7 +85,7 @@ python do_fetch() {
                         break
                 else:
                     bb.warn("Cannot parse CVE metadata, update failed")
-                    return
+                    break
 
             # Compare with current db last modified date
             c.execute("select DATE from META where YEAR = ?", (year,))
@@ -104,7 +104,7 @@ python do_fetch() {
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
                     bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
-                    return
+                    break
             else:
                 bb.debug(2, "Already up to date (last modified %s)" % last_modified)
             # Update success, set the date to cve_check file.
-- 
2.25.1


