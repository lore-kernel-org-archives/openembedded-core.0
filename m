Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907FBC71155
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 05:26:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.11498.1750137998447939201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 22:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLMvX7M+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234f17910d8so48405175ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 22:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750137997; x=1750742797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AszOnjPbXv2oqE5YdZF5MIm/v8B3q+mMLxuFOPWkzyY=;
        b=fLMvX7M+i9xLQCkvkCliHvz6vcopp8UavRVI1GHpQQjj+jGUjIJ03TH1HFm/GJIgEt
         qlwBAa7BNPpYx8tPkYIJ7dMKZjK4CYSRo/b12/Gz+FYL9BaITFNay9tVMI7HnvtyMjc4
         krYbhe6zmuq0ivWIGDuAvIvFSir0n9G5X100Dd+9FJDPlt0xLK5K6m9t1WOiJltKw3aH
         Af6vdyNWpLX5zKAH2OBwKL6bQqF640XWWwfvutrXqb/TYs5W55sN8AWApT3yE5+UXaZo
         HF4ByCY14/lst7xVZzXdkX4w5dbD4h8kp0leQocqgSMu+fwYr1Y2yIvTUyaZ8EMBqXQZ
         7lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750137997; x=1750742797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AszOnjPbXv2oqE5YdZF5MIm/v8B3q+mMLxuFOPWkzyY=;
        b=f/YNaAYjV+ulcaHcc0lz+rPmp/3v4vEDRSkyV8naLq8t9LelAeBmBgeNxzEpyXc6Ff
         Nwio1P+7nJy/qgl4AUYkg0qZS11vPc2sD+g8uxlroezOEaQhNRd/EzCqK04ie86jbqOP
         hTcvB+WgqWx4srOQXChgMSkg+JZ8+lVy4N+ZRvngrP/qYhpmo4W6prS5RGS945xwgaYr
         J8FnYp460g5bYvynWB5wThOF7eePitJxFnnv4DwETYkS/+X5xJiB9LoNe58G7QOagI+G
         5U48IVNaLMrgPkDxMqYUj5e1qUJKWGOnHwi9+YcgalLsLkDxb6gczOm1XaS05+0Wi9ig
         vmfw==
X-Gm-Message-State: AOJu0Yxu6DWktpl2ppz357kTS0v+BZuzbN9KXdeU+u0jSN+cgQNZqoaa
	/hDyv6GOG8ekU1oPVawqwM4ftgD/JP+jA8QjiR8wRbVFvD1v9ZF+wzHYAEzloA==
X-Gm-Gg: ASbGncsePhVBj9cb5OhI5dCoOpuy8XqoClhITtWcg+7GPPHVtNbKrAiE1OX3Sb8y+h7
	6ofzXCqldOkCIIcQ2bJYUXMHyEfSp0J+hymGvnq+syhEr9h7MbwBZNmcW5DS+9DxxFQzabm4JKQ
	yPfDX3Sc+arU8opXwi3imr0ALTBYmsaKl25ztGtsf2jA1HS0fh9SwMApSH7bIh0/NBbPcbevPPh
	dA7iYS/5aO+23dhWehix9UwIIsSnTdbJ/znQHwunezoyQNm07qAJVQMs6fmsHnHBlTkrlwXVcNU
	MmSbhJUiK3ILCU0hmDjA1EIVzlgJO6uXDLuBslNXLLIevDxAoue3eDGDjWPKYnyftZ+gANY=
X-Google-Smtp-Source: AGHT+IGfRyrzLqouIuguhJX1EvIAT4WrGhshk5TOnZdYQWt9JL8vDRTr2ytWnBaeiPHmg0FmdsMp7Q==
X-Received: by 2002:a17:903:acb:b0:234:c549:d9dd with SMTP id d9443c01a7336-2366b19da09mr190252855ad.48.1750137997271;
        Mon, 16 Jun 2025 22:26:37 -0700 (PDT)
Received: from kamensky-p15s.cisco.com ([2601:646:9d86:8270::6b7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19b0sm71125555ad.61.2025.06.16.22.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:26:36 -0700 (PDT)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>,
	Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 3/3] oeqa/runtime/stap: fix script logic problem
Date: Mon, 16 Jun 2025 22:25:40 -0700
Message-Id: <20250617052540.8256-3-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250617052540.8256-1-victor.kamensky7@gmail.com>
References: <20250617052540.8256-1-victor.kamensky7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 05:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218853

Looks as a typo introduced by "6cf4d23a2d26c2767edd93f2eb317ff759b5a992
(oeqa/runtime/stap: improve systemtap test)" - when original command was
split into two parts 'self.target.run' was missed for the second part.

Note this and previos commit issues were masked because mentioned
commit has try/except around tests, so failures that normally are
reported when test assertEqual throw an exception never reached oeqa
infra.

Effectively, this test was broken for the last 3 years. I will leave
blanket try/except around test for now, so this test will pass all
the time as long as dmesg is working. But at least with the fixes
one can inspect log.do_testimage output and check that all steps
are successful or not.

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 meta/lib/oeqa/runtime/cases/stap.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index 23eace7e9d..6b55e7de50 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -26,6 +26,7 @@ class StapTest(OERuntimeTestCase):
             self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
 
             cmd = 'staprun -v -R -b1 stap_hello.ko'
+            status, output = self.target.run(cmd, 60)
             self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
             self.assertIn('Hello, SystemTap!', output, msg='\n'.join([cmd, output]))
         except:
-- 
2.45.0


