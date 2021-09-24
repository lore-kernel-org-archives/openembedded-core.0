Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.8848.1632493001721667670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gEmv8Asg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id g2so4906906pfc.6
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CEyhNaxcXqvvMENPtz7cvrvVN7EZujGuVkAGlZFg5us=;
        b=gEmv8Asgfv0Fc8nD4Cwdr6rPJrfU7yyxZ4zJOIXF6WvQhkeNu2uzbxKHl56C/ikLgt
         luuK8LNu1/3J5E+5yk5lcPUoua6WCOCt3g2Ndo4RqnM+zDgb7Tbuwue+P0D4LX/S3Mcs
         hBISw6ec2jUbe3bb9G7j2QssjVQo81UTdsDvlPlfw0aL0UCNnj0IGeCykZcgFbr0jLzu
         PZgLeKZUqtzQkkcxIJaBuO2p0zyldPsF1V0rmFuxZ8QjlBYrIirvweVTSoqjCNni3kUT
         agsYsakaqaQ70dRKn8heylJdTkUBoRiC3XM7kGEOVXP/UU7Wofz/Q44ZkG1dTQFezJEE
         QS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CEyhNaxcXqvvMENPtz7cvrvVN7EZujGuVkAGlZFg5us=;
        b=FnOh+bzBTs75ye0SAzw5KpOmBGH42v9rp1gdCyUFb+Nd4s/cFXriTcie/yy4/unYR/
         W5SHnBK/llHkGstqYaMcqLZP4viYiFJBQBbF87n33TJB1dI1dVAo3+g/1emjpF0lHVNt
         serBG0yH3i532FXy8s2A1fzlmTYPRaApNkIwDzav9f6qur6EaMTQISoetC9O6XmDZVHi
         F8P+nvbeJurJyKdxVPb+VdTD3OTNGAXkt3vXbGhQ4Xne0T0PKHysBbsKXF144sr55ohw
         H63pcGSsZjFPkRsBNQLnJIgFzUugA5v8p/7QLVj1HP06ypvnFMV0naXHZIyuvtmcYcpO
         5d3w==
X-Gm-Message-State: AOAM531waRJ7c97GQCwCVe7BaE7zhMyRR98PAoqTpUa0uvydmFattmsd
	W8zBQXB26Qe18d3CRMixtEdm98nCc/FXlG/s6KU=
X-Google-Smtp-Source: ABdhPJwc1eJb5ZeHUXL1Cfs50McG1W1s/qw6R5Ka4LHMEIeJ9EjBhzhiKzeWR4Ld6zTcG6zeJbxGaA==
X-Received: by 2002:a62:8493:0:b0:445:5372:1357 with SMTP id k141-20020a628493000000b0044553721357mr10120986pfd.10.1632493000700;
        Fri, 24 Sep 2021 07:16:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/25] bash: Ensure deterministic build
Date: Fri, 24 Sep 2021 04:15:23 -1000
Message-Id: <6e65d4fc9445bad488c510d17d4eb34c205568ee.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Bash keeps a count of the number of times make was invoked on a directory
and changes the output versioning accordingly. We want deterministic output
so disable this behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13a039e03195a47c750d5901e96fe81cf523481f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bash/bash.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index c7cf8cddd3..4e6176d2e6 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -49,6 +49,11 @@ do_compile_ptest () {
 	oe_runmake buildtest
 }
 
+do_install_prepend () {
+	# Ensure determinism as this counter increases for each make call
+	rm -f ${B}/.build
+}
+
 do_install_append () {
 	# Move /usr/bin/bash to /bin/bash, if need
 	if [ "${base_bindir}" != "${bindir}" ]; then
-- 
2.25.1

