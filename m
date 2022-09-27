Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E8EC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 12:09:33 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.10049.1664280568690338422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 05:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OdpjuMoR;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id c11so14632723wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 05:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=4hCrfK6rDTOhidVQCU+iKZY5lKnmModLOYALaOd1gU8=;
        b=OdpjuMoREpOg+0GmUHNACPnyb3mUt/JrQ6s6NVa/20Ha2dPYxgPxz47wdIEeCDcGST
         zEp5PgGwLfumI1SyGEpConAe34GDd7CrAzX72XcyYZgadJTs+4rSXMoW0xoDfXqnbbtf
         /wi/hZhoN/GIbAIeY7vv5XXiAQTtaXr+NQq0h3M6bw4mDcoyfgqY6+X7b8Zg+rA9p4lf
         j1woc67P1vx/gc1AVf68UFpL2+yMiAdZyfddTeCDCo+oxcFW3qDJFCD4613QhhUHY8wY
         o+F1lE6ntkKjq6MO95YU7z1S5Z5j+FfhsX/VxCXxYb2vBIl7JtXKBF1yn8lV+ZYc+D+T
         7z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=4hCrfK6rDTOhidVQCU+iKZY5lKnmModLOYALaOd1gU8=;
        b=S5acdD6hrOr5qDm0XPTn9JWB/pTg+HMx2idzVybIcA38uWh2TX4Kq4RCjA4Mg1wWDJ
         pZTzJMUuUswZ+PdPcEvfYVK70XjJ0KsgeOFqHjmTFnrgEbjjgTX5R8URu4Ae2E3HtL9Q
         dLw7lGGgE40bEe/MikPVUryewU8R7CbSf3J37ahcgoZh/fYffI3g8+E6HMh7YAdniRJD
         VRaYnhHonhLLzUMqGrs+kLKS8PJRZbTcGZm1fc211SEydwZZRXcGdMDt6Mhqs9Cx5lUt
         /LUWpyZxuoBx+Iwv3lXk4xlmrqYyWV+CagwTUbanHncZ3vTzogN8eHXSRdstV6GN86Fh
         hSeQ==
X-Gm-Message-State: ACrzQf0YGtma/m6Qq+ERSueXVykeY1evknUTteAHOxH76Vd8VK7WRl1w
	X0+uknCbP9S2ojl81oMVd4phEWCdYaU=
X-Google-Smtp-Source: 
 AMsMyM57x9bYr6wEN5te0HCUraxkxthQTw/Z7rhYyiQMGsOgF/uPsrjUuCgCw7FpEfIe0KQ9pSZXPQ==
X-Received: by 2002:adf:d206:0:b0:228:64c1:c3fb with SMTP id
 j6-20020adfd206000000b0022864c1c3fbmr16479111wrh.260.1664280566884;
        Tue, 27 Sep 2022 05:09:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4743000000b00225307f43fbsm1608096wrs.44.2022.09.27.05.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 05:09:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] githib-releases: add a class that consolidates version
 checks
Date: Tue, 27 Sep 2022 14:09:20 +0200
Message-Id: <20220927120922.137422-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 12:09:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171096

github has recently changed how the releases page is structured:
the tarballs are no longer listed directly, but are included
via separate 'fragment' URIs. For now, we can change the check
to match against the release tags.

This also establishes a common base URI to use for both
fetching and checking the latest version.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/github-releases.bbclass | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/classes-recipe/github-releases.bbclass

diff --git a/meta/classes-recipe/github-releases.bbclass b/meta/classes-recipe/github-releases.bbclass
new file mode 100644
index 0000000000..ed83b83731
--- /dev/null
+++ b/meta/classes-recipe/github-releases.bbclass
@@ -0,0 +1,3 @@
+GITHUB_BASE_URI ?= "https://github.com/${BPN}/${BPN}/releases/"
+UPSTREAM_CHECK_URI ?= "${GITHUB_BASE_URI}"
+UPSTREAM_CHECK_REGEX ?= "releases/tag/v?(?P<pver>\d+(\.\d+)+)"
-- 
2.30.2


