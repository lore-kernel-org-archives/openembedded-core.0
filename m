Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3086C74A5B
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.35732.1678494447580790605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HDGt1pSZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id g3so6565715wri.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7l9XKwYg4jck6hU022bcjKbKFJe2rgTXBNR8GOyGsVw=;
        b=HDGt1pSZBpAGSY5hBMS1+iE8wyNOiJYQGUKxytv4ROViJ0ffQhwLSf25EoCRl3XbXw
         SrvnRgJVZQqr5rYMOZznn1pns4FM7Ihm1gqjXk2X9UyF/6KMvEJTUYM+4cdlrEIU5c1Q
         sTtVjtqi66X9M5C57AVjZSknTapJJ5sdFGiZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l9XKwYg4jck6hU022bcjKbKFJe2rgTXBNR8GOyGsVw=;
        b=b5UyvVhn1PdKbzBkBqVWwht1k5hmtgRuMCl2F4qCg8QW7LOHbAsBHoNh0ixjXDTgrQ
         aGFhqgrWXIyvw5pVXYSXliZb6VFOw1PDBJmeqF9nVTL3+yqIVgNsKaJjGjaXqkgpkiso
         lvSa/Fxx0x2BlfLHRb2Gj7casACDtNa3dKfSO1lNqYha6wO8KA43C0wf4+ws7TBavggm
         T5LBQjL3h4cyepAZ7pEAJlvG6AwfeA70/UU6tuY7NP7OJLLdmRlk/5s4Iaj+36q0F0by
         l3uaibAM0k0Ib/LwWE20WcU2vsPRE4deD5RsAvLrcvGXqo/wjT6mB8aZxYELIN7vdfRW
         G45A==
X-Gm-Message-State: AO0yUKUuekEtlf2gCuy95pq97G8xHvlyhAmW1XMBUx45IieAh86UwhyV
	v+uNq/wqKjhwsJk5eKDAOVTjZlHUgGdzktrJSFs=
X-Google-Smtp-Source: AK7set+SM8QbUab40GaCcX6ha+AuCHOfrUxggS7JSLuaUQ6RhehVVMS0Yy9/8SGC7gId9e01bpfj5A==
X-Received: by 2002:adf:decf:0:b0:2c7:3d5:9faa with SMTP id i15-20020adfdecf000000b002c703d59faamr17065303wrn.11.1678494453721;
        Fri, 10 Mar 2023 16:27:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/16] busybox: Fix ptest dependencies
Date: Sat, 11 Mar 2023 00:27:22 +0000
Message-Id: <20230311002722.3211118-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178360

Ironically, busybox ptests don't all work without coreutils being present. This
dependency fixes execution in minimal images but the failing start-stop-daemon
test case should probably be investigated in due course and the dependency
removed when possible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 62dc839245d..4569acd475c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -55,7 +55,7 @@ RDEPENDS:${PN} = "${@["", "busybox-inittab"][(d.getVar('VIRTUAL-RUNTIME_init_man
 inherit cml1 systemd update-rc.d ptest
 
 # busybox's unzip test case needs zip command, which busybox itself does not provide
-RDEPENDS:${PN}-ptest = "zip"
+RDEPENDS:${PN}-ptest = "zip coreutils"
 
 # internal helper
 def busybox_cfg(feature, tokens, cnf, rem):
-- 
2.38.1


