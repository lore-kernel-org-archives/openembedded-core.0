Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F477D37E3A
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:41:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10275.1768398064812282383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJCuTiWx;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so64870415e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768398063; x=1769002863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0Yvi1mxMICGtOH3+1bxDyHQPIPg4MENoh6WZqjEBRk=;
        b=SJCuTiWxj9gC/C92YWJD/IDkIVFcv9VsQfYKraRRUgTMMMpAUOS2jCbGGCsrkrE1Te
         9OU9Ujj5v4fjLaibNHDfpp3DPVZCp+YXqG/XOU0XQBwnOvzGdWeTjbBIXDi3ytx1bYbB
         RsZ1sSptwpQIM4cWJle7HD/cAAiK5skU2XgA1vDT2KQmxyZrXAB6I+be2mI0iW3Xk6EK
         u5U55UNhZUBgn06yFu29PR6/MtDMS2hHtgkw+HbUkuSJSyIiV+5dr6Bf94TMBCnOmjtU
         cqzY/C3DWNO/9fU7rwUXBUb4DuPRuiZZIc5GmoDI3UhBhiAOTnGS3IJzGnv7ilCEiP4V
         o2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398063; x=1769002863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R0Yvi1mxMICGtOH3+1bxDyHQPIPg4MENoh6WZqjEBRk=;
        b=gfDDQUZDMfPUO0detUVhAJcwWwHMy7pVTJh0jxENevfahb1hia9RAji74g75wZiVYg
         6JyvSzQZcGqmMWFlWBIeh2No+yUwE3ltpD5aY4tTxWktzkCi9Yg7UrV5VCqfIG1QGkR0
         9fAO62+yYrmiTPCBKeIm7Gd8I5gKNGEN+EC4ot4RDXuVM8ErSA4zcc+NZap4dmtV6zSF
         sBQ383S6VcaKapN/fs1D8Uc9IkoRn6oLfOOVsT0F0aHAYP/P8q4dSyncC3ozIK+f0nlH
         Rag7CyQcGAixU8PfQZ/Tuhdw75kTR1X2MdIz/c5hpN24k51KDyUAN1h7eZgljdjMf43l
         f9ZA==
X-Gm-Message-State: AOJu0Yw6m7Uy+PYeMT2s6wjB7O60f+mX19Ty6aoryT9ykTXp8bv5HhgP
	oblN17GH/jJghZqKDjsUj190J1xZyyvVVRUKsKpEjDHogyM+38hrKWgQT9p15PVYr1g=
X-Gm-Gg: AY/fxX40JWzoFWmq4wiDOM5IYJhlUSdHQUAvso9BS6FZ+mvkzM+s4tmXlhO1wB/wv3f
	fT7+q80CinlyN15JDYglO2DQeybR94ZXleSmvRMMbDzeAUVpS1Dj6nAvZEmxda3gCfAdCioWBXT
	rDmh+OHWmihrrIaRKPQWXNxLYgWtbh+bjGfIQ8Yga6b26SbOzxaB7hq2SIwXpGt7p1XSoT/2Ao3
	okl+qgZfFlAs+WwoXgdCByaVrBjISOPGuFu+iPBstEknLccaK0L+DBrAJQml1ZJ10zyIRgCCcre
	eIWVryv+vomKa4ljPZ6nNCdR9StQmSY8Y2LqqsfQnUWIPSY9bKFbDomQxVYQF6QXChUsKBFXTxy
	VbdxVwWkU97/UXW3k64yEVU55HK11rg1RQLoSrBJ+rwUK6+bYVpCpOZh5gmvbxhVSsFaZLlTRDB
	R1pqlBhlez6wIST/NuhKkI4Vsp+qh+KbWCZZTls3kumzECxQZiMW+jGPL7yw==
X-Received: by 2002:a05:600c:8506:b0:477:1bb6:17de with SMTP id 5b1f17b1804b1-47ee33a646emr30437485e9.30.1768398063162;
        Wed, 14 Jan 2026 05:41:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm28101855e9.6.2026.01.14.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:41:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] rust-target-config.bbclass: apply signature exclusions only to native/nativesdk
Date: Wed, 14 Jan 2026 14:40:59 +0100
Message-ID: <20260114134059.3114851-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114134059.3114851-1-alex.kanavin@gmail.com>
References: <20260114134059.3114851-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229333

From: Alexander Kanavin <alex@linutronix.de>

Applying these exclusions to target builds and expecting that rebuilds
happen when they should relies on incidental
mechanisms like paths or other variables using the excluded ones.

Rather than think of possible scenarions where it works, and where
it doesn't, let's not exclude the variables from target builds, so
task signature calculation can be relied on.

[YOCTO #16132]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/rust-target-config.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 8e737c1451..a0a590bf62 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -432,8 +432,10 @@ def rust_gen_target(d, thing, wd, arch):
     with open(wd + rustsys + '.json', 'w') as f:
         json.dump(tspec, f, indent=4)
 
-# These are accounted for in tmpdir path names so don't need to be in the task sig
-rust_gen_target[vardepsexclude] += "ABIEXTENSION llvm_cpu TUNE_RISCV_ABI"
+RUSTCONFIG_EXCLUDEVARS = ""
+RUSTCONFIG_EXCLUDEVARS:class-native = "ABIEXTENSION llvm_cpu TUNE_RISCV_ABI"
+RUSTCONFIG_EXCLUDEVARS:class-nativesdk = "ABIEXTENSION llvm_cpu TUNE_RISCV_ABI"
+rust_gen_target[vardepsexclude] += "${RUSTCONFIG_EXCLUDEVARS}"
 
 do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
 
-- 
2.47.3


