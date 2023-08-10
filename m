Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840BCC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 13:34:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.17199.1691674493918699395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 06:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UdgYRn/K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe501e0b4cso8381375e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691674492; x=1692279292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6vhq8eq++o4NUI7fXRaMIwWUn078Mjy8Kxrftu/XQ5k=;
        b=UdgYRn/Kn3+RPoxVw1cM53pl0cWo3vN3AdCfTEwv5AcI+M28AIDkN8uB+0kpf7NuON
         8ijV3mpDA1plgPGbuJ5f5DjulFGU54ZgKJyURxj/zL7NmsEozmgviWHhSDKZZXlKIfwn
         0FP81hOMu+VuwDsIhFG7Pm8V8/NhpZgIaESJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691674492; x=1692279292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vhq8eq++o4NUI7fXRaMIwWUn078Mjy8Kxrftu/XQ5k=;
        b=SIJJqH+gdzyyHgKxFBv8/htSJr/J/HSHoC5bWDZDxC1Y1jGTvJdsDcW3iu68vc+UWB
         zi+k/8B6e+USeUoEEvoNeVG2T3LrNinuPKHN0QsoV8vLiprUvSr29UuZdehKu9/eLNvP
         vdbOCqzrfrtfaWDJy+E9TJeOWkKO7RyUMb9cuRCuLfqlmf6JE5cMwy9HTVvqj0/09BN9
         mAgvcMxDfjaDPFm8qzsdGDU8eKSgJizc+h8iiHw0hbDq9Z3ynloQk1KF+KubR6lAJlOh
         ImWkgdGOXsrN+ru1YWyTKomG2ZtJTr94J+eK1AHZWHM3RvNaG6cpdE0Ue0i9ZWlWo3Hc
         RRFw==
X-Gm-Message-State: AOJu0YxXofErVyL40uURpYgypRN25NIL3rBeXLRJs4U5r+owPS/EaSrP
	f4ial+/9OSnkyx/Eb9FFuZ5AkpjpI15jujCKQg8=
X-Google-Smtp-Source: AGHT+IF4G0wKwJhvagyXbavs+NFBEp79kJZMXLapFM2861ZKzyYUyz+PzATwO6X6yh3j8ajqv798Ow==
X-Received: by 2002:a05:600c:2949:b0:3fb:403d:90c5 with SMTP id n9-20020a05600c294900b003fb403d90c5mr1924123wmd.39.1691674491806;
        Thu, 10 Aug 2023 06:34:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003fe20533a1esm2176697wml.44.2023.08.10.06.34.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 06:34:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/reproducible: Update config to match ongoing changes
Date: Thu, 10 Aug 2023 14:34:50 +0100
Message-Id: <20230810133450.237127-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 13:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185747

We can't have systemd here any longer without usrmerge. We don't really
want to enable the latter since having separate usr will likely result in
a class of reproducibility and host contamination issues that enabling it
might hide.

Also drop INHIBIT_PACKAGE_STRIP since we generally don't build with that
and the debug binaries should be generated regardless. I suspect this
is legacy from older issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 0f7e6eb376e..4c6ed4e4a50 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -212,10 +212,9 @@ class ReproducibleTests(OESelftestTestCase):
 
         config = textwrap.dedent('''\
             PACKAGE_CLASSES = "{package_classes}"
-            INHIBIT_PACKAGE_STRIP = "1"
             TMPDIR = "{tmpdir}"
             LICENSE_FLAGS_ACCEPTED = "commercial"
-            DISTRO_FEATURES:append = ' systemd pam'
+            DISTRO_FEATURES:append = ' pam'
             USERADDEXTENSION = "useradd-staticids"
             USERADD_ERROR_DYNAMIC = "skip"
             USERADD_UID_TABLES += "files/static-passwd"
-- 
2.39.2


