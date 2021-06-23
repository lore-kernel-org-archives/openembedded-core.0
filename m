Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.4793.1624437253437345781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 01:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HR5XRJw2;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id df12so2330151edb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1D6VeRUmmbVjsrWqYpq9hwP4hSROtsm3W9IoJ2dsiUQ=;
        b=HR5XRJw2gVUwxqOyT1lYMdYWPPke+6Czzol9RyQvpVziSeIFpga3HUki2okihZGrJi
         gRitLj2eY/4bCSnIRVMOTDmGdd+Il3CMh4YkBLZP52OYYoFxE3aJAva9xTUllyGGB8Lo
         LfS/p0nVbxJHeGZ81HQ/zSkuHgX8kSewdBC7/2SefEzViMXl0D6yw55c4k8EE6SLz3MB
         +z+KJnjAdLxHBPRQi7Vac/1SwEDNH9gGlT5uHhWchTWE/SYj1lXDXbUeu1jV+EGMwGJF
         lWOLGnLmOzuw0zV64ewdS8dMW5nBwUemGP8SmZqUTSA7FSBlmmm6SDRLbXsyVyoFptoO
         qYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1D6VeRUmmbVjsrWqYpq9hwP4hSROtsm3W9IoJ2dsiUQ=;
        b=bfDXc+VNAcHHFYl5QEkDbEGbSF2nlZp4QhbFssdah7KqEPzyrKI0X9qAKMEAwybvqW
         hgQ5byn50wGISsNmwD0EbqHiOb0i0VwAgtd6ON+UzI7x1+IIBEGS997/abZoAy0XPJnJ
         fj3tQElUbcRBuyR0E6ex2siuHNSjB8U6p3XENvyXPuRHY0WLqrwdNxun1mEVhnhDy/PV
         qnHfye+IUlZWaQgeEYeewGnf8GIxWco9J20vP7lnB9XuVNRqPLJSwlynHzgez+Tm+q+u
         HK+eSEgLju39HttOqqaX6LrLQ3P5mOcXVlh6iBRSbBKMAlCq8obL0xFJqWBKGSMvnHtr
         w9AA==
X-Gm-Message-State: AOAM533TkApTmvNRzFBrI49e1O6SnZcFiAtEUZfwgmEWcUCvEBWOWhZW
	GukhNT5x6REaaJ/kO4GuHhmFkT4udr/tXw==
X-Google-Smtp-Source: ABdhPJyVJ5+4iNPQjZCEn7z8iTDkWUJIBOY+8Ge/m/3H4zib8XWUi+3voQ/Y58kQgXKsy7V6XNuH7A==
X-Received: by 2002:aa7:d8d4:: with SMTP id k20mr10627478eds.143.1624437251507;
        Wed, 23 Jun 2021 01:34:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id m7sm13013827edc.46.2021.06.23.01.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 01:34:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] pypi: set SRC_URI with _prepend, not with +=
Date: Wed, 23 Jun 2021 10:34:03 +0200
Message-Id: <20210623083403.2060507-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This did not cause problems in builds, but broke some devtool
workflows such as version upgrades or checking the latest version
from upstream. Tarballs should come first, not the patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 87b4c85fc0..384a209874 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -19,7 +19,7 @@ PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
 HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
 SECTION = "devel/python"
-SRC_URI += "${PYPI_SRC_URI}"
+SRC_URI_prepend = "${PYPI_SRC_URI} "
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
-- 
2.31.1

