Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5999EC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:25 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.15105.1634673324147381235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qm73cBHo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 136so594293pgc.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mrNROJD7Gp9UT54pVlwVX16w8t4UIUYwnK6e4mdn6gY=;
        b=qm73cBHoGS6Z5IJLnoYwmuBYT5IlMz5l3lZYmDYeizf4njxq2GWyIgEa75qhrHvuKU
         nDo2pYzcwMHuor6ZaBSAOwUHDcTfyftezHNV7rRiGiee/FeC+P3rYnXQjxjuvqzxE0/z
         uimUUFt+GqcANIMz6AZLWXXVudvnKLyE9R1SzVXOKcgdNwuq2qGUL60xSX7f8XO+t+Dq
         DWSMBIrdbPapHWVtMexSylAQPhU4np0RAwP59nD7Rzcj53PexhbEFbaKWMI45lV8krjt
         VwJo2ZtIbRwlFTW+Jp8T5FGn9Dj8jyuOrWA5dudQIt4pZM5rwRk1kbJuMuZbU8HP4LOS
         weiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrNROJD7Gp9UT54pVlwVX16w8t4UIUYwnK6e4mdn6gY=;
        b=0DItsmpm+KntA/YFBV85n+Z/7aS941F+vOqh6pNC6KpxRAjF6BENfO9rII8ug8INa3
         QcfWPAArb0DzZtMmyeUOmXhcmcKsjKYB8xAD1VfnZpPfXqhk457LS6C1hnibTzgILAkC
         TaI1TTDjqFwSK01bnQq3wc6XFI3KGPrzb07A9OsL7EI47C3UqZKS8uJCKGAMO4LiBAm1
         FjzaoNsS1H7HyRgho872srPWcErj/727RLaBb1G3HboxvVHR09Kz77PrgAQbUsZoyHlJ
         Z5/VI7horWr9HFGa+70sE6pU/T1oWUDznbSlhTOq58qVF07gac6BInv1H1tD5Vp2rJM6
         Dg7g==
X-Gm-Message-State: AOAM532GWjNXUeH3zf0MPbdW2ZfH4Qz24NbGcFzYq2qnFzHm+3EvSgCR
	F6gTMCW6S5F5JamYxNYkFZDaeuVm9hbixg22Xpg=
X-Google-Smtp-Source: 
 ABdhPJwc4k7ekHkw5hTBvTAqbCLDmEI4V7sn4ylD/5sT6hVIn6okCgGHTGTuOk4Warz/LFc7ox/g8w==
X-Received: by 2002:a62:1c52:0:b0:44c:f1c3:9cb5 with SMTP id
 c79-20020a621c52000000b0044cf1c39cb5mr1955389pfc.14.1634673323190;
        Tue, 19 Oct 2021 12:55:23 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/38] gobject-introspection: Don't write $HOME
 into scripts
Date: Tue, 19 Oct 2021 09:53:43 -1000
Message-Id: 
 <419205da83190fee53861251a03f01736a500e16.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157237

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Writing an expanded version of $HOME into the wrapper script breaks
reproducibility. We don't need this here so don't.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5df092524e93cd7d0eaa633ec8a5689d4c0d018d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gobject-introspection/gobject-introspection_1.62.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
index 92b0d1d52f..0842f10ea9 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
@@ -102,7 +102,7 @@ EOF
         # from the target sysroot.
         cat > ${B}/g-ir-scanner-wrapper << EOF
 #!/bin/sh
-# This prevents g-ir-scanner from writing cache data to $HOME
+# This prevents g-ir-scanner from writing cache data to user's HOME dir
 export GI_SCANNER_DISABLE_CACHE=1
 
 g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 --add-include-path=${STAGING_LIBDIR}/gir-1.0 "\$@"
-- 
2.25.1


