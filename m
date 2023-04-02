Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425C3C761AF
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:43:09 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.48699.1680453753453219689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FJ+OLDkr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id q102so25047483pjq.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453780; x=1683045780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SMaCavEhWqnUD1RNxRAQvZOMxViLCeZ/vXJQhvzFYU=;
        b=FJ+OLDkrdPuEtZ3613rkKJgILnNLjzOybFgqgNhkDHinOoTWxEc1fKZO7NN6bNV5fi
         286S9M9Mp5jfZDySDPI//xCb2hMJrg4gA6iTd2xLN1qCtSAcnlYnT3KKl/5g1gtrmVMK
         AJiM9YB9GCzv4ebcy+Eydlhb2GGssnhEj869TLIqUKBKCa6G9jX1oDTonAOjEfXpaGbJ
         OHDJd/ESLI5Zu9xobIh6r7XKpCxsy1adFtYoyAY6875p99IIQjXtp3ki8YN9nkYOHDLq
         mSqvWADz4AjBntEdyozDq4IQqHC7FnrDSsxCTHoxP8+EoQmsHJFyAMO6fKWxXzSQlIG2
         c6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453780; x=1683045780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SMaCavEhWqnUD1RNxRAQvZOMxViLCeZ/vXJQhvzFYU=;
        b=lwTKAIIUFQCqsqR9UaciTWCdCeIUIsNvLbFdBfNVfDoSgppwXfze5y3zFV0NbvUdQh
         AENnwDBX56UuI3X6dlL1empeW2EPX0G5ZB9beKudXf57VGp37anpUJ6WsydbAtXeWLEU
         hDELjabkZsdv4673BRbfYoKF4gNrNcE/JOfmmdRKlcyuHhorlzWNJHWxUGLq2kogf7QT
         BCtjCT2gw3ekUoVIvQLxpfILjOU2xwhNVEZCcMmDyWxHltSVnc117H/8qMqFWzqgWKi/
         JdfPIbWtjimOZiOFPMx/Q2Gy2rQ1bgaNuihjes/O6YeBF5Y4qfKhTHy2PduZ1KtllhSs
         U+7A==
X-Gm-Message-State: AAQBX9dr4xinxzgqZnSeoRQfj7tZsYoF1098VIFdiX28eCF7Eblp1VAc
	2T48G28OY6ShzkemeYzg6mIJ+QMdV6ila430SkU=
X-Google-Smtp-Source: AKy350Zhj7v+goKjCGYnoQbDADVAxG5DA03OB/S7nIYkR/jPAnbOJrGc4KDAHmC3tMBLWB53TrJnxg==
X-Received: by 2002:a17:903:41c1:b0:19a:839f:435 with SMTP id u1-20020a17090341c100b0019a839f0435mr17921441ple.3.1680453779995;
        Sun, 02 Apr 2023 09:42:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/21] scripts/lib/buildstats: handle top-level build_stats not being complete
Date: Sun,  2 Apr 2023 06:42:14 -1000
Message-Id: <19815bb76e414a1c1fd8d31a84492d72dd29205e.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179600

From: Ross Burton <ross.burton@arm.com>

If we try to parse a buildstats directory which was either aborted or
is still being built then the top-level build_stats file doesn't
contain an elapsed value which causes an exception:

UnboundLocalError: local variable 'elapsed' referenced before assignment

Default both start and elapsed to 0 so that the parse succeeds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 701d985aa8f2e9c2b9c0736fa25b424f3701889e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/buildstats.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index fa94c65539..6db60d5bcf 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -234,6 +234,7 @@ class BuildStats(dict):
         """
         Parse the top-level build_stats file for build-wide start and duration.
         """
+        start = elapsed = 0
         with open(path) as fobj:
             for line in fobj.readlines():
                 key, val = line.split(':', 1)
-- 
2.34.1


