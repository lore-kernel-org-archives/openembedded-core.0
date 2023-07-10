Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC7CEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 14:35:30 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.41355.1688999726598401864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 07:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UJd3wVcw;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-783546553ddso129185839f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688999725; x=1691591725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18By9L0gzcvUPvI7QFQw64DmTEi3Xee9HZsRKgLaE7c=;
        b=UJd3wVcw6cvqZk1ueeYZZEPCMxX0ZMCqSFTgry25d0TsZA7zhEBi7RFH4CpYeTPTw2
         G3cAd1CrifY7+MklHfGpNnr03FETaBRxMgrw/YdEpqajkjzlUac8TNSk6/Hd5QsAmA6a
         V0LfHDZJJnxTP3TPZPTScdX+k/bYa4BRvvvGs9050IvQLK112ghHsgzqfcSdlhP/BCMR
         P5MfjEGO3fCkEAtIMui8cw0uFp/r3yRxClXSrhWk/+5H5G2veGro7Ga6Wf8YpT8+SD8P
         LFAEZyqb3MNdEUvSmKQ8kuXQXY1SkgDB9RJLvyaJFO9vbR3zdDylB6dKmhOGKhUW9Woy
         24eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688999725; x=1691591725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18By9L0gzcvUPvI7QFQw64DmTEi3Xee9HZsRKgLaE7c=;
        b=DOCawX7cl7Hjxa96wD4sv8l4UZav9P01G0+rmW4AJ/mPLV8oX9Tis1KebvXm+Fkn1J
         0UVNlAqVQxddhlqPBJ5KDCW01pOapiDJG5OnaotAqZaEleHPkyzeEzgP6xSmjZ4UbKKU
         Tgx8bS8TsrPD7Zf+W8iNb9b5aMOTeBTdVb2g2sYdk9cw+tPKes0hpGMdSxjJYpLMBX8G
         E1iVUAa/yt9Yz02uiiB5If93jDVsWgo2be2/gk353cKAaqFrNNr8TlNlRcakC7wcMxdI
         9XVqiITdPHT3D90A4wpm4WCRSRU/yneLL4YaMPz0rtJui5g0hGFZgOYv2pCWEW5Wfnee
         HN2A==
X-Gm-Message-State: ABy/qLaDuKE2luLDEU2DS14S9n9cEolFsJxpzgB8k1H8SCKemfvNyBA9
	WNv4GOZviU7ysAM67c2ZUSdIq7zRTOg2jYGk
X-Google-Smtp-Source: APBJJlHeacsjy51ZOA74nXkaLoIBnnkqP4iAq+yv4uV4ULRpV1vvNI2twLy4N+JxPc1W2oFosNUosg==
X-Received: by 2002:a92:d185:0:b0:346:5d44:dc1b with SMTP id z5-20020a92d185000000b003465d44dc1bmr3922411ilz.10.1688999725645;
        Mon, 10 Jul 2023 07:35:25 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id c7-20020a92cf47000000b003462183edc9sm3563641ilr.7.2023.07.10.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 07:35:25 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Mauro Queiros <Mauro.Queiros@criticaltechworks.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH] pybootchartgui: show elapsed time for each task
Date: Mon, 10 Jul 2023 14:34:47 +0000
Message-Id: <20230710143447.1242849-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 14:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184080

From: Mauro Queiros <Mauro.Queiros@criticaltechworks.com>

Currently, finding the elapsed time of each task in buildtimes.svg
is a manual effort of checking the top axis and finding and subtracting
the end and start time of the task.

This change adds the elapsed time for each task, so that
manual effort of comparing start/end time is avoided.

Signed-off-by: Mauro Queiros <Mauro.Queiros@criticaltechworks.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3efebd3404de548f0757863da237f2d18ce60013)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index fc708b55c3..707e7fe427 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -558,6 +558,11 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
             draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))
 
             draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h - 4, w, proc_h)
+
+            # Show elapsed time for each task
+            elapsed_time = f"{trace.processes[process][1] - start}s"
+            draw_text(ctx, elapsed_time, PROC_TEXT_COLOR, x + w + 4, y + proc_h - 4)
+
             y = y + proc_h
 
     return curr_y
-- 
2.34.1


