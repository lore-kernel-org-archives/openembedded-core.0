Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A004EC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 22:28:34 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.421.1713392914109369101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 15:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mGvozVSU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78f04924a96so15946185a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713392913; x=1713997713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cr6u2tWEQvYlUm1Ff/NhTNmx0ILeYoEBziqZJyDKWB4=;
        b=mGvozVSUarBAnr9Sl3mr0NEA8vCTjk5d4aEkFF4k9TxNyvJVIf5dwFDW41V2EoYLZ2
         ukM8vAVRjyC87nlNqTxDKeH9KIvS1XGerM0qhgQnzRg3xHvkBfKOjVXqiWwGpQjUaDm5
         pKfzW6YJJdBb1BiY1mwcOldI7doI8+1yLU4U446IDG6UH1uTH7vfeYwMNPFiQtGdC8Fw
         uQdVtyFNzgOyar22s5vlA49Fa2sHc8RtXreSPiGim7a5WQ5RQSVWWU+3LzEbIaJF5pIY
         0B8yLfnxE6qbZ3/kLHHsQ7A4/hfYC3p+S28RTQqqc3z48s5uzzouoOGrjQ0gg7L/50jt
         STMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713392913; x=1713997713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cr6u2tWEQvYlUm1Ff/NhTNmx0ILeYoEBziqZJyDKWB4=;
        b=N7AaY7cuOSTP4VXrWuEx+WEw7wAcDxhGpM9RXuk13zA3wKxAau8ukJIRKf9Z8+QgpS
         p9zy+eG8PxlsdlGczXMMA7PJJ6gjVKvYTxaAf9E67J473LDpfYqm2w5dtyuALWtnDDgV
         WsH/ZQTevVAAQfL/lTsZma0Zaw/ntpbDEk15R+JwX8rYjyRQxqRFWriSSq15mOX4/HNB
         QXD5k2A3BinMNaY1O0q2124Jja3AL/pGFTN2Lm2dOPRMUBxgGN+tB3F7tFs2Ld09j90y
         RYeFBgMYLBHJIxJ+zMGd2huS6qdr/wj+RpeMmQSCo8oNYXZmQODde2f2DocxqAqSri0+
         Jtqw==
X-Gm-Message-State: AOJu0Yytyap9htsn29zOPL4+lEaaUyhQ1eUrgxeMy9qiuJTItMkF/05/
	QeoNsCLEa8KY5Z7VZdhy2PJPPMqVlwDR+KWmJA93XWMy2MdYe+vtcBqJlONwSLCd8qo7we3hgNU
	=
X-Google-Smtp-Source: AGHT+IEI5udINt/StqAzWFwick5J7zrR8qWTT8k5nznI8eT7/tpDo+fUeaHblzlpz15fLQsY0UGT2w==
X-Received: by 2002:a0c:e849:0:b0:6a0:52c9:5fa5 with SMTP id l9-20020a0ce849000000b006a052c95fa5mr660316qvo.7.1713392912899;
        Wed, 17 Apr 2024 15:28:32 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id q16-20020a0cf5d0000000b0069f4808719csm70446qvm.76.2024.04.17.15.28.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:28:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] liba52: update SRC_URI
Date: Wed, 17 Apr 2024 18:28:25 -0400
Message-Id: <20240417222826.3549176-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 22:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198488

The former SRC_URI was no longer working.  Update to one that is.  This
required updating the md5sum and sha256sum.  NOTE: SOURCEFORGE_MIRROR
(https://downloads.sourceforge.net) does not appear to be working for
liba52.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 7a3b4a43c8d4..684dd590ca15 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -10,11 +10,11 @@ SECTION = "libs"
 
 inherit autotools
 
-SRC_URI = "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
+SRC_URI = "https://sourceforge.net/projects/liba52/files/a52dec-${PV}.tar.gz \
            file://buildcleanup.patch"
 
-SRC_URI[md5sum] = "caa9f5bc44232dc8aeea773fea56be80"
-SRC_URI[sha256sum] = "a21d724ab3b3933330194353687df82c475b5dfb997513eef4c25de6c865ec33"
+SRC_URI[md5sum] = "1a2e77b4f7aacd858961a6b727710551"
+SRC_URI[sha256sum] = "c1931bc511dc48987fdba6888be577f3035e3f0b6b81d3ea3e766fca8d18e128"
 
 UPSTREAM_CHECK_URI = "http://liba52.sourceforge.net/downloads.html"
 
-- 
2.30.2


