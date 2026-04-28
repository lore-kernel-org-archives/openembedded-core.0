Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C0BFF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 08:59:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8115.1777363918412374435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 01:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KKysZllf;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so94723075e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777363916; x=1777968716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knv8OHkTYFq3in7JMjaEX9aHm+yJPBR7EOCvHu+XnTo=;
        b=KKysZllfNs+bfl+2Eu8Qkq3vcNQRfLCzxoWZ1Ltqi53KSDp0KAp/KVdxzOeb+mpEE1
         ee/4MkBBFsyPilSEVv0/Iy88L/YZtipR/OMc8GA+zGf69rtLINfNTyJ3MPIZ0S0odGtX
         Wvz1TGROhqHsV79wJCmvQ5ZFe/18W6T2Hm16lmEhElzHbZMCG5yfsGdq4HaD3EfIBjsA
         TuGNN7z7IdHPr8UyEX0dKtUzgptOxh8izKqZlxifhy0JCmVKCU4W52TrYaQL0bKUKvoX
         X9ajaktnJng7ThpKrQakJcHz+u+dDZ5mARgKF20IrCopWfHDTRK8G/E84aglfLzWUoW2
         YpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363916; x=1777968716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=knv8OHkTYFq3in7JMjaEX9aHm+yJPBR7EOCvHu+XnTo=;
        b=Ognbk3wczovuXAFsqT/VUxP4k6VKj7AXdka7aLF7S3GncBJn+UrXmQX/SV12DhrfGo
         wwwB/R1uFcHIkGq4v/aIBcyNGEsLTJaun808POXnnC5FZX8U4v2UfVg6zf8kaUeMAf0N
         vEzHwq9/UkcFRiNC4Y4Ow+j+rAf6NxofXMpY15a1UwU0l69oCwLO+PJ5Uh+7kHZtRsxG
         JFy/0CH3uHdGTL8Sr5tvtFAVBPv/8aRj6B6LT3SyPwKg7h4uK/kbHwp027UEDeZAaOOi
         yOnKkOVyhqsYosS/M/Tnk/MaoQb+m0ipTnIWRv8PA9hbrOOcts06aueQBYdxg5LmuCrB
         L0aw==
X-Gm-Message-State: AOJu0YzqmCaeB5nklkMW0bNrnBSzjZ9iZvNlrkTPmHg1WinkNJvoLjmk
	a9t/fpX23DH2U2Fuij6pvNj6WbSFscftEN8sfJ4ToaBhFhJZzwwCB0DwW6MKaW/asAI=
X-Gm-Gg: AeBDietRbvVEdyBYGJ6Ei/BG7Kp0tmMrwc55/tPZBl40lXzD6A3vMHhJJdqkvFtfBBd
	/ddVdt0vqZayHbLp7CI5MCT9aA6Cg7CJNIhUG3saKaPJqvCSnCepY0DAcZZfMuIR3QxBmv9+snt
	jpGy2kPWG1avO382UGOgwPLouGpd1YB3gL5URiEJXQfefmFqSJTs8mvBHkEmL9lM022y8t1amk3
	5sbdTgCd92tJ+86IOMFbmKVQzbciMubKhhpfr33nRrjgh5PshTfr1l8WHK5/MFLN/j2sMQhu9RB
	3S1eL7fmA7Uz7TfYCnFfpSkKry5uYgx7fF77D6S9ItmiPidT7Ju37h4t+S0SqapH37OUaPA3X72
	kfRO0p3q2O2rbnghCuDRlPS+34C+uho+g2zC2sx9P0y5mpIsUDntBqkh/XWE2hH4ljMhS20Tdng
	4LfHqE2WIPt9O6Dmx79c7aHi2IJEyBiV/3TUPOBr1foxfesOr3pQkHV4dRlHH2b7cpbydpKxZbS
	FuRYq8=
X-Received: by 2002:a05:600c:3b96:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48a77aefe5amr32050325e9.10.1777363916229;
        Tue, 28 Apr 2026 01:11:56 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([79.123.125.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm4588351f8f.20.2026.04.28.01.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:11:55 -0700 (PDT)
From: "Sam Kent" <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v2 1/3] package.py: fix kernel module file pre-filter and document strip asymmetry
Date: Tue, 28 Apr 2026 09:10:44 +0100
Message-Id: <20260428081046.1660101-2-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428081046.1660101-1-sam.john.kent@gmail.com>
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 08:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236047

Change the check to f.endswith(".ko"), consistent with strip_execs() and
with the /lib/modules/ guard already present in is_elf() and
splitdebuginfo().

Fixes [YOCTO #2348]

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 meta/lib/oe/package.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 279cd56..c375acc 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -37,7 +37,8 @@ def runstrip(file, elftype, strip, extra_strip_sections=''):
 
     stripcmd = [strip]
     skip_strip = False
-    # kernel module
+    # kernel module: use --strip-debug and --preserve-dates (required for
+    # module signing to remain valid after stripping)
     if elftype & 16:
         if is_kernel_module_signed(file):
             bb.debug(1, "Skip strip on signed module %s" % file)
@@ -1167,7 +1168,7 @@ def process_split_and_strip_files(d):
                         or (s[stat.ST_MODE] & stat.S_IXOTH) \
                         or ((file.startswith(libdir) or file.startswith(baselibdir)) \
                         and (".so" in f or ".node" in f)) \
-                        or (f.startswith('vmlinux') or ".ko" in f):
+                        or (f.startswith('vmlinux') or f.endswith(".ko")):
 
                     if cpath.islink(file):
                         checkelflinks[file] = ltarget
-- 
2.34.1


