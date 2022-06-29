Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D3FC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 13:08:44 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.11139.1656508117892533783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 06:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cP9CcvST;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id c15so5918369ljr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 06:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jIggLkrkgFrK/s6nZ+NTji1PWGXhCI8y6m+6huyEhFM=;
        b=cP9CcvSTLkyULJuEZRdA3ZJEllEar0Rd9TW9S0FVFHPEKt6GTCv4prr2T+XfXMBN9R
         4Dx007HQzzzwtFRbTG+FBYoDGtMovKiPo41GL677XUUcpVPXnUzyE/t36HaQMdkps0CF
         WbXUixvlIXSWeSq01EoUq3NtgGThQpON9QlJYUjxpfTmZbTm5I2SMx8+R+Wkye0ZhSMX
         fqxYrgy0jjHAz4zrCIsQ9gI6F+d9ifO/dUj6Q20WV/Ka0Rd0D2Eu3wZN8+zvyET/NSuX
         khfVStf7IcHh/LjBAu0Q1BMnMJOfWSLmR7ykLYJbgHgSf1BkOPCu49PquJW3DQD8Lab1
         qtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jIggLkrkgFrK/s6nZ+NTji1PWGXhCI8y6m+6huyEhFM=;
        b=TS9sLgBvu6xnVPXmu/cJAtySRt6z2JuCkNtSVn4DTiPN2zspGqNWtSrqDg+OOlEk2o
         nBzyyTu3l/53iclqesk5QlCGSs/y79XqlNnIWviDj2Xvn4cGaLwMDUfOSrwLnAaepCD+
         YBW3169eOSz7xNynm1yO0G/4wvnaTn4pvrlPoq29dynP5J3afPZIXTQKkazrNL8Auc+f
         KCO3AwBwXwsRr8ZoH7Ae+Pe39j0bvCcOvm+fT6ocKwjxpORmWRwymZUX8BVXA9vq17ZO
         cD1jWWhyx+gGm/OczzEL4ku7ud9RZe8LFcoRfv5Zg+jgxs6BqjM+jABTPJANQHYcgROO
         XVAw==
X-Gm-Message-State: AJIora9fn3FepvCFUT4q8/Ka4nK1tHMNv987REW9uOOQkQipg1kn7mzU
	7m/FxUP1dhNNVGbLtvL4sFIFnYdhfkmulyqd0/o=
X-Google-Smtp-Source: 
 AGRyM1sq/8NOdJV3l1L//uPV7CaR4qc3aLM21HgcqNPSfkErsF6yJNtW33lQOCqfDHafWO2gAmo1ZA==
X-Received: by 2002:a2e:9054:0:b0:25a:7435:d585 with SMTP id
 n20-20020a2e9054000000b0025a7435d585mr1691858ljg.62.1656508115714;
        Wed, 29 Jun 2022 06:08:35 -0700 (PDT)
Received: from localhost.localdomain ([194.99.105.240])
        by smtp.gmail.com with ESMTPSA id
 s13-20020a05651c200d00b0025a928f3d63sm2094472ljo.61.2022.06.29.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 06:08:35 -0700 (PDT)
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>,
	Jan Brzezanski <jan.brzezanski@gmail.com>
Subject: [PATCH] base.bbclass: Add sstate-cache dependency to GCCVERSION
Date: Wed, 29 Jun 2022 15:08:30 +0200
Message-Id: <20220629130830.48974-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 13:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167374

If we have the build with different gcc versions in the same workspace
it might happen that nativesdk recipe will not detect the change of gcc
and the package will be taken from sstate-cache. This will lead to
do_package_qa failure due to binaries requiring symbols that are not
present in the older libstdc++.

Example error:
| ERROR: nativesdk-mgen-1.0-r0 do_package_qa: QA Issue:
| /opt/poky/3.2.3/sysroots/x86_64-pokysdk-linux/usr/lib/libssh2pp.so.0.1
| contained in package nativesdk-mgen requires
| libstdc++.so.6(GLIBCXX_3.4.11)(64bit), but no providers found in
| RDEPENDS_nativesdk-mgen? [file-rdeps]

Add vardeps dependency to GCCVERSION to make sure the package is rebuild
with correct gcc version.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index cc02de5f77..da2dc05bba 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -148,6 +148,7 @@ do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
 do_fetch[vardeps] += "SRCREV"
+do_fetch[vardeps] += "GCCVERSION"
 do_fetch[network] = "1"
 python base_do_fetch() {
 
-- 
2.36.1


