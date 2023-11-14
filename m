Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0E6C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 15:29:12 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.15356.1699975750809573667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 07:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmiZv3jV;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ccbb7f79cdso43442485ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 07:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699975750; x=1700580550; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pgdqideiTUE1ZMUpb05iX5VrqI3ySxAptxiuijoaUPw=;
        b=GmiZv3jVXoI7Vg7FYvtZ4MvRctVSRzyKeHVTIK5WISAT0YZ6Dt+/iNI0fpyEt6MOeO
         0JdjQmPXpcS47h1hkErHEX/j4op5cfVG31cppDp833lHkudRyT+blxmIAWPBLFkulhOL
         ou9pX4WllVSaRZ1PhylDjTeMXHDbpOCpmOeUCOHYmWSoQMlElU5kdtrVqQEbD0BXflq7
         bebuuxujbMOSsx1H0JyJo6i58FTizsu2OwEtfHcUnMruyRpqSqYF18iTZmgWhaPpaU3z
         gopua8zxRSaYzuesDczPlFkwVmljCUGlm0OPYlc6z/XSDrTBmvVdg/dCn3bAiqO6F2Kn
         3Sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699975750; x=1700580550;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgdqideiTUE1ZMUpb05iX5VrqI3ySxAptxiuijoaUPw=;
        b=vkoVd9pIflmHkb4xOYpyH+r0uFp62MicHsV/VYP2JrC3wfuX6RXE5URF25i/OtIFGr
         xJYL1d2sBVlQf7sufTSGc/P1v33Eq97fMSrYgp+kwGrmw2YvkhL26IVcw7fIMYH5D3sF
         cbfg1Th79bdoUoa5g/DqLZsVdmcYsS8R001UT+kdFqRMRBPwgYFfLfNidXxrFr1I3xf7
         gUzEEma3/BJyF3HxeAs+1JDLMiGjOm4QmX1EfXp6x8MHS/2IjWNJoOeQ3DzZhLztI5xF
         337J3Kl59KylfZkmUnRrpgxwIsMPxwp3UW2n1h58fBZsfWE3Zb1Qa+qhNiHRYvGYm45g
         U0AA==
X-Gm-Message-State: AOJu0Yzn+LxtHaTarUMeHAPKXWl9Sg2RnfAqJMXANxYQEST1QFNbeqVY
	eRLYWmeJG8/PiSssMyGAo04IzyzXqB87Cw==
X-Google-Smtp-Source: AGHT+IEzX6AnJmmriZq0dsKGGtcYPv9CcAzo+qe/v9VB3YvXwg1TSLGbqpUgzRnoZvN6cxZ9skIoIA==
X-Received: by 2002:a17:903:2589:b0:1cc:636f:f376 with SMTP id jb9-20020a170903258900b001cc636ff376mr2250809plb.44.1699975749653;
        Tue, 14 Nov 2023 07:29:09 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id f18-20020a170902ce9200b001cc3a8af18dsm5775056plg.60.2023.11.14.07.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:29:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 07:29:01 -0800
Subject: [PATCH] rust: Avoid removing origin from llvm-config binary with
 chrpath
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-rust-with-clang-v1-1-d05ed1f7387c@gmail.com>
X-B4-Tracking: v=1; b=H4sIADySU2UC/x2MWwqAIBAAryL73UJrEdFVog/RrRbCQu0B4d2TP
 odh5oXIQTjCoF4IfEmU3RegSoFdjV8YxRUGXeuGiFoMZ0x4S1rRbsWjJmO5d27WfQelOgLP8vz
 Hccr5AxpK/6phAAAA
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.12.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 15:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190511

If these directories are removed from binary, it does not find the
needed libraries it may need from recipe-sysroot-native, e.g. when
building with clang+llvm-runtime, it also builds rust-native with
clang-native and links to libc++.so.1 which will be part of
native sysroot but may not be available on build host system install
and it loses that ability to find it in native sysroot and we see errors
like
llvm-config: libc++.so.1 not found.

during rust bootstrap execution.

This patch stops editing the binary, so it can find the dependencies in
native sysroot it
needs for running itself when placed in target directory ( target sysroot )
yet when llvm-config is invoked the reported paths are relative to
taregt sysroot which is what we expect, so functionality remains as it is.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
When using libc++ instead of libstdc++, llvm-config is unable to find
libc++.so.1 from native sysroot due to llvm-config copying dance we do.
---
 meta/recipes-devtools/rust/rust_1.70.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-devtools/rust/rust_1.70.0.bb
index 16d433910f8..98cc56c0c91 100644
--- a/meta/recipes-devtools/rust/rust_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
@@ -205,7 +205,6 @@ rust_runx () {
     if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
         cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
-        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
     fi
 
     oe_cargo_fix_env

---
base-commit: abf3e54d118139e1fcd952a691b77a0c53db6a30
change-id: 20231114-rust-with-clang-21ace8ddf286

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


