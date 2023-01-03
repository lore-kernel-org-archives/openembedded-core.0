Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B951C54EBD
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 20:06:08 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.4141.1672776359160700802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 12:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VdHvEIu0;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso22612461pjc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ57ZgFunvDnZc6QFtz3mLotuKtntcKyWi8bOoyUyq8=;
        b=VdHvEIu0PKhN7GtE5rNC7uPZvDcYrQCEE9T1wkFrNn26d38dqu+tb3cYB5S4W8/DEk
         Y7vaVHe/RxQuPvdlphM726VKuut25fS+vKmSs6m08GS+OjGz15S7zq9++pTi2Tenv+PM
         aGgwKi4NfO0uptm1VG52CyeUMxpr0htQ2s7RO/UROF6lDw+BgMevn5Iq8p7UWGwsnPDF
         p9fy3HZYYm0Fkc15LCBO78N14u3KLswDN3zrHd6naPBD7cM9AY03286pYQJSZ+/A1zOq
         WhuuhPqQ6j9w/5A1aEH6ZsWFNiWwo1iTU7mUfNrNehSzWvMbLy8CGKJkXvTX9wLvata9
         HKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ57ZgFunvDnZc6QFtz3mLotuKtntcKyWi8bOoyUyq8=;
        b=wq3BRG15x+8KZaiXVqiHTAX9uCWfTVrfevFGiOdKPN73gdBFPoK5Rdh38qy7BFPvIr
         hG+gQbYHG1crmwXhHdE/4XnD2t6HFs+wqFZ4qJRqcumjq3wqVzWq19UrFNjHB44bh9Av
         0pV2JvsZQJbaSuAyti0eEyjZla1hBvUbC3kJCs+i4u3OmTPRLOzMyzYeStbp1sOhpIaR
         KuZH/CIXqpmw0z8Ykul9eNwEFDitbNZKWNjEqR1y0JNAVQxrlNKfICoKX9w+qQf/FSXg
         hyDA/snSePKTSTO/CGuZBaATgLHTVzdOUufg9X9TgnvgnXwk/l/+elYmvfCzJk3nom1F
         bjaQ==
X-Gm-Message-State: AFqh2kqNokS59o8hfPVO4rB0FxA88iog02Yh/B4ByAgYf/5IdVfBbSyX
	MV8W/xJ83tLNwV25IAaaV6He3IW/YjU=
X-Google-Smtp-Source: AMrXdXsqal0GyHj6woOdI2wAZ/QR1GA24Jq7g0i2yR40A2+orW9UwWXE3EtIgY1exYySJwbJAHoZKg==
X-Received: by 2002:a17:902:6bca:b0:189:d8fb:152d with SMTP id m10-20020a1709026bca00b00189d8fb152dmr46853893plt.25.1672776358242;
        Tue, 03 Jan 2023 12:05:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902b69200b001929212b478sm13779227pls.118.2023.01.03.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 12:05:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/5] time64.conf: Add GLIBC_64BIT_TIME_FLAGS on ppc/x86 as well
Date: Tue,  3 Jan 2023 12:05:51 -0800
Message-Id: <20230103200553.52973-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103200553.52973-1-raj.khem@gmail.com>
References: <20230103200553.52973-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 20:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175368

Make mips expression across all 32bit mips architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/time64.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index c6a3b682c2..5c53356d4f 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -1,9 +1,12 @@
 GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
 
-# TODO: Only for 32-bit architectures?
+# Only needed for some 32-bit architectures, some relatively newer
+# architectures do not need it ( e.g. riscv32 )
 TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
 TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:mipsarcho32 = " ${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:powerpc = " ${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
+TARGET_CC_ARCH:append:x86 = " ${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
@@ -23,4 +26,3 @@ INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64 setsockopt se
 # libpulsedsp.so is a preload-library that hooks libc functions
 INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"
 
-
-- 
2.39.0


