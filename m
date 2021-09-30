Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D15C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 20:42:05 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.18787.1633034524512248830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 13:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JS8HCtk1;
 spf=pass (domain: gmail.com, ip: 209.85.210.43,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so8946311otx.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 13:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+tKcaKdorXxK6RwDfujuuWhyRpSo0fdKnxNlV+Rnqjs=;
        b=JS8HCtk114Gicgdi36/TC3rCcuA0/Sa57sLixN9lkNJRHubYf6E5BylPsVbQYW6Iyx
         prgaSoWEknnTjuY22SMHpSQ6Qr3gAsGEj8jfnl3oUB9XsskVD42VbyitmpUqN6K4qzll
         GydKpv87ladkh9/EyN0mpk75e0f5CUmffNaKeaCSi6ebz6NKB66uWWfGpDzswk5F/wVF
         2zcJJLZeiqWZ5ec9YHogvO7ExhXvemo5uqaRO3LYzmLDtJBu3VsyN+xGPaLTFgz9CH9f
         uIEXr7VVF+Q1USXShzg3iIL4pZkQ1AzceZ3QEni9L4cuDbkkKSoVMjXCwZLJisYgre07
         K7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+tKcaKdorXxK6RwDfujuuWhyRpSo0fdKnxNlV+Rnqjs=;
        b=DDs6UFb9mOZHrnDWSKmP2nPNuFKYXIFH4qKnrFyjeEzbaCp59J4MTEN0m5rediBe0b
         9HmgXTmJRPud6JVysGNhwJpurBypCk3gPlpe1WPVztQhoRtv0U1pUeROTr7/xLHleRwp
         g396vSFUWdEEoC+0c3YjnPsF6ER9Dh+QQ4TLUTXql6J1z4uk1YCiCL57Qf+09N6uofx+
         nTJdwGKVqd1zac4OhhFMekkLczf+92VhwL72SE18iXn4Oql9XYjlijHu2q25OPdR0ho2
         ETGhLqeARXUYq8esZyYOymkB5Mp1MlxSA4TzmN0nvxbp3Jy9BGtn5F79YHFMgmWH6L/W
         NkbA==
X-Gm-Message-State: AOAM5308A3zaIiqZmhtytL0GqdCz+n2aeD47CRqMYJ7RO7blWEJejQ0f
	CefnbYI+rR/hPdIuyQFjomuOgzuzMbw=
X-Google-Smtp-Source: 
 ABdhPJyWOG5hQNymkIuj8djWxHI8cRv7hTGgWBYoKXO/9qQ/ZDV9icetN1q0l6imssVkaacRX2I4WQ==
X-Received: by 2002:a05:6830:1090:: with SMTP id
 y16mr7012008oto.317.1633034523633;
        Thu, 30 Sep 2021 13:42:03 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id v1sm756805otj.70.2021.09.30.13.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 13:42:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] python3: Fix sysroot reproducibility
Date: Thu, 30 Sep 2021 15:41:59 -0500
Message-Id: <20210930204159.3451316-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 20:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156508

Fixes the reformatting of the sysconfigdata to be reproducible in the
sysroot as well as in the package. During this a bug was uncovered in
the way that the data was reformatted where it appears that python
cannot parse a single line of code over 40000 characters. To work around
this, pass a maximum with of "1" to pprint instead of sys.maxsize which
will cause it to wrap as often as possible and should keep it
reproducible.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/python/python3/reformat_sysconfig.py | 2 +-
 meta/recipes-devtools/python/python3_3.9.6.bb              | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/reformat_sysconfig.py b/meta/recipes-devtools/python/python3/reformat_sysconfig.py
index c4164313e8..5e2b12879d 100644
--- a/meta/recipes-devtools/python/python3/reformat_sysconfig.py
+++ b/meta/recipes-devtools/python/python3/reformat_sysconfig.py
@@ -16,6 +16,6 @@ with open(sys.argv[1], 'r') as f:
 with open(sys.argv[1], 'w') as f:
     for k in sorted(l.keys()):
         f.write('%s = ' % k)
-        pprint.pprint(l[k], stream=f, width=sys.maxsize)
+        pprint.pprint(l[k], stream=f, width=1)
         f.write('\n')
 
diff --git a/meta/recipes-devtools/python/python3_3.9.6.bb b/meta/recipes-devtools/python/python3_3.9.6.bb
index f04bfc3053..aae7837180 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.9.6.bb
@@ -161,6 +161,10 @@ do_install:append:class-native() {
 }
 
 do_install:append() {
+        for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+            python3 ${WORKDIR}/reformat_sysconfig.py $c
+        done
+
         mkdir -p ${D}${libdir}/python-sysconfigdata
         sysconfigfile=`find ${D} -name _sysconfig*.py`
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
-- 
2.33.0


