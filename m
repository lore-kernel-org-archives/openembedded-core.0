Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23D3C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.2154.1743577893481271742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gawb54m5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913d129c1aso373671f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577891; x=1744182691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/ni+JQtuGNgdlvaN1VCwjpp48mS51cwajb+LkJjlPk=;
        b=Gawb54m50epSFo4hpM9jj7J0EwESjzz4rsPB2z8/TK6BLR9hPZoIbpnbmxYjD/CZLU
         Z+A93VSkWs2UkGD9rMOrgflnGf+aeMVbvLa3uWjPeCC1E9+tvti/4rxuYLnN7ercZDWL
         UFL9yxIVM2UrRE52mdsn8W2nZWpjdOkPAVIaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577891; x=1744182691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/ni+JQtuGNgdlvaN1VCwjpp48mS51cwajb+LkJjlPk=;
        b=gEyRym6zOa94P1LFfwLR4+F1qWhY6MSNjYqKy2YMLguwvHz8/Mhg2gaKeYRgUgMBT2
         Z3Dv1zPielFv1Q89mrOf80uEpyscAGpvVKr6hSQSO7ccWUTJAUbShjnQ9kVP7rGYzVVD
         Un1zKkvkX4jmg2toVZLTs9al2SLyxHChxH8xhe1uisNEpEwiIP6drkYX2wVtumaHlfwW
         kSQuByyPcGyCr06f2IuQjGVozNA/xVsDcuQOFDVa1t9aGS7NP8jwa1wlRnYiVqXcZzK8
         J3Ac60USWc3Qd1DOtHUD+VzLZUdPMTLcedIpS7rEmJmdPs7LQpIT4bpah1kzxzAo9JUE
         9FZA==
X-Gm-Message-State: AOJu0Yy249Dm+ilYPbDG+ysmRxPGOhXcaqsr1uZOo6pAnEM4oGYr7POm
	eR3+MMf/e4TLvnbCAUm9ISq3IBPz84N8gBdT+INlx04F86vP2r2SzRSQxM0kUbO86nXtJe37K2O
	+
X-Gm-Gg: ASbGncv6cQOQOlKKQydWtOIDktxXnX9wIht9fZoCutCMieSyua/YZuzU3vhieaHT+HQ
	uzUfJG1TSeOGmmiX7xafImITou6wTZQcJAjPL59yspR5DL8INWJjsNhZwV+lArYWr5WNrKpetqz
	wlt0Tr9lYT6HfidL+KxxUmJt9aCnpDC3VIpbZDcpaHtnhGENEr61XL3ntOu+E5lO9eSJ9YN/385
	StJzlbGclJEa0ukObGEsmKQ95e+9ckrjVxXurja3yHQ5yUdWXKuv4O6qxXhbweGX4NN33erdmN6
	4HVoderL4xt87NAMeEyVSEq+C/wPc4JM3/XkC4zpH61o0vRA/wBfI5Yij7QJJVW6JFaPvwHVeA=
	=
X-Google-Smtp-Source: AGHT+IHRqkI3tR1tIOTWkmFx8CvuElWvuoWLmg1FALAE0ScLclBP0bo2TAxC9nran3461iJh+yl8gQ==
X-Received: by 2002:a5d:47ac:0:b0:39c:13fd:e6cd with SMTP id ffacd0b85a97d-39c2a396da6mr658111f8f.29.1743577891446;
        Wed, 02 Apr 2025 00:11:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/48] python3-beartype: upgrade 0.20.0 -> 0.20.2
Date: Wed,  2 Apr 2025 08:09:57 +0100
Message-ID: <20250402071017.2157620-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214201

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-beartype_0.20.0.bb => python3-beartype_0.20.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.20.0.bb => python3-beartype_0.20.2.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.20.0.bb b/meta/recipes-devtools/python/python3-beartype_0.20.2.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.20.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.20.2.bb
index c047ed2026a..9941b28fd82 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.20.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.20.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "599ecc86b88549bcb6d1af626f44d85ffbb9151ace5d7f9f3b493dce2ffee529"
+SRC_URI[sha256sum] = "38c60c065ad99364a8c767e8a0e71ba8263d467b91414ed5dcffb7758a2e8079"
 
 inherit pypi python_hatchling
 

