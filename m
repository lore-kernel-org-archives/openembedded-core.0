Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AE5C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 15:47:09 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.176910.1698248827231984276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 08:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=1hLEvEGR;
 spf=pass (domain: baylibre.com, ip: 209.85.167.51, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-507c78d258fso8486138e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698248825; x=1698853625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZKSAkB8AXb+krDxx6iPZFIE4+JVtHFgnD7HuH9JG14=;
        b=1hLEvEGRIbQNJVphCb7HWMnAkA2aMFAtZ9zrzvh8BIxAxqz7zq+P3NbDc6xekFDZa+
         vP5XAuv3XriJkHaff40VxVu8+YW4S2kZNm/b21n9+NWGurAZ/ppL79iJbd1+irjQ/dD0
         6Wzg8iHcGTRWtnzTTsTLH0Hu7KukwgoOK4AAf+Zf6w7WWQ7czEP9BX2vKNSYp3y2ffaN
         FO11XgezRq57dmZIiu4daTwEyNnR6sHIoFrvOtDi1/2IugC0nibDrclPZ7Z8HvQRoVtc
         k00LH1R4bOIMNTk6whB2OgzVj0JxqvLRHcojoyCTerLdgpdYqW/NrIG4eXLWjFNSzzsO
         J5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698248825; x=1698853625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZKSAkB8AXb+krDxx6iPZFIE4+JVtHFgnD7HuH9JG14=;
        b=CeF0zqVmN1fB+naBfVog3dbFL0Bvl7ZiXtOC3NyVCIIrB3vW8H6wQ5NtNp7WXVidx6
         jkn4gQv2ca8n35oObDd2cfqVBzHpKFRHt7Nq/Kh8/dTRWzxvafBdqc6WouNvqk4DXejA
         dxRqAMzUEUVgHsZ93IEG2iXzVvrPu1hI3KyNL5u3wPppUQq1JexP9punKs1xNNdGbEEq
         yHrhx/kCcpd40T8gKChGyoCOTsFFBKBXyHn8EyUPUkDBXAY5lGQsTJuX9NoUA8TVfU6k
         uJb3eC5v25GqXmo2QQlgz5kg2uYS4W9eHbA1AWSM7kFBOXRmBT0mCV5kO9ezqxlBdOY1
         iAlw==
X-Gm-Message-State: AOJu0YyEDMr/U6eVIUjmrtGr7xxOyB+gtG9UheXEo7ikILpUPFuwS1GM
	5tk4o/Acjl0MaRBAa2SxG20KnxRNxsiUbQcrEjWKsQ==
X-Google-Smtp-Source: AGHT+IGJLoKowMg0RZva3TH+S9j6gg8KA0uDArGe9RXoGmsM7DWKv9I4NzaCpE2i4SANzGPCwM/j9A==
X-Received: by 2002:ac2:560a:0:b0:507:c9d5:39a9 with SMTP id v10-20020ac2560a000000b00507c9d539a9mr11230334lfd.52.1698248825001;
        Wed, 25 Oct 2023 08:47:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b0032415213a6fsm12301964wrn.87.2023.10.25.08.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 08:47:04 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 1/5] scripts:recipetool:create_buildsys_python: fix license note
Date: Wed, 25 Oct 2023 17:46:55 +0200
Message-ID: <20231025154659.2442373-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025154659.2442373-1-jstephan@baylibre.com>
References: <20231025154659.2442373-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 15:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189682

License field of setup is not always standardized, so we usually use the
classifier to determine the correct license format to use in the recipe.

A warning note is added above the LICENSE field of the create recipe
in case a license is provided in setup. But when the plugin is called,
"LICENSE =" is not yet present so we can never display this note.
Replace the "LICENSE =" condition with "##LICENSE_PLACEHOLDER##"
to actually be able to display the note message

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 92468b22546..321d0ba257d 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -254,7 +254,7 @@ class PythonRecipeHandler(RecipeHandler):
 
         if license_str:
             for i, line in enumerate(lines_before):
-                if line.startswith('LICENSE = '):
+                if line.startswith('##LICENSE_PLACEHOLDER##'):
                     lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % license_str)
                     break
 
-- 
2.42.0


