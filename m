Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E0CC48291
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 11:41:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.60598.1707133290725072891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 03:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ShGirlMf;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so10435755e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 03:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707133289; x=1707738089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1EmjoxQgnTcMnMGp4J2AiPzWJMDBYFjcnu+ofJ74NU=;
        b=ShGirlMf1XfKxASu9ccr0FZNXfZXYZozZO20aI5KvCfrP7JXx7i92k0tEPcYwjSQME
         CTm4mN4w3U/nka2P0CK5djx7nyBu1GULskL0RtWe88AstdxzbWVF1qPtgO0Hp0Nfu170
         kJ+gxc0MfPLBS6pyC4G61C05GjSsD9j8CeZRpRoIOFbcVoULpJGNvgqPYewoHGcUsjlU
         rpym5LAf7LdyfQIBZSQJlg10pAhua3yja5tg4nRCPaU64fL644W9XiHKqw7f2byRq6Bh
         5bqD9whPMgS1Mx0pGnmepBah3GocYhUYFPV7ayps1isPdohd5T0/+fZMrW5d0KR8ssZI
         uUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707133289; x=1707738089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1EmjoxQgnTcMnMGp4J2AiPzWJMDBYFjcnu+ofJ74NU=;
        b=KvlYJ3LmUvqY4bHbQ8XTMNaL28ueZkCm8Vn9PNtjNf9VsCVmLF2jie1OZ8zZX7td6t
         hLufvF1pPiGj+X8jKJJbMrbuf5HciDLmKzHZ9bO5ENT/fdR4ETXoRW25x41QFbFYUKYB
         B7qP3yKg2PNctoHz/eIgAUMKY/D6H7YUnOv1JWslTSZlGKjOJJdJdVMb3oot6zVci1iG
         6pDzSm1PmhCfXPnyHF9LRgrG9DQQtJfWzj8abKHNBvpGB3puxvSvwKQDGN1+JzH6M4p/
         g2A1N6d3iy1qsTHVMt+pKmaMlCyEk2MutNJa3SH8XTcLUkg7HmdSymvj/4n5eQ7NzGWF
         r/ZA==
X-Gm-Message-State: AOJu0YxMdm2C2GjWnpyfW7hdirf5L/US5Dpt1MdKQP8w0q/fFo7CRqRg
	GXX4cx92gKoHAsg3/wClXJaRTlrorEFGv7h4QR7JSPYPbZFtuh0ZixPLoUu8
X-Google-Smtp-Source: AGHT+IGDXY98YI8r+1jjLP7nQwpIN275gjwmo3b2+OF+ydA9SeUJSE0zYNuwZMoDlkotskyPZCydsg==
X-Received: by 2002:a05:600c:4fc8:b0:40f:c5cc:e756 with SMTP id o8-20020a05600c4fc800b0040fc5cce756mr4214569wmq.32.1707133288526;
        Mon, 05 Feb 2024 03:41:28 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c1d9500b0040faf410320sm8388657wms.20.2024.02.05.03.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 03:41:27 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] systemd: pack pre-defined pcrlock files installed with tpm2
Date: Mon,  5 Feb 2024 11:41:23 +0000
Message-ID: <20240205114123.2974862-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 11:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194927

The new pcrlock tool systemd-pcrlock [1] is installed when
the tpm2 and openssl package config is enabled and with them
some pre-defined pcrlock files is installed on the target.

[1] https://github.com/systemd/systemd/pull/28891

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index 9e09c89355..a907d60e84 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -685,6 +685,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/sysctl.d \
                 ${exec_prefix}/lib/sysusers.d \
                 ${exec_prefix}/lib/environment.d \
+                ${exec_prefix}/lib/pcrlock.d \
                 ${localstatedir} \
                 ${rootlibexecdir}/modprobe.d/systemd.conf \
                 ${rootlibexecdir}/modprobe.d/README \
-- 
2.43.0


