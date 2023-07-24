Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A7AC41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 02:33:58 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.39769.1690166036556652196
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 19:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=q/MHBTk9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso2021698b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 19:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690166036; x=1690770836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8NP6uuwqOanog0SLh8u7o0mk6XhOnub5IoFtlf/RXs=;
        b=q/MHBTk9HMPo5vBp5072d8zWtZ9dwyNtTIia6iEkTMCGDaLFMUQS6MiGXoAghGmMXa
         k3qIhAybJcGlcx1ivg2uCrEinGO4D2ID5QSpbkWjQjWtnsgCF5VEZ0ycKzi2qyVPFEBR
         drZnncWWMmBYBjJBdteEvJVAK31qxY6FYWit6a4asUHbpOhZmwgQ1Xl9ssBmAyRBsol/
         qOwPnRJYbxJrtCFKlbZWdhNMQ3jPL7uztgxmVoZ9FUN+esCKieD6H4iKhxQuvkP0CIFh
         CRQPjImHw1az0BWgh4JdI1SzHxcvA3/Z39xSsM47go0ttSNx4+xny0FyjjoyfHZBcjVc
         aj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690166036; x=1690770836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8NP6uuwqOanog0SLh8u7o0mk6XhOnub5IoFtlf/RXs=;
        b=kwx86mtjnrdg3/NQxA53a7C0feiONBuwVVAiQIpNV+Oz02pCFH6vGsG4n8cPRdDNw2
         O4DgDxyym5Cov4zG7OmRHDuWcBacBhtG0nIXfuO7sHlNxV72b2mDoQB2e+Jdie9FoIB+
         0qloBYznz+ngquhA6P1pklxgwrzRSjr3xhn8zud0bfLndUJp8h2zi97JclmlztZ52t+G
         BCESy0iBP6mCQn6Ory3Q8MnestbY+GqWg5vPcd9NXKA4XZavqw9Qd6yFvDO3R6QMh7Zi
         piTfWd/9KS9KwX9hV3NmM3NCMZ5Knj97AVYLm4One2AI0ausc5DVvQpnHU2sHFTmzH2V
         qhcg==
X-Gm-Message-State: ABy/qLZjclTWTy2KvF0e+mLU+AnHTRAu8/dyxcApjTNnEnYSCmPwjWYu
	NGBsPvl2NfQiXzwt9LAv3xIeUjfp8LIFVr/1UPS+Kw==
X-Google-Smtp-Source: APBJJlH6mnSnSvOiNGji9+BHJF72nl7jFdEYlDxZz0e2cIUWDBbvzB3wYCT3L/3Cjmvc1snMGU1BHQ==
X-Received: by 2002:a05:6a00:2312:b0:644:d775:60bb with SMTP id h18-20020a056a00231200b00644d77560bbmr4899026pfh.20.1690166035609;
        Sun, 23 Jul 2023 19:33:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j1-20020aa783c1000000b0063f00898245sm1024174pfn.146.2023.07.23.19.33.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:33:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] package.bbclass: moving field data process before variable process in process_pkgconfig
Date: Sun, 23 Jul 2023 16:33:33 -1000
Message-Id: <e7d3e02a624f7ce23d012bb11ad1df2049066b37.1690165924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690165924.git.steve@sakoman.com>
References: <cover.1690165924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 02:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184777

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Currently, the latest version abseil-cpp contains a new library named "absl_log_internal_format", it's
basic package config(.pc file) as below:

prefix=/usr
exec_prefix=${prefix}

......

Requires: absl_config = 20230125, absl_core_headers = 20230125, absl_log_internal_append_truncated = 20230125,
absl_log_internal_config = 20230125, absl_log_internal_globals = 20230125, absl_log_severity = 20230125,
absl_strings = 20230125, absl_str_format = 20230125, absl_time = 20230125, absl_span = 20230125
......

Normally, the process_pkgconfig() would process variable data before field data in a .pc file, but in the
absl_log_internal_format, the field data in "Requires" section contains "xxxx = xxxx" format, the
process_pkgconfig() treats them as normal variable and using the setVar() in bitbake's data_smart.py
try to process. The absl_log_internal_format field data contains "_append_", this hit the setVar() checking
and finally bitbake stop building and reporting an error as below:

"Variable xxx contains an operation using the old override syntax. Please convert this layer/metadata before attempting to use with a newer bitbake."

This patch move the field data process before variable process to avoid the process_pkgconfig() treat the field
data as variable.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
(cherry picked from commit a73e269d3e591a10bb397b94b82e3fb960112d33)
Signed-off-by: Clément Péron <peron.clem@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fed2f5531d..67351b2510 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2178,18 +2178,18 @@ python package_do_pkgconfig () {
                     with open(file, 'r') as f:
                         lines = f.readlines()
                     for l in lines:
-                        m = var_re.match(l)
-                        if m:
-                            name = m.group(1)
-                            val = m.group(2)
-                            pd.setVar(name, pd.expand(val))
-                            continue
                         m = field_re.match(l)
                         if m:
                             hdr = m.group(1)
                             exp = pd.expand(m.group(2))
                             if hdr == 'Requires':
                                 pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
+                                continue
+                        m = var_re.match(l)
+                        if m:
+                            name = m.group(1)
+                            val = m.group(2)
+                            pd.setVar(name, pd.expand(val))
 
     for pkg in packages.split():
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
-- 
2.34.1


