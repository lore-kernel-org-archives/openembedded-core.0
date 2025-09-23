Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D64CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:26:42 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.1266.1758642789136452783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 08:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=cv4M8z7I;
 spf=pass (domain: baylibre.com, ip: 209.85.167.53, mailfrom: ukleinek@baylibre.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57b35e176dbso4092040e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758642787; x=1759247587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SyW0iLJ3Zzv/NkJAQWhneuvSTi6vDieanKFMCoQQpTc=;
        b=cv4M8z7I8WHkfXFfkxRAu6tUZBLIaHYTDGBv54Xn6U35LvCpo4uT8tLjBDUSmSGW/P
         6CTURJF2TnPNi6pOHEAs229lGquRRyPvDTZF85BdvyTUlGfgpGjSsoZXPRADBeKoANRP
         E5ow6zSkSbTQpkniUxzEccr40EXPRdMmyaZON9DqfnESXWTJpqbhfPdwzX8LXJRqHxu8
         VnyF3Ec2kGGcs4c5KsxOQUPS0U2sZseKP3bmUoUZ1jkCMAF43sHXVeYUsHPIe4dhurUS
         GxhUfmL1/V3afVABZUAq9Et1gwxTlOetfe6fLqsFwIr4KYY6cub3HHFKQQctv4kNN0qM
         Ys1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758642787; x=1759247587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyW0iLJ3Zzv/NkJAQWhneuvSTi6vDieanKFMCoQQpTc=;
        b=efjTEp71Bk3n0ufvMAjEsu6of7wbKh8Fd9v3iQGB4gJVQ951HuRchwofd1NYrRB/4y
         8IiHvQ36Ylqb5fSGJenVy0uV01fjmh0lengJBJh92gWUAIF1PQ3/Q28yawLgW0bEfCDv
         e6bpEB9VV9VrNxllx6dhX9slFShipbzI9SSGZlsZ5SlmsFID7aw4J1tPkKZhhP2fpbke
         40z07j7LvCypYpog5T6LxVEDSnNWMv71G/pBGl1ohKN4761B9BritrYHO5/VcdIz31Ik
         RhZ1dzEhnZ6v8VK/k7c4S24ocowNur58A40Kz83fAwGlE2zRGzlYBrAcEnc8qmjUpo+r
         f6Xw==
X-Gm-Message-State: AOJu0YyaOzCoBqpzLnlY2L65c0e7lXB5aw+QdlBP93X7xtFfimeGjgEW
	6Ji9iahuXBl/VoiGIADUaVsMOlTbYvAdqWYHOUHAGTGsjziVxlgObGAHs69n1hYP0M2T8glauFD
	xzp9m
X-Gm-Gg: ASbGnctzHNYhHq+BUa+lyQ05x8MTvfjzF3hhvrjBm+qLGYfhOllki/8u3gQlUUgbrqj
	gNihhTzYnD1xg9IiI5tJstKz99Q1oRUFsW8iGasJfpWnHW8DbYaNv4uUm4INLsLBIfiBEuVvP2G
	CBpqVufiEPEusYnunjnGQV07mw5p66QZXTuMof85e+fWC4sOG/uwgRKyE4n4ZZfeGqpZ9cF+q1e
	3H2OsktlvMxSwxOPWRvYFzk52mxcC4lZ98R5jed/Qy/rJWNpNCBd1NkELi7cRHpr+u1pLMlxjCN
	mtfGwUtbqtKz+00mYn0U8JLVbBw5VfgK4BFqHTVFFgUM3NXjHZFn1js132+ZSh8bixii9EoCo3R
	qLyClcwVnonEa1aGLTWiy5MExQhXRVGQAnK5VV5s3lAGtaXbYt49HzR9KNbreIO9W
X-Google-Smtp-Source: AGHT+IEYEwmjcJdGX+zE9UPthmSfVZ4YPILNSxITytFRMXqAnMXQ1LpcwT5EptRVIt432kDxw3krww==
X-Received: by 2002:a05:600c:4743:b0:45b:88d6:8db5 with SMTP id 5b1f17b1804b1-46e1d98a1ffmr35990185e9.12.1758642432416;
        Tue, 23 Sep 2025 08:47:12 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46d1f3e1b03sm95191305e9.23.2025.09.23.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:47:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta/lib/oe/recipeutils.py: Handle multi-repo recipes for upgrade check
Date: Tue, 23 Sep 2025 17:47:02 +0200
Message-ID: <20250923154701.1506704-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=DIM2Tk58nT43Gtp1+kcz650RdgMhokwfVK9W6tEvdsM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBo0sD1xvfymxVq+jNHEIOLeXgTyFVVFX+7w1VgY 2f4OEdX9UeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaNLA9QAKCRCPgPtYfRL+ TuLuCACfuU0GXkQQ1q+YuxhQpWDYFL+GlPWvaQKuXlPC+C49UCoGSv8lAmJLDkLWQ4A9QChoxAt MutGyhrRRO3qI4V8r9X3kxXOa2NShOZkjbzU/o4G7IGu6v9gBqn32PFjokKDc3vU3pixy4312Pv hu0RemMjqKfn3e0+Lff6lqkvA1BwFn5esUwTa0/iinnu18cfqJW1O+xH+NjGZINx8/FOe5k9QgO zI1F6wtbAqXeUdPsX7FcncxNLJfQFz5fA69a5YzC5lK9ezQdvusV0Rw4qis0wNXG48zSfYexw/C I2loFHXodRMNu8wITYYKmDVRLcGnannUpxdC7ALArviwWHe2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 18:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223908

For a recipe that uses more than one git repo there isn't a single
SRCREV variable. For example for linux-yocto there is SRCREV_machine and
SRCREV_meta and rd.getVar("SRCREV") yields "INVALID".

Luckily bb.fetch2 already handles all the details and exposes the
currently used revision in ud. So just use that.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

note this is my first OpenEmbedded-Core patch, so please apply some
extra caution before applying this patch.

Note that for testing with linux-yocto I also set

	UPSTREAM_CHECK_COMMITS = "1"

for that recipe. (I'm not sure this is completely right to do in
general, but that's a separate discussion. Without it `devtool
check-upgrade-status linux-yocto` suggested to go to 6.16.y instead of
6.12.$latest.)

Best regards
Uwe

 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 044f1bfa6140..102789ce735a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1075,7 +1075,7 @@ def get_recipe_upstream_version(rd):
             try:
                 revision = ud.method.latest_revision(ud, rd, 'default')
                 upversion = pv
-                if revision != rd.getVar("SRCREV"):
+                if revision != ud.revision:
                     upversion = upversion + "-new-commits-available"
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))

base-commit: e90bc48bdaa2234cad52bbb2800f5246c277ffbd
-- 
2.51.0

