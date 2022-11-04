Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93691C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:47 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.7154.1667530897554732713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eziO7kwJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so2172340pjs.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avRfzfGoY3xWHQKQqxv/iKpbN6t1uj4HSUfTwdG3NRo=;
        b=eziO7kwJuvwWHg/ncdVC7axZpB+NmrrmSrQilY5AxceRIa9SE4PbHve4cVjQwnRPeg
         11mnFc0ufw6pQb+dphiTnw181qZXDwLvzb9Q4SJblF5G5VQg0CgyyEN0pCG4cN95GARc
         8SnoGSSout62547lNaJYkVpPAKFHvm8Bcw0QtxWea1fnLROJqwsl4TAxJ1D4IRBTjR8k
         gmWV2Syq0A3W7tNGOBi7RWKTnW07x8VvFkzAt04wUoV5UZ+0UULCLgd6VBDHRBG3SXq2
         9L4B3CIAxKJNe8YccYrtrMZI6WGIN7b7aHNYK0sMUugmCx1/aWpGy0iuanqcNgPHlh7Y
         TT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avRfzfGoY3xWHQKQqxv/iKpbN6t1uj4HSUfTwdG3NRo=;
        b=lFHR+v++3uJkX+T2ZxnXN2dPWjZkwLrk03nw3jvx/gYcWzZFUwpBICDyFxdgVRJ4dQ
         hRU9TpiAe8lBfilPz3Ogq8adgBt9RCPAUZz1IFKuFkbA655WpDQl/0db3OtlIPqDFX6A
         JP017B+LP22we4Z4a3G2yXBs29cvRDWN5L/e20AF3K0/EJDj9zirpmxhpcp2Suu66vnK
         6qaB/23A6XYpeHMvoGek2YKn3whCRa75SwwVMhLrqAmZnN/3bhVLCLQ/u6aARLX3IOaU
         kgpzXUAfXWM7V38etnGQcuyzthd6BJnw3O1c5yB5dQzlQkujF0P/8xSz2gk0Acfe5/zM
         Ecjg==
X-Gm-Message-State: ACrzQf1g10oisNO9e0TV0fYwKnLyiH7EloRmiLsq+jfkb2UV86eJe2t5
	ZHXZ6B7zVy5NuUye5TTKhz+lPS4qxPJnoHmT
X-Google-Smtp-Source: AMsMyM4YIC320U8+HBEpl4Ba/rZ2/tznnr6FGiuRoPJc5xg9Bhxrw5s04480Uxb4/L1qhQSBKHFGEA==
X-Received: by 2002:a17:902:7485:b0:17d:5176:fe6e with SMTP id h5-20020a170902748500b0017d5176fe6emr33459612pll.147.1667530896596;
        Thu, 03 Nov 2022 20:01:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/31] cve-update-db-native: add timeout to urlopen() calls
Date: Thu,  3 Nov 2022 17:00:44 -1000
Message-Id: <6725a95736d4c0976dad8e9ea860ddb1a4c8952a.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172670

From: Frank de Brabander <debrabander@gmail.com>

The urlopen() call can block indefinitely under some circumstances.
This can result in the bitbake process to run endlessly because of
the 'do_fetch' task of cve-update-bb-native to remain active.

This adds a default timeout of 60 seconds to avoid this hang, while
being large enough to minimize the risk of unwanted timeouts.

Signed-off-by: Frank de Brabander <debrabander@gmail.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5f6652854f544106b40d860de2946954de642f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


