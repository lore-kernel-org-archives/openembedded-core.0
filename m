Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDE6C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:18:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.5654.1641899892222620504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hRGcC7G2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id c66so10727811wma.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zsm0LQi2oG/HNGzcDdI0YFDyYvvvUDYa+YEvdxv1jYw=;
        b=hRGcC7G25Gr9NZc+bz8VMmAFlTBAB1Fr1l9W2O9gPpVZY1OM8Y84EI5TdNorQf9Bzw
         stbIEU8oK79hWiLgxgsO7aqWi0xxRmOMDGAEHUE4PVwsf8IlPa5yQ/brwW9JiczIpwe0
         suXhdVVNE9uwzXfoL0JmRQliIsxbxeJ9RXwco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zsm0LQi2oG/HNGzcDdI0YFDyYvvvUDYa+YEvdxv1jYw=;
        b=BVKiRDYmdLu9uWAcjRuA9/IfsGTaJgJLg6Z+KpQLRaL+5Dz64wUstnzMbN6jt0no5E
         DoYdWqYdsff8REfFyJih2nB52Ae2ZOwaJq1qANpqnH9Y0tlC0SICJuMHN4UOcokE9J5j
         9W2DyggOYT/xL4xJhlU186dfZeRmh7gqrSMTKw2JlpMxF0gwc9ygEl298LFTaSS0Cw7q
         /VwoW1M1Fxqt4KYoz5uG4imSYhfpY7k9rgdyxDkobqFR1OEddpgMFjplLd3ZV8f7xjzU
         bEpFCBFOpWxHTUUvBQZ2D23/yXGdqpYt6q0M74bFxFERfGqMwJW6dC1orGVTu2QJbUqm
         sNwg==
X-Gm-Message-State: AOAM5328dVtAjoaOt6oni1fhX7lGxdhstioAiq3AP8luivQwQnEvqj/N
	sKg3BVVgpWFlXUffMGA7+CCK4dx9feY2Lw==
X-Google-Smtp-Source: 
 ABdhPJxKY3G759PYjkXaMBVlc04VZBW9rxgo7aljZAokPyARfnJVFo2OmQZMwGnddH5XydBQ3PpCfQ==
X-Received: by 2002:a05:600c:20d3:: with SMTP id
 y19mr1993294wmm.151.1641899890601;
        Tue, 11 Jan 2022 03:18:10 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4])
        by smtp.gmail.com with ESMTPSA id
 m39sm1553215wms.33.2022.01.11.03.18.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:18:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sstatetests: Add OLDEST_KERNEL to allarch tests
Date: Tue, 11 Jan 2022 11:18:08 +0000
Message-Id: <20220111111809.1633613-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 11:18:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160396

Some architectures vary OLDEST_KERNEL and this shouldn't change the allarch
signatures but in current OE-Core can/does. Add differing values to the
test configs to ensure we catch this in future (we want to keep a 32 and
64 bit machine here to test that as well).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 2be96f1781b..70ef10cda53 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -342,10 +342,12 @@ TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86-64\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
+        #OLDEST_KERNEL is arch specific so set to a different value here for testing
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
+OLDEST_KERNEL = \"3.3.0\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         self.sstate_allarch_samesigs(configA, configB)
-- 
2.32.0


