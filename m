Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.14721.1602252622100496040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UrKAPOc5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t9so10439964wrq.11
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ko6lwaK8OsUThJ+jJwF4H697qaQuxbgIvFL1KdUzZQ=;
        b=UrKAPOc5aOBGSSijucfyxVAeG42Ci8LhIJi4t0/1AbMwqFOqwb4nCTM5UUlA3R95q8
         8N6VcaJd8G2JYc4aKMWZAx2eGxVJP1NLunRpq5rSF1TQYbBd3OJddsyn3uwfbKb8VdVV
         zF96xrLwRDMXR5AJytcxjgHT6Ol2TPR/aLpk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ko6lwaK8OsUThJ+jJwF4H697qaQuxbgIvFL1KdUzZQ=;
        b=cnAR7L1jsA7KLQsEz7/YXa9iXeCXCZUNuqYul6NsxTPHWeO3OSoFDCci0vhzHEp+zA
         uguJMMHK6pnEx0wca4rA8XxW94D2tqLXoTvHT4ikJC1Gbd3R1sg1OX8KLSVt7QoT0s09
         yKzB7rc7X0uG6480Y+UDEOV9WtjacwU4R5Eq0GHrHMI68hEpVuDr6oWEfrfrKc1hWekc
         uuaWIQIjvh8KQ5toYoXCzzwsxjQ5mtO7pBIGtO22uzV5YCjVR6nRfp0ZY4jQDHyw/SVr
         ZNYAX1Sm9RLVzGTn7wAbUiAbzg/xk+7P5GZfU6OY6b0vib5SIHkpsouXqjABSrjNBG5H
         h7cA==
X-Gm-Message-State: AOAM5316J9FyyDYPrZG0lIQBGn4Fj93CxqEqBCMHYocqqLctH/UE490t
	1vc8enx2cL2Cr4y/CP7ollG2i3FFep/vrg==
X-Google-Smtp-Source: ABdhPJw0dQOQf5zCgflABSxaGf6OenXKhr+4f9G06MISA/hMgHEIT/YmA0Omft0/YmbWJc4OrrsXYA==
X-Received: by 2002:adf:aa0a:: with SMTP id p10mr14893067wrd.362.1602252620200;
        Fri, 09 Oct 2020 07:10:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id u81sm11343780wmg.43.2020.10.09.07.10.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:10:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts/oe-build-perf-report: Allow operation with no buildstats
Date: Fri,  9 Oct 2020 15:10:17 +0100
Message-Id: <20201009141018.3288420-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If buildstats is missing, avoid a backtrace.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-build-perf-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 7ed86a72f66..b46d61869c0 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -353,7 +353,7 @@ def print_html_report(data, id_comp, buildstats):
             bs_key = test + '.' + meas
             rev = str(metadata['commit_num']['value'])
             comp_rev = str(metadata['commit_num']['value_old'])
-            if (rev in buildstats and bs_key in buildstats[rev] and
+            if (buildstats and rev in buildstats and bs_key in buildstats[rev] and
                     comp_rev in buildstats and bs_key in buildstats[comp_rev]):
                 new_meas['buildstats'] = BSSummary(buildstats[comp_rev][bs_key],
                                                    buildstats[rev][bs_key])
-- 
2.25.1

