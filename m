Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2976C433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 12:44:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.27004.1653309850746053862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eT63vyvE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id t6so21201470wra.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9eVd53rtGigLiQ1H6DcXVVG6KxUwDdCDB5CmtW9DdfE=;
        b=eT63vyvE1lPmxa5oQSZs09w4NNkvSpac4ymkHZcOoifE/jA77yK2MhfuKuaT5Zs065
         u0ouS4de/6wrda+95XGcoj3o1ratEhpaV49JI1mDwZNw074SZBl7Df2DzPTJQ4UD+VaM
         VnLBExYqVZOhkgraU7rPjF8vx1rZHHQqjjeV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9eVd53rtGigLiQ1H6DcXVVG6KxUwDdCDB5CmtW9DdfE=;
        b=39I1Vf+7XOQNxsgKelIHv9mazf5nsys3RGT6lyvBN5MZdAazPmD4UUc0bYBY7QIsny
         2F45YTUtSdaP/9AuJ73XdZYr+kqWCtKRoslhDRZJbpR3Z/ijpbsgKvVrb6SFOwS8oxRm
         HrZqQ9ao3XioxZsH5vh+RibBMzyhVRU+Eq9id3wCAnZHBM8rqhrnXuiSmSYel4vzfVgz
         0hiPQJ1fZlk3C72EhoyqJoXLfBaUq0Mo8FdGVSM032BKA8OjeICxkq4lFVtdKXj1P+2D
         7PMU7UkFrZCuGPg9DT66Oma6l/oK4qbL5NlubfeE0/UFTpUyWYOzw+yryPvQTsVUWT9A
         il1g==
X-Gm-Message-State: AOAM530BP+JhS2OtTud+l6mLSaXVuWammZvEkNrR0d17cSuB+Y71nf/t
	u8QZyecn5xrQs1xqOyPMZT7os2BMU91NaSGt
X-Google-Smtp-Source: 
 ABdhPJyWQFeOcVdElK8Bd3iePFtTihU/X6rdH5YpN3/xRzVR9IJ1uYYtDdrkjbcYL9mDmskei4kJ+A==
X-Received: by 2002:adf:ed86:0:b0:20e:6f48:a194 with SMTP id
 c6-20020adfed86000000b0020e6f48a194mr16580911wro.290.1653309848713;
        Mon, 23 May 2022 05:44:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24])
        by smtp.gmail.com with ESMTPSA id
 r8-20020adfbb08000000b0020fcf68d196sm5457725wrg.80.2022.05.23.05.44.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 05:44:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts/patchreview: Add commit to stored json data
Date: Mon, 23 May 2022 13:44:06 +0100
Message-Id: <20220523124407.257617-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 12:44:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166017

Save commit data when writing to the json file so the results can
be copared/extended later.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/patchreview.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index dc417b4c55b4..002991c559cf 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -222,6 +222,7 @@ if __name__ == "__main__":
         row = collections.Counter()
         row["total"] = len(results)
         row["date"] = subprocess.check_output(["git", "-C", args.directory, "show", "-s", "--pretty=format:%cd", "--date=format:%s"]).decode("utf-8").strip()
+        row["commit"] = subprocess.check_output(["git", "-C", args.directory, "show", "-s", "--pretty=format:%H"]).decode("utf-8").strip()
         for r in results.values():
             if r.upstream_status in status_values:
                 row[r.upstream_status] += 1
-- 
2.34.1


