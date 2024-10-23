Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976C7CDDE67
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 10:50:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5931.1729680628047743432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 03:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RoklXVKo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso66176165e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729680626; x=1730285426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhQjelGUCc4rvXb0wIFJ8IVCLNME8ZvKlF/aleUeWdo=;
        b=RoklXVKoOFdm01JVeyEvJ0l/0xVXVxufdZeQF2x009n5WPeZ8mp6lWVxppLoRWPzKp
         DvZdFW7nSaBUomUwvznxU5qkaM8vBo8TWsN51qUQVVPh8CKEC8I9K6kJlHjjo+ttItx5
         uynDv5Eb1NjLIUDIAbHWL6W6TlDViqZlPrs08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729680626; x=1730285426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhQjelGUCc4rvXb0wIFJ8IVCLNME8ZvKlF/aleUeWdo=;
        b=MML0MgGY/l38iYZrGkPmbBCHtSvbNyArUGAVnx/y1gZM9EU/mdE9jSwyst6iyC5k2m
         CVUslHy4suIiu65BFCVVG3rxW/E5BLjnsagmTkBlJHoA/Gyj3E5bzlTDR7x/rVWttPIw
         ItPksgTSSyDZ86bh85nqwF53EG33FRNsam3tLotWj0XBW3B7suyhyfRcQFcMO8F3vhjg
         3Dn0dkSNVcGfGqX2ciAoP0d4QANpT80C1Rw6BA+upFu/ypW7Pp2/NlI4GTjJZBqC3lKG
         v8U4bHsK0xqs6w5L2gjuyPm2Mjai599Sgprl3W7IWiHd+lF6DPJ34FxP69hLxC+fCQcr
         JLjA==
X-Gm-Message-State: AOJu0Yxwv9No/m+Cgww8Kk3MxJTb3WutqKaGAVDISHL87Qzf6hJDmwux
	V3tPrWP0SB699w+h5+v220HDBxPOGV7C17GbgMXcSvd2Vcr6YlYFFpvNf6tPmqBGOOJs8BXylVz
	v
X-Google-Smtp-Source: AGHT+IEO/Gaxo14oxTY5DhslydZhXP2RFwl8lRQNC8BqYwHwygq2yw0INmuDzpAiFyf249FcZnspkQ==
X-Received: by 2002:a05:600c:6002:b0:431:5f1b:a7c4 with SMTP id 5b1f17b1804b1-431842608a3mr16681325e9.34.1729680626172;
        Wed, 23 Oct 2024 03:50:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186befc85sm12780435e9.27.2024.10.23.03.50.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 03:50:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] time64.inc: Exclude pseudo from the 32bit-time warnings
Date: Wed, 23 Oct 2024 11:50:24 +0100
Message-ID: <20241023105025.3376089-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 10:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206194

pseudo has to wrap all glibc calls including the 32 bit ones so
this warning is a false positive.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/time64.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index f939f9b7c74..2200144719b 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -39,6 +39,10 @@ INSANE_SKIP:append:pn-glibc-y2038-tests = " 32bit-time"
 # /usr/lib/strace/ptest/tests/ioctl_termios uses 32-bit api 'ioctl'
 INSANE_SKIP:append:pn-strace = " 32bit-time"
 
+# Pseudo has to wrap all glibc calls including the 32 bit ones even
+# if it doesn't use them itself
+INSANE_SKIP:append:pseudo = " 32bit-time"
+
 # Additionally cargo_common class (i.e. everything written in rust)
 # has the same INSANE_SKIP setting.
 # Please check the comment in meta/classes-recipe/cargo_common.bbclass

