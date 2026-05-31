Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE184CD6E56
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:14 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16903.1780186693823763829
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fQegkbBJ;
 spf=pass (domain: konsulko.com, ip: 209.85.214.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso1885445ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186693; x=1780791493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfy2x/xiOYP+5Zq3H8w99Tz1/fSVOKND/vu4JXktFLM=;
        b=fQegkbBJX88fE9yU4H2DXsYMIH3muUZBn3UTeiR16reZBzc+BceUnvy6wL7pvEWSzM
         jWgoqAA03FZoVQw3QtsKR+y+R3n5tPXHiUi7YJVjUqEaIjG9OJyCcBHw8DMz9WBB68Aq
         eEAb1sNeq1TGaM49hkPvAOnQogDXIZfST3YJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186693; x=1780791493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vfy2x/xiOYP+5Zq3H8w99Tz1/fSVOKND/vu4JXktFLM=;
        b=mSeIcbfBdASuzaBrPVUA7l2dGBumqJ2lavtFgbKIWKpkUIVL/GkkaRqxjMhiBa1wqm
         sCddxE1ZxdV58k7TpKH9BJBWs9SKMcyzLfvFmr/DsPQyN4fTcix9YD9BIb3WcGYGjZUl
         9QYTqUMCxAAei3E7JbXwRkGQLWp3zO0dFBV0ZnLspAfq1Xg8cwpEW4+tfKd5lKbNg5Ez
         N0DZEpdDqlc0qvsqxBEOVPMcYpSg8rhxAq+SpVhClbNtDfrZtaJ72Kq+0TzFC5Kx6Bj7
         hnB0OZ+kJxIVvPYSFWc0EuJ3D9rVg0rT/YMyjlS8pKY0/n+d6NgZCIlN/TznvIg+50e0
         y7Pw==
X-Gm-Message-State: AOJu0Yxl07Ws3uNLv3N/RvNbt3F7ojQj3AsSxxCNMEH5UtrDStwIWGUg
	pLbLSi5izrx83PS77PyV7UfRNN1LPAJqe7g/0FfkLoyQkWEV5YIwE4OfCI/2tZZGOuLOROqVCw2
	LwN9D
X-Gm-Gg: Acq92OHRzuI6OgVb95C+vEWBWd6YQNdOqVHmM8CIU3y2CETj9+pU9s2h/NLxk3GujsF
	22sgnYsdNTtO4/wC1ku8+avR9nq+WQticY9EEWTS8K0JHVFtsNXf0lsDWv9x9HGig79KDGExQwK
	U36yRXZ+E6ueTVKl6DjVcaUkWxT0ks7SNnvJ/rCAw8bL6WAAsIQcXE6VAJ6wVKh/V/tqlInKcQA
	cOT6eaZhMx22cI4N28VB45wLfluPzmzRSbYQxfSVjoHY7CZ/qp/47EUY77FCwZYz66zLh0t6+re
	KKJyvjDs+72NkDaIdenWm5NJljBSqZLSbXBSaHTz9vbPqS/8wTtNBZxT6h3cXyLnTAP9klDW+wF
	zf9RdgBMai7vZkUH47tlmzr417OYpoIQf3Bu2OliKdXEIk+GgIsfHBJiD1H1iWow2UA+4AMz/tM
	OuhMWqlnZS8PaK4c6c9bEGco6JPwM253a0YemRoYkly9la0Rr4bxzLxQMUp1vjviMJyM+MV44Fx
	Q==
X-Received: by 2002:a17:902:f651:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2bf36889aa0mr62205725ad.33.1780186693199;
        Sat, 30 May 2026 17:18:13 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a0fd4csm61242755ad.30.2026.05.30.17.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:12 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 4/9] python3-poetry-core: upgrade 2.3.2 -> 2.4.1
Date: Sat, 30 May 2026 17:17:51 -0700
Message-ID: <20260531001756.1582306-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-1-tim.orling@konsulko.com>
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237783

From: Tim Orling <tim.orling@konsulko.com>

2.4.1 - 2026-05-23 [1]
Fixed:
* Fix an issue where certain marker operations (mostly used with extra
  markers) resulted in wrong markers (#943).

2.4.0 - 2026-05-03 [2]
Changed:
* Update list of supported licenses (#935).

Vendoring:
* packaging==26.2
* tomli==2.4.1

For a full comparison of changes, see [3].

[1] https://github.com/python-poetry/poetry-core/blob/main/CHANGELOG.md#241---2026-05-23
[2] https://github.com/python-poetry/poetry-core/blob/main/CHANGELOG.md#240---2026-05-03
[3] https://github.com/python-poetry/poetry-core/compare/2.3.2...2.4.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-poetry-core_2.3.2.bb => python3-poetry-core_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.3.2.bb => python3-poetry-core_2.4.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb b/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
index 0f55368d13..a428214b87 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "20cb71be27b774628da9f384effd9183dfceb53bcef84063248a8672aa47031f"
+SRC_URI[sha256sum] = "89dceb6c10e9c6d8650a16183400e3c9ff9ddee13b0a81023b5575334a2b3744"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


