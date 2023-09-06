Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BDDEB8FC5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:42 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.7464.1694004518097829659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BUyXUDKT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c364fb8a4cso3267215ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004517; x=1694609317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LP2pLOuCvFHoZLA6YF+BJtWSjfkhl8varVM9Ga9LTXo=;
        b=BUyXUDKT1zCIsrQxTwE1jKdE8rvTiKkyyQshhFLn1O1ITZ+bMJv+UEHVR6Cd1YVTH8
         BvpnbSfuWFEJJf2M4QW7Oh/y6LfdtmiEDdJ7y3thALzi0tjq6cDRF25ed8aOP2+tT3Oa
         3AgcQBLg5e5iCVSabRHM5uCqPEavmlWeuJAwG9Y4saXk0G65I0Ph3cjaeGveJ9aIb/XA
         RsdkMXzqVWTjdQi6oNhMZnfgNdD2DnEIKVP1yf/SxnV/Tx+Re23VtJgtIGIfgmVoKZ0S
         OzLl3BGWQpAY0NPIdFc5+h8PNmgXFNktS2V8IcKB/wY9RKnOFCHYMNoeXZru12vwBmBE
         L+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004517; x=1694609317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LP2pLOuCvFHoZLA6YF+BJtWSjfkhl8varVM9Ga9LTXo=;
        b=P4cid2VKEist7GWjZ0zFclIlmc4QgsmkwjHfUuPjQ7EYy1gorplVwGmNLtRAd1mrN7
         bGJtkhPkFksCqCIrzDL/fu4zyC/pf2FVRYFQbhBKTSCVyfOLOR48R6Y0kNtv0/xVWCrS
         q30Zr5UUaVcnXW7EFsMFFeBt4vqnCkXPfi1ACMwkxDgiu+gFBWyQx3Ztu3ujDpzpcuVe
         aLbGbLI+O4Sz46SqLWlrsmn+Sntk858M/2aeJNCrXa/3rNbc1oWA6X8avwDFYmzrIFTm
         j07sdjjU5ugYWe/cqCWuyUgzjGeHfu6pfAwi0QVgmMGFya0+I/MDgOIq69YnAaGTX3Lk
         XROg==
X-Gm-Message-State: AOJu0YwCauN+a+FsMPLe4HcQKjxmUMMtkpmHUptqA2VYmttC/F3Urffo
	K8ffXFD1/efOEFImQ+WttmFpQxsfUgzz8gABoms=
X-Google-Smtp-Source: AGHT+IHnCwa1G9QlpFaxU0ENDKF7OYW2zmoyygBreLcozx/ezRy1MiOp73RHWvRUFrHjpUeMnBil+Q==
X-Received: by 2002:a17:90b:1e4e:b0:268:46fb:df32 with SMTP id pi14-20020a17090b1e4e00b0026846fbdf32mr14841896pjb.34.1694004517051;
        Wed, 06 Sep 2023 05:48:37 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/14] json-c: fix CVE-2021-32292
Date: Wed,  6 Sep 2023 02:48:11 -1000
Message-Id: <a7b93651028b55d71b8db53ea831eee7fd539f33.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187300

From: Adrian Freihofer <adrian.freihofer@gmail.com>

This is a read past end of buffer issue in the json_parse test app,
which can happened with malformed json data. It's not an issue with the
library itself. For what ever reason this CVE has a base score of 9.8.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-32292

Upstream issue:
https://github.com/json-c/json-c/issues/654

The CVE is fixed with version 0.16 (which is already in all active
branches of poky).

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../json-c/json-c/CVE-2021-32292.patch        | 30 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.15.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch

diff --git a/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch b/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
new file mode 100644
index 0000000000..28da522115
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
@@ -0,0 +1,30 @@
+From da22ae6541584068f8169315274016920da11d8b Mon Sep 17 00:00:00 2001
+From: Marc <34656315+MarcT512@users.noreply.github.com>
+Date: Fri, 7 Aug 2020 10:49:45 +0100
+Subject: [PATCH] Fix read past end of buffer
+
+Fixes: CVE-2021-32292
+Issue: https://github.com/json-c/json-c/issues/654
+
+Upstream-Status: Backport [4e9e44e5258dee7654f74948b0dd5da39c28beec]
+CVE: CVE-2021-32292
+
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
+---
+ apps/json_parse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/apps/json_parse.c b/apps/json_parse.c
+index bba4622..72b31a8 100644
+--- a/apps/json_parse.c
++++ b/apps/json_parse.c
+@@ -82,7 +82,8 @@ static int parseit(int fd, int (*callback)(struct json_object *))
+ 			int parse_end = json_tokener_get_parse_end(tok);
+ 			if (obj == NULL && jerr != json_tokener_continue)
+ 			{
+-				char *aterr = &buf[start_pos + parse_end];
++				char *aterr = (start_pos + parse_end < sizeof(buf)) ?
++					&buf[start_pos + parse_end] : "";
+ 				fflush(stdout);
+ 				int fail_offset = total_read - ret + start_pos + parse_end;
+ 				fprintf(stderr, "Failed at offset %d: %s %c\n", fail_offset,
diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index 7cbed55b3b..4da30bc50c 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 SRC_URI = " \
     https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
     file://run-ptest \
+    file://CVE-2021-32292.patch \
 "
 
 SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
-- 
2.34.1


