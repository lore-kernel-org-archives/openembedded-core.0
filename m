Return-Path: <nick.owens@eero.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335F9E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 18:02:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.135166.1734631315848870887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 10:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@eero.com header.s=google header.b=mtMz2wpD;
 spf=pass (domain: eero.com, ip: 209.85.210.181, mailfrom: nick.owens@eero.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-728e729562fso1054084b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 10:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eero.com; s=google; t=1734631314; x=1735236114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X8yCGHSgVoroVkDVstoXji9DcUi6mmaK905bnFMH4QY=;
        b=mtMz2wpD6QsPXPWs8Lw80sNDCxitgp7czopbTXSSM026kxIdcbaYNXdyKWPFFKC7dz
         vMPO5VH2QpfU5ikg/kBu3wHoin8zLr+nMlbrsmxWMcavxyK/wGq0XVPB3z+Xw4hMJRFB
         u+UAGYKIj4ztPK80CZ5sMwZxiyWU5su7qe3ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734631314; x=1735236114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8yCGHSgVoroVkDVstoXji9DcUi6mmaK905bnFMH4QY=;
        b=kRefYgZfzQpeRJACx95K6B3EynCA6qSPNzejyxsge/y+Mv9D7ES7cDFi2WDHPkSkPM
         Z5fNYXYEq26ctCA3cv6uvF7Sbm5ImP0WBZ4m16XJwQVAcv6xpuhrmpSWhaEPnYn+InFb
         xx2a9vAJqb6/mwf/gxAIMLhfAs2Pk9iA3Hh9VN4as7WzLxlSX7fcI6r9VhUjXfXrpW8F
         pLeznHU6cLYUsDXWCDIh8DvwDL2Zg9uwIbQRUIQrjvJMqPwNVSsmYdjOjqeVUCzcu87M
         BXXmxVjl/Z52D3VFt96bNVJO+NcQh7o0Tov/tkPt6yqAZj7WeVouBdCc+WW1vOSH4Fjp
         P8yw==
X-Gm-Message-State: AOJu0YyoM9v9cxhtrisu6YT+554XwF+8jvWD4KvtcrtxVIk5c5PTAZl0
	pKZhr+owYBwuFDEniiG8K9//zERY0l5wwQh7jp6NWO6+ytxmNodcIJ7NpxNFVVbDXJjJxYGPn1d
	9
X-Gm-Gg: ASbGnct/hxR97U4yDoQ2b5QkYgwWJEvs603w5WRGdjQ4lqD4rY7yj8Y/mD8HMHOk5NN
	Px1VnIVD550lHgHTJTQpey+gMpI/zbrrraulSGhpz3i+bOjvoeM9pLNEP9UmwXUST+h5ozf+O1v
	EuwJ5+pd8ii0p34RPPkw9mgZlKH4qCzlFqWKkkMXKbNx/kt+/P9CEpBKdn3MTOacQqEarTdwPsM
	3xCmI8h5wIaN30wCfL2B65GMT1NBzd8KkBT9i0N1ltYdz/Qe9PozvKTBpkFOXh0T0v1h7z8nHX2
	vin1zDxT7Kg=
X-Google-Smtp-Source: AGHT+IG+ndESRgVO1fwslJ3679dVRBLQ1L54DJ3aSHpeYRPh5CljlFco2IeYhFsT5ry2jJl5VInDPA==
X-Received: by 2002:a05:6a00:35ca:b0:72a:a7a4:9b21 with SMTP id d2e1a72fcca58-72abb4f2175mr741246b3a.5.1734631314385;
        Thu, 19 Dec 2024 10:01:54 -0800 (PST)
Received: from ubc8fb08c436a5b.ant.amazon.com ([12.76.39.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad830333sm1590644b3a.41.2024.12.19.10.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:01:53 -0800 (PST)
From: Nick Owens <nick.owens@eero.com>
To: openembedded-core@lists.openembedded.org
Cc: Nick Owens <nick.owens@eero.com>
Subject: [PATCH] icecc: allow icecc in kernel-arch recipes
Date: Thu, 19 Dec 2024 10:01:30 -0800
Message-Id: <20241219180130.396868-1-nick.owens@eero.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 18:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208926

to take advantage of icecc in out of tree modules which may not inherit
kernel, but do inherit kernel-arch via module -> module-base, change the
inherit check for icecc_is_kernel to check for kernel-arch class instead
of kernel clas.

Signed-off-by: Nick Owens <nick.owens@eero.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 8a48f2ad63..adb51baf99 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -181,7 +181,7 @@ def icecc_is_allarch(bb, d):
 
 def icecc_is_kernel(bb, d):
     return \
-        bb.data.inherits_class("kernel", d);
+        bb.data.inherits_class("kernel-arch", d);
 
 def icecc_is_native(bb, d):
     return \
-- 
2.34.1


