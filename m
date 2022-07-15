Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E396BC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 17:03:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.35.1657904629443792994
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XwL59qXZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 i204-20020a1c3bd5000000b003a2fa488efdso4942852wma.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9w+G4sT+ZEOF0SWjWbz7UPCSVPsWfb1kCJrmJQL+59s=;
        b=XwL59qXZekq0rOs8p6esfqx+9maiRYluqUsi5VkyOKWmB0rvDbMw9V0wQ9uovJDtOy
         9Cw2UEpkdELJQyZs+2zDEaz3JP71I7njs11UtY+hLIr7OLPXLIde6hHvFMwyYzZyoZ32
         s1jSn9vADYmcqCdToFQqIiBhrdgPbi3AQrJlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9w+G4sT+ZEOF0SWjWbz7UPCSVPsWfb1kCJrmJQL+59s=;
        b=T2J72tQk1juMlCLQfcgFxeJzmdliL5LNecNoxETFMn4z4O+r0Nd6BYvGX9ccHJucHL
         nnmnoC11ts+AXECM6MufZqANec2ZNSvMnh7LAK7HT6/tXU2i1yeaFALRBVA2Ykwcc+nI
         tmaJhGYfc/eq+oHOiE5dL1G8owAPvD8qLdGt7HpdlX71VIDAj0wok41WP2ihgfrK2pSi
         f13XuFTII3schT7YnKqc2VDjytd0kBRy2ApoIoTUUmcpvD3jh6a7n1KOKu66vEDoXM4J
         SRspks4ARU2n8CMGrE0UeHqzfmZF6OwJHMID30IpJliKLp2+r7CBqwai3uPZP1+gcEBg
         sH3w==
X-Gm-Message-State: AJIora/FA+De+GLFWjmtD87nd3xulun4MPSdAqBqu35k/JGiiZoJE/hu
	8UezUb93OyDCAJHQOkdqidnpF9a4JFWRmw==
X-Google-Smtp-Source: 
 AGRyM1uVWzvcTSbZyh1DOn3ikplgGybFMQyu8mtuRaZgW3UHy57BpHPvM5LrNvGe2WkKFdiQ7Ddv9w==
X-Received: by 2002:a05:600c:1986:b0:3a1:9fc4:b683 with SMTP id
 t6-20020a05600c198600b003a19fc4b683mr21720962wmq.72.1657904627219;
        Fri, 15 Jul 2022 10:03:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a5d68cf000000b0021d20461bbbsm4211621wrw.88.2022.07.15.10.03.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:03:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: Fix determinism issues in ptest package
Date: Fri, 15 Jul 2022 18:03:46 +0100
Message-Id: <20220715170346.680759-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 17:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168131

NROFF can take different values depending on the filesystem layout of the
host system and this leaks onto the target ptest package through the
Makefiles. Since ptest doesn't use them, delete them to resovle that issue.

Also ensure the task can rerun even if it already deleted configurehelp.pm

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/curl/curl_7.84.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.84.0.bb b/meta/recipes-support/curl/curl_7.84.0.bb
index 28b09ef0173..75417cd1bc5 100644
--- a/meta/recipes-support/curl/curl_7.84.0.bb
+++ b/meta/recipes-support/curl/curl_7.84.0.bb
@@ -93,9 +93,10 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	cat  ${WORKDIR}/disable-tests >> ${S}/tests/data/DISABLED
-	rm  ${B}/tests/configurehelp.pm
+	rm -f ${B}/tests/configurehelp.pm
 	cp -rf ${B}/tests ${D}${PTEST_PATH}
 	cp -rf ${S}/tests ${D}${PTEST_PATH}
+	find ${D}${PTEST_PATH}/ -type f -name Makefile.am -o -name Makefile.in -o -name Makefile -delete
 	install -d ${D}${PTEST_PATH}/src
 	ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
 	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
-- 
2.34.1


