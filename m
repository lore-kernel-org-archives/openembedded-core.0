Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E47C7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:36 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.173.1686329666530375229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mQzNd7Fj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-652699e72f7so1708535b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329665; x=1688921665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bATYXmSIR59LAZUqn0QBdDse9FiYGF/h0BImCX1FG64=;
        b=mQzNd7Fj0FtpF88fvmoVda5Mg0vufKLH21uLRg4x2EpanN65QCGnoODwfqZ83jLA0w
         9t8bwZIaBrZpHoZ2FDSEVGyvWVGE0Vn7H1hJTQGeLvZqqt1JH/BR9/pPC8AR0SFatiVO
         NBm4cY67MZdygv+zkvXVRvengJa04q2uA1oKfp4PV8zrD8sl4Hn701hlgwVhOOFjA6d/
         w5Qnq0WatknHqPWvEOG2E9paDpatCgIqTro16E73L9V25nz3don6qI0uDQa4mM6hToXz
         44defODrjyzdWXN+89q4nfGZRh8uNqcu4RKdk29k2w+d+EvYhoajslR2BVnoCEY5OnTh
         CpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329665; x=1688921665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bATYXmSIR59LAZUqn0QBdDse9FiYGF/h0BImCX1FG64=;
        b=gLCDYFwbnxfjv5I9rXrAVyH+GK6u/uwRjKmDWj4zrNJM0ez8+JG/QN7FhwlrPeOnIL
         kc6kJQN3FiGTtdkFtoKVvzunb38yP7gkreUsEOvIeIkSI/qv54TkKsBbstUvYKdfl99Y
         JpWe7iJ11naFIt94vLaaCK+cpyVqsog4WIZRryVfYB6ygYYUGJxXAxzkJ/vsrzbT0iXQ
         FbeT1bEoMNF9jg0PzMa4qyDOE0dvaHCplI4skyp4LsNaQUrfIAyyNY2o82N+vPc7j25o
         7X0AzHIPUdfx7KZKKgGczqn7XHyQ9E3XqnIfecGGSomZxsJedgToU2u22eIUIYMZKWod
         z4QA==
X-Gm-Message-State: AC+VfDwVqO5tLtlBxaJu7nbduZcbF1nGx2F+C0OSE2TgUMmFXSwq2F1T
	VgZwS0ywdyAWZNjJk2z9hM+hswtC1P6vOtDB+OY=
X-Google-Smtp-Source: ACHHUZ7I/RVuSlj4A4s6GLkLDDSCNbrlrE5VtTWbeFEHlTp4J9i4VCmcsdLUE1rwIqccbsU1bu/DTg==
X-Received: by 2002:a05:6a20:7288:b0:111:1c17:3fc6 with SMTP id o8-20020a056a20728800b001111c173fc6mr1654789pzk.10.1686329665570;
        Fri, 09 Jun 2023 09:54:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/30] go.bbclass: don't use test to check output from ls
Date: Fri,  9 Jun 2023 06:53:40 -1000
Message-Id: <6f9b6145b473a1adcaf39c1af0d17bec00547ede.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182579

From: Martin Jansa <Martin.Jansa@gmail.com>

* avoids possibly confusing error message in log.do_install like:
  ls: cannot access 'etcd/3.5.7-r0/build/bin/linux_arm64/': No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2f1777e6ac5269a71203b6a2c562a43503be95ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index 6b9748406d..9c29fecdce 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -132,7 +132,7 @@ go_do_install() {
 	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' pkg | \
 		tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
+	if ls ${B}/${GO_BUILD_BINDIR}/* >/dev/null 2>/dev/null ; then
 		install -d ${D}${bindir}
 		install -m 0755 ${B}/${GO_BUILD_BINDIR}/* ${D}${bindir}/
 	fi
-- 
2.34.1


