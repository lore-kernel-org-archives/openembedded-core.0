Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0119FC2BBCA
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.16252.1718787604212406388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PU6VyUUd;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so436904f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787602; x=1719392402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilokTvvRJ2i+Gda46srU0Csq5o9YTyK4XzTyqxgh2MU=;
        b=PU6VyUUdDs0rV56JybFG2Tipxxw1aVDeYPMsF7W7A6Mc3ztner4BVgb4aSfno3E2ds
         oJXZT4SLPCX7/Tr4j2zS6War7qgZKT4I9FZI/z1kemP5ZnYHyZvGm82UonFtbMyVJMZb
         OsifQHPbbAdkRTtr2zN9lfs5dMolUOELf8PcLdvpUMubo1jJNp0d0Z+rirL43EbpE6Sb
         uKKaC0EpRcYH64CVlHVS3YSpajqMJmN/widWeHV8VJVpY2X0ieS9v5NqENfXKAGzct3I
         PWDfUO9/iTjydF3WBJPow9L9BsMtsGF535kExTjwmceGZtgoMyng2M8I1ajOwZQEIGpd
         b3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787602; x=1719392402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilokTvvRJ2i+Gda46srU0Csq5o9YTyK4XzTyqxgh2MU=;
        b=w+dfAntP4qfYELNnugZJURePI3JRl9ncIxuXywzAkYVUrNz1fLyLzCKt+JbOapXCmG
         EkPoPcW4JRuM1/y26Y3irUVZA91kjv3eYtClei3cXfRCzYcJxW0zpLSpP9QAjb61p6K/
         C13sdIQ61BSAksZB9jKtvde15vrhtd+VwcpZgwLTs/a/NMeTCUA0BdDuLl/8KJGv4qFT
         9wwcoxGyUYCA980jahEEgXRcX29ze6zuxrSSFZe6qisK7FOp38mOmmbX+YXbfpW/FP+B
         GqOyxLjBOZjyJWbmRwvz4Fko3gGDmQ6iWi+bS2BFy118dPaPh3RoVn0G+USF0UVT1umg
         GeCg==
X-Gm-Message-State: AOJu0Yw00iAQyMoXWylY/sRCSc8PACZynOXgpu6Sr3K5bBFsbNTlTrrd
	05vBF1NxcG1NR5p4d9FKRkwS/o+7Nmx9QGDLAp+MwkoYoca1jcBd89kbWw==
X-Google-Smtp-Source: AGHT+IE2MTrYv7ns1rg6NR2z/TXxbAINJE8sJtuI88TX/4p1Z5mFIL6Itmi7oVZQPyf8i6DrZWT7jw==
X-Received: by 2002:a5d:420c:0:b0:362:2ad5:724d with SMTP id ffacd0b85a97d-3638c33fd0cmr1090245f8f.10.1718787602599;
        Wed, 19 Jun 2024 02:00:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/15] python3: submit deterministic_imports.patch upstream as a ticket
Date: Wed, 19 Jun 2024 10:59:45 +0200
Message-Id: <20240619085957.2787700-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200889

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/python/python3/deterministic_imports.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
index 104df949644..2de6ae2e981 100644
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -11,7 +11,7 @@ has caused a long string of different issues for us.
 
 As a result, patch this to a behaviour which works for us.
 
-Upstream-Status: Pending [need to talk to upstream to see if they'll take one or both fixes]
+Upstream-Status: Submitted [https://github.com/python/cpython/issues/120492; need to first talk to upstream to see if they'll take one or both fixes]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 ---
-- 
2.39.2


