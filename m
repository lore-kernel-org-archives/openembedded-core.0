Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69378C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 15:45:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.14187.1642520715188186948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 07:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DL25Sdnm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so5114486wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 07:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8ONG1TbvK8BDTY/CW5pTGX6OR7e+xKH3POp6qkO8PY=;
        b=DL25Sdnmu+MPZvnpTQyVg46TtM0PAsJ73h7+XthwhutqbAQpBr5ki4C3u6dxxkYPfR
         IIz7TS21jTFCRbx0IqxqxNBvPb9sXsPf8JoojZXcUZLWwxVV89ppKfWGJtC+GJYOs8BZ
         LeizFCH3cDkGKXx0kzLx3T8zhI/RUoZ8+o6IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8ONG1TbvK8BDTY/CW5pTGX6OR7e+xKH3POp6qkO8PY=;
        b=3x72bnb1/3oD4ixQgaeecCxZXFFLIowpssGT9oQPSql5bEBGFDBlvx5JDCYsPvqMzl
         sTPNbzC0Paxfi1kHOzoHa4wKWfYuqOmVlKT0i8U+2i027dO3WhHOYYrMe+nWroEdrcXE
         xalNLI1uRsE6q2Z6RIdbhPdHJGMzkfB/ZNToBhJjv8VjBlt0vBZuEoBDISXG5VclT5qT
         E2joloFbWvsNJIxQrtFfqPV2o3IMeUmN+v7A81Ler5pwg/JREZkDyz9mGT+OtgZznxr6
         9fAPBCWawveEIqwmtmFNWciJqiI2+V5GhlaNTk4b5glpd+xrdJeWWXJtjg7YwzsgyJ3V
         RnGg==
X-Gm-Message-State: AOAM531i2aeBhJrIeCynZpMrgzOt7GqTmcXwUMS1HagbLbMiIAaPNdIk
	qLD/QLpWhQd1IG1d4psKggyK7ghZccxr5w==
X-Google-Smtp-Source: 
 ABdhPJxKX1oA7EU5djGPlynun/fPZPGeYxlvNh9o+DzDItBLf6f/IE1sOwSnr2OqxEl8ATKIs/muEA==
X-Received: by 2002:a5d:6b8e:: with SMTP id
 n14mr25572276wrx.537.1642520713198;
        Tue, 18 Jan 2022 07:45:13 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:cdb:ba2:df58:76a3])
        by smtp.gmail.com with ESMTPSA id
 l20sm3711159wms.24.2022.01.18.07.45.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 07:45:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Simplify ptest-runner
Date: Tue, 18 Jan 2022 15:45:12 +0000
Message-Id: <20220118154512.1896092-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 15:45:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160674

Upstream mentioned our ptest-runner could likely be simplified. I had a
look at the output and yes, most of the code in the runner is now obsolete
as upstream output is compatible with what we need. Simplify accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/expat/run-ptest | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/expat/expat/run-ptest
index 59d8ab57e38..dbf602ca800 100644
--- a/meta/recipes-core/expat/expat/run-ptest
+++ b/meta/recipes-core/expat/expat/run-ptest
@@ -1,23 +1,9 @@
 #!/bin/bash
 
-output=${1:-"expat_tests.log"} # default log file
-
-# logging function
-function testCheck() {
-	testExec="$1"
-	shift
-	echo && echo ${testExec} && ./${testExec} "$@"
-	error=$?
-	result=$([[ ${error} -eq 0 ]] && echo "PASS" || echo "FAIL")
-	echo "${result}: ${testExec}" && echo "============================"
-}
-
-export output
-export -f testCheck
 TIME=$(which time)
 
-echo "Architecture: $(uname -m)" > ${output}
-echo "Image: $(uname -sr)" >> ${output}
-${TIME} -f 'Execution time: %e s' bash -c "testCheck runtests -v" |& tee -a ${output}
-${TIME} -f 'Execution time: %e s' bash -c "testCheck runtestspp -v" |& tee -a ${output}
+echo "runtests"
+${TIME} -f 'Execution time: %e s' bash -c "./runtests -v"
+echo "runtestspp"
+${TIME} -f 'Execution time: %e s' bash -c "./runtestspp -v"
 echo
-- 
2.32.0


