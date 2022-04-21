Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957C0C4167D
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.2070.1650582524246596574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 16:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D/GT4J31;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id t12so6972282pll.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 16:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXc8dIGjOPS+blXr9UD0cV5lKzjlNdrJ3PmUYfZhlWA=;
        b=D/GT4J31A6R4Id+GScD5lGt9YKeK5eFeIX6+JVXH+rjCMcaRCEBdfq3Z0t93JZDHJU
         Y+0Bt5iNPg12XLBkATKS/KzLt9P7BG72CvpBs6MlAL3PgjpbfyJyN2jwdqfAfzomrx6W
         bAQJuUc3fWbuCmedO/Gid/jq7cozNkffq2/R0ehYLAvcT4TXnuNOLPXy44fN7eJcC/ku
         DZW3t12+YNojnhYCLzOF2b/JjrM+fyUP9w7UgaupfjXogi1/xrOyprv3hwCJcKH4j5wj
         2vmnMlGkiN4PQCZjLoCQSEUMYCcoyU+0o+R+1Plv4U1QmgwUlLZsTd7RUAqT6ECASn3v
         3ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXc8dIGjOPS+blXr9UD0cV5lKzjlNdrJ3PmUYfZhlWA=;
        b=0gPibw/2XRFuXVMNfFwkAVyVCtgsEigc0vhOo/pr7M3AbPlQuFLYX3IcBpb5+2VBhU
         IQXJFtQPpQ0k3VciVT/687+Xabq8TdfoZOVon9leG6+KxvBgSAV9rp3Rfya3fGJxS8fu
         Q7+HhTXsXT2k7zhmv4Ce5HFQsynkI9shjJesLxIOyA/VrvgfKcQs0R1Zs9gRk2Z9QcvX
         YcLgyIClMTAxkMWiBgc/c6i5e3NMKtsWI2GhYBk6D/H34Ejhn7YDlG4EBfO7Pprt6acL
         oIdj+8vPevGgZLSbghnmbXzC47HrVFhz3PVeUvv/ms0PeLNmkcTWAMylbQBMUZWYCX90
         7N5w==
X-Gm-Message-State: AOAM532Kbhdb/5LNPCtpnzOyHv5sHoWvDAxynjTvZyQ6lCpaJEc1blND
	HXqZfpb/nmYf2D+gVdP5d2hgY2c+lag=
X-Google-Smtp-Source: 
 ABdhPJwLiWYYnXIuj8rxCrNTNGRFemWK3kw6sb+0fEpINvaSFtMBUX8I6xg2sLUdg5XKSCIYeLCgxQ==
X-Received: by 2002:a17:90a:ce0b:b0:1cd:6fff:8dbc with SMTP id
 f11-20020a17090ace0b00b001cd6fff8dbcmr2082384pju.212.1650582523390;
        Thu, 21 Apr 2022 16:08:43 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:7a6b:1408:49b0:c75c])
        by smtp.gmail.com with ESMTPSA id
 p13-20020a056a000b4d00b004faecee6e89sm169880pfo.208.2022.04.21.16.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 16:08:42 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ross Burton <ross.burton@intel.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [dunfell][PATCH v2] boost: don't specify gcc version
Date: Thu, 21 Apr 2022 16:08:38 -0700
Message-Id: <20220421230838.92357-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164769

From: Ross Burton <ross.burton@intel.com>

There's no need to specify an ancient GCC version here as Boost will
probe it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Change in v2: fix my email address

 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 829e728b6de..1c13fb3599b 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -165,7 +165,7 @@ do_configure() {
 
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
 	rm -f ${WORKDIR}/user-config.jam
-	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
+	echo 'using gcc : : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-- 
2.30.2


