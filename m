Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD460C54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 18:38:21 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.1160.1709836700805038713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 10:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EEJrmyyI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dca160163dso11538295ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 10:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709836700; x=1710441500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/TsE+1zcE+Xtqbavcuk13zMfiSyYzm0OZ3RNV5bwss=;
        b=EEJrmyyIO+Vaj7X6f/OZefbhHn5X6+quuN54E7/kHM2h5RdSTVPw8xPPoIPwYpvx8j
         jmacG5KEPEVQY/8h6K1ts6Ox5Q+p4tXh8zfsiHuyPu/FiS5jKTLLYZf5xIpwmx+RE4KJ
         gjCFQo9lS0ntcWXVE/Lk/R7RFG60+OepyVIzb7dbLnLso2ZHdwKfp2OdpuSGcJw1PDig
         prATCE5YodtQbHR90Qe22CVhS4kYBwu9DVYKIS4l1JNLjMXOzHyqzhjAX5ze9RZVjlb4
         SoawCUgRzASKTF/94GTqlRD27F0wPr6B6GqQ7rR5aj9ucnOLg76cFfUJhln0qUFLCKkh
         8/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709836700; x=1710441500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/TsE+1zcE+Xtqbavcuk13zMfiSyYzm0OZ3RNV5bwss=;
        b=jJmu47P+ytQs7KlU/WOMIf9gbiIDyaulLU83kvxa+xZ1CMNlQDrmAVUZTBovRnYOYq
         2WIHOrwE76Ayn2kiBAFIk4WfBZzZ/yqs+RPC0HjIdZYIaWWU+aEQc6yA5UWZYpV1Wt3q
         ZH73r2js0h1sCMVLRWddlmh3LXjr7aO80PPsjA8hcYbHk8auqf6CuWegRLSeQp2ATJ7k
         TfXTeStRa5lA7XwsUVbKkdm/nK6emVKWF8cCFcfikq8JDnI/aVf7M4E6Kqj132Y6SWWo
         L6sj0vy89LoK74sYHCNnWcIRR/QOjZZLdx4akO1nk4PnYVyA2ipHdMt/131IZeauEnY5
         2X/w==
X-Gm-Message-State: AOJu0YyBveXuoto+juUUv5LprJc/ZJINZA1HZvg28o/4F05ZjRY0ite7
	kaS7cnekdI2EZMqdvqxyoN4X5AfjfDUhxvBnr5pqRTjIBSEZ9xn+tdr8gEUe5znEUgREhsvFd3J
	RFUc=
X-Google-Smtp-Source: AGHT+IHFL9E/M0FpQeIGz0s+fw7mtUibffbZKeD2uFUqEmNsYvJr4u1fpEPvzjgv8UE2k9wscV1ZSg==
X-Received: by 2002:a17:903:41c2:b0:1dc:ccd3:29e5 with SMTP id u2-20020a17090341c200b001dcccd329e5mr11548842ple.2.1709836700076;
        Thu, 07 Mar 2024 10:38:20 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b001d7057c2fbasm14959026plg.100.2024.03.07.10.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:38:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] useradd-example: do not use unsupported clear text password
Date: Thu,  7 Mar 2024 08:38:09 -1000
Message-Id: <688ec6a245d3d8a92c358e13baf752c9bac332e2.1709836581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709836581.git.steve@sakoman.com>
References: <cover.1709836581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 18:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196813

From: Chen Qi <Qi.Chen@windriver.com>

The clear text password support has been dropped. So let's just
use a normal ecrypted one. The password remains to be 'user3'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd8232f9c58980d95180ad320b7b0bb0fcfd9ff5)
Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index 3f4c42d714..cff624e2f9 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -33,8 +33,8 @@ USERADD_PACKAGES = "${PN} ${PN}-user3"
 USERADD_PARAM:${PN} = "-u 1200 -d /home/user1 -r -s /bin/bash user1; -u 1201 -d /home/user2 -r -s /bin/bash user2"
 
 # user3 will be managed in the useradd-example-user3 pacakge:
-# As an example, we use the -P option to set clear text password for user3
-USERADD_PARAM:${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash -P 'user3' user3"
+# As an example, we use the -p option to set password ('user3') for user3
+USERADD_PARAM:${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash -p '\$6\$XAWr.8nc\$bUE4pYYaVb8n6BbnBitU0zeJMtfhTpFpiOBLL9zRl4e4YQo88UU4r/1kjRzmTimCy.BvDh4xoFwVqcO.pihLa1' user3"
 
 # GROUPADD_PARAM works the same way, which you set to the options
 # you'd normally pass to the groupadd command. This will create
-- 
2.34.1


