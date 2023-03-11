Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73618C74A4B
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.35796.1678494451815420228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UW79qxE1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id g3so6565626wri.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrlkGsIRlJLnX+P9zTbbtDXpXVBUefLheLyPvMzG0h4=;
        b=UW79qxE1jufyA8M2YQOhyxd3DIFEEJjgXUJr/JNJPTdBG1O8OZslPtouYE3g05Jjjy
         hzzvHUsuYcbBt1Uk7t85+9mJJGMrapnEgDXmwU9rTZt8O0NkZ5X3kIrqPyjXV5B0xNjS
         xrDT5RCHqDG23EBlgB4mBXYP+dGgSutBWHvzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrlkGsIRlJLnX+P9zTbbtDXpXVBUefLheLyPvMzG0h4=;
        b=vV17NYCFcAYBQx1mTt+NmG5xLobpQidICuG9RjemJufz2vnEe/Qh5Q/flDviLHOrKx
         Jyjcfwuf+pn6iTUCvblTPwrtf1OH9etkFSd+Q0QpEuNtNqLXW044/P1zmgU9eiDI1ZI8
         qL7MeOMeJBXXTX7ndE1Dq79tkdLpIjxlWOtjlxzwdzJTOdpts8KTrWpwRHoQ0UzOD7Dr
         aXoXVbxty34P26D7XCJT0ZaUrWUSfhXx3wiEsGKCY7+TAZ/wEz1YhHGJi4ZmIPKJ4jzv
         GXvwaGV0KovZRl6kw6ENKxiHQKKOh2QkgA6ek0CBgYMBdC5sQPVCNEC9JnxYJj7PRLL5
         VamA==
X-Gm-Message-State: AO0yUKXgg5UWBWZxfqyatLaJa0K7L4i2/kAOg6l/oK7o1UwyBJZRfm2t
	xLxjn6Q3MlcF/+IDxv0Y5tvfkQzR/ODm8P1swxA=
X-Google-Smtp-Source: AK7set9WmaDKotX1PGIpF3ZFuWa1FoumL5R0JJZDrv2UdPgRR45x9EgFpecyBYBU4PrkM8hZ4qVVUA==
X-Received: by 2002:a5d:52cc:0:b0:2ca:2794:87e8 with SMTP id r12-20020a5d52cc000000b002ca279487e8mr17065858wrv.21.1678494450081;
        Fri, 10 Mar 2023 16:27:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/16] libconvert-asn1-perl: Fix ptest dependencies
Date: Sat, 11 Mar 2023 00:27:17 +0000
Message-Id: <20230311002722.3211118-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178355

Add dependencies for missing perl modules to fix execution in
minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
index 2714582957c..d82692c0333 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
@@ -15,7 +15,8 @@ inherit cpan ptest-perl
 
 EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
 
-RDEPENDS:${PN} += "perl-module-exporter perl-module-constant perl-module-encode perl-module-encode-encoding perl-module-utf8 perl-module-socket perl-module-time-local perl-module-posix"
+RDEPENDS:${PN} += "perl-module-exporter perl-module-constant perl-module-encode perl-module-encode-encoding perl-module-utf8 \
+                   perl-module-socket perl-module-time-local perl-module-posix perl-module-scalar-util perl-module-test-more"
 RDEPENDS:${PN}-ptest += "perl-module-math-bigint perl-module-io-socket perl-module-data-dumper perl-module-math-bigint-calc"
 
 BBCLASSEXTEND = "native"
-- 
2.38.1


