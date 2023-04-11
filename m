Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E77C77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 09:04:20 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.9102.1681203853027930116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 02:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=iWnHKpX3;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id ga37so18859692ejc.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681203851; x=1683795851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiPFDJz/NTArYRs6NVo0RStPLEO83OjwnoRMm9iN5LE=;
        b=iWnHKpX3/IZoa+MHS3wiuIqRpqEgk99WAZHUcoZDiVjJoIe8Y4MH0utQV93zERdYQL
         r25DDKH2Cyzmnjfqa0HRsaKsQcS6JKh+R036JQvOLg18P5tChEog7ppHtAL9OTzGbhaD
         lrnGMSBf/rmMLJG2ZVCiMtn5d+WZpntwLlKtNxzteqqGAFZBqCAdhX0SZ6eFI+yUR/um
         ysuRRWFVtBfTnEFY2HteRhp/vC6yjvrUGvnrjqabL1y9tpG3esLhB8NCE5JHNEXkzU6n
         1PBup1IU8YiwLXBHdfiVoyi9DGS9lUGHrPUacBf3967Npomi/sXWz0IsTYsXXkidEWLe
         S8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681203851; x=1683795851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiPFDJz/NTArYRs6NVo0RStPLEO83OjwnoRMm9iN5LE=;
        b=HXU0nkbqyq9TUSwcuPPrJZV8af7pnkxWNn5TvtVPyYHIKhTF+CELX4jJhYcnGR0H5M
         KCICmZeT5lquYvmgKzoKOQMTfVomMoKwsQpTe7EKGGJ75aGiJnibbZ1N6C2hy+LsJ5t2
         CYnMkJclH1L95vHB1g7+bxMn1NHxd7yLBsYF08n5T5PaJbWLapAGYjiCPLN1hKR8xxXt
         Go8JtWC23c1Fpq3kKPdeWsO0Zqk2+IBwznUwTbDCn/8I4DaHUKT109VxTwxpWJD+iqIq
         socHxkJyTSe2GtxJ1sibHWCDqalvaQxM5ZNcvvxNx6rRfY33rlS9SpTT/h3SZHHgvIn+
         E8OA==
X-Gm-Message-State: AAQBX9dvcuJzTU94NEvWV2aK4pnnaXgj7eFwR1kttiS4kvwgDb9QXIBQ
	cIKFm92glSY3f6D6gpNUErhqOKpYpWI=
X-Google-Smtp-Source: AKy350ZKIQiXwmyoa2cK7PQZ9BI535SuqQV1XmaZ9vOruXolTZDAdg9mP3Ti5DAevidncX0jRZYGXQ==
X-Received: by 2002:a17:907:9693:b0:948:a1ae:b2c4 with SMTP id hd19-20020a170907969300b00948a1aeb2c4mr12088027ejc.6.1681203851503;
        Tue, 11 Apr 2023 02:04:11 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090699cc00b008ec4333fd65sm5889007ejn.188.2023.04.11.02.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 02:04:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] oeqa: print stderr in the AssertionError as well
Date: Tue, 11 Apr 2023 11:03:48 +0200
Message-Id: <20230411090348.2434686-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411090348.2434686-1-Martin.Jansa@gmail.com>
References: <20230411090348.2434686-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 09:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179913

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/utils/commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index c1f533802e..7b2f6ec124 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -209,7 +209,7 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
                 exc_output = "\n... (last %d lines of output)\n" % limit_exc_output + \
                              '\n'.join(split[-limit_exc_output:])
         if assert_error:
-            raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
+            raise AssertionError("Command '%s' returned non-zero exit status %d:\nstderr: %s\nstdout:\n%s" % (command, result.status, result.error, exc_output))
         else:
             raise CommandError(result.status, command, exc_output)
 
-- 
2.40.0


