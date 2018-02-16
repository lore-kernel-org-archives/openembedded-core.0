Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 492CA78622
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 20:30:07 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id d10so3254555itj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 12:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FE5d22kK4R5ATXPLu0JgyatxovhTJw9fTcmvTOf/q9Y=;
	b=Dg+pSfqbgbImpX6Klk+tbRAx81PRJ9KD8638BSfXhhTs8GTKalEIcRZGNhJEOGoW82
	VnlOcETI3ISMh5M3f3tn1s4OkMVDkB6e8ppvp9ylWmT7roSKCYBCatkEdW/5utHYBZiq
	wB8J31PMLfBFWW5QQ2PPWVzisl2yyFxbtmauuS+hMoJfzQL1uVyS8GMTAMX5T9SJofGa
	W1xfjSCNCc6t3rPqtLJvFSt5Mb7mWXrJe0b5AecIYR30rvnVEL96hPZpbYZPySRbNq4X
	M2TqiQ47qA89xvEQMfcxQmaLDBwTIrn531K8X4C35DtSg0KblestT7hKg8qMy8qqE82P
	mJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FE5d22kK4R5ATXPLu0JgyatxovhTJw9fTcmvTOf/q9Y=;
	b=QfdIkFo6TZDs90OYVFSiBIq+cEg2KiRW90h+L6rBWdoBFyVA8Xjl28WL1mue7gQW7U
	2RTDN5/SP3FTBBsX2DTClwxC8GsNelLayCvjWdKeDlc3+cBfR05E7DuCWPa5FBGqLiq2
	AocEeoTihxsUrOUSNUASMo1Nq78gorbau9cZJJkMDrtcZBx40gWLe9r3+KnQQ+m+nGv7
	x9B3L2CfHrIX3LecmPcR4G6wrYRdu0PrzO0iaN2FxECpgHMejjUWReAL43lAbmoaELPZ
	xtnVCrcefoONrVSoho9Ej5qvmL5G3O/jJ9UHxN9yYEBm+dNA79JnkGsa6co20JEHy68m
	ahiA==
X-Gm-Message-State: APf1xPDGRclyqJsinK7n9tyn3JGuxRf4jtBmoCHAK23LA9hbHx6lxzX4
	yGcmI7xDl0CSGqkug1LaNcmqnjLq
X-Google-Smtp-Source: AH8x225JQjcCxVKgJd7JpENrwTDEKlaWHNuYi5jOOj8LYDlZlap2RimP1bavlTiB2mLDzT3Pf/M4xw==
X-Received: by 10.36.110.142 with SMTP id w136mr9646559itc.20.1518813009307;
	Fri, 16 Feb 2018 12:30:09 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	v76sm17100102itb.41.2018.02.16.12.30.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 12:30:08 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2018 14:30:00 -0600
Message-Id: <20180216203000.32571-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] utils.py: Fix parallel_make limit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 20:30:08 -0000

parallel_make_argument() was incorrectly taking the maximum of the limit
and the calculated value instead of the minimum.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index ec91927233a..80f0442d0ae 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -195,7 +195,7 @@ def parallel_make_argument(d, fmt, limit=None):
     v = parallel_make(d)
     if v:
         if limit:
-            v = max(limit, v)
+            v = min(limit, v)
         return fmt % v
     return ''
 
-- 
2.14.3


