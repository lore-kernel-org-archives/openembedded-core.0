Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5C4C7115E
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 11:56:25 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.24250.1750055062664149033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 23:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EEAM/Uyr;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: nmjain23@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso3025862b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750055062; x=1750659862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YeIsLE2QCR9js1eXFlcY4JDFKw9C1FdXqMLAelmtumk=;
        b=EEAM/UyrgtkF36xjSVF9wJQ1tZs2uSDk8LvIQ2dmjOcxiIUyxqBi2vAESqweBLKz6i
         YDBgrPCZZ1qIfXORpxiaHhjYYBcJt92n7ppTedhI05ibCGGWC9k9lJ02HENdKB0VQm9o
         EevkisofHvNCS5/CPXnoeDhAvU0/mrT2iZmx01RKejXe30Oklo+yHjC2GH/H8m2AMGvy
         Me8EBY1jEF1nFHaei0Hilkfa7vtjiI7WFMXrePfe2T+plQYpeinqhsKlUyVZ4VNAaPCo
         zdvVOb0bM6M16YUC5sUGtc9EWqmsn51+5nRqi+/s88Hpe4ZUynWTDglL8AXAb1/xNXwL
         dJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750055062; x=1750659862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeIsLE2QCR9js1eXFlcY4JDFKw9C1FdXqMLAelmtumk=;
        b=NsFKyu54r5zR9AyXBeCG0+fVbrB1Q6YWF7F9t3kvXYETtx+QVLpE6qwE7P4Mk3pIyX
         3lSETVeDUoczsglCaAtvVmn2UEplp0Y0hwq1F/yCbvddwx+aoe6LZKUUMTWvDurI/3bo
         63q0quzBN3PpGcCXUuda+06Z28t3wASr0qA7WfCF0caVBzQHIKzHR4wwRTHOskjhO2uS
         uCGdjVjcGDK8gax2XpdAsBt+9ZohxCjNqAxztLrqGO+at2a5arG+fWNnX6S8JIRTc2WH
         VEGLKCLyC76MQcIPlirIuaTqXPs7mv+zTagwvkvv4QF/rZaRnf4hQ2TiAmBkh1xpN1uY
         7G5A==
X-Gm-Message-State: AOJu0YzjDULnLMO3xTMrEtmPvA5GlP/7ByIpNHbRSZuF2VzKRsN3JV5v
	DCW5ZpCGtZktEKfl4Aai4fwpuGFpOlLT+rOGyp44yvyKjJXV7j5LiuRQyHrxCsq7
X-Gm-Gg: ASbGncuJKJJXN4mGAXBDIe2nfmYQwkcECE1UEJXAl3+zc59X6VgR52oDakyjmBgXEh3
	+k9h3xEsYp9P2S7hRq3fIN01vGPiHx9Gd1E8XZ6iiJJ59qi7KQpl3FQfq2+nsOiOkkucid11SGa
	NA3NKlmspyDHfvB78bJSWX/m7PLG03TedFKL9yDsIceaZFhbm7oqe4lcLuCR86FbSvdSbRNFchc
	eLvmau9IGyGu6i3KDiAEvMuOIItjxyl/VU8ri+kieXzADqUhy/0paTNhAWNaK4yWzaDGrfDjHIH
	M/Wawvs2Fm8RJS/xGtOQnJ2pPe8IqgN4GCaezeUpQFA3/uv/BXu044v1cJpDUCtcY0QDjpbsOaI
	hYw==
X-Google-Smtp-Source: AGHT+IEaOxVUWp4uNdIVNHwFBVwP01yMurS5evBmdaPl7j4fzfSIwSwJVyIZ4W4EldHx4qTZxtjm6w==
X-Received: by 2002:a05:6a20:6a0b:b0:215:df90:b298 with SMTP id adf61e73a8af0-21fbd559f50mr11600892637.26.1750055061644;
        Sun, 15 Jun 2025 23:24:21 -0700 (PDT)
Received: from LL-3450L.kpit.com ([2405:201:6807:8e5:486a:d246:6c6e:6f5e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691bf6sm5109497a12.67.2025.06.15.23.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 23:24:21 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: liezhi.yang@windriver.com
Subject: [kirkstone][PATCH] e2fsprogs: removed 'sed -u' option
Date: Mon, 16 Jun 2025 11:53:54 +0530
Message-Id: <20250616062354.3531944-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218818

From: Aditya Tayade <Aditya.Tayade@kpit.com>

In embedded box, sed might be provided another providers like Busybox,
hence use generic options whenever possible.
/bin/sed -> /etc/alternatives/sed
/etc/alternatives/sed -> /bin/busybox.nosuid

Here used 'sed -u' option is not necessary, hence removed it.

Fixes below error:
sed: invalid option -- 'u'

Also added 'set -eux' option which halts execution of the script
on any failures.

(From OE-Core rev: 5b3b290baa0a83f493b7ca25d5ffa5ff279bcc69)

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07caee1829d2a61bc018fe0e37ecd482922179ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit d2da6b5c5668dbc84b905ba2fe4c9b57b580fd82)
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 279923db8e..1857a17189 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -1,7 +1,8 @@
 #!/bin/sh
 
+set -eux
 cd ./test
-SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
+SKIP_SLOW_TESTS=yes ./test_script | sed -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
 rm -rf /var/volatile/tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
-- 
2.34.1


