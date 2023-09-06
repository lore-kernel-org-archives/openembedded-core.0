Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6B7EE14D3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 21:16:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1817.1694035011039000816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 14:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ckc5BZDo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so3272315e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694035009; x=1694639809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mg5cf85k7ipmCSqB6YPmv0W5s1kHL84N6UtBfZ7s3uI=;
        b=ckc5BZDovAJc8lAYX9guShWWT7HWAcKVcaXpUvXWDA+uU2LQqtkRQmd8V4pVuSVtnM
         iYTIr3fsToXWYKquG0G3jvb9gG4I1JDrWKS9QQTSE90nGipzq6JgOKUCTwT3iOBGqxL9
         B7bfUle/o3xlTeYr1ye58D+v4sL6/afbZlYO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694035009; x=1694639809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mg5cf85k7ipmCSqB6YPmv0W5s1kHL84N6UtBfZ7s3uI=;
        b=E2B944Y4raAYJjToQeSE8zDKfxVyppzgFuxYszvNFexDTWOhL5lsAmYBRHugQ2M4Es
         YA80Puh3r9XehYi4/98XR/fQ1yJm60gDhvLNS2U0BM6l1zTWNI2L7qZUOU3o23HIQmf4
         o9iEV8bT5Qhoyk7rCfY0ZwGvWgPWgTEHAbjyriVRhC/i3wqEqgJc2L1Le8TJ7/cgixdP
         qunFc7S+lRHLpxdN+JAbdE7FXI50MuSDQUf+vLz1Lq39BgtXb/jAOr7/IyeFrO7aIoZd
         kRHMQmu2ed28sLl5CNue7gAmxez0/O7UN9gSfrqB860JWCfZ1ixngKfjLLRu6MUdfUu1
         1aug==
X-Gm-Message-State: AOJu0Yxhh8AiV2gkQSUuW0t+kzSsnF7SK4Artfv5DHjrM9BGIYtQ/AYL
	tXzHYkK8n3mU85FOjw7llRTgFtgtLJPop8Pymss=
X-Google-Smtp-Source: AGHT+IE8j0tvBDJgnp0MmXy9qmwQpMN68NOMgIua5LO1OaXEVwU1ZSaImzfZ9cEBX6X6XG0KwV1I9A==
X-Received: by 2002:a7b:c01a:0:b0:3fe:5053:1a0b with SMTP id c26-20020a7bc01a000000b003fe50531a0bmr3204693wmb.11.1694035009094;
        Wed, 06 Sep 2023 14:16:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id l12-20020a7bc44c000000b003fe61c33df5sm602251wmi.3.2023.09.06.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 14:16:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: ovidiu.panait@windriver.com
Subject: [PATCH] mdadm: Disable further tests due to intermittent failures
Date: Wed,  6 Sep 2023 22:16:47 +0100
Message-Id: <20230906211647.3046246-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 21:16:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187356

I took the mdadm ptest enabling as I was told the tests were fine now.
They're not. Disable more of them as having intermittent issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index f624d81df56..c66a89677f6 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -105,6 +105,11 @@ do_install_ptest() {
 	do
 		install -D -m 755 $prg ${D}${PTEST_PATH}/
 	done
+
+	# Disable tests causing intermittent autobuilder failures
+	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/19raid6check.broken
+	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/20raid5journal.broken
+	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/21raid5cache.broken
 }
 
 RDEPENDS:${PN} += "bash"
-- 
2.39.2


