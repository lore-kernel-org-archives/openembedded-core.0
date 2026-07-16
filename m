Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430CBC4450E
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 11:35:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10732.1784201735530950701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 04:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GRKjr6/X;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2961115f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 04:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201734; x=1784806534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOxoH3apcENN3iJ3izogjedlNrdHD+PYbnPqEvafTDE=;
        b=GRKjr6/XLUVHoNmbSkQrasYLtTxMRDsXGFoZ6bFnKh5ZbJvNeSA0KTuxqdw4cgegTB
         oSgZVAdR5kGMocWL1MqNU3QNTprcnqwMUJfX2yoDYQsahy7lzLChdIKJU7ksF4xYIt/A
         q2fVr+FFFve3EVqgxGwnKNye5FA3MdkHvJoOpPY5NjxLKUTxS+J33ILUT8iH1QZ11+z4
         tXGzCkr2sOu3xOLvYFjqBprMw5XIw1ssnxil358GJ72lzjziDLYX0pLVqJxgQ2QYrcuG
         w1kj6Sc6EPG1F2UPFDE7saxujcY7YksRq6/mglkQ6igqzb0zsWOvZLfN68IpmdYISKpN
         W6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201734; x=1784806534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOxoH3apcENN3iJ3izogjedlNrdHD+PYbnPqEvafTDE=;
        b=ZR8cczW4P6sr2+cBKIdCn74+PfS4pVKCQAVc+Unx5Q6kVh9xgCYTCsVEPIJpbN3raX
         bEhuAagZCXOaw9ASU9mQQONxtMDKEG4na3wO2TNh59RVs7UmzYNeQYzfACdMAhvhQvcy
         HnbWQOunMcuSw/K3E1gzFY0oyRZdeX0OvcBODLF4qHHodSxCOwqMfaQYh3yuOU7ANWEX
         DqfK2JPLVDbiEYEQNPAbLxtxpWQCgktrf59mTXBLUbjQnrfVtF/qkcXecuV066d/fsL0
         P15FqF25wgqXz3qHjmFBNVsj1XrKYo9AgF145xfyfiOPX6CEIjHdVfcoWN/8aLljVul2
         5s2A==
X-Gm-Message-State: AOJu0Yw06NKexUQ7n6oh8pUUTIXFMvcVsiLoYefdKyaWA61LOjyaAFcj
	RUzuo3XTvksIZjvLmF29v7Eb2WN43KXK3XOZWR+XL6DvefhxxDZxbyLFjfDvtg==
X-Gm-Gg: AfdE7cmXefhq4U5P08p4flv9ivHjPGlffqTKzkS65NzKGnORQCMfvzwwT+VLX0AX0JX
	KiSGDoiZ7Sp/HwgAiozac5KfYoEYN1z5PdwncQhXpqg/iUegoZS0MdIInuKL0DUdIdla3dJ7ghW
	bWcWF4reECcTeCUGrVhIQ1ejN3Rmme+8V4CF8EVswI8fmWBI9LWNxldsrO+pY35EeWnzYulUVsC
	KurH+68joDyrJD+Yt2+ThOEzSpueXhSiUFdq65XKKewwbvJ7/ixU2UCastySKjgOD6yez1Wyct5
	GHCmAuMHkATRMcvxbHe/PdRDsg9yZWjqeqjam4fWiZz3WWkB6nvQuIz1qLsn4tiqRO8RlewMwDy
	KiPvZNytDTP39agJylVhByJzh4GkqbXlJwBLTpD2fnwnWIsJqPn3eS11cG5Z5A4LGg4MQTRyVcn
	+TGOP7fQhdXFzXoiX4STs1/yjRkrVXVrc3506Jx9JQi/LghwT6
X-Received: by 2002:a05:600c:b85:b0:493:c062:a533 with SMTP id 5b1f17b1804b1-493f87efaa9mr242960465e9.17.1784201733505;
        Thu, 16 Jul 2026 04:35:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm26215803f8f.18.2026.07.16.04.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:35:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] gnupg: drop upstream-version-is-even
Date: Thu, 16 Jul 2026 13:35:25 +0200
Message-ID: <20260716113528.2322001-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716113528.2322001-1-alex.kanavin@gmail.com>
References: <20260716113528.2322001-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241084

From: Alexander Kanavin <alex@linutronix.de>

Upstream isn't clearly communicating their release strategy and plan:
https://www.gnupg.org/download/

In the beginning gnupg 2.5.x were development releases while 2.4.x was
the current maintenance branch. Over time, upstream started to indicate
that 2.5.x should be seen as proper releases, while 2.4.x reached EOL a few
weeks ago. There has not been any communcation about if and when 2.6 appears,
and if it does, will the odd-even version scheme still be followed.

Meanwhile, we do need to pick up the latest 2.5 releases with AUH, so let's drop
the odd-even pretense for now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/gnupg/gnupg_2.5.20.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.20.bb b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
index 4146b12824..a7f0d40c1f 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
@@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
 
 DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
 
-inherit autotools gettext texinfo pkgconfig upstream-version-is-even
+inherit autotools gettext texinfo pkgconfig
 
 require drop-unknown-suffix.inc
 
+# Note: when 2.6 is out, check whether upstream-version-is-even class should be re-enabled
 UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
-- 
2.47.3


