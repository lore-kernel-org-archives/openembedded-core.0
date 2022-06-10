Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDBDC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 15:03:50 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web08.28185.1654873428097046128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 08:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=YiR4+9lG;
 spf=pass (domain: foundries.io, ip: 209.85.160.48,
 mailfrom: ricardo@foundries.io)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-fe539f9afbso3517765fac.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7BP66amxqtg9ODwGkwZFC7hjDbMRWAY1VnLXCGo+m3g=;
        b=YiR4+9lG57ghzPgSGgHAH47TbN2l156GvhowrEv3vMBO/xwjJBAkhEpPdIaj1rB91J
         Nh45jjJW3lzTosWy7Z16ru4hMiqmt9mKT7b+E6+5Kkp8T9uwJGUmyqTWmv213pXGXh3s
         f/nzLUDGJwjD0lwjBlw/krj/0A6Y2ujCcvs0gGDpuS7ycDmnAWVm1KiBry0BpLN4NcWM
         9PQcr11iCbEcfdu/pR5TyuQ71TBCANGQOHuL0/3M6wazZYMBKhM7MlVwV/zBUCNVEfwe
         aXvsTG5HMpM988IB6ceJ74/dx3hWz/DM1K52BLJacJ3BRlAp0FOQlaen+7e+1+JM3bjB
         qwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7BP66amxqtg9ODwGkwZFC7hjDbMRWAY1VnLXCGo+m3g=;
        b=iNOuAftoBMXCUUh7fKKLq5H8H+u5ceVL3BlmWwKpJPQkkUgJfGYWG5ZOH1jHBoWiNU
         ghyeuJ63AFing9j/6iztwVRRAVy/O6kkDrTA2P6KjbFAM/c+Uh4VJkkyfda/Jcjh1LQV
         UmXyc8OkBNEo5SJL4P7qdjKVaWlK2F8+kqnH0BLb7k7WkstwXbQnhEbeUTz+wcDl6xqM
         8Y/rdjgQJqs2Efx1jFVk3di56sZwSIsV/vAmHjj7v+pYwunFxXN0bKjQ/7cLuqHLdwPD
         Ho29Z01sD4id8oSUy9Gesai1w/N7S920I5mskpejFmS/ncEIRe2bjUQlMP7yu2jzJIWT
         V8Nw==
X-Gm-Message-State: AOAM530y+2UcwzOU9a70q9wd6NjdWv+qhI9TFrBYCSl43DbIjA8dOCLN
	96VGEfBZ7Dvi0jDgmCjxwnr/DJo3saE2
X-Google-Smtp-Source: 
 ABdhPJwanQZ3xFR6rHvrudWzcm24rnTPT2cDsn8ouHdwVTgs+tCYPFDThhklOj7GJShyF4NwOeaYbQ==
X-Received: by 2002:a05:6871:606:b0:f5:cd73:62ec with SMTP id
 w6-20020a056871060600b000f5cd7362ecmr115086oan.147.1654873426531;
        Fri, 10 Jun 2022 08:03:46 -0700 (PDT)
Received: from localhost.localdomain ([191.251.46.199])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a9d57c6000000b0060bffcb1ecesm6471833oti.78.2022.06.10.08.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 08:03:45 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: daiane.angolini@foundries.io,
	jose.quaresma@foundries.io
Subject: [PATCH] gnu-efi: enable for riscv64
Date: Fri, 10 Jun 2022 12:03:27 -0300
Message-Id: <20220610150327.1457168-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 15:03:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166809

The 3.0.14 release already includes support for riscv64.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
index c746c2a1b8..36d10354ed 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
@@ -20,7 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
 
 SRC_URI[sha256sum] = "b73b643a0d5697d1f396d7431448e886dd805668789578e3e1a28277c9528435"
 
-COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
+COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
 COMPATIBLE_HOST:armv4 = 'null'
 
 do_configure:linux-gnux32:prepend() {
-- 
2.36.1


