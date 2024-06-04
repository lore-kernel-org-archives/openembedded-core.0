Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45774C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 13:24:41 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.21474.1717507471356093333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 06:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=M/bElvvu;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4400904c39bso19659671cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 06:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717507470; x=1718112270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/eCSYy/qFUoZR5/NZBNEnSNgcNNCeol54Wl32ljGYI=;
        b=M/bElvvuxmnFj4Q5KiQeAjehsam39kV7Gum4QULFrqU9HwfZLv4UyjW3+FeQ5MmmQR
         TbiG0hMz+miN8zYIG/bENldQUzqsYpDANziV/XEglQInXksXzp4aPuxIoY5G6essQk2L
         Yu+el5Aqd7/XdVNlDua9iGAp5WhWhv+xE4DwWp59KTEBhDhGyow+E4qjDMctHEeXmOB0
         YLX2JomQvLQrxxgTg7Oe9fk+jX3Hu8JNHgBEvlPwy37OwAHacKIhol4NkIjkEM2AouY2
         v57ltyKDEDhgt03zlQgXLLTE0WwonI9Wi+R8G4W+V5jIqDW36IGVYLJzBYF0XrbIq28U
         vAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717507470; x=1718112270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/eCSYy/qFUoZR5/NZBNEnSNgcNNCeol54Wl32ljGYI=;
        b=kKfd3BoL14jdDKNyEd+dWZ0nSPSKh7/HjnU7C2wqvJiC5fqGk3MxColv7X0V7OtIPe
         jCgHQt1OIIxNk2Poo1wWIHRFy/kSpfa+FHbeksgzpGq95mJqlPbZi6gE989NCXBS4r0t
         YTbtkh1rzNQBxj1ZIpBUNthAkFJuKmFLOf+ihayP+2N/GavkHCDTSgdgZ1ChF6BIbW+O
         UxMyfhQeL5zkyD9PLXNfWJzMeJaByqOBdWaukG8UK/XRxElB8OZYfhVBOLuwWFlwX/0F
         NCAMJ9Ieh68y19R0fCtOUKzr6EEn4qq6ZsAtNnCvndfvPh2VTWr9/DyXnj5cC4zmPmrk
         pnxQ==
X-Gm-Message-State: AOJu0YyWo0dHMsBvmCRJiT96CXZuL5Kq9xqi19blxm+G4YDwEOXvgvLv
	ith+D0PW/J9/B75JCa0R4F2o+2ZpOcMrRHmLJunJt7RPBse9VaHDZeT9Wt6D0mprKvWHfMRQr1V
	w
X-Google-Smtp-Source: AGHT+IH4LSZ4B5Gr3GmJVfvSkZlWkOl1AJIzKnsUxBsDZikYLEiXdNpN14I1rHRUoA2e2cwmjGwSbQ==
X-Received: by 2002:ac8:5786:0:b0:43a:4733:ff4f with SMTP id d75a77b69052e-4401999db14mr45593981cf.18.1717507469976;
        Tue, 04 Jun 2024 06:24:29 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff2467e10sm49266761cf.68.2024.06.04.06.24.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:24:29 -0700 (PDT)
From: tgamblin@baylibre.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] python3-trove-classifiers: upgrade 2024.5.17 -> 2024.5.22
Date: Tue,  4 Jun 2024 09:24:27 -0400
Message-ID: <20240604132427.2700918-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604132427.2700918-1-tgamblin@baylibre.com>
References: <20240604132427.2700918-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 13:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200336

From: Trevor Gamblin <tgamblin@baylibre.com>

Changelog:

3674fe0 Add Trove classifier for Django 5.1 (#179)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...iers_2024.5.17.bb => python3-trove-classifiers_2024.5.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.5.17.bb => python3-trove-classifiers_2024.5.22.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
index 94c48ed102..8876b63e7d 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d47a6f1c48803091c3fc81f535fecfeef65b558f2b9e4e83df7a79d17bce8bbf"
+SRC_URI[sha256sum] = "8a6242bbb5c9ae88d34cf665e816b287d2212973c8777dfaef5ec18d72ac1d03"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.45.1


