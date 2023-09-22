Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B8ACD4F2B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.16353.1695367492732926924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIrvzLc+;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9a6190af24aso223846366b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367491; x=1695972291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SohMYHBewsHsdW+0cUthZg61YyRkWdYDFJ2cPISed/o=;
        b=WIrvzLc+LItqS9CZszz5zSMVxNbhOH4BE4/pQQbfl7T8pi5VR8YaYpKQg8p3Js+XL7
         DuxVDQpAoC297BL8LRVu/pz0nx1XnXsrcKg9f+iVIAsjsD0umgQC8uAYPgdeQXu+l+pB
         qx+kiy1s3mmdm6vCDtTZCj+BWWkGcJKPo6sObSJlfgRd1YTYzW4HLC24DpmG2WNk8hsJ
         Fj4CStGupIelLzIuyBiahzrqXqOzKosc23QB+hiv+uXWqE2xSWi06kABYJwlsjUOFgB3
         Mp7tv3K0eULxRweBcLR6G/gcS7qxUQ5wRRlpTd2z6u1oOidY+bsQEoJqZN9GysFz7J5l
         Xx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367491; x=1695972291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SohMYHBewsHsdW+0cUthZg61YyRkWdYDFJ2cPISed/o=;
        b=qZWZKypGeQSFQ14gvY7PP4gHCggSMDUfE2GzIX2fHii6WYN1m8rQFrmMxkHUZOvBIF
         jlaqOJg5crNqwy6SvUNW8BPm9VJ53oUDoSYCNg6qfI9bMoJ7AN5UkJf2RvMYcwzAsYoG
         qXr4ESIqFwxObQ2mfvopI2kpegwcZ6GEjYQ+GiWeSyqWe9u+p7IVKx7n4Ld0j4mNHcN2
         lMC6JqAtGlj3r49PBf2QkH79Nl2KJ5O8nCS90GnHAhgm9TbA7I1raVsI9a4pIjPpG1AI
         +RvgSSSh31wE6cl+57QlNA7IoR98J34zj0/kqSMgspaYszrg0LmGBBTfUWf0X2H9GCam
         hK5A==
X-Gm-Message-State: AOJu0Yy5KZnG9EZgRP+k3mg7DQ/BYSN764s5VxUTlSP4bOpm0v85JTpX
	IGF40Ih7+Ds6FyvhvZByl3zXsn9tM/Q=
X-Google-Smtp-Source: AGHT+IFcrsCCt5at3RNzPAKvYkE/XDyDBoWYbwczp9W1ZDFm7YdMLSxri+EOIuU5We8/NRqMEsy1Ew==
X-Received: by 2002:a17:906:530b:b0:9ae:5487:c71c with SMTP id h11-20020a170906530b00b009ae5487c71cmr5455975ejo.49.1695367491217;
        Fri, 22 Sep 2023 00:24:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/40] mmc-utils: upgrade to latest revision
Date: Fri, 22 Sep 2023 09:24:17 +0200
Message-Id: <20230922072431.1481743-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188069

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 879c179dd73..2d02927af7b 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "958227890690290ee766aaad1b92f3413f67048c"
+SRCREV = "613495ecaca97a19fa7f8f3ea23306472b36453c"
 
 PV = "0.1+git"
 
-- 
2.30.2


