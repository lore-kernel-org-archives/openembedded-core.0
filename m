Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B9CC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 18:52:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.826.1783709562963559292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 11:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fV/pUIDY;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b7612475so10664405e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783709561; x=1784314361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZWntpQCnj9fPVyqHKBdKUqRTglME7EUoxVwKP5wwr/s=;
        b=fV/pUIDYkeYi8Edv5gbsHpD20wQrzy5vwAoP2nB3IWXgnxc2zBz6Y8FmNhf8Q6OiS5
         Z25ElxnCOQ/DYaxS3E3XXsJ8PG6qqdkNOAW4SZjqQx3cl5czjy3P+745DeeZseeQeSwH
         d3hQrGxWGBJeqOXhTNUZbGrxa1D+vTm4wRn2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709561; x=1784314361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWntpQCnj9fPVyqHKBdKUqRTglME7EUoxVwKP5wwr/s=;
        b=SrrLlvbQNNuMUzxqPT2ox2Bbgv+GVi3blhpIjPXd34g1QWtsIXDsvsHssipl1VnfX5
         MuD2k31myc5EW0l/Lw2lLJJo7DLRMozqYoN9pWGe/+6BzGVFgzuDHl/NC9El3MHf//ur
         rml+FD55VqrKB+cWh5lVDaiUy5hufRkWxqzd/6Q2U3k+C2ZQYT7nRFkpFBzUSiKsudbw
         xhRdTCWDQMEt14loBIn9j5uisM6Je+xLOLlI0SphNXZoVHkuSlu5eQYMT1qUnas/Cnky
         rMV/izWymYYzUzNTu218U5dj080RDgNvNUSjNJmYNcn59qmG4GEzMGGoTmQw3H2Hpc5c
         y4VA==
X-Gm-Message-State: AOJu0Yx7IpK3RZUeSdGmbggBORfco2qiylHH2/EidiVJFwDf9gx02Stu
	y/OG8yIZVzDLo1lJA7w+h8j5Isat3Uf+KUz8FVqUnVS3biAVt6zEfgz9kge1PjYLkec480aaF9Z
	e+gsDkDg=
X-Gm-Gg: AfdE7cmOGqqobm+EZpFgQEBcL4V91XdipW82YwywGbj5iZ73JnqVVapHIiFGMbga9Em
	foRY3PKtFLli7k81FE1Gtqe02dZagq0vjRdlHUoxBlWER1iU24AXZ9pr8oVhD1z/uQU72GJXVUk
	7VHk44uzefvp4jfU+CZvFZoGYcCV5NV8isVhAXVgYnu7eL8k52Yi4/ikiprOsafQDrHBcuv0cHl
	a3dT51FVsi9QtHt+kN08WEqRsQHXoTyV5G/u1M8Odf5UWFShMnGAF/pSV2MxTEW/M5sSEpGKWZ9
	W5LLA51w8foJjhd2egOdIhmXhQLH5XbVL8spRX1ceXkMMo4A/QvOOJL8NqiKTZ+zeRZiJVQYp/1
	2UvF1b5NlNjemOXMRilidD/HBklAflSR8VdnIe08DF2jIzMVVaaoZdCHLvQX0pCCdnwillJDcfU
	PM6/czKwpvEzKzLuwQMp6p9zTl1hSSPiFzb7eoZw==
X-Received: by 2002:a05:600c:4e4c:b0:493:cbdc:7cd6 with SMTP id 5b1f17b1804b1-493f87d91e2mr748235e9.7.1783709561162;
        Fri, 10 Jul 2026 11:52:41 -0700 (PDT)
Received: from localhost.localdomain ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e0f165sm57096675e9.0.2026.07.10.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:52:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] lib/oe/patch: avoid duplicated "From:" in generated patches
Date: Fri, 10 Jul 2026 20:52:08 +0200
Message-ID: <20260710185207.3999639-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 18:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240681

From: Yoann Congal <yoann.congal@smile.fr>

To workaround issues with list.openembedded.org rewriting "From:" email
header, users are encouraged to put a "From:" header inside the mail
body. When using the suggested git-send-email workflow, users may use the
global git configs format.from=true and format.forceInBodyFrom=true:

man git-config:
> format.from
>    Provides the default value for the --from option to
>    format-patch. Accepts a boolean value, or a name and email
>    address. If false, format-patch defaults to --no-from, using
>    commit authors directly in the "From:" field of patch mails.
>    If true, format-patch defaults to --from, using your committer
>    identity in the "From:" field of patch mails and including a
>    "From:" field in the body of the patch mail if different. If
>    set to a non-boolean value, format-patch uses that value
>    instead of your committer identity. Defaults to false.
>
> format.forceInBodyFrom
>    Provides the default value for the --[no-]force-in-body-from
>    option to format-patch. Defaults to false.

With this configuration, devtool generated patches look like:
|From 4457b9d7805551e6b35efa25f998b63901d4bf86 Mon Sep 17 00:00:00 2001
|From: Yoann Congal <yoann.congal@smile.fr>
|Subject: [PATCH] Add a new line
|
|From: Original Author <author@example.org>
|
|[rest of the patch]
Notice the duplicated "From:" header.

To fix the double "From:" header, use the --no-from option for
git-format-patch to override this configuration and generate only one
"From: Original Author <...>" header.

Note: The "format.from" configuration is in git since v2.10 (in 2016),
and the --no-from option before that.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 1d50e83ab7a..0a201afe0ad 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -530,7 +530,7 @@ class GitApplyTree(PatchTree):
         patches = []
         try:
             for name, rev in startcommits.items():
-                cmd = ["git", "format-patch", "--no-signature", "--no-numbered", rev, "-o", tempdir]
+                cmd = ["git", "format-patch", "--no-from", "--no-signature", "--no-numbered", rev, "-o", tempdir]
                 if paths:
                     cmd.append('--')
                     cmd.extend(paths)

