Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD92C48286
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:35:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.15958.1706276120132524407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CNtQrs+d;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40eac352733so8536555e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706276118; x=1706880918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3BzsYzBR3ZrD2uEMR6gEExFc2y8N0moLAmQN2WQG2Q=;
        b=CNtQrs+ddF6fAg1KpgXBgCAhl9YheaAA07tKykNpU/pry5UNvghLHUFEo8siQ2T7A6
         8jb0XKfYw1EUYCVMP9sCNVwxt1WgqxjTPnbYbCRfOkSz6ZCJDOMZFj2Nx4Ntc8gE5MVb
         Rb2mT2DoLuuqrgQYEK5iQKfr0i1BJ1kcL5yBNNkS8/1eReOzEqR9loWpAfAPwVm2Bw5g
         eaoo/IVNBytlrP7ZSyM8EDl9Mcmk/KiqgDumURxp2KFlLMjEVC14hDgnSqlio+rZXgkI
         lkfvnVaowO5ee9pw55qBPxbo8LOORPxCgbBfkyjqgayhAJkWq1WI/p2xvsJT1Uomhbkn
         NCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276118; x=1706880918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3BzsYzBR3ZrD2uEMR6gEExFc2y8N0moLAmQN2WQG2Q=;
        b=eZqYSM2bEb+vbRGvjCvrDttFkU1+7lt4eieGKnC1p1pz9HdjTAV1RjvCm0xhNI2Ir/
         wF1SpeobfDeBrAsfuQfzd6d9+0ZXbtGCnhXI10FbOcqH79ANK0n8h38KfD88Hc24dQmn
         q8OTqvrptlJcx8wNjhPU4WLlSEMS0KVRb8B62P/CfyUqub85aTqM0Zcs4E193aAdzHBl
         VBoF7ei4ZxTTvOFxo2NYRFp4a1qZ3BWAcYMk+Qz2xQrwClV64U607NOVde4PtKjA9vxv
         qNYbs9Wmjvq8hKWf7oVEk+eHWl3CkScgQHCDh287dBmZaesKOV5Mj6gQ0XCmaaDNbzb9
         1/jQ==
X-Gm-Message-State: AOJu0YyDqitwyVG1BzpQBP10tPzaLraV3BrwzIDsSNwV3Ay/dnCmWX4K
	dgETMOYNHqvRBo/x5r8fZDEJBp+nKkkDsHr1XISSELQBhPfp5O6YScDidrkt
X-Google-Smtp-Source: AGHT+IEFCshf97xcwjND6F9qG87g5VdM8HXsjMAynlErvcQOEFzMsTDtig+VrMAbrBWbJOVi1BnF9w==
X-Received: by 2002:a05:600c:3556:b0:40e:38c4:e7a0 with SMTP id i22-20020a05600c355600b0040e38c4e7a0mr936387wmq.30.1706276118443;
        Fri, 26 Jan 2024 05:35:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vg14-20020a170907d30e00b00a30f3e8838bsm631554ejc.127.2024.01.26.05.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 05:35:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/8] classes/package_rpm: use weak user/group dependencies
Date: Fri, 26 Jan 2024 14:34:52 +0100
Message-Id: <20240126133455.2609378-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126133455.2609378-1-alex@linutronix.de>
References: <20240126133455.2609378-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194365

rpm 4.19 automatically generates provides and depends for user and
groups:
https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/users_and_groups.md#dependencies

This mechanism relies on sysusers.d for the 'provides'
part, and thus is systemd-only at best. So we need to disable it for now,
otherwise image generation fails with unresolved dependencies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index a641dbdb299..3ca6c5aa7b3 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -721,6 +721,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
+    cmd = cmd + " --define '_use_weak_usergroup_deps 1'"
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_RPMOUTDIR') + "'"
-- 
2.39.2


