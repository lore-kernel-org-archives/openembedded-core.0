Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F981C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:10:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3665.1787303406522551669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QgykdehU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so698694f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787303405; x=1787908205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HzVMZ5KzSCNrbmOyV3I8PI3/hwQ3oDZJ40qVk+q8Rsw=;
        b=QgykdehUqoQjuPPSgK6e2UmBTXfUErxhLWB8bBHG6jPcZwz6LrvoTE3S+8jY5EzMbd
         t97pjiKeRbBKb3QBU6q26LhgrESrUXf6UecFx02T7gl2O2HEgbLXwT7OUtiy2xDvpGTH
         AFSn+KKB/uqNCze+QFGBuTtNg4dYmF8u8HMRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303405; x=1787908205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HzVMZ5KzSCNrbmOyV3I8PI3/hwQ3oDZJ40qVk+q8Rsw=;
        b=DPJNzA/796ZcnshKqp2IPe587w1N15u3DsANgfs3WTGXFB2rOcGZwmJcKIkyRviQmo
         C5JLIw8quUxQcN7yYgFvGaNDkfzzr5eyULu/Y/en7v3gaJgSD9oVfV0wT/lWsVLDffGU
         Px6R24IvmS3P7ZjuVNI1cFwEifiNyyjJ0HUKL0O1K8Bui36VsncK/jWskLFSSTDhL8Ky
         ZXhdq0vFmAv30t4rcR1QTjVtYlNArMehiFWtw01PBAldL9UL7Kd1+/HytgHeSgcTQwz7
         iu+h56HF+Dv0XTi9RpVGxWVy7GZm5Z7mZkd7NVMvxPqWaE+ktGzFWBKKY6mcYYTugYT5
         De5Q==
X-Gm-Message-State: AFuF++kBWPfpSGC/1cl+PffDpmNPm3H8VrEose1Btzk0AObzDEHiqzOj
	OXfX0fB/JIkgNacNzszqZlbjItA7xeK4GgTvYDJyP52k+mQrZemXHcuvY1hoGTEW0l88HXcpEET
	rtgJWIq4=
X-Gm-Gg: AR+sD13YF2+jNctP+wZ2MYr26aOuL/+X4hjrnI7u/zt1wo9D3IXNxSgO6qnIPqasfbd
	ulWdalwBBWDP3LFBkjteA3/Pa2779WrYJjzG7sW1Dx63Jf3Fc7RTlYR3THV/R98f5T1nCS+2M73
	8plj5cJLJ+JmueD8UvdykWQvLD+mRHV27r30CObofY4DPAaXZuezCcVksBl5xYGzEkFYEUARAuu
	twIKeCE7Y/Dsdx19YBhsoUDTgf47w0+Cnm9rCfaHC54oX3jnV1b5mYckk6wm5T/KFIG7HGG5BmY
	MK7LGhRO1rZslYv+Gn7j/UtvLmELc8DJ9PZx3L3BvcwM2zKtYKvU1HYn/ofrizdxz6frAnSQ8sc
	AU6imktMABkgTxGcnLWWMmNO7bUTb2CsWL7gFs8LKESPo2GTsl4/JcgkBL2BcWnqJ+fktLQpV6/
	+H4df4nc54leRNeNGfp7U1fTdIN/98kD8xBbWnzimxIZW8EAMlI4fwfIXuwCiL0T5om0oR1JMBN
	nGxhLLjzL5ueCa32A==
X-Received: by 2002:a05:6000:1785:b0:481:511c:8d45 with SMTP id ffacd0b85a97d-482c0bb16ddmr6425002f8f.20.1787303404559;
        Fri, 21 Aug 2026 02:10:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d23sm17049620f8f.22.2026.08.21.02.10.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:10:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] puzzles: upgrade to latest revision
Date: Fri, 21 Aug 2026 10:09:55 +0100
Message-ID: <20260821090959.3859632-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
References: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243911

3c36322 Click-and-type puzzles: clicks outside grid hide cursor

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 71eb6673e3c..6e1e2b87491 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "7ad37c64af3bc891372ec16db1531cee599b6e3a"
+SRCREV = "3c3632259d298ab62aafa8a5858823569ab1af46"
 PE = "2"
 PV = "0.0+git"
 

