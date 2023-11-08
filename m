Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11793C41535
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:17 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.13934.1699451229047108541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:47:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qV+O9XNX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc9784dbc1so43763585ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451228; x=1700056028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7pqI5PNZ7Se3roTn+gMuWkHVdeN6bO8KiasPXWmlkI=;
        b=qV+O9XNX9ryVPytOo1f5CWXDbE04Hdw6yIt6lIz2Krj+11aQ5ZaV9gDfeoHUSfO/vV
         ULm28itMWvWOJe/G6r4ktJCi1XiG9fTo8YrMmuWljfSbYBPwoO6j34heK0MBjZ5CYncG
         aJtIBvE+DhJMhgAZ6e0j6F7DYqUKZrgS/89vxmEWHPBBY2BSHbxhp5yGsNQC0H+wzL/n
         LNpiPAmt2sFYSizI9EqcthsG64GUegqQpvww08wv5ga2Jqr3Gjzlyehapt4TxjDmkc+y
         vZL4k8naIIE6EZ51i61Cwfizq/lj356K/6EJSrk3WaOxKmuuYhp9AXzoxdI9Oi9YV/Oh
         2kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451228; x=1700056028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7pqI5PNZ7Se3roTn+gMuWkHVdeN6bO8KiasPXWmlkI=;
        b=EPH/pXC22jkEtv01yo5ZXUxby3Y4wkd+AbVISIfxpWvExKgoorNHB0cFiczlgxltOd
         WGPBpqDOm6yEqsrgSVabp/8EevNolHuMI4roaEFZXkmTPtbe75fzynoc0fj+JBs4Q6LN
         jex36bn5J7iI4guniE0AHpGuWEcy7kt1RCdHNrsSXKaCDDfkCKthcGPzTbMTqrgsgoD0
         aqYbuHUZ753g77ndd+RgTefVmfu56fcttoXAQJ9EJf0outf9REXmBNFkp4c1AlOqnZAt
         3X7OHhJkRPSa06B3z1ELiTRgX99cq9x7nNkCFCrl6tr2UKUEfvY5eFfkVssAyPvDFHrm
         jL1Q==
X-Gm-Message-State: AOJu0YwVE+LgSN0zDFPGsSk4KfPmlWH1Ab86lPID4bv9b07CdyAAB9QW
	o8tMvv2fFzj00FqkGrhRizDZkelWJH70GXMWPFT5Cw==
X-Google-Smtp-Source: AGHT+IFK9+oEG8RjxRIKotlKXdii3tq2V/1FDiXQLtkbwm3HlG8mraY4c0b+KZFOnszUoz+M0+gCog==
X-Received: by 2002:a17:902:dacb:b0:1c9:e765:e14a with SMTP id q11-20020a170902dacb00b001c9e765e14amr2333581plx.1.1699451227813;
        Wed, 08 Nov 2023 05:47:07 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.47.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:47:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/10] cve-check: slightly more verbose warning when adding the same package twice
Date: Wed,  8 Nov 2023 03:46:47 -1000
Message-Id: <7d7d1de6211b2813c1679bb9ce35289607d66c12.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699451066.git.steve@sakoman.com>
References: <cover.1699451066.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190332

From: Ross Burton <ross.burton@arm.com>

Occasionally the cve-check tool will warn that it is adding the same
package twice.  Knowing what this package is might be the first step
towards understanding where this message comes from.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c1179faec8583a8b7df192cf1cbf221f0e3001fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index dbaa0b373a..b4c9f6ffe3 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -165,7 +165,7 @@ def cve_check_merge_jsons(output, data):
 
     for product in output["package"]:
         if product["name"] == data["package"][0]["name"]:
-            bb.error("Error adding the same package twice")
+            bb.error("Error adding the same package %s twice" % product["name"])
             return
 
     output["package"].append(data["package"][0])
-- 
2.34.1


