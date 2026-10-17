Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9A6CCF2C4
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 22:57:15 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5717.1792277828998912632
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 15:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30b6dad2382so2838638eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 15:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792277828; x=1792882628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QixYrsBApXnXr0nnzdwFL94BOHZO34Po1CcREZ9O3mw=;
        b=HDHq/0QYhM7C+14+UxNxKHcJOWjAdNhSmuhrfrEpXZ623Z0zYCX2XOApMHkrOjwr6A
         LRDp6NnziAXgJwxQyvv3hWp3GrOWuPyrQT2WCh8TgQL6WiG7LfIxDGdtTlpfrEcvIRWP
         reWI2WMt7wauogu4W2KSRw48WTsYwpXB2ZA1BU8o9BmaI/6HXj+9z8eME49VFgKbAjgW
         P45XkZcOgt1LOAG5S7y7eC+FcdGtfMeHirY2zUNSJT8uX+liYjsCdrxFbjghlfrQSWZ+
         h34/uv+KJUosn+sOZJxRAOGNfBA8AhKuZz/v0WVyoxKJxTpIY4PaeYxNCGsSI6YgSdBg
         RYhg==
X-Gm-Message-State: AFq9FYIsEHsGadF0tBBB9nMC4zXrN/zGiSvynOjVdnygeeHR/VM5vtna
	xI7/8ks7c3SxZEkOdi16dbavY8NX8lun2CkKljYcfUVS4qftYwHXrZkInbxXOhpQ
X-Gm-Gg: AYBFou2FZitaJTAow1KpVCjpl7ND7KZtX2pdzkjY77NZe3lw4HW47EZi01qbirWvvxY
	xxieHNZmDFagRdUtZxMy0FIShzcLyqKb9pM35ao9qs48VmRcl7qU79YI567pclhk/CKCnBNhqjB
	rVfbL1jYwryodNi+OG5jNtLBRwxQXyTUrwpL7O3sl6XFtxqStffhU1FMLUnTnRYutK3ns7Q8J6y
	MVQNQrlGz2UcT201JeDjpqmwbWPb4MoWsm3Y2Sev/ARiYewxzUr70W/J8jo0pzzHcPJZtYHb1eN
	4cEInp+LMjV5x/l0wWAJ3DDg3ePVvMwxUaOtNh3gZx/8toJpTE5Rb7er9KJIQJ+PGe8BRaEsvCv
	u/0UPpg+4HyoTM+LqEqR+CWV6Oug7qqirDdwZJ0H/6IB9DUYFZzxjMI4hWHaRKQB0R1ykH+xTwE
	GjpNv3bVHtUaevjhhlS6hohwiVNLrEELpOhvQ5DT/6Wh/q3NGNR20cprIohmLIrJref1cO5SBCR
	k2M2CZdENFaMie5TmbJD2ma9wU2NWhtEjktK6ERwktNxYYkXVsfKLDQ7xPIIADdeEYy7BkhHeVV
	P5Z3eq70nD01oOw5tPM1v/o5W2cbgb73PsrBOdK6auj7+TEPEFJweI+JxM/WCc14+pU+IP0vbWb
	w
X-Received: by 2002:a05:693c:8946:10b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-361a1f567a5mr4795746eec.30.1792277828378;
        Sat, 17 Oct 2026 15:57:08 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082f7f6e0sm21244088eec.27.2026.10.17.15.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 15:57:07 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 2/3] yocto-check-layer: Skip initial signatures unless test_signatures runs
Date: Sat, 17 Oct 2026 19:56:55 -0300
Message-ID: <20261017225656.680168-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017225656.680168-1-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 22:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248099

Only test_signatures compares against the world signatures dumped before
the layer is added, so a run without it, such as "--run-tests bsp", spent
a world parse on a dump it never used. Dump them only when --run-tests
selects common tests, as it does by default.

Tested on meta-freescale with "--run-tests bsp": no initial dump, same
results.

Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/yocto-check-layer | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index e747451366..2fcb90acdc 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -214,7 +214,9 @@ def main():
         logger.info('Getting initial signatures ...')
         td['builddir'] = builddir
         try:
-            td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+            # Only test_signatures, a common test, compares against them
+            if not args.run_tests or 'common' in [t.split('.')[0] for t in args.run_tests]:
+                td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
         except RuntimeError as e:
             logger.info(str(e))
             results[layer['name']] = None
-- 
2.54.0


