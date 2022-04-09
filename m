Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7355BC64E66
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.11374.1649540918584317528
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 14:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YZRMsO6G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 j5-20020a05600c1c0500b0038ea8b53580so2244660wms.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 14:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KacsaxGW6M76hbLoYf9H/C5redBGWObq8xR1FioCW5k=;
        b=YZRMsO6G3j8gSFnDku+Mc4TO/fNzf+2ZVdFNI+JE6Kmy8f0nVJFvm5+Sr57jkRaXXH
         hm1dpjPxmSaRtcMFaHs+IeiSiR/onxQdxAGA3YjWzDO5TGiSHgrgUHFtqZ2rCkfeDxWf
         D7drlOmxkQakxalAm0I3cPFSgPskAGLmZn91o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KacsaxGW6M76hbLoYf9H/C5redBGWObq8xR1FioCW5k=;
        b=qg3q4vEApTrEK1MDYFZrHg/SO+EvQdxKcliRpc9hbviZDH43NSAnjRh8fGajgYdJKf
         E+Udggo7aCADYaXXo539XcHYHYGbneZt4mQYiBU9kHOWCVunobrZK1MLe4pB3T5zAaQX
         rKWQMCk4DGoFGQmS5oJx4II+J+lrkX4+ZtKgvnrpRU7x0i9xRvstkyAWQ20vELaKzZc/
         fNMlzX59oWcsUsXz4PXKtY7QujEwKmNHMuCd9OwCgNSYeGw9PocSl6dZ3zCriouwMc1P
         2ahIzibRy8nQ1tAGUrdLIYg7rq5KtTg2xhArgRhO1E27C98s7jggkaGswiB+QWsMfZaC
         PVeg==
X-Gm-Message-State: AOAM533O4Z2OBz5vaHY47x3+0ZHtq8sVao0ccRQ1IKt+MTGRuguTFPq7
	uQTZRUj7eSFhEAPPV6bgyuBkP3QE1bN2JA==
X-Google-Smtp-Source: 
 ABdhPJyig1NTnypwuL/6PCyHK8NxHfA068oXE35ApjIZRyvkcsF2aSlqqXkGXzRv5OSTR+CjyhmZvA==
X-Received: by 2002:a05:600c:1989:b0:38c:b8b3:8fa8 with SMTP id
 t9-20020a05600c198900b0038cb8b38fa8mr23267016wmq.18.1649540916524;
        Sat, 09 Apr 2022 14:48:36 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9df4:c2a5:c308:84e])
        by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0038eb596ab10sm1679081wmq.2.2022.04.09.14.48.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 14:48:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uninative: Upgrade to 3.6 with gcc 12 support
Date: Sat,  9 Apr 2022 22:48:33 +0100
Message-Id: <20220409214833.1982317-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164194

There are reports of issues with the new libstdc++ from gcc 12. This upgrades
to a gcc 12 version of uninative to allow builds on those systems. Gcc 12 isn't
finalised so we may need to add a new version of this if/as appropriate when it
is.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index bfe05ce1eb5..411fe45a248 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.35"
-UNINATIVE_VERSION = "3.5"
+UNINATIVE_VERSION = "3.6"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "6de0771bd21e0fcb5e80388e5b561a8023b24083bcbf46e056a089982aff75d7"
-UNINATIVE_CHECKSUM[i686] ?= "8c8745becbfa1c341bae839c7eab56ddf17ce36c303bcd73d3b2f2f788b631c2"
-UNINATIVE_CHECKSUM[x86_64] ?= "e8047a5748e6f266165da141eb6d08b23674f30e477b0e5505b6403d50fbc4b2"
+UNINATIVE_CHECKSUM[aarch64] ?= "d64831cf2792c8e470c2e42230660e1a8e5de56a579cdd59978791f663c2f3ed"
+UNINATIVE_CHECKSUM[i686] ?= "2f0ee9b66b1bb2c85e2b592fb3c9c7f5d77399fa638d74961330cdb8de34ca3b"
+UNINATIVE_CHECKSUM[x86_64] ?= "9bfc4c970495b3716b2f9e52c4df9f968c02463a9a95000f6657fbc3fde1f098"
-- 
2.32.0


