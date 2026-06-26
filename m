Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2366BCDE00C
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 11:38:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33115.1782473892791710810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 04:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X3mBJjvq;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49241896317so4354535e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782473891; x=1783078691; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1debIVE2wcLlhscrQyoU2eWf4m5qysA7IbZXUw1/uXM=;
        b=X3mBJjvqPCEjZzqKyUe4tDxREY1JwchDfZbCDoj599DZ/BAXrS+baqJ6lwz6lfFGGK
         3JD+hexN8Gl3hJFvzzvAQOrDgGOYOKkLRFYGTBrPk2hCrcKi535uFsUtJldssi44KttI
         zKn09LVT995Yg3YhG6e+MDB3UNSsyUdRTCMSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473891; x=1783078691;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1debIVE2wcLlhscrQyoU2eWf4m5qysA7IbZXUw1/uXM=;
        b=UVzO++vM+BNgffUQk1QiEbUaO532w8Thnta6p5tjJlJZAnxrZJMpT7zXjtnsDlMa0X
         zXbgfbO4HhL6V32KWxKdCdB3Q4SPagJlCb8jGmREc8yjW4CDN8AXfP0JopiKn49kgWnn
         nTkjlWS/lyf/4pF5K7kRB2+WgGpmRDztj5YRUmQT8ALAaZGJGrCPM0pvWhikMLcEM2ZB
         SOooROZ3zI/JqSIukX8dQKcCTRlh1N0NeGi3MBoVcl6h5tICKCFU4P/an8JuZAS5Amr9
         Jw02/x8t9IMcQ8cZtnyfcRDbP771gFGXQkL43udJGuCrnGJbRDgr97eoC9M2p9I3miWw
         6sjg==
X-Gm-Message-State: AOJu0Yzc1njvUrFZOQt+HktlDT9Spq4/GY0QWKFG8fD/PlpHYJxO7eSF
	1mYX8tpvojC/dJuUI2MMQjZLy7Zyha4F1Vn9Pxmp5jUptX2fIDdxf6Ndq3s07OgOSe4=
X-Gm-Gg: AfdE7ckXThyC3Qub5D7pUVRiEcz0PRmpY2C6jqXwBgDHnTAKAbtQFza9ZUXNnDqcCby
	PuFWI9K7+GYnVTLQiXM+1jRoVZFFf9dUgHxojzAFL0b+QTAIaxDhTGlvOrHJLH+52VApdzXY2n9
	HZNE6QhAF4OuD9vkzF/4SRjaUtYPcKbLWK7TA7M4MlXSZZ9EkJ5FQsm2eMD8XJeZup0bIaWRn5s
	OQBEazOF0xRpzd7XBwTh0WVrS8ErkkYjSxafgMFURjclqLJRFHm+ZNWutiNProummMMxFbTkLmy
	yPX9Tw8V6yFNbppd1Xl6RaBUkYo8zsYpSD+AIfdbmgPclf7twdVYCQ9kMYbzMnLrXCU72rbgEbD
	f2Dqbpy3M+1hJOdlCZUD66PZnLXoiS2l3/8lEF4XNKk489CZS/h8Ds87505GQcr4Qu2/fN/7nY0
	+8PizFRFSqmDcWuGBq7RGqq5pfXQnmWCazAkcW1T5Lfbq1V6Foko+4rxepBQB2m8pM8DgMSMWN3
	FwenOmTrg==
X-Received: by 2002:a05:600c:8b4b:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-4926688974amr90249945e9.28.1782473890945;
        Fri, 26 Jun 2026 04:38:10 -0700 (PDT)
Received: from [10.1.75.39] (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49270208b29sm421345e9.10.2026.06.26.04.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:38:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to support
 Ubuntu 26.04 on Scarthgap
Date: Fri, 26 Jun 2026 13:37:53 +0200
Message-Id: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJFkPmoC/x3NQQrCQAxA0auUrA20AQfrVvAAbsVFmKbTQJmWZ
 CpK6d0dXL7N/zu4mIrDtdnB5K2uS67oTg3EiXMS1KEaqKXQBgr4jUtOPKNHtjIlXtE2L+iSRt7
 mgpeOWIj72J8HqJXVZNTP//CEx/0Gr+P4AQ9sOvx2AAAA
X-Change-ID: 20260626-ycongal-scarthgap-rust-segfault-812ae2a9c95d
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, ccasciato@21sw.us, paul@pbarker.dev, 
 randy.macleod@windriver.com, ross.burton@arm.com, 
 sundeep.kokkonda@windriver.com, SunilKumar.Dora@windriver.com, 
 Yoann Congal <yoann.congal@smile.fr>, 
 Sunil Dora <sunilkumar.dora@windriver.com>, 
 Alexander Kanavin <alex@linutronix.de>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782473890; l=2025;
 i=yoann.congal@smile.fr; s=20260527; h=from:subject:message-id;
 bh=0VOZaUhTils8vKg+2GxksWNkPquOMkTtGFzsy6LrUHg=;
 b=HWYJ9YEFc5DlkwGMkPfqxE/49YElQJaWZuBZ4XWGA7MmUM0TeuVcvYG49MMxAlmwUf2PEJvpc
 6vW8kqnfMxvCGeHAy8bmxU800jderUEU8ESq8PWJbBrnH7NC2AYvD3Y
X-Developer-Key: i=yoann.congal@smile.fr; a=ed25519;
 pk=AccXM/XSn9zzv1zYXEM/MdcAaQ7cluqUBg1xzwrqNts=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 11:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239626

Hello,

I'm currently trying to support Ubuntu 26.04 on Scarthgap, but by doing
so, I awaken bugs fixed on master. The current (and hardest one yet) is:
  16058 – AB-INT: rust do_test_compile/do_install segfault
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=16058

I've this bug triggered here: 
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/40/builds/3981

To fix that, I've tried to backport the fixes mentionned in the bug:
* commit 74ba238ff1ba ("rust: Enable dynamic linking with llvm")
* (commit c31859be39c6 ("rust-llvm: Disable libedit") because I
  trigerred a libedit related linking issue)
* commit d0671c3dad87 ("rust: enable dynamic LLVM linking by default")

But that last commit appears difficult to backport: It was made after
master switch the LLVM compiling rust from rust-llvm to common llvm.

I've hacked the backport until it passes testing:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4085
... but I'm really *NOT* sure this is the right approach. Hence this RFC
with the patches I ended-up with.

If anyone could check/review/improve these patches to help me get them
to a mergable state, that'd be nice. Otherwise, I would have no other
choice than never support Ubuntu 26.04 on Scarthgap.

Thanks!

I've copied the bug CC list for awareness:

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
Richard Purdie (1):
      rust-llvm: Disable libedit

Sunil Dora (2):
      rust: Enable dynamic linking with llvm
      WIP backport: rust: enable dynamic LLVM linking by default

 meta/lib/oeqa/selftest/cases/rust.py           |  2 +-
 meta/recipes-devtools/rust/rust-llvm_1.75.0.bb | 40 ++++++++++++++++++++++++--
 meta/recipes-devtools/rust/rust_1.75.0.bb      |  6 ++++
 3 files changed, 45 insertions(+), 3 deletions(-)
---
base-commit: f42bc5a91196691a30d92482fdf2eca7eabdbe25
change-id: 20260626-ycongal-scarthgap-rust-segfault-812ae2a9c95d

Best regards,
-- 
Yoann Congal <yoann.congal@smile.fr>


