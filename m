Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436EAC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 20:57:15 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.3433.1632949034658502925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 13:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HWWG6jrV;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so502051pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kxa52OJAFVvz7VDyTPqWmGB11IxTkKaWLZDCDFCWOWw=;
        b=HWWG6jrV/uwmT/7Wt8yxFtVM/bJ2tQCeKDeTaHylYIezAUk28HB8fsxeGx17r4tl19
         PgTpJTju9jlGcQdBg3BIqrQC6xTJbcJemhL1WBq59roUWi4Ldr5/RiJNqA2PKsxAnaIS
         kgg3pL+gFLFwOUI6z2KCsEG4EAo6lu+jJhZG8R0abw5hCMynJYQa3Rr6l5b48seTY8Ko
         iu3Mp37R4f5+uSBlu9JpAm3uXDj8UCecrJ66eTZBZhR68oWDOGWD7hEblBSlOYhoIEM2
         qx8gER4rBjT1Bw+P2OY1f4LL0Kez65RICgRTtrdW1ap/mgAfI5OOWr2P8kYNciKhPslS
         Fp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kxa52OJAFVvz7VDyTPqWmGB11IxTkKaWLZDCDFCWOWw=;
        b=VFGHLRBy2VUAPF/Yy6A3rInA1/q3ubu/pLRK31pHPwWDZyOHB6TWJ1EE34JqxMBBtr
         oGz6aFU5zvk9GpYq1sz9AAvzlwCqrh++9hCKu+jXXd0nb6nQEnclfyGAbvQu7DmnpRM5
         LO/9tDWjR6244Rl7r4kh+HBpcrMxKrWHJjgDKnOa8vIcXT8WKpO1YWG+ILzSaZOVHmKl
         ZrWcAQUIMGJ4wog+LVvgEqz0Lv7/nr7+aJONFNt/hQY0V64z0j/p+AMZNR6zQTGH/M5l
         FGuEraDRYdgl75M9y2MZXmMSaf2rnWTfRU2hMS1lHF8SjUs9rhwVAP/P4RypKQk+NS8x
         7bYg==
X-Gm-Message-State: AOAM533WAaPspSJS/3GEFUiL7nWzeUdahk1MuLieljLae6ZaZX8+UcGT
	S4IsymSKEuRA2/dz4lEwrf3mm2822Joihw==
X-Google-Smtp-Source: 
 ABdhPJy9SkScssyrH6Yp6Y/Ep7IJOs25UoMYPT3I5tiKR8wJdfFWEGkVvLjjM7ah9CnlXC/osxi81A==
X-Received: by 2002:a17:90a:ba14:: with SMTP id
 s20mr8895118pjr.20.1632949033831;
        Wed, 29 Sep 2021 13:57:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id
 b8sm621444pfi.103.2021.09.29.13.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 13:57:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Persian Prince <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace_5.13 -> strace 5.14
Date: Wed, 29 Sep 2021 13:57:10 -0700
Message-Id: <20210929205711.193186-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 20:57:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156475

From: Persian Prince <persianpros@yahoo.com>

Strace 5.13 won't compile with 5.14 headers:

| ../../strace-5.13/src/fs_x_ioctl.c: In function 'fs_x_ioctl':
| ../../strace-5.13/src/fs_x_ioctl.c:64:14: error: invalid application of 'sizeof' to incomplete type 'struct fsxattr'
|    64 |         case FS_IOC_FSGETXATTR:
|       |              ^~~~~~~~~~~~~~~~~
| ../../strace-5.13/src/fs_x_ioctl.c:71:14: error: invalid application of 'sizeof' to incomplete type 'struct fsxattr'
|    71 |         case FS_IOC_FSSETXATTR:
|       |              ^~~~~~~~~~~~~~~~~
| make[3]: *** [Makefile:5011: libstrace_a-fs_x_ioctl.o] Error 1
| make[3]: *** Waiting for unfinished jobs....

According to https://strace.io/files/5.14/:

* Improvements
  * Implemented decoding of memfd_secret and quotactl_fd syscalls,
    introduced in Linux 5.14.
  * Enhanced prctl syscall decoding.
  * Enhanced decoding of IFLA_* netlink attributes.
  * Enhanced decoding of MDBA_ROUTER_PATTR_* mdb router port netlink attributes.
  * Updated lists of BPF_*, IORING_*, MADV_*, MOUNT_ATTR_*, SCTP_*,
    and UFFD_* constants.
  * Updated lists of ioctl commands from Linux 5.14.

Persian Prince <persianpros@yahoo.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/strace/{strace_5.13.bb => strace_5.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.13.bb => strace_5.14.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_5.13.bb b/meta/recipes-devtools/strace/strace_5.14.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_5.13.bb
rename to meta/recipes-devtools/strace/strace_5.14.bb
index 7d93f2da98..02a4843edf 100644
--- a/meta/recipes-devtools/strace/strace_5.13.bb
+++ b/meta/recipes-devtools/strace/strace_5.14.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[sha256sum] = "5acc34888b9d510ad6ac915d4a8df08f51cf1ae920ea24649f6a4bb984d0b656"
+SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
 
 inherit autotools ptest
 
-- 
2.33.0


