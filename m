Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D6FE7B60C
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:38:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.17093.1696423107869708360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IpbKN7+B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3226b8de467so2056683f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696423106; x=1697027906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxOc2ZkNMLuJy0BpfQb88Qg2JxDswliuk7qyD89CQWg=;
        b=IpbKN7+BrVa7Mo+FzD6Qz3K3mVDqMpSEB6035KqL0Si4dis++xi6RQIN1zwAYG0zwu
         b/z/YBVCOvX9Ni9qGsM3NeCOq1m4pCFtsqOtptU16l7bywZIk0fPH1/rHtFkuv3iYugU
         8A0TxD9hlo44Ze6tZbsc2SyZzD216Zxnp6v9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423106; x=1697027906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxOc2ZkNMLuJy0BpfQb88Qg2JxDswliuk7qyD89CQWg=;
        b=bZFrfsGjkOiiIdRmww6cM+ECbRjfgOf+awyry7jiQdxbPrUDe3KhdaWWJGv9zNttot
         h0LiLJoNdvXaBTO7/GCuGRia0UwrruBO9+r4snQyCQe6P2qPqYCxYHwvkGv4gNJZqlye
         wgd+OBD8zJQ0uAv2WCOt7fxGwnywFYymK6Ni/q+OLZ0ILlL/tYcDLz0rpJbDJ2Td5dJ7
         tNDrvSHxpe5tys71RCP2BTZoAz58rA0wnSnIJHCs7nGBkmjsnaYa70Uhpl6RfYU2c9Ol
         bntXN5mcPLTIWxXBnTdZvZsSG/LnO2ojzFMgSp05x+qaGLS0hDocGX1e+aH5Or1I+ngY
         TQmA==
X-Gm-Message-State: AOJu0YziMKlVjVDzsUONRr1KLkJ3SVefa4RP9CHJQsCmMSlLf9mWtFpA
	RaBeDM9rNIGfKuNsm+UoJLd1Iph8SYYwV4a8H2w=
X-Google-Smtp-Source: AGHT+IGtmvRoORUTO3LGlkU49NZt+vUZxK6jfaNabSk9EHgrlj7OzOr80Vo6K4BSkiCjD4/a5//c4w==
X-Received: by 2002:adf:f290:0:b0:321:8181:601e with SMTP id k16-20020adff290000000b003218181601emr2094077wro.8.1696423106116;
        Wed, 04 Oct 2023 05:38:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id da4-20020a056000196400b003279518f51dsm3974617wrb.2.2023.10.04.05.38.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:38:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] qemurunner: Skip conversion from/to binary data for logfile
Date: Wed,  4 Oct 2023 13:38:20 +0100
Message-Id: <20231004123823.2990916-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188676

There is no point in decoding binary data only to encode it again risking
conversion issues. Write the raw data to the log file as binary and skip
the conversion.

Also always update self.msg even if a logfile isn't specified to improve
logging/debug.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 22cf258dddf..b8f51112861 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -115,10 +115,9 @@ class QemuRunner:
 
     def log(self, msg):
         if self.logfile:
-            msg = self.decode_qemulog(msg)
-            self.msg += msg
-            with codecs.open(self.logfile, "a", encoding="utf-8") as f:
-                f.write("%s" % msg)
+            with codecs.open(self.logfile, "ab") as f:
+                f.write(msg)
+        self.msg += self.decode_qemulog(msg)
 
     def getOutput(self, o):
         import fcntl
-- 
2.39.2


