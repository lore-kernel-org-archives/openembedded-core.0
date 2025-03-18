Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE0CC36003
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.2877.1742323140381081336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JrxWr6BR;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso4497284a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323139; x=1742927939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8htbS5eHG54cm53T1cvh9m41VKMDCvM1oYLBVAL5ck=;
        b=JrxWr6BRWrv74IK/my8FG9M+0SEoqrYg3yghoG1M2FBzCx3fzWq69zil+QL82HvKZ/
         nzdMmvykbGWeQNSO176n2JOC5s21RnE+55dt07IaYmyofn7b7OCRk8pTg7h2XUIZH6Ah
         6AsIoQbAWwUX7kU8sJDRJ8dTJGOqtaCnBX+RAY6Re8oZZaWo33jsV5+7Jfq2qStUhF2Y
         IQJa/TnFPTZ976VMUobTKOtbS/Cd644478IJHPBL1xkIi1H9YTBnDSbABbCvO31Jk3w0
         tlgW36fV+ILyTyStOrP2wfVAK0TwarZt4iDJ4wc+6dc+7ZZBLKMsfWac81YtKbqrmEto
         42pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323139; x=1742927939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8htbS5eHG54cm53T1cvh9m41VKMDCvM1oYLBVAL5ck=;
        b=W1mpZQ8RejVD9ieNSmUsAYUFcwNx9vdjtPhadB6qclxMLSrK/SQkK9pkr+KXpusHrf
         NVMKhkZSxkE4mA8YuU2fOyBRCZtb96NPAVqW3lzFmyUQfq83CPdifvy77vu1GKrdpZcW
         sd4yMclw4t8xny21EvucF94hR6bi/II9ykRrkQOnASsr9KU434kE9XYf5ANLCmCw35jk
         Ti0a4tuT9qGimKg7LuDNKNpBM8avacuWJSvPUI6mzxDr/SX6tw6TWxKoNlNBaPHwVYxv
         z1H+/4SwITcocTvdnv0wA8xA1d5wQg8ySFMk01T8hV9QKZM0XpSiEK++VzoFR7r7CEC1
         +biQ==
X-Gm-Message-State: AOJu0Yyvx+jygTRCC5tHVnq0+U4/jNXl95ftmWoJYPetLD936O76srLS
	/Ja2jxQHOYgdNIO6ioHivlF07i9oTKsikE5plL3gnnLhUYCJwaN8wbd+TkMC
X-Gm-Gg: ASbGncswBjIeyZsGiWlaaZ7oG/lASL1/mIoOLKWElehHtYaAeUNGHKBEcsqv30eqMWd
	Y5nDZJedXVEamd5iDsbSpM3oLqHqEyfwt4VLJpr/CMjtNXaUQGtKu9HUNr5Kf5snMadu/66pFRM
	tJgJZCHokeVpIUmwIpogcspj41lC6kMUxhlOvpbQMxY2dWjDgFJiQ8wQeTsKs8GBv531bCe+ZqD
	qZR6Cb0kZ5OmpXn4ddLgvPbo57w18a/qROvX6k494BCzNEVYC0SDgnR0yi1j+fs+xAgqe62bCLW
	WL7jKY4D/AkwDuPG+0haAwQ02tnRKRNbRz75
X-Google-Smtp-Source: AGHT+IGuf9Nxa+YDhVBQBEvoDOZLDtonxdiGq/R19s5T/otcb9BqAn81uhZy938tejLVXVbPScAuyA==
X-Received: by 2002:a17:90b:3909:b0:2ff:58e1:2bb1 with SMTP id 98e67ed59e1d1-301a5bff14dmr4241708a91.32.1742323139622;
        Tue, 18 Mar 2025 11:38:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 18/25] cpio: Pin to use C17 std
Date: Tue, 18 Mar 2025 11:38:33 -0700
Message-ID: <20250318183842.2256284-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213244

Fixes build with GCC-15 which is defaulting to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index bfaf5c31c37..b081bd53db5 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -20,6 +20,8 @@ CVE_STATUS[CVE-2023-7216] = "disputed: intended behaviour, see https://lists.gnu
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
+CFLAGS += "-std=gnu17"
+
 do_install () {
     autotools_do_install
     if [ "${base_bindir}" != "${bindir}" ]; then

