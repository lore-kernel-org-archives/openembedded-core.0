Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213C3CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:54:09 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.25460.1694526842807931539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R0DkP+gK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c1f7f7151fso40596295ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526842; x=1695131642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwXkCFIVP2ZS65yOiVUAPTDr1EQP6NNC4dEXOe+MFHQ=;
        b=R0DkP+gKQSUmLqcEevJpZvLTbFg2ZpRff1ZKNR5mEh4JijooPLOPFzHs9tAlAXPpQJ
         s48zWMdgjI6vodD3NIIQayDCpHTNXxt2z21Lg1iMhZnKH+2yCRlfman/opRfIH/lE4Eq
         aODzi8sA6zxC/6tkFWewLLjmHErDh7BDpna3I20N3AVZTgGa2R/bG/Rxm2te+6Ke8nn1
         znCaD3EY5YorMOOHGxNmj1agZ+nxZNARLhdp8jqvZ04Y0NeKNKnFDOEpnJB4epHeVYVX
         WL18KstrwLWSGJRKWTCiasOKnYkU8VLxuFeob+CZfejRmDUUK9RRlAYnI52Mvgj78v/o
         OZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526842; x=1695131642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwXkCFIVP2ZS65yOiVUAPTDr1EQP6NNC4dEXOe+MFHQ=;
        b=pjGTKPhL1WhZUCtnyLLt0TlUb5fdFr9aTc5khDtFjTZt8IXd6x9GSK7B2S+Hshjgwb
         DGsxaN+PFXp04d6GsOW1zxOUh07yjjoSsGJNo3XjWUISJfDBKN03x+kQlyiKvUTWjJgf
         5Xk5FpYNyb8nbpEEe22SMuxu5IV9YyjrSDeSmu/D9EyyYTilleECpQb/m43sfJhzYDpI
         XsYz2i6U/7yfV8lAeWqKhzUai3iXJz9QyyvB1gMagkThvNvK93HRCg827QberwWwfPNA
         pmtxKv4EQ3PtxKdOYHtPqPLdGBa321OTm4v+Xqm7pFZTCoVFpvunEygAnJRiHkE8cJq6
         Rc/Q==
X-Gm-Message-State: AOJu0Yxu80+Jk350UvVLNPmQMaENT0QBuqkeGAknoHqeDyp37tg5HnHE
	7b80cHNIO3syLwNeK44q2Ir1ve21DqDTrBh33ns=
X-Google-Smtp-Source: AGHT+IGdqYWW1NCmVF1OgHP1M1NPo0uPZJtKpFmXlI4pPNvDx5HqkSLtyVicHspWn/zroSMbWhvfRg==
X-Received: by 2002:a17:903:4d7:b0:1c3:e30f:6c82 with SMTP id jm23-20020a17090304d700b001c3e30f6c82mr172183plb.53.1694526841965;
        Tue, 12 Sep 2023 06:54:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.54.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:54:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] oeqa/target/ssh: Ensure EAGAIN doesn't truncate output
Date: Tue, 12 Sep 2023 03:53:22 -1000
Message-Id: <605d832e86f249100adaf3761b4e1701401d0b76.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187528

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have a suspicion that the read() call may return EAGAIN on the non-blocking
fd and this may truncate test output leading to some of our intermittent failures.
Tweak the code to avoid this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8920c105725431e989cceb616bd04eaa52127ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index af4a67f266..832b6216f6 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -226,6 +226,9 @@ def SSHCall(command, logger, timeout=None, **opts):
                             endtime = time.time() + timeout
                 except InterruptedError:
                     continue
+                except BlockingIOError:
+                    logger.debug('BlockingIOError')
+                    continue
 
             # process hasn't returned yet
             if not eof:
-- 
2.34.1


