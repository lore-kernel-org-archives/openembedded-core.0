Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7D1C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 09:42:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.17297.1667468511103651695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 02:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MmVSSGsa;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso2898858wma.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 02:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VeSkujD2o1kXINFKr5xH2+kUBff4EH/F3YwC5IC60mI=;
        b=MmVSSGsaBRK8iO9S0eXt/1c1Ky40/2hrnX8J+nPk2RSBjXxjjreFBlvDtPG1JrFr6M
         WEo2GiF8WXfCYL/lIz8sUce4g1+Uj310nv4YBy4/NBJ6tTr0dkooil2CeKaVY/3MYndQ
         oASvLn+Vuo0YuNIr2hBtuEN1E+pof5gUXdAUspRebieY70cwNbayWIEuHrGkE6JcE+C7
         7FKud2o1uQeQm9TqMo3zO/RkSe6+qJHZa6Giyy4rdjTTt6EKNefW15ltNpRLXVg4ahdG
         x6xNgGzJtUCjSbY7I1WTdwbidqeiaxW4XYb4gQvPi0AAgm9FEaqG9ORTJiOhZO6XgWyI
         sSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VeSkujD2o1kXINFKr5xH2+kUBff4EH/F3YwC5IC60mI=;
        b=aEji7qoiRzjjPJDSwkOtMSogcVtVFCcYI0ip1nkLsZUhZgEKqxiRJdyuxdwRBA7YxB
         Cr6W+KWRe9nW8bp0Vxv90AboXvrtx6L/Zo7Rg2wPxKbnHhUj2pyCDpkYHLgYe8B+jo+6
         XkXB6Ci8YRFXjArCi2Pl2GMtBF449mnsMiAmLsfUB+nfQaaPfgzh6fKmmvU/VanTkuwx
         ni3QwQtOdmT6bvZ8pLSxNtdTjt/v1FzZRtpru3bIfdTLbpYLu6cr/ihTxxxp9FuQ6yA1
         obT3kZlVCVPmx0N4OtYALb/449awlYmz/nLRmD3vePRtA0GBY/edywzjZzj7DeXEMfev
         eE/g==
X-Gm-Message-State: ACrzQf0IzV+8zVWJRBqiXzTps+r5iKuwygZGtI0OHZQdYIdRnHwg3dlz
	KzcKNVXMkaCawTpZ3etrd9+92eomZKP0Zw==
X-Google-Smtp-Source: AMsMyM4WW21yz8RLO799Uhx59zM67r/NNEkK7KALi2bSxtDMKtNAAWVpSvToXijU+MOPLlQIMX4k7A==
X-Received: by 2002:a1c:7312:0:b0:3cf:6957:1639 with SMTP id d18-20020a1c7312000000b003cf69571639mr16916577wmb.108.1667468508960;
        Thu, 03 Nov 2022 02:41:48 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6b84000000b0022e653f5abbsm356880wrx.69.2022.11.03.02.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:41:48 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [kirkstone][PATCH] kern-tools: fix relative path processing
Date: Thu,  3 Nov 2022 09:41:16 +0000
Message-Id: <20221103094116.3474799-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 09:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172620

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The previous fix for processing of paths with relative components, broke
uses cases that were a mix of patches and configuration fragments.

Updating the SRCREV to include a simplied fix for relative paths, and
a cleanup patch from Jose:

[
  Author: Jose Quaresma <quaresma.jose@gmail.com>
  Date:   Thu Sep 29 16:37:23 2022 +0000

      scc: only look for error in scc_output_file if it has valid content

      When process_file function fails the output of the processed script is show to
      the user, some parsing is performed as well to look for common errors so we
      can point to the right input file.

      This can only be done when the scc_output_file have some valid content
      otherwise it will show invalid messages to the user.

      Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

  Author: Bruce Ashfield <bruce.ashfield@gmail.com>
  Date:   Wed Oct 5 19:13:33 2022 +0000

      spp: ensure that prefix check uses absolute paths

      The previous fix for this issue was too broad, and impacted
      all calls to the prefix check and removal. With this change,
      we only expand the input on scc/spp operations that may
      execute with relative paths.

      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 533720a1756454447341769c4a0969fce8d6f287)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index dea7b65a7c..07d7daf5fb 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "ba600ef61a85966596126a6e8d936971905e8749"
+SRCREV = "6a4752ebbe7d242c02b3c74a5772926edd243626"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.34.1


