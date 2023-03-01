Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF44C64EC4
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 00:06:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9796.1677629173926479529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 16:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=V4Bv3EgM;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id c18so7530603wmr.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 16:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677629172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUga53eNUNt68c31ANHKMd1ChrFJoxASSj23znBLyNM=;
        b=V4Bv3EgMjopsDibLcYNBtvGERHBnymt1n0OYFtq/ULT7kSgzWv5YUTsRwHXbZbS5X9
         oHcKOjmjb/c/3G8fehJMe4uO707rHgpwdzgVGEk0HNkgRT7OyDjUMs8XQ9zPEu72TmA8
         NVUd0xxM0UKzziWDO7MYwAtGz1vUGwjKFE5hWXSMl/bgEk2d5HIWrm4v87f3yREyV1W2
         4apT6P/2JVzfTvMa0qo96Gi2nNY/McSJ/UxfTY3gy+6ZARG4T2GZUO4PmqjZNNFhAC00
         AfXJST/dQNpiEZ5e69FIaJUUImJn/KgU2YlPlCXMnnD5lPiz0zxOIPfPvO0SaxrN04YK
         pFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677629172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUga53eNUNt68c31ANHKMd1ChrFJoxASSj23znBLyNM=;
        b=QEDQFPnbbX4Bepy/bzgTkfmOl4PtHSsZhQWdNZofkDIXe8a7Ktxg7e7aD1/04nslJs
         m82g6o4hLTblhQLh7FwRIrhiiwoXeug+NMG92WMxubCTgbDg4PABRk4hsFsVo7nu8Zl8
         BN/MVYrfotXutMP1x+n6h5ctuDa0a3T2M+XUbu1jYh7R8sbxgzuBQ5uoE7h/VDmIf+Rd
         NhHTaO4Q0eEKygSzzUbsANLI8TQLbrX4IQQgHyhgyrAmvsTT4aOnBh1xVNZ3h7aviCyA
         x64Nf8SqiES23kklcwfcv7DVUEIFv8WHsbpm9821M8bWY965hWrybejlT6ruzsKX2DR+
         sysg==
X-Gm-Message-State: AO0yUKV+chrjnuTNZl0VDEv6WlEqnk5RsLzJef6wEZAMTbAci1Va07C9
	bzU/39WWPb78X5xyozviqHnq3scQ8REXzRWk
X-Google-Smtp-Source: AK7set/pvac9+vxZEoG30diN//pSLbzbL3mdFmkav3RHT01n4MozTVGJu06TQIoCt477FU4PuuMTqw==
X-Received: by 2002:a05:600c:329c:b0:3eb:3912:5ae9 with SMTP id t28-20020a05600c329c00b003eb39125ae9mr3189601wmp.24.1677629171945;
        Tue, 28 Feb 2023 16:06:11 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id e26-20020a7bc2fa000000b003eb39e60ec9sm10941072wmk.36.2023.02.28.16.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 16:06:11 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Modilaynen <pavelmn@axis.com>,
	Mingli Yu <mingli.yu@windriver.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [pseudo][PATCH 1/1] pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
Date: Wed,  1 Mar 2023 01:03:04 +0100
Message-Id: <20230301000302.93660-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230301000302.93660-1-yoann.congal@smile.fr>
References: <20230301000302.93660-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 00:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177861

From: Pavel Modilaynen <pavelmn@axis.com>

Use close-on-exec (O_CLOEXEC) flag when open log file to
make sure its file descriptor is not leaked to parent
process on fork/exec.

Fixes [YOCTO #13311]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 pseudo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pseudo_util.c b/pseudo_util.c
index 64636b7..b58036f 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -1611,7 +1611,7 @@ pseudo_logfile(char *filename, char *defname, int prefer_fd) {
 		}
 		free(filename);
 	}	
-	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
+	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT | O_CLOEXEC, 0644);
 	if (fd == -1) {
 		pseudo_diag("help: can't open log file %s: %s\n", pseudo_path, strerror(errno));
 	} else {
-- 
2.30.2


