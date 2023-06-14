Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40542EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.7358.1686734983869533880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=l4ey/VHG;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-977c89c47bdso84857066b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734982; x=1689326982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frDUjz3XVmlaXVJxahbQq4F171SY5tPPy0wBgUnrJfk=;
        b=l4ey/VHGaWqe8eApeDHkjWQ0wYqtdZi4c2/FYnjos5SYBj5/XCbxayF4RlO4eDXzzf
         VqzbE2Z5BO/C7rtVjA8EREarDTUEFGz0F0wN2GpL4cu80NpsJNRN/wzGysIbE7JKmQ6R
         X28twm9n4FIKz0ybfxhUWgbiwe/OFCTIfCvTP/Y3J0Iq8OebWrCXnRZgkvrDA0HIyyIb
         eUoYNRDQkb629mcTYxkFAiJrqJQAAQBGrFJR5GgZATsJ5M98CYFdbEZ/ONCXx550IPPv
         v0X1vo8tgwmhA5eU0ilzYQc5iVV5uGQPr00sbovFLP6asepnkKJCGcKeWhcp044LuVSg
         ZSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734982; x=1689326982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frDUjz3XVmlaXVJxahbQq4F171SY5tPPy0wBgUnrJfk=;
        b=BuHqHMpfQxpLZqHRdmdljnVZRSHa9OenAneFAdD3vbt8ogT7UKpFJf8RthpSbU4hhi
         kH/tcQpz7SBSebjPUqvbr9QZFwVfEcdk0k04vlwByfUCcf5jV+2G//+ixOFNzIhhGVDB
         lovSWc25D27RLyvEd7i/by+8nqwIb/Rm7ibIeZkPgaiY6RYP1jq/ilqRvwrxXaoNq2OB
         oan1IRnsLga8i0Lzbqkxg+Hg1o7W3e4Vv6C19EfWLsCnHhjXIPkXdnMYOZirque6LAVl
         wAC6o0OaUETPYKtuM/ymJXNvSwg1n9hnm3S0R++AXZt85qYmXvhwbv0nrC0hzXkSvp7m
         JxJw==
X-Gm-Message-State: AC+VfDxolPbYq4711Djtx3G98npS/9O2cJIvZtcqRf88P5nrM2BTrT6I
	94V5uPe3o+nJ8eqWKrX8mZdRffwKIPA=
X-Google-Smtp-Source: ACHHUZ6VJUxaC59QRCnE+ieq0AawufSFxObFTSWz0gA5XGf84eb0eA8QYjX8FvDrgfH1dU1St481MQ==
X-Received: by 2002:a17:907:9710:b0:96a:ff7f:692 with SMTP id jg16-20020a170907971000b0096aff7f0692mr16860860ejc.68.1686734982318;
        Wed, 14 Jun 2023 02:29:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/55] libxslt: upgrade 1.1.37 -> 1.1.38
Date: Wed, 14 Jun 2023 11:28:50 +0200
Message-Id: <20230614092918.4065570-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182772

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libxslt/{libxslt_1.1.37.bb => libxslt_1.1.38.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.37.bb => libxslt_1.1.38.bb} (95%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.37.bb b/meta/recipes-support/libxslt/libxslt_1.1.38.bb
similarity index 95%
rename from meta/recipes-support/libxslt/libxslt_1.1.37.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.38.bb
index 361bb0f8dc9..bf35a94b7f0 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.37.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.38.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3a4b27dc8027ccd6146725950336f1ec520928f320f144eb5fa7990ae6123ab4"
+SRC_URI[sha256sum] = "1f32450425819a09acaff2ab7a5a7f8a2ec7956e505d7beeb45e843d0e1ecab1"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2


