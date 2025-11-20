Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90B6CF8851
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 12:19:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32977.1763641191558209553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 04:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OirvjhFD;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so458940f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 04:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763641190; x=1764245990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6qmmNQy8NfLeMnAi4uwfAeS5LWO1eAQuRkxGizIvFg=;
        b=OirvjhFD/ltWIWpsf5Io6G3mvlfGmCDzCnrY9lLczTBuEOlMZjpr5G3MbFnMQoxdg6
         4WqjKEbyQJwQx5+PV+qeZ73ZJD2/3hWUvy59VutoU+kuMTh6hWFJTqU/tHsRW2qLVRZk
         nHR/wE5xqI28arliZaH1yLm/u3WUmiwayX+TqOFqSk8SMCGfby6CsrijWzEFGjljYbAs
         EaEArF31DNcYmuRKcGEt6nRcWZo0InUwke+lTq/YFriDPUDAL9Ra7ua+acjRNLrIVjd/
         mt55XImMMLmtpTp550wzy1nd5NCJCo1vIYnfXyIe1pIJrK6mRJy/RCOWMhVPPCFQ55sW
         wfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641190; x=1764245990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6qmmNQy8NfLeMnAi4uwfAeS5LWO1eAQuRkxGizIvFg=;
        b=EXD1sHDEOA/UbSSMAROr8B9Ey5iDTRM4cWwmSuZicZT9gtH1PKibL/+LFQMlq3olUO
         dyF1NqqrsVQQv+PdoYslTpYpl2svPy1+UME6X/puKr8zpFNJmav2ptCm+N0yEaNHRNSr
         UEEJTjAHtudkLhs1wjTDVuBGlRxxT6uLAWtUwW9unxBrTMCBH4wZR7fQgYfnszMum10V
         ThFQWF5oZYVOPnZ9ekklEw9oHBoXxAmm4zBDeOw7TfvM57MC1QTVolAfNVDhxG/3+GM1
         nVbUM05iF2oxITHFJGPzpuXp7h+yptpfv/rMJFBtyt8eQRQdvoxcTNDs2H7zBvek3Fn8
         eajw==
X-Gm-Message-State: AOJu0YxsU/wnrWmoR2NnRpoLgLrAOGErfKhR6ywVMwvIJg9gO/npVm4f
	dwFY/0bhreYy84nxd6xvHZSuTto4Tlk8MlwR9Y5OLjTSAmm+mI9wO+WEuhERm6QS
X-Gm-Gg: ASbGnctZcSkBr14nVtAiH+QFmFEV0VISWVAIIk4U5my/bppQlTdbcRKInoYHPmBseF9
	LVidkNuLPMMYiyuVnSeiUmqccWzKgLJlxdgJ2iyeCpZeQJ0BpkiMCLcZ/of+Ufbd5TjH7HBm+By
	wd2MiHEgMUrFyfcIUqD+1vbMcAtqt6P/rK9N4DFgQj3S500pwF7SOHvuBqwecRJSakOJJQViYKw
	Fsagp1CNIrS0ajDMXyDB6f47/Ljm502h7AVdGFW1fyx0dncpNWdMB0hdBtIXMSZlwoDyTxuj0bI
	42vmyd6clzgQg1xVFZNkYQqWur4JDpD0ThVLTRxuhPCpb2uODpDvOC3zgoY5wDTS6nf06tw9FF4
	lM7m7f4+gVpQgKje5IoM0l9M6H0w3zqcKPhv6pJlWqXRG/7C1TpkqpmD7bfNJ6zD7qkp4PSSMzo
	0MnuUCM5xmn1S5Jm214AI=
X-Google-Smtp-Source: AGHT+IF/tBr05qpQtuXPG4RhVLk9l5U2rXfljwcLlxaQtk+f+FJcPYUhGSx2+vSrSWbB/R056enS6w==
X-Received: by 2002:a05:600c:3588:b0:477:a977:b8a7 with SMTP id 5b1f17b1804b1-477b8a8ef7dmr34022135e9.19.1763641189642;
        Thu, 20 Nov 2025 04:19:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffe377sm103812435e9.1.2025.11.20.04.19.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 04:19:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] rust-common.bbclass: filter out incorrect compiler flags in wrapper
Date: Thu, 20 Nov 2025 13:19:47 +0100
Message-ID: <20251120121947.3473848-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251120121947.3473848-1-skandigraun@gmail.com>
References: <20251120121947.3473848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 12:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226619

This patch is a workaround for https://bugzilla.yoctoproject.org/show_bug.cgi?id=15976

cc-rs crate is used by a number of projects, including rust's bootstrap also
to invoke the systems c/c++ compiler.

A few updates ago it has changed the way CFLAGS/CXXFLAGS are handled: it now
merges them with HOST_C*FLAGS and TARGET_C*FLAGS.

This is a problem when a recipe is cross compiled, but it has a build dependency
which uses this crate to be built. In this case the C*FLAGS variable contains
target flags, while the HOST_C*FLAGS contains host-specific flags, and when the
two are mixed, the output is not what one expects.

This change tries to filter out the incorrect flags:
- If the wrapper is invoked as a c or c++ compiler wrapper,
- then determines if it compiles for host or for target
- Depending on the on above, it considers the TARGET_*FLAGS or HOST*FLAGS
  correct, and the C*FLAGS variable content incorrect.
- It subtracts the correct set from the incorrect set, and drops the
  remainder from the compiler flags. (Which might be often an empty list, so
  the flags are frequently unchanged)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/classes-recipe/rust-common.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 31331c7a26..c61143a56c 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -148,6 +148,29 @@ create_wrapper_rust () {
 
 	binary = orig_binary.split()[0]
 	args = orig_binary.split() + sys.argv[1:]
+
+	# The following is trying to be a workaround for
+	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=15976
+	# cc-rs crate passes both host AND target flags at the same time
+	# to this script, in case a recipe is cross-compiled, but a crate
+	# is a build dependency, and is compiled for the host.
+	# This tries to filter out the inappropriate flags.
+	if sys.argv[0].endswith("-cc"):
+	    script_type = "C"
+	elif sys.argv[0].endswith("-cxx"):
+	    script_type = "CXX"
+	else:
+	    script_type = "other"
+
+	flags_to_remove = []
+	if script_type != "other":
+	    host_or_target = "HOST" if "build-rust-" in sys.argv[0] else "TARGET"
+	    incorrect_flags = os.getenv("%sFLAGS" % script_type).split()
+	    correct_flags = os.getenv("%s_%sFLAGS" % (host_or_target, script_type)).split()
+	    flags_to_remove = set(incorrect_flags) - set(correct_flags)
+
+	args = list(filter(lambda flag: flag not in flags_to_remove, args))
+
 	if extras:
 	    args.append(extras)
 	os.execvp(binary, args)

