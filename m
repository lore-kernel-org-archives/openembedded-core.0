Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436D4CFA446
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 22:36:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143.1763678187221526616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 14:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUPU3pYs;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso8757675e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 14:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763678185; x=1764282985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7WeYGLm2mdxkwTj1zfYs8dvIxFaIQzIZmIaEFBDIHE=;
        b=ZUPU3pYsuwDN0N/kpjR1YIJDtIHkXwsIYMLQJOoQ9Hbxh0oAz5TDe2nr4vxkd3Xy0W
         Ki67XB411AuuJIygT2FpIDRWZA7x9jD32r0lLYjpb3zSpZKyLEI4PkpqcRcM69vub9Yd
         X9iULBTyzO3bnMZWDAMyzWieJzNxruNRz1sa2aW7/plvtZam5G94mlRo/+IhvdEZOQpG
         B/62uyK33y8bf0qdNHT/MjE1x1AbPliv0yHXKOiVOqLWFQAemWSuAGlpYApXr1EPYJLq
         UtOHUiXcPNtuDkAeD3LpnViuxvG+jMfvImRjEcFdpq8Y5rUci9/Y+tOrdzETC5CEPDTB
         xS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763678185; x=1764282985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l7WeYGLm2mdxkwTj1zfYs8dvIxFaIQzIZmIaEFBDIHE=;
        b=X+RUaEzgeHjwz/CtkF1N1+y54dHSDQOMy4JKyFwad53iK/GivtSEL9HvJRSu0ylg3v
         PYWoNbbu2wGZL9RuISv9v5csKCT7XEUdqlx20BJiMjq0YFF287r7OwDwvHNBrRFQuoMT
         UY1NWwLK/C80OcnsJvtLW1wXmshkduX93YEfQtbIMQq53pe7ek0bn+wY0Twphy75b42P
         MAT4qqJzt/z5voPeQTVIsN4nowZmDjmIFIEUXwwzz5jFYMIIGbsJ9zc8M1N2EVxQAsMs
         xzw7pntEX70oQs08iQ18yEp23sWwp2sXbRQeZYH3r6YZghWIiUt4Lj4Qqlta3y1jQRV+
         s8vA==
X-Gm-Message-State: AOJu0YxJmwBElV6YONwuYtJjovMzJF+ODqBnFX0s2FRgBmKLPSruuWej
	RofHE/u2dnzhTkg7QK3WkCuMAq8/pQs2bx63SQCpWwt/hkTrs1zLsyNWPbAXND5b
X-Gm-Gg: ASbGncudlJ8ZK2sBLGj0k4hSNE1pcOXPu+Tk48pC7XDc2kKB5f+yitDJDSY7cdFAtLq
	2elVt0E1oAq+LVW6qewZNnzvf0fhRYuKi+TRCVZWrZmjaSwHbzCfEGDaC/O9Pnjux2j4BOpf6Wa
	hz10NjTI4sA7q4U8cI3+j/x7u0Fe1p7yN74PonCAlPXvrJXaFsMaV1zJQW5nfdJQ6+3EHAqVmQO
	KVN+ZF2TlQE1JjAIxbwE2QP9ikeaygx3t1wEQnPTmAyYGgBrcx/gwB+aI7pMfo+Vy5Jk2EMTVAt
	A933Un5vpFTFPiRk7jtRxBsTPZcO2b8Xocs7SklKxYTIM1qSk2QeNGvrpUAR8bNsuVUg0cl4RQd
	rz0jEGgBWuekgtN1pEHJh7zTSvFL+BgbwmYkiCwWgyToYRZ/LBgmtZ0K6QVQOmqa0SDjyfqaTgx
	Qn0pn8cMr+
X-Google-Smtp-Source: AGHT+IG2hxMLjTu7wxLCh/QGG4+InZwEhTtrPyo1ZixxvTXuWIzhneKvhvA3aOfTfZiChDY8nxeO4Q==
X-Received: by 2002:a05:600c:3551:b0:477:a977:b8a7 with SMTP id 5b1f17b1804b1-477c01a7cabmr2744225e9.19.1763678185497;
        Thu, 20 Nov 2025 14:36:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363e4sm7611553f8f.12.2025.11.20.14.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:36:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] rust-common.bbclass: filter out incorrect compiler flags in wrapper
Date: Thu, 20 Nov 2025 23:36:23 +0100
Message-ID: <20251120223623.282605-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251120223623.282605-1-skandigraun@gmail.com>
References: <20251120223623.282605-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 22:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226640

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
- then determine if it compiles for host or for target
- Depending on the above, it considers the TARGET_*FLAGS or HOST_*FLAGS
  correct, and the C*FLAGS variable content incorrect.
- It subtracts the correct set from the incorrect set, and drops the
  remainder from the compiler flags. (Which might be often an empty list, so
  the flags are frequently unchanged)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: add empty string fallback value to os.getenv calls, shift code inside if block

 meta/classes-recipe/rust-common.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 31331c7a26..dedd1cd557 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -148,6 +148,27 @@ create_wrapper_rust () {
 
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
+	if script_type != "other":
+	    host_or_target = "HOST" if "build-rust-" in sys.argv[0] else "TARGET"
+	    incorrect_flags = os.getenv("%sFLAGS" % script_type, "").split()
+	    correct_flags = os.getenv("%s_%sFLAGS" % (host_or_target, script_type), "").split()
+	    flags_to_remove = set(incorrect_flags) - set(correct_flags)
+	    args = list(filter(lambda flag: flag not in flags_to_remove, args))
+
 	if extras:
 	    args.append(extras)
 	os.execvp(binary, args)

