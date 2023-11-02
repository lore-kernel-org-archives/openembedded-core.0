Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5BAC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 12:11:57 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.29101.1698927108077629389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 05:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GnUX4mIQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso1450580a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 05:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698927106; x=1699531906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2X1GZ75KxiR48H2TRTcmEKKnQ8m1smWsPkDjBIZWgjM=;
        b=GnUX4mIQoqnoHN4IQaYst8ynAD7rCxIfOo6d00NVTdKeAfRtd/0zlXf1TZpnk5s6mC
         iAl9DuKKkHU/1pM3TQ3aoZricDm1arRYKC4foNGmlPP0csyF2S09yi6dBgSNah5l/gdQ
         pYY8Z6pjOs2JCdLast2NeiclydPEpbVZYyYzfyoUcWbJl2JfcV0R0/BimaXMYMlrc1tG
         t8NTGxNVqThgpBbLmgsleyCt7+u4uPSxW6z/XQkVYfqfh4A7kKJpTKkatvIpwqfr6J1h
         HBLYdjYL47x2etfkIw68fNcn9vvyAxxonj8y2+cTMsEN9cxf3u2gqkUXAu+mg8wI6okx
         KKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698927106; x=1699531906;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2X1GZ75KxiR48H2TRTcmEKKnQ8m1smWsPkDjBIZWgjM=;
        b=mIgMC+nEO/+6FjeaoRSJeF+YZ/U3/1lX4TOtm0AGK/VTzZksBlz6VgOtQgH6gGHrx3
         bXrP/R/+lZMlcvlUCWc0rEfJtVH5PsVHcV72GOlqGRRyrWYg89+/Xi0wbM7fYfXsXZVd
         Vx1CjBzbnZzMwSOKNFT+wvR57ldk/A0pwaGhKRNRj85I0qricjmL6nEUunArE4dCU007
         EqziyXwOCB6D6nnOA6puT+t4MbJitqh+zeHEn3rSUXaENa0BnRVm5Kr11ODD/Pnj9brd
         VZgijte3rXHDlyHPylRaPIcqcwlRbUJQrXVBnfIbsXegBp+URie5hEAxbM+3tqj04VTo
         9sNA==
X-Gm-Message-State: AOJu0YxEf/PbBBaus7DV/oQn1YRCFnFAE7C6CJPDgZO8C76QkukMeXpO
	ZpBFBp9lbpgyAWfXE/W/I83DO4H2Bn4=
X-Google-Smtp-Source: AGHT+IGc69bSm3AILyGsoT+AHfR0tcsRwdzq3rftGj/2QGwMLWnK1NVPLiH9zYAdirnwr4TAcl+mYg==
X-Received: by 2002:a17:906:fe49:b0:9ad:ef08:1f32 with SMTP id wz9-20020a170906fe4900b009adef081f32mr3812135ejb.37.1698927106223;
        Thu, 02 Nov 2023 05:11:46 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id y24-20020a17090629d800b009ce03057c48sm1065838eje.214.2023.11.02.05.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:11:45 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH 1/2] lib/oe/buildcfg.py: Include missing import
Date: Thu,  2 Nov 2023 13:11:31 +0100
Message-ID: <20231102121132.1148-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190078

From: Jermain Horsman <jermain.horsman@nedap.com>

get_layer_revisions() uses the os.path module but it is not included
in the imports.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/oe/buildcfg.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index 90f5e05715..b9d32c7cc1 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -1,4 +1,5 @@
 
+import os
 import subprocess
 import bb.process
 
-- 
2.42.0.windows.2


