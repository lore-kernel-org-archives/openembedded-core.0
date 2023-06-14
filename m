Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4056EEB64DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7359.1686734984409511119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZNxjUDVZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-977cf86aae5so70832766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734983; x=1689326983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj/sawFAHPTt6SRAigiklB0WkUWCKDY69O/ue7VjopM=;
        b=ZNxjUDVZgNMZ0w9OZu+QoZzVja5MZyYjEyp3YR3ht3Tzd5Say1CAtWQPZ51HzTLN4Q
         SfFWasD3XOGZPtgT5vvDKIZ1AyvmN2ejwNfvVjzpM73IuWCJ6C9jP3VYVkvPhjHN7yC8
         XvrlpWjcmB4r59P8qLQLRDlN6UVU2rrkgPkdN1b/8JiDIPU3m4NYCzwjqoKl7UW6K/s9
         8DrpUX5SFHXtH7QvryWjKASe32uUZKeDl4zlN652UnLdFyia/VbWI041QM4HJHJWrmds
         hxjOgB2TCMLqCCbVi8qQ195ClTjBMIN2olPZMxrnYLVcrTtDqoMBQD2sjtOkiNKajGGD
         jdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734983; x=1689326983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj/sawFAHPTt6SRAigiklB0WkUWCKDY69O/ue7VjopM=;
        b=an217X6uRA4cxasPXNi+IrEVrrD3s/FyP/uyd0Av9JRQ3A1r4+HVojjBCx/OnHDg5s
         xAyea1jpAx/bOmgQeONwI4/onmBLQPZKlvYSBfi+T2l7GCGKmvfsLgnody0llTMenB+A
         olNZVGTUUdrzJZusCNPBb+E5cw8CZlPVj6Vm04NpLIRXCf20JXL4JXfq4s6295xg+/Ga
         rv+mxXHN4BswFin/D9W9Ma2Srrv1nSTdgiSMlUdX2r1hwVlAsiTeHdHG9v2ZWBojgEJu
         Uzg0fJsp6gNF80Ouz3KtYP4uBfEYIOfoAGpbxgrD+Ok8N1XMZ7G0jv7VgH7rar4W5K6o
         m5LQ==
X-Gm-Message-State: AC+VfDxAOIQ0CSTpl6BLz0ete0tHP0CV5W9PFB245vUfOGp9bWSbXFd+
	1SKuEy09/aK4piMfT7zaufQGt1BSMPE=
X-Google-Smtp-Source: ACHHUZ7WlSL8cd/yml4j0ZWjTo4cGvO958ZyClb4jZMWDNTuDTIZKFtKVc6sEGpPC6LMSuxHV/vQwA==
X-Received: by 2002:a17:906:da83:b0:974:1ced:6a59 with SMTP id xh3-20020a170906da8300b009741ced6a59mr13755087ejb.3.1686734982782;
        Wed, 14 Jun 2023 02:29:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/55] linux-firmware: upgrade 20230404 -> 20230515
Date: Wed, 14 Jun 2023 11:28:51 +0200
Message-Id: <20230614092918.4065570-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182773

License-Update: additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{linux-firmware_20230404.bb => linux-firmware_20230515.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230404.bb => linux-firmware_20230515.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
index 7412c022ba9..34701312942 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "0782deea054d4b1b7f10c92c3a245da4"
+WHENCE_CHKSUM  = "a0997fc7a9af4e46d96529d6ef13b58a"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c3f9ad2bb5311cce2490f37a8052f836703d6936aabd840246b6576f1f71f607"
+SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
 
 inherit allarch
 
-- 
2.30.2


