Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E881CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:23:39 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7671.1781043817149766057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 15:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SrZiXICa;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-43bfe209e45so3853911fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 15:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043816; x=1781648616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv5OKQop7Wo7gff8+1BGhZIiH0L4lHFQ+T/i52i5NQw=;
        b=SrZiXICaIIuqdTG25Sg7g5kuomZvloF6PZma7oWAWlzLOyuB5gvBcTGIacxC2m0+xV
         bIhMr7fl0yPa8Zs0ROsreCNKNA5auiSECSR8MeEo4RNiOI8mEVEM4u5MPa4z8BuYgVwV
         XY9dg8+SpCOpBoJGb6VMPLYvcsGngQjPzOod/QqphSL/50olxjPp8whkCq33zMAmm7cc
         gPxgMc22P75DNvBZFxxu00QGYThLvALDH5Plm8ibmcSod64PFmrAUP6QWzu1+Z4oPCly
         79wpt4xtv+UivsgfzMqGo0YRKOlvElrtHqaLbk1R3+v3oXvjONHBFlq/Dyo+TN+d+CXz
         6N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043816; x=1781648616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fv5OKQop7Wo7gff8+1BGhZIiH0L4lHFQ+T/i52i5NQw=;
        b=UZMfJNV2lcr0S7YMmMgKmeaIH1chlEGF59zBxewJ5cQ4xzr5WNb5PmGgu3SKrZWFDw
         774UtAmWV3y0gnDNbpOgE6j1lCAS+s3+DCnky+5+XOzsbP/SHYsssDvCqjxb/Dn9yFDc
         RCpMBFLhYIYpUiqWWDiM/PkXoZcBXDfJ0aQaPRvx4zW/KDnwuN8pL9o0HfbvI3Gt57/+
         aQkhJQ1FsKNixdOEL9hiK2eouUyZXVIVTt7WDNyeGHsRglAZAYXD94TuAYMl78+BvkN3
         7nApyD9Il1gd2yk7MM4Am/RtVXvTpyWMEO6ADn3uPVj8EJ58CjxNy1kEF1A+SDqIfNcN
         nmXg==
X-Gm-Message-State: AOJu0YwNc5dZf83M46ZG6I+axIBFmdEItvg0z4NiP9glC2PVwqBNcH9d
	FR0X7XQbP5dlte7MNG8K/zPZtOUY5m8DlXtvVOaJINDw9ytPpKEn3/LnJgYwKA==
X-Gm-Gg: Acq92OGesDlr5tK6UnPgSdJYVgCWLKQ0Jble7S9efu4w7wmp0vrDb2tkF226zMyrEEo
	yyqt/tlSAOJ+eKb+boq7OXtIdp0B/dCqCEy3wH7D8Oz0LJsaSeD1+I+zroA42ybSZZ9XeOfQ9bN
	1mZCvsW89YwTb6ZNj7P6zUIEoemaZaUAX7UR2FMdU5NMS0QN0uemoM6PfIF4AgJM+I+5XIeJ3zY
	mwI2OOs0qnusHnXNouniC5DfLOp0gi3QoKI/v2+10fwrBhi3+xKlSkRv7fEmBm6Ep8cdnbgAiI3
	vEOaEr4TcAwpyUusVqtfIA6mlJhBOHBCkDc/68sVjcwABSuOGMoiTF4ZlaAM8zUDVD1vXPmEM+P
	dvrKBy9bf1cVk/JL4bvOuBj6s4ARyXFtWIAnQPoRP/qGnWEcXTnlmVuPOhF1ACRJdDIW5ff8i1i
	aqovhIzg6zWHwnV8ViRh26EAKBXf+9Gg==
X-Received: by 2002:a05:6870:390a:b0:43d:2f82:beaf with SMTP id 586e51a60fabf-4413da90f3dmr12227441fac.13.1781043816286;
        Tue, 09 Jun 2026 15:23:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::ce1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7d4f449sm19122610fac.8.2026.06.09.15.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:23:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/5] classes/baremetal-image: Remove "do_" prefix from image manifest
Date: Tue,  9 Jun 2026 16:15:52 -0600
Message-ID: <20260609222331.1293007-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609222331.1293007-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 22:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238304

Removes the "do_" prefix from the image manifest to match the naming
convention of image.bbclass

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/baremetal-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
index 4afc171314..7a6e71853b 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -45,7 +45,7 @@ python do_image_complete(){
     import json
 
     data = {
-        "taskname": "do_image",
+        "taskname": "image",
         "imagetype": "baremetal-image",
         "images": []
     }
-- 
2.54.0


