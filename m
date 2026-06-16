Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2A6CD98EF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5784.1781637404303380662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NtGQQOoQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-492329c5514so964665e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637402; x=1782242202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgt0iUoLb+XxMeH90QHZRhC6E9gE8wHV9ovfTgME6Ik=;
        b=NtGQQOoQtv50tchDPYqKxynnRAYxpJiV3RbH9DkZhTpRRLygz4J3AtSUYd6tc2IqIA
         PWSIUyoGiEp11phC1gPSAmI4osNfo/kC06B2Tey+r3mCVTPHuVPsKU5t4hFnRJcSKlmJ
         c4lhIg/GrlQ/XJgt/PSBgKUtw8djIybFnWXmKx7mmcBBVKUQ/9qt9p8QvKGIOVzIN8BO
         0NPBL4L2D66q5eo+tgMXPO+E5ZaHVyjqJ9lUe9B/th7e13fumzEr3HbWwyYPgwK2QXAx
         uWuyyIIReolUECmHkzZw/lnbY3VncVPQkFemFceyvKPVYNzopJYCbbFudRMSg8bP9xMl
         R+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637402; x=1782242202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgt0iUoLb+XxMeH90QHZRhC6E9gE8wHV9ovfTgME6Ik=;
        b=nesOp6GgbdoEB75077UqVf8thnp8D8esG0bFA0WBEjRWZvD2IfMLVbHVrTz8cBFgQR
         g062YG7IkGRGuDqhFnauQtea6c3iaK/1NgLpLNEy84HuCJmOeyaYwT7Ew9eVXfXYHwLj
         dsEL7eMRNLRJ+xZ6kTh37HMWHSvUmKk3PSgbDk7lAfdwYl8TYpubCvhxPC5kzNeAQ9m2
         JVovfMGEPDU2uW2xl+bOSbupgGYwKKoaO8VX51BQyIXjHJF4eeIn/PJZtC/E3ARgahtt
         1IOrf2c3KAttxUFAozXucwErjKMrXXs33HC3AKvIM2aTlycQo1hVaPY3ohm2jejQJMRT
         xFUA==
X-Gm-Message-State: AOJu0YwH8ltwjAoTQJnWf6PokJyfQMUbksxS4I41z6yn4Q1kj4ORXvGz
	o8NDJ1f/FhGE3MK4i5CKWjt9R0V6dnT8ka4GRlBH04TsNjzJDC7YSy7Mf58+Um0F
X-Gm-Gg: Acq92OFy+cnMrZrJnKtapLwU8JTQQVyk8B1qus+mODCJnO0Sy5KQqkLP+v+DsdGwQ18
	ERj9/NpeF9vaIhL+tou7EqIiBC1OWTCKIVMq5hgXijoDFJOgNay2hzgTot1AcdcQU7gCX6uPuK/
	o6lfe7Lf7CwXBlYzsTFsukWY1kYnxS0OWCPxZ9auzKj33tqEK/RGDS9QTqyBRohVIsst1HxzcGU
	YtBWbBPcHPB0PRwn60wxlrpxwXjXhY/21jfFCulsop9x00cOKPGhKSKbRd382xfX2FIyAe97+KJ
	e+v6qsoiEc2F/sRG/CctfZzgYwYgB9QLyVnRVMbKh0is+OOzpX9rhKQAWi0kqkUUosVxQ9AKRyj
	cDNYdI9Ms9V2TYNsd34pbEBbTEGFmGeDmGQmhkZTrXfc4sPvZJLuV//nMToB9SVitgBDHRSAY9K
	tQxQwYrnutRvlBUB74zlSpnHpzp33U4nOurY4tq2tWePyWXcJ5IMvy3KFYRjw=
X-Received: by 2002:a05:600c:c178:b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-492340e76camr430135e9.12.1781637402392;
        Tue, 16 Jun 2026 12:16:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/30] libmd: upgrade 1.1.0 -> 1.2.0
Date: Tue, 16 Jun 2026 21:16:06 +0200
Message-ID: <20260616191628.2014553-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238935

From: Alexander Kanavin <alex@linutronix.de>

License-Update: formatting, copyright years, additional files under bsd-2-clause

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libmd/{libmd_1.1.0.bb => libmd_1.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libmd/{libmd_1.1.0.bb => libmd_1.2.0.bb} (84%)

diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-support/libmd/libmd_1.2.0.bb
similarity index 84%
rename from meta/recipes-support/libmd/libmd_1.1.0.bb
rename to meta/recipes-support/libmd/libmd_1.2.0.bb
index ffc59deb26..1aee94a054 100644
--- a/meta/recipes-support/libmd/libmd_1.1.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.2.0.bb
@@ -6,12 +6,12 @@ lacking on others like GNU systems."
 HOMEPAGE = "https://www.hadrons.org/software/libmd/"
 
 LICENSE = "BSD-3-Clause & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
+LIC_FILES_CHKSUM = "file://COPYING;md5=261bf22602270e2b29c53930d409a3ca"
 
 SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
 	   file://run-ptest \
 "
-SRC_URI[sha256sum] = "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
+SRC_URI[sha256sum] = "ac15ffb8430502fbaccdec66c5a82ee0eab0b0f36220df56710feadfeb13d0a0"
 
 inherit autotools ptest
 
-- 
2.47.3


