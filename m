Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E13C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:18:36 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.6576.1714659515005312782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PwGoMJPy;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7da04b08b82so229506939f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714659513; x=1715264313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w0trQ3AOWIEaOHOp30ezgWJZLTjssNX8XbKwknuWTN8=;
        b=PwGoMJPy8AkorVXn0NyPmsMl4iQ1c42Fj5ucwsMiCRNqigk3A6hF0b+Vre9b3s4df4
         wSlkVtKSO1yVPT+QTqqvmAvBTExhVFDcEy6VSqCjRP6EJ2N2quofy7amEuiPWXuJFACU
         xL04HGFY91qtXG2jTB6Y6U/iw4etCx/60kB/mpbxiCujvnEvA4WUUIzY3F8aZY+YVc5L
         JXNhP/bDsQUDsKyHdg9WsK1cnETtQEuRHStx5cqeSfptfMO3kRWSm0FSt7DllelD+BDS
         4j7pDmnTxHb81kgz02OgDUb4fhKabRaa8U/HzRjmNBk8IMAd5nkcgDd3Iv3quUutggGL
         WduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714659513; x=1715264313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0trQ3AOWIEaOHOp30ezgWJZLTjssNX8XbKwknuWTN8=;
        b=QAjr3CcZbNOZkSJ3CqjElK0MkXPb3SMFnNVaoW5YhjTGkQRIRQ4DUjGMRNG2vllqZ0
         2ufCD1cxiOjctPkvh25r3QnZZmAQdo9xn9ogO91jr96iwEumkNzSxIIEPHlDjnLFRxwf
         JiSIGfl0rK6x8KhCLyuHpSajifok9skQRWVjTxKrUUMdEW0KYF/hpxXq7u5/XtIYgvKE
         bWwn8m5IA7Lc7FMluHvuLyt2eV2TgDKpKjYqbtVua405FRmVnecQus9KZipoLTrTXQ6M
         anHodAi3Q9sRIH8QzD0KvqLSBppmgwtiOlv92PQzd4CqunjYXoYjVsTksX/MnG8sJarw
         GEmA==
X-Gm-Message-State: AOJu0YxD1WTVL1OsG/GPRTt0fxb7frK85yE3kwzrTcB+cxj27yoHnDNl
	NJJTKHtCiUeJHiwICRFgFPmv7xIxlM3BYTcNd0r+UiBC4d39Lmmnn6P/UA==
X-Google-Smtp-Source: AGHT+IEBkPAAvmv1wE/aY0OjuE8sMao80KDeo9Y0mcNSvC0yGzvWGiKx869WJ+XXMpA9zWGn0GdVqg==
X-Received: by 2002:a05:6602:6b0e:b0:7da:303c:9a5f with SMTP id ih14-20020a0566026b0e00b007da303c9a5fmr2804523iob.20.1714659513417;
        Thu, 02 May 2024 07:18:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::d802])
        by smtp.gmail.com with ESMTPSA id c22-20020a5d9a96000000b007da030e682dsm215231iom.34.2024.05.02.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:18:32 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] cooker: Use hash client to ping upstream server
Date: Thu,  2 May 2024 08:18:30 -0600
Message-Id: <20240502141830.1137815-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 14:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198925

The cooker attempts to connect to the upstream hash equivalent server to
warn the user early if it is misconfigured. However, this was making the
assumption that it was a raw TCP connection and failed when attempting
to use a websocket upstream server. Fix this by creating an hash client
and using the ping API to check the server instead of using a raw
socket.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/cooker.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index c5bfef55d67..25b614f1e44 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -315,11 +315,10 @@ class BBCooker:
                 dbfile = (self.data.getVar("PERSISTENT_DIR") or self.data.getVar("CACHE")) + "/hashserv.db"
                 upstream = self.data.getVar("BB_HASHSERVE_UPSTREAM") or None
                 if upstream:
-                    import socket
                     try:
-                        sock = socket.create_connection(upstream.split(":"), 5)
-                        sock.close()
-                    except socket.error as e:
+                        with hashserv.create_client(upstream) as client:
+                            client.ping()
+                    except ConnectionError as e:
                         bb.warn("BB_HASHSERVE_UPSTREAM is not valid, unable to connect hash equivalence server at '%s': %s"
                                  % (upstream, repr(e)))
 
-- 
2.34.1


