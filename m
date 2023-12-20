Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCA5C4706C
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:23 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.13010.1703038700750815262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t7hjDnRt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d855efb920so4140802a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038699; x=1703643499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OshZ1sNUuabAQCh9MrIaJrimvpyStRpUWGGi+sZt3A=;
        b=t7hjDnRtx1kCysfnjXJVi7eWbqgnTuwgRQ1ZJzzJyQ67E7WgUSsJwB2mmd2c59SazT
         0EfK6YFLzLz9mWKSZQkQPgNVkGk5nmfdm6BMeh7MRjCrosWQF348S0XKNzjqZ7k5ay+K
         0E7+cJAkig0M0IRrJm9t5Z/t/nNzdLr57dZXmVfMtgkKn8oO35eUst+7ecIzO6yO+5p9
         3iiYTvJ2TJXsGLx9IPDLD4DMrWyOs/jj/0XwqHaAWHFZ8mgHlP6dNrVA8lflLt8ln24F
         kBNLlY6KwYcbqxKbvRItQAkrPTSRRit+yHGwOvqMxLjTQ03UiEVlTucds9v0tjxrn/JP
         dBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038699; x=1703643499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OshZ1sNUuabAQCh9MrIaJrimvpyStRpUWGGi+sZt3A=;
        b=Hm4DmhoVHWk9AdXz85U8LSGNXp8/RP/CqT83NtGoCiktbZOsOsmPJVm6P2GQ5p8z/o
         59UlL0WVLQU6OFr1u0zdoBIgDSuIlJ41NHNDENPWckpnHpuspbtmaFVB3QBABUF1IngQ
         R3UYNIQZT5TkEoLpiH03Lj+Wm2VeG94Hcgq6yfLfkCB0TT1KmT5ipptCTTanItgTgVRf
         eJaCbMtWUiyBxJKPj4oLKZLh1Vxk2Cp56XswlVRfcsEwwMqDY3M8obwq6V7MEjcvNaAb
         ByFavEqxuWMklZmpPWrOBEMdF/Md1+uXPr4ZjEDYFlZhOXTtCaDa64OkEj4VlRn905Gk
         8JcQ==
X-Gm-Message-State: AOJu0YypVqjo6CBKAnD1DIduazTvsbyWi37EuUSy33Dz5ZBbv5f7glc2
	qDKllvnPBY8d0ZKdSFITJ6H+Huwr3jY8gwbB6BAkKA==
X-Google-Smtp-Source: AGHT+IGcMrQY/xWt63J8bqJvs51YxX7iapVd4ec9X+VyUV3C2a4zxWf8siPGqoGDN/xQVQ8q/4Nh6A==
X-Received: by 2002:a05:6830:1b70:b0:6db:a849:c69a with SMTP id d16-20020a0568301b7000b006dba849c69amr1102015ote.68.1703038699357;
        Tue, 19 Dec 2023 18:18:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 7/9] glibc: stable 2.38 branch updates
Date: Tue, 19 Dec 2023 16:17:57 -1000
Message-Id: <88e95c24c4b7b440e4ab4653fb93bddcb7524a58.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703038443.git.steve@sakoman.com>
References: <cover.1703038443.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192766

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on glibc-2.38 stable branch are updated.
44f757a636 LoongArch: Delete excessively allocated memory.
bf5aa419cb elf: Fix wrong break removal from 8ee878592c
63dbbc5c52 sysdeps: sem_open: Clear O_CREAT when semaphore file is expected to exist [BZ #30789]
1e04dcec49 Revert "elf: Move l_init_called_next to old place of l_text_end in link map"
719866ab2f Revert "elf: Always call destructors in reverse constructor order (bug 30785)"
e0b6c9706c Revert "elf: Remove unused l_text_end field from struct link_map"

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 19b98bc11a..0ef4289557 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "750a45a783906a19591fb8ff6b7841470f1f5701"
+SRCREV_glibc ?= "44f757a6364a546359809d48c76b3debd26e77d4"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


