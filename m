Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.4437.1591214636374577715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d3/A5lf/;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id c3so3668976wru.12
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gac75Juf/86ShdTqLwHdupxV0nFEYZoZe0o/aWQDO+8=;
        b=d3/A5lf/Ii25lsxcHduV33qImBF278b6PtFiFQwd6vN5pnbwH/YSBOA9r0eGGWQCBI
         BYK4heinzO7PynVPVL8T21bHO4qa1sVLmSQFDJq3oJwnOv8Y+TT0Wxoco6PH1MHFRSlq
         2q5EhIF+2n4c4kMHEBjNW6G/S5aWqadjk5Y+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gac75Juf/86ShdTqLwHdupxV0nFEYZoZe0o/aWQDO+8=;
        b=c+xkezUj3zZhIgCYvxehRfvQXFswBbrsGx359X4qPgbieqbIUpV+OY0GtXhPJCgCYJ
         05FflN5Rv+3vNMaeAUO3haCEeDA5aYY3UlXumNesPQYAfLmCgX8BmNWEOXQzkZFIrzOj
         aDHkYIzIliVPD/Nyn91kXUV/WbJGBnmIxDvYGV/RevNbMstZwqv85SNyvmmV7cqW8YWn
         7GNH7/fgBCJC4AqQ/SQyTfmJi+5pC1tdtYCeF1AEdCx1xR5E13IvXeMsiRY6i5OxdUZ0
         559r/IQcnpc14TwS+fJ3PaGsE97M998Wu/qAe8NbEnkslFvREsgjlCuPqFk0K+If/sN8
         B0cw==
X-Gm-Message-State: AOAM532T8f0eDJEhv5FixAb9hdef/YfqZD+E0fyDr2nzksZDT9Dqmkdr
	xN+ZWI5E56hc8Pede4YXnCKAAO2pOhGEYg==
X-Google-Smtp-Source: ABdhPJx4RAlXMq7fnuMnRQnBd3lElwwosHxrwxSCuJ+6nqasjFix2GUM8vEZV1NemwoAqHgBnoechA==
X-Received: by 2002:a5d:6b83:: with SMTP id n3mr963582wrx.395.1591214634787;
        Wed, 03 Jun 2020 13:03:54 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id 37sm5007030wrk.61.2020.06.03.13.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 13:03:54 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] archiver: Fix test case for srpm archiver mode
Date: Wed,  3 Jun 2020 21:03:48 +0100
Message-Id: <20200603200348.23291-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can't assume that rpm packaging will always be enabled when running
oe-selftest. In particular when using nodistro instead of poky this is
not enabled by default.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index d557d9b576..e6d321f157 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -126,6 +126,7 @@ class Archiver(OESelftestTestCase):
 
         features = 'INHERIT += "archiver"\n'
         features += 'ARCHIVER_MODE[srpm] = "1"\n'
+        features += 'PACKAGE_CLASSES = "package_rpm"\n'
         self.write_config(features)
 
         bitbake('-n core-image-sato')
-- 
2.26.2

