Return-Path: <grembeter@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FFCC25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 17:47:55 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.771.1717436874071824620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 10:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ks+xoPZF;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: grembeter@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaa5cd9f0bso18055381fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 10:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717436872; x=1718041672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WXDQl1Mo4gm7QdHREj0CJVu2U8EfCLhjz9L35jecWuI=;
        b=Ks+xoPZFgJYePmC3EvXsFw4fm6TlNqoxeZKGMu8aRvktAODKMZ1UhqTRFHdrFU4Kz7
         R1rh7P/1mKrpBAf2j+N2WiIpXmjkfRx1F/ogeIphGFpSGSiOlDCeZOrkwujwGOybHgoF
         rS/XQA3/Smgu9q6vuue9lqW8wsYHsDiPzZe4seXF7ufANj8bo9GdvttZKfNSVC41yssI
         4MkiY5Da5YU/Jgy7+eNUgssoNRYbnyttfIJslbVvbPk1QlXXbdACtvO/kCN4y2fk2qmI
         u58dDmUtgYaVtsi760jN8AQbdjWK/9w/bzzzK9+vuMcs2HtfQaX7LK/Bay1+5MBybUpy
         zbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717436872; x=1718041672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXDQl1Mo4gm7QdHREj0CJVu2U8EfCLhjz9L35jecWuI=;
        b=N/SpYKcqn1N+JZjcAOFs7DVXAzQOBJ+oVi5z5DnkRmWeVYSbnvq+8wxHo8tUnPbG9+
         wFyXFFh4cum4a3T/RV9FRoSDo40k7QFmM+cuEbilOiL7UJM4SfavRR+Qrogipal3fYGD
         CdkrvBfa14uejvOC14tOILwzv8EhAaa0ElsvELnE6miyPx8c5EPjp/8SW0LakQvpo5lh
         l1VQumUcUQeGZGAClQbIkWcKRWNrTjZpEsPdUk2+4xWVkFNF8Y8MVJroV72ht7hV1OGY
         dlxo611zgCmDBwV+PPyLZ4oU327fkMtWPX3mxQ0VenYeFAA/MSFvqys0ngEHRTgrdhY9
         Ql8g==
X-Gm-Message-State: AOJu0YzaPh7KEJeScUGCsjOwt5+4s03hQiBZLLzhUbovMO2ZTC5DHUwT
	Iedug+eHXjdD3YDJFBbTl56oEtVZCAa9OqaiVlbljnOVljsLMSCoApKIxw==
X-Google-Smtp-Source: AGHT+IGsj1xsDpCUQNtAQN9SO2EdLpmgQTfYt40kIRQ7oQo1R8g8eePz4gQcavFD3pZrGld3ZZGocg==
X-Received: by 2002:a2e:320b:0:b0:2de:6f52:5c8d with SMTP id 38308e7fff4ca-2eabb7cd6demr1207871fa.21.1717436871790;
        Mon, 03 Jun 2024 10:47:51 -0700 (PDT)
Received: from think.fritz.box (62.54.143.157.bbcs.as8758.net. [157.143.54.62])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2ea9bac64b3sm10164261fa.60.2024.06.03.10.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:47:51 -0700 (PDT)
From: Grygorii Tertychnyi <grembeter@gmail.com>
X-Google-Original-From: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
Cc: bsp-development.geo@leica-geosystems.com,
	Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Subject: [meta-oe][PATCH] python3-pytest-html: add missing runtime dependencies
Date: Mon,  3 Jun 2024 19:47:33 +0200
Message-Id: <20240603174733.4338-1-grygorii.tertychnyi@leica-geosystems.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 17:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200274

Upstream toml file mentions Jinja2 and pytest-metadata as runtime
dependencies.

Link: https://github.com/pytest-dev/pytest-html/blob/cfd32d08488e2c6fb72f0617db94ab41d3fca8d0/pyproject.toml#L42
Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
---
 .../recipes-devtools/python/python3-pytest-html_4.1.1.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
index 37478ee0ae35..154ec255cb5d 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
@@ -15,7 +15,9 @@ DEPENDS += "\
 "
 
 RDEPENDS:${PN} += " \
+    python3-jinja2 \
     python3-pytest \
+    python3-pytest-metadata \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


