Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42321C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:36 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.20187.1637901395302094956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VSC0zPoa;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id m15so7044962pgu.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r563C9Lg3PSjEQa5Y81F96RgOxBdG7ZN8zou7ObigP4=;
        b=VSC0zPoah+xY8xVWOojv+m4YLHHuO2AlJ68mPQuY3e7HMg3SAzycb4pHh2zK2+7jQj
         Q4BiSlcYTrGBRvaPIhdYLtTOpJ0ZfzHmJwiuD/W3sbWlSEaRiuPQapuG6885Qey2rIP9
         zEyI+Bt1skZTi2IlsChdbt3VmvnMGE99OhQsy34wYrcE/Q0TKpQfHcEWgg61eEB7v46t
         HnmdUrRW5PU80Q4S6mXMRaYCMpk7UvIz25EBqaaZodZ8K1ItNpyNbZjsrsmAEc9iR6uk
         evACLI8wEh0P1sG8jIeyOet691/lHDcWN0NM9l7XCB5SFk3aAFpmhptfUtXRAhtx8dMu
         lcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r563C9Lg3PSjEQa5Y81F96RgOxBdG7ZN8zou7ObigP4=;
        b=dNAtlJtW9eJEzPcIVBxeujLTDxVm14cf7BcOAI+Vk+X+vZeArTqQSVj48LaCCmpH8O
         gKKZg7xF+PxlIPMqIVwD/K8PW+ks5bnhab5iDoIZLZNs4pSLI0Ec62oHoJ3f4nJXQ49w
         e0o9e/et9YkcFD1ootnlQXl9MC06H1JyytpsA2Y/dhvDa23OSTfShSTYWb1Sz9z/ZfjD
         S2P2zunLITr/MwNf77bUTtiB6/SNq9GELODL2wA/JWYaM7U0rkXa4x92LCaIFTUHBsmz
         S9rOxKZ7bS6bDWA6koBTNes6ieeN990dQCJT8NDGF+4Fn2tuEs0iQSAx/C942l0DBGtJ
         eYKA==
X-Gm-Message-State: AOAM533kh1G+7ayJecojRRU9hJcvr81/D3YSKUdLRixh90XJ49Q2sSpq
	y9pwjvGHjRPfrTLyY2ud/u+ixLmghdg=
X-Google-Smtp-Source: 
 ABdhPJybbWbnz9AfTiY6g4xOlw0oq18i6ldtnfp+9lwIK0AJl1Z9M0ZgQM8Fs7yxqYGuHBC7DdFw9g==
X-Received: by 2002:a05:6a00:10d2:b0:44d:f03e:46c7 with SMTP id
 d18-20020a056a0010d200b0044df03e46c7mr18542623pfu.0.1637901394672;
        Thu, 25 Nov 2021 20:36:34 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 24/26] lib/oe/terminal.py: use bb.version.LooseVersion
Date: Thu, 25 Nov 2021 20:36:03 -0800
Message-Id: 
 <fa4ab0f900b388f9ad47d9de0753d3bb1f950a65.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158820

distutils has been deprecated in Python 3.10 and is slated for removal
in Python 3.12 (~October 2023).

Refactor to use the newly imported bb.version.LooseVersion instead of
distutils.version.LooseVersion.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 59aa80de669..6681b0831a5 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -5,7 +5,7 @@ import logging
 import oe.classutils
 import shlex
 from bb.process import Popen, ExecutionError
-from distutils.version import LooseVersion
+from bb.version import LooseVersion
 
 logger = logging.getLogger('BitBake.OE.Terminal')
 
-- 
2.30.2


