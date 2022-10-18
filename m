Return-Path: <debrabander@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D89C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 16:38:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.9523.1666111077650990384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 09:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OopKpiyQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: debrabander@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a26so33455755ejc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ga90glDR9yJf9DtHIcO82FPc0tN9nNIxDquGgeansSY=;
        b=OopKpiyQSlhGGywbguHQqEwj9/P5yUPDi0IL4Z+nMib0PgQJ6NIVq8qwmIToLHFEy2
         I9FcS4K8YoWLlEPY2ZjRprtahw8exHNJ1aVCeYl8pzx9NMm/zeSf3AGbsmaeaxd83D7R
         zb5xqLgxMkaGW29U8cSc3tcTQyrm/29imqIr1rrYDUpIqqhkstNiEWoKFqShAblE2ats
         z/uh3b1bTZ2z7rMFh9p1fpY/p1FSvF0k9tT6Q+HRz5Z+7U0ua75KR2tOU2CfMGAB0tZB
         K9J5PBE1QLCuiytzDhJgnoXHJmP4Fl5H5oYzntydGr7NQyNUFa9E6KH/Z4ot59cD/J6g
         EhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ga90glDR9yJf9DtHIcO82FPc0tN9nNIxDquGgeansSY=;
        b=Y3II3ZfH4rPVYGx7KDoNI6xYjLpqSUMohnZsUXOwcFY0AFHtprtMmb4Njn43u51Bjk
         kBjPZID8bPWukqJ1Iy3ICMAXyOS5Z88vByu8IfoehRKUHRroRJ9CVjB1xfLterbS7o6j
         98boHtrPN49coNpunTFrIlAD4C5bgegj3jpv9f1YfpmxdHP5zOeAdP1w72Hf0CKG6WQp
         sxReZ7xHRD4/Tg+l/SZXEZ9nzeK37nxtEuA65FmFkibob2fu7E5+g3Ym89EjmX0hGbz8
         cOXb3zJay1modN/IzXQjVra8RW8DsafJ4T3uQmfCmg59qKuqcdNisc6b2+s+fyvFYmH+
         QVnA==
X-Gm-Message-State: ACrzQf2VuleN6ipowyErqrKQiqNPpE3Tb9nlRYu7smEBElvEF9XsCu2u
	EaC4ipwe/ajapE1RhSR9R4AQSQQgWAO9Eg==
X-Google-Smtp-Source: AMsMyM4xreCOjjL7Ikuf+TzJEuKyQeW7kpB4EwCBOZK3t/2Tw6Plmb6GChetJ2/q20qVd07nYbC3Ig==
X-Received: by 2002:a17:906:730d:b0:78e:9ca5:3269 with SMTP id di13-20020a170906730d00b0078e9ca53269mr3147899ejc.366.1666111075621;
        Tue, 18 Oct 2022 09:37:55 -0700 (PDT)
Received: from buster.foobar.local (186-153-172-081.dynamic.caiway.nl. [81.172.153.186])
        by smtp.gmail.com with ESMTPSA id u8-20020a17090657c800b0078c1e174e11sm7692976ejr.136.2022.10.18.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 09:37:54 -0700 (PDT)
From: Frank de Brabander <debrabander@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frank de Brabander <debrabander@gmail.com>
Subject: [PATCH] cve-update-db-native: add timeout to urlopen() calls
Date: Tue, 18 Oct 2022 18:37:51 +0200
Message-Id: <20221018163751.967-1-debrabander@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 16:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171945

The urlopen() call can block indefinitely under some circumstances.
This can result in the bitbake process to run endlessly because of
the 'do_fetch' task of cve-update-bb-native to remain active.

This adds a default timeout of 60 seconds to avoid this hang, while
being large enough to minimize the risk of unwanted timeouts.

Signed-off-by: Frank de Brabander <debrabander@gmail.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 944243fce9..9b9dbbd75f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -18,6 +18,9 @@ NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
+# Timeout for blocking socket operations, such as the connection attempt.
+CVE_SOCKET_TIMEOUT ?= "60"
+
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
@@ -39,6 +42,8 @@ python do_fetch() {
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     db_dir = os.path.dirname(db_file)
 
+    cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
+
     if os.path.exists("{0}-journal".format(db_file)):
         # If a journal is present the last update might have been interrupted. In that case,
         # just wipe any leftovers and force the DB to be recreated.
@@ -79,7 +84,7 @@ python do_fetch() {
 
             # Retrieve meta last modified date
             try:
-                response = urllib.request.urlopen(meta_url)
+                response = urllib.request.urlopen(meta_url, timeout=cve_socket_timeout)
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e.reason)
@@ -107,7 +112,7 @@ python do_fetch() {
 
                 # Update db with current year json file
                 try:
-                    response = urllib.request.urlopen(json_url)
+                    response = urllib.request.urlopen(json_url, timeout=cve_socket_timeout)
                     if response:
                         update_db(conn, gzip.decompress(response.read()).decode('utf-8'))
                     conn.execute("insert or replace into META values (?, ?)", [year, last_modified]).close()
-- 
2.30.2


