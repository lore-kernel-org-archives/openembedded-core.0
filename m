Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A45C48260
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:35:22 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.15939.1706276118468776313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e6gGXsoA;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a313b51cf1fso67582166b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706276117; x=1706880917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iwbia9tJ7gF6dPRuwd0xtP47Mb68Rn8wemX+X8Unjwo=;
        b=e6gGXsoAEfPyfdXDM38843N3TieIfPBwdCccwaHqqxWNu57csH00qZip6EHMOfZjXH
         Q+2184bbV4ZfrGYoaW0wCQiOE/vToYvJPTCd95i4M2bCO/XkdZ3+dqiVg7Rs7e99kzB0
         WCy8pvJnD3/nCtbX0ITWBouK8xXQ/4pKIE5qnsZG2pxRFUCTiwym47+BH7kOkHp60R1B
         p0o0iQjAFEbL3xOVQwvcdvD98PxIi+imYj75HG5nNXVATCV+7kCcohtbhU+14vsiYggi
         USNHtWGVp1pN/Nlwqwdi6Z8vRHWzug3IBVA2A8iL/KHdw5Q94SbZ7dRsiHqyxNI1+rv0
         jY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276117; x=1706880917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwbia9tJ7gF6dPRuwd0xtP47Mb68Rn8wemX+X8Unjwo=;
        b=iucIlo/Lm6J14yFzp8vdlDt2qC1MM/vJbATVBtDOM0O7BIuG1S0BEgCPXuh3jNN3Ba
         dvUMCHgTcS6gEJQ4NOOujaoVZMCy0F5JKhr0hYJ4iJ/G+duqddfNqzKrigSSYNk2TiPv
         5OZSeNSfbESzJ+HTRMkJSh0MfhQKgGD+kjGPFcinqRRipTsXb81Vo6/SjQZUlQuVF8+h
         hW0Hv1PVP/9z1n9qIBFjH58bC32LAWFAg2gIzb+MDdZfgtehqkJZYUbedvWn4t98BNO6
         swtLLVIZvh82YUP+7MOfKNovuxh0nZjC+B/Ap6psry+19K4fBPILviHsQBsX6p22KNHR
         2wEg==
X-Gm-Message-State: AOJu0YzVHbk8YMwRGCk5ZqP3Cn53v0XfgP2EcRJfoThgiGFG4FELks1Q
	fIuI4YFSGDpOOkYJ9cbTYYneo/q90C5BVbhREVnCe6tbw+N0jHm8UiUdnS3N
X-Google-Smtp-Source: AGHT+IEneNmsfbtfgkWqqluIPXh1sEG6zSyLAKKskgJd8K50OPU02EUgsq/FZQXLWwQogt70rrljwg==
X-Received: by 2002:a17:906:f906:b0:a31:1684:f19c with SMTP id lc6-20020a170906f90600b00a311684f19cmr1302240ejb.14.1706276116833;
        Fri, 26 Jan 2024 05:35:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vg14-20020a170907d30e00b00a30f3e8838bsm631554ejc.127.2024.01.26.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 05:35:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/8] classes/multilib: expand PACKAGE_WRITE_DEPS in addition to DEPENDS
Date: Fri, 26 Jan 2024 14:34:49 +0100
Message-Id: <20240126133455.2609378-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126133455.2609378-1-alex@linutronix.de>
References: <20240126133455.2609378-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194362

Otherwise, PACKAGE_WRITE_DEPS would contain non-multilib variants
of dependencies even when building multilib items, resulting in
sysroots being populated with entirely wrong versions of them.

This hasn't been noticed until now through sheer (bad) luck, I think,
except in the cpio recipe, but the previous commit shows that the issues
did occur, quietly. Every other recipe in oe-core and meta-oe does not
prepend the multilib prefix.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/multilib.bbclass           | 1 +
 meta/recipes-extended/cpio/cpio_2.14.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index d80a34cf27f..b6c09969b19 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -140,6 +140,7 @@ python multilib_virtclass_handler_postkeyexp () {
         return
 
     clsextend.map_depends_variable("DEPENDS")
+    clsextend.map_depends_variable("PACKAGE_WRITE_DEPS")
     clsextend.map_variable("PROVIDES")
 
     if bb.data.inherits_class('cross-canadian', d):
diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.14.bb
index 560038d2a67..397bb5d87c1 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -65,7 +65,7 @@ do_install_ptest_base:append() {
 
 # The tests need to run as a non-root user, so pull in the ptest user
 DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
-PACKAGE_WRITE_DEPS:append:class-target = " ${MLPREFIX}ptest-runner"
+PACKAGE_WRITE_DEPS += "ptest-runner"
 
 RDEPENDS:${PN}-ptest += "ptest-runner"
 
-- 
2.39.2


