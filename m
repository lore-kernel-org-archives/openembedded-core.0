Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096D2C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 10:54:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3756.1787914434996836890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 03:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gJYdQwC/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482c58a8683so664833f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787914433; x=1788519233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRAAilaBpRrDBkgB5sWes7MzXLT0+t1+2bZux2DT5zM=;
        b=gJYdQwC/1KCghn7UBHEI1eKdLLeR+leIAo43qRp1rCwVy9hjs/jEZnJH7gXnRLIVos
         JSQC3WHwJacTBsJKrTiGhg7NKxOxW7bh2pMo5RWiStkY7okOdGQRafPuXYQElF1aqJ+K
         QpygM81tKoeebk3kCBYjdtGMviLvcWK55JPVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914433; x=1788519233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dRAAilaBpRrDBkgB5sWes7MzXLT0+t1+2bZux2DT5zM=;
        b=ZYZ5Phum6E+2qTZu4nnfoHQ2pHw3hYCopSvROfmYtF/OcGxxr12HVJcfULAseDrI2E
         KWDvoREtVgm0cxXDorggT9FcENjl6KM111UVz8XGPJQAqgX/hIpdJmP8z7UkRbNowYEs
         27dSS6wsYaVB+SjUqViL9hQPZkcVEl4UjnC38w+CunVjbt4bpMlnJaIhQYkNKNHdJLfi
         bU5VIjt8ZbWhK+oZcjR0JoiQKnQfYAAq/i1SUowTfTP6H2vp0oUJPjTz/IATKKKFwXSW
         SNXkDdT3DlbRjrh5Wwxw6a8HJ/CXjlhBkgRHBOoc5HsTNMtKnuIJ8BDPMaUNVUIlh10v
         SQUA==
X-Gm-Message-State: AFuF++mAxvmgQX1rdJurh1mYBj4fhjcV2coQA3yOVAxVTytX8oFg4Kpu
	HJtCMpKWLhXgubGkY36lNJ6iTPSCThreEbtXoXnhc0CgMUk3flgjzXB8fZW8hrzL4Cp9K9UKOj9
	HlynjWWc=
X-Gm-Gg: AR+sD13bi5jpeQkogEZQ4oogz0H+IUMsq5Vt7MbgKuZ0BL+b274ib9pBlO7d89iEUqp
	1E6IGa9vfmBFJS6VQpFpI8JBML+lKvYp9m0hPqDeytzgSMfDOeS5tXG654XmeOweLo3BRiZETXP
	ICYOnrFXpo0/bwHEXRn+cAWc0wneJTgSHBNeIdbpaL2DnONH0U3zjZQ1kO4sM/ZZ2t2mtgxPwt/
	30wDJ/BUuLu3/P3SuOqNEJ9IvFctCoT/KKHaS73amDvbDSINoUkiiSNoTgFvD6/jS+LL4hRY2Xo
	2XmauIcj/1PkCgPyw3Aee/5TeTKfKWVHdNLk9BRLUcNv3MMM+d4Yl10hbvd534W49TxKoGj1aWv
	N1iaoqtVm4LULpFTzBqAmfozt/E36YRlTmGvoiRPt0IDdFhspFYakYWkoWOY8Jojp3ZVBlT2mcf
	+2+Zigsf08Ma9RXcWW8Bn/rXiJrzgWkWFSncaQkTw04FMnnw3R1BfMdtFmefgOCTVAPFYXCnNDl
	jKkzDJdtLq+ABXg7J1eE2yGq1hj
X-Received: by 2002:a05:6000:3cd:b0:481:57f7:6015 with SMTP id ffacd0b85a97d-482f7984c9dmr9526886f8f.6.1787914432954;
        Fri, 28 Aug 2026 03:53:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33d58sm2723469f8f.35.2026.08.28.03.53.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:53:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "files/ext-sdk-prepare: Ensure all dependencies extract correctly"
Date: Fri, 28 Aug 2026 11:53:50 +0100
Message-ID: <20260828105350.960246-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 10:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244530

This reverts commit f8336d39ddec1600b231a8117441e3927e661087.

This breaks SDK_EXT_TYPE = "minimal" with SDK_INCLUDE_TOOLCHAIN = "1" since
the toolchain extraction doesn't work well with --runall do_build. We don't
want toolchain build components.

Revert and we'll have to find a better way to fix the other issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/ext-sdk-prepare.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index ed03b77ae62..89b04030899 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -69,7 +69,7 @@ def main():
     with open(logfile, 'a') as logf:
         logf.write('Preparing SDK for %s...\n' % ', '.join(sdk_targets))
 
-        ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet --runall do_build %s' % ' '.join(sdk_targets))
+        ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet %s' % ' '.join(sdk_targets))
         if not ret:
             ret = run_command_interruptible('bitbake --quiet build-sysroots -c build_native_sysroot && bitbake --quiet build-sysroots -c build_target_sysroot')
         lastlog = get_last_consolelog()

