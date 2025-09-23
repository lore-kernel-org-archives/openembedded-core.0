Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71ABCAC5B3
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:39:13 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.18548.1758638349157878719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uXsHQGgl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-330b4739538so3680638a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758638348; x=1759243148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHeti5SlDca7yna/7HgTC9HKruVzWUcNbz1GbutRaUI=;
        b=uXsHQGglFEvZjFFo6FA/6e8ET/VaBrui3uLRG9KzSfJz8wIx3LGA/AJ59E28wY5Bsa
         Af1eEbNojm2hT8DBiJBIJ82FW95EP0sIyxO7ve6lTUrRR7rlxHRIPrfI1Qppz203iuWH
         FRh4m7pdX07pCQ5PEzuFkvuh+WI0uWQVIAKcljtGZkcF29QAXlZsXw7A7ImLMhInDPDF
         0Yb42F7RVnr5Rh7OV4rszv2h0vldOEhp6hk64NJc8LDCr7ADZko/WeIn+Y6WFV+SdzfS
         pq2XvbOxPPetEiK1Jnan615bgRL3KQ2z0wxEBT4fbBQiRlXL61jX+KdUXoD0MBWwMmYy
         0aIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638348; x=1759243148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHeti5SlDca7yna/7HgTC9HKruVzWUcNbz1GbutRaUI=;
        b=IzPMTyqLSFwaj89SAC1u+U+u0I8jCfcDDsh+m7Ukhbz/PrMHPKiQSetmwgI0q+jaTn
         MqXco3iE/vDcaKkZGF3FsO5EakhSnqP8C0TiwVh7QOZXOYYNaB61PAiQ0O0NFMegPHa7
         8W+LVOThzW4EPxKXVOMAY915hIB2Phk2CAY8nZqz2NiZvGlL/J/KXlMMwrmIIFT9pUkO
         /m7OHpOY+tu43H3YnUioaGajyFxl2y9OoFNx8Co+/X26h3LAr5hTzRYK6JL3pzXx5ww/
         8CIggw2XFfX6thumWxBf228JFrnZ9+IHc0LJiHCSDAnqdVA/9Cm7W4jJqtxwhW+5woIS
         Ia9Q==
X-Gm-Message-State: AOJu0YyuzEkhmFrtELcpJf3/adr92ufqxkYxGa1Kz+EVxEXMNYj/HChQ
	fdbNr9sMt3eRM5RH3OCd6GBRDFE0hQmTRGdo24MqrJxsihebIO8v+Cl3Lx7UEJj77jPnxllop3I
	X7OJMyxs=
X-Gm-Gg: ASbGncs1dsGJrDoR4L6WCfNEnXESR7IGeybB+U9meVPwh0G94CTBIgdlP7+TEGVQtJU
	54u4a5gX0tcUW/pDHM/Jn2iK9wURLaFSAgqppPW7l+4cd+5Mtm44D5Chd1pFVPiVfI6UY4pOJNo
	1gQh2kdHUFbDxwMwc7iYfCK5ocAmODF6f48FHU9CzuSixJDtN6+YEZ2DmCjY3M1HRBixoVVn82w
	oEP30Ky1T1/sx460lWEMf2KDVopEpssz29IPBrPP84rWqNsUh/vq6NvG7uKaHxwKRfQBJT4QwHI
	kYJKura15vCHQZjDMF7RZn0f9RlSVFgBGHkF8K2dA8HrL3wK8ql2b4U1vs0VGRePxiGotffryIN
	urM8s3xdXNaOf
X-Google-Smtp-Source: AGHT+IEhjP7S2Uwthxn2FeqQjYiMxACHdIDr7HB7cXVEi0oaJAmTnSSEJzlTliaIQcA7Bxz2QsgwcQ==
X-Received: by 2002:a17:90b:3ccd:b0:32e:36f4:6fdc with SMTP id 98e67ed59e1d1-332a95146ecmr3550911a91.4.1758638348179;
        Tue, 23 Sep 2025 07:39:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3f58:7e15:309f:29c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55100df86bsm13428368a12.23.2025.09.23.07.39.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 6/7] lib/oe/utils: use multiprocessing from bb
Date: Tue, 23 Sep 2025 07:38:41 -0700
Message-ID: <8721554e02b4da4bb1aeb334921bc66a9eb80c91.1758638188.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758638188.git.steve@sakoman.com>
References: <cover.1758638188.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223889

From: Martin Jansa <martin.jansa@gmail.com>

Fixes build with python-3.14

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
and oe-core now requires latest bitbake already, so we can use this.

[YOCTO #15858]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/utils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d272dd2b8d..2137b05df0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -5,10 +5,11 @@
 #
 
 import subprocess
-import multiprocessing
 import traceback
 import errno
 
+from bb import multiprocessing
+
 def read_file(filename):
     try:
         f = open( filename, "r" )
-- 
2.43.0


