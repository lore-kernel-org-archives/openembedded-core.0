Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9439C5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:38:24 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7656.1787409497448288258
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HKRb2COJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-527e352a167so12801701cf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787409496; x=1788014296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rzhmAegDYbUvevOJBMWxcRKC2Kgu3Kst/Y5/AVCX6IU=;
        b=HKRb2COJ1cmkVPbla0hI6ghBiKprCuzJKo/GbkAtf4kc9bo/YM04ppI5dNDOaaNKhm
         lFZBlulZnRT4DcHFaK735/Ct3mgF+S16z9rCD05pswvcHyLstA2uTks7xgdas9lwX4yF
         JGbY8OSNxsooK0B1Erv5lIrbutNue3MqnMnbClElNSeY7iuDtHhhcbJRWpiCy2fecK9V
         8vf7emxZgezLxeQGD5jH2ufvSMAcEHfC0nGTD0xMKdGks397UYYHeMLo16+jj5URVgVU
         kDt/FOM4is7DEwPx9b15ymuHsU9yaNymdjVQ3slOXDTjPWP3oN0aiXn703fzgY1OKXUB
         lvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787409496; x=1788014296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rzhmAegDYbUvevOJBMWxcRKC2Kgu3Kst/Y5/AVCX6IU=;
        b=FTRdbexxWtKNFVuGnwQ7nfe5qByBuTaWGmM3oDNoIN7rkU6qtCXNoMKkAFf9vzqRaG
         djLtC7Jh9RY8yLSBZys6v0qSxgdpYJylC0gGWahi8mpZ3x62xmV9eAYvPZDpengwPOcC
         9i0JaocYWWrhUzCNzlM/3CMJwyiNfjwF7mW9T7EKnldWQiW3T+1JcugeuwWO0uOgbbMJ
         rZPCd1KFVwg2qUyUxP72BytLebkGtO/B/06SHezXbppFyaKGKWX/rzVfHYZCkDnBcReg
         BwI0p5ZQ5LRevrefJ1dooBizv7+sQmgeOy5xXrCCxvqV3LQBpLR8D/Q4LP18tHnNcqBO
         cIbw==
X-Gm-Message-State: AFuF++lb+d2OOqVIQvaolTmqRw1fAIXzEuNVpHVpE88XDS70/Zt4dJ8c
	4lZHX6wt0L3FkL0LGIBpi64iI9ePbNNw48BCmjs9fDPG6LML+Sk0Grjw539mVKis
X-Gm-Gg: AR+sD12HoIGaQ8kpyMWOnj7czhV0TnlrnHQhdPZr3IcmniLleUcwT9tiSUY47f7jkKK
	VeLUF5ydsZpBpnymiFrnERonOMmiJzpG0GGpsFEF8aSagyGIGOMtZo1udCX0hz3Af1M3YYpkgjp
	H3zkJiVu7LT32J/F13Jw2+SrbHgijd5C2kN9qaJ0paVMtoXRjfpIxdAI7530tdibLH8n3xAcy9c
	j24lXG/zoomOAHfHXQvkeYuSRchfScR0N01tVZaGJA6gsw/cHow0Cw8SORK7e6Z2Lc2pCKKmY1Z
	nW1BSYz1w7fkfuALq8luiopEoE0UwafKIg1xRm5Dz6/rPdAhYxJ1OiEXEAgWXH0TyqSLhC7QQiy
	A8Uhsfyr0aTaNvz3YMD6CFDtmdmrJWpFe/P82I6xe0pAgrPQRqAOD1drR5Q35r4JAfPjNAdz/C7
	c4fB0uCQHhj00DiSJjPi1VozOkjdEXzdrxG94WobJgOr0iuFZWQ9xp/OWwPd4vuzaxxVoeSuVaD
	0UO8otXFsVMCPFb5hiOarajsjdbGkE=
X-Received: by 2002:a05:622a:4a8f:b0:51c:a7e:4cc2 with SMTP id d75a77b69052e-52df5a3186bmr136876971cf.20.1787409496156;
        Sat, 22 Aug 2026 07:38:16 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e099c38c0sm14728811cf.13.2026.08.22.07.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 07:38:13 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] oeqa/sdk: update cryptodev to a revision that builds on kernel 6.18
Date: Sat, 22 Aug 2026 10:38:06 -0400
Message-ID: <20260822143807.2256028-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260822143807.2256028-1-twoerner@gmail.com>
References: <20260822143807.2256028-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243984

The out-of-tree kernel module test pins a cryptodev-linux revision from
before the 1.14 release, which predates the removal of
crypto_ahash_alignmask() from the kernel and so no longer compiles:

  cryptlib.c:384:28: error: implicit declaration of function
  'crypto_ahash_alignmask' [-Wimplicit-function-declaration]

Move to upstream's "Fix build for Linux 6.18-rc1", which is the revision
that restores compatibility.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- none

changes in v2:
- none
---
 meta/lib/oeqa/sdk/cases/kmod.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
index 0c4d8ddb543f..1be23e994fd2 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -31,8 +31,8 @@ class KernelModuleTest(OESDKTestCase):
 
         with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
             git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
-            # This is a knnown-good commit post-1.13 that builds with kernel 6.7+
-            git_sha = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
+            # This is a known-good commit post-1.14 that builds with kernel 6.18+
+            git_sha = "08644db02d43478f802755903212f5ee506af73b"
 
             sourcedir = os.path.join(testdir, "cryptodev-linux")
             subprocess.check_output(["git", "clone", git_url, sourcedir], stderr=subprocess.STDOUT)
-- 
2.50.0.173.g8b6f19ccfc3a


