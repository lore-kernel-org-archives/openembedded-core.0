Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.13226.1602771338801940216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bb8TS7VO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id b23so2010332pgb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=edk1dG91ad9g0pINVUTKriPI84gP7UAazVSjORj0KFw=;
        b=bb8TS7VOTGpa0RdTJeb9ASbikzn6+m3JbnQB/lIV9FTG/hxcWmfc+DQwZKsb8GT4Nn
         dQSN9tCo+PAe3ssMTJ+9Z5P9Lz9Ql5rNgcMJnQ2ZvvOiBNmWw6UTGUUsBwfQ7NzeJqAM
         D4n05Lkxt/AkZ3VIQZXCngjPhTyTBsxu5aWTYi2QrAooBU4p9Fvc6SbknPSj2LwEfu8K
         pwpHnVv1p5u1N252MTnHtkOtcxeMW3HksFKONYDJpJBy3LMMURJVi7m8wNltUSfn6L++
         yN/JUuSsVD2iRZh9ZYMbqFhrJLz9obmyKj0SSoJGTkvVHpY5yFKFR8WjOqihKZ7+f1bJ
         vxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=edk1dG91ad9g0pINVUTKriPI84gP7UAazVSjORj0KFw=;
        b=fkAaz/YDvMfrdanzgghEofCsmN5mM2RTdkY8MAkV6l4wciN7wVoZWK0XJCj+tYxOnr
         mcaOTqFO/YKwdW41jufle0/YtFlF71CpJmisBWpsvUJ9SNj93l+iZAgJgw00DTfre8Wg
         l+VkDWlY708NWvdzvZfJMWuWDTxawz/8S5jb5xe15issNNNqCvTQeuMsZqQRSKDxgQaV
         6sBptcyDIXZHIYWYK07xKVd7Jj9cMoWgiQKMoBAnlzh9uyjwEfMHsDtuj6kDRM1PtDJL
         erC8Trj3Bp/QOIMLa4PhjHzRjh/eD89e8+eALhybzPUdZwMC/rFLdrkLyFTMSnIGBOYd
         pSiw==
X-Gm-Message-State: AOAM530TUH+qE2xTAv/q6bquEBxKqxLJY5ro82Qlyw5UNN4m/0GG2Dm4
	3jluB2wD4IaQvdcCPpdl120LibXKaCRJUZ8v
X-Google-Smtp-Source: ABdhPJynA3EOTYsL4kcXBMX9VBlTesKEuj+e7pAMubfwsr6QBDZ0up7jKop7r0zYDr1aJF29AcRitw==
X-Received: by 2002:a62:d44d:0:b029:152:ebc:77f8 with SMTP id u13-20020a62d44d0000b02901520ebc77f8mr4412268pfl.14.1602771337693;
        Thu, 15 Oct 2020 07:15:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/8] scripts/oe-build-perf-report: Allow operation with no buildstats
Date: Thu, 15 Oct 2020 04:15:07 -1000
Message-Id: <86f7582b4da46be1e964e3e6dc4ef21049169aa5.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If buildstats is missing, avoid a backtrace.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23c4b21f947c7aae1303ca6526fc5aaaa9fc7bb8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-build-perf-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 7ed86a72f6..b46d61869c 100755
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
2.17.1

