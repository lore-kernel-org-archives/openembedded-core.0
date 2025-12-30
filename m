Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBA0EE49B0
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:45 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71744.1767125564567191336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N15UYD6K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so91365155ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125564; x=1767730364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5nX7vi3sRW06rI8Q1Vq3VyDZ2nueqSnl4eLdKYtEvc=;
        b=N15UYD6KdHKwAX8W2+xwNNt97zz+Mqfd6+rAoU8yTgNuUIwhxZCBkVa83NMbRi4L0/
         njwZYS3pH+08qn9cNLty1ECq+/9YaWlEvbxWhL2F9EAyYmft4LEUMGl4luZa8yBOzAhH
         vUC/Wpb1dYx1BBhrmkP0VdZVkR2D1kxusfb7SXr9mIPWVG35aed5JvzKDrE7MLG2kWzX
         qHO3/cgsYSF1Wppr0UXBnHcqSHTwD6yDNuSmLq0piJjsjuytAoEsoxcR7bf281a6FTP3
         F05p11+rorcpf0vs+WJZmgpTql3WsIHoFQ2qfbZoXLFP2rmi2xrIWg4URSMghMeOMDaS
         Bpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125564; x=1767730364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5nX7vi3sRW06rI8Q1Vq3VyDZ2nueqSnl4eLdKYtEvc=;
        b=LrGALb4LyqgJKJ/iFQ9jjYmfpMx747qkGq6DCAY0PEEpq5m1IY60x7CGdVPHs1N7bH
         qYBgvUh2EzMmob9WEL0fizYqA54asKC/qT2W/acoyuZlW27q+8hp8xkbytRP8dhJHZKh
         giM9nJrqYw9umePBCQ4fmlbPemDV3Hq5575wj56+m8XrnsjzcHsz1qYDUaFjBf3rDHmO
         ld5XzFE5+E79VWFbyIH6ETy7unCBVflimpjn6tTuMtlRSXhm1oyQsvGmVwosZSt+NCya
         rDxxDWXfsezzdXJuze7tLZ2ZOuuCyuvHUUo4RlPoiS1WBzTMQp7AyU1hdzZMtNbx2Huh
         qnLA==
X-Gm-Message-State: AOJu0Ywd59xILudRBU9qhRem0vyKebtztbb1nJvq2gB+YZ07+F1Adya7
	nAC/gZ/rVXpYLTGMr5F+PmLSbJXIGOrJn7NUFwYZqFGMZP5tlgMvaNyHa5yu1kwH0pPdjQvdxT2
	v4gPn
X-Gm-Gg: AY/fxX4LT9nkqEqNkqH3lDzzoqKMw3n6hcWCHbg1H9MOegXq5tmD/Wx0spatPUh3t8k
	GNU96p0u8MKAkOTQPGjMepKm6jb1X3CwCgnx52cLHj1EpAkuahsI1+MccKpKXONWTX/7TeSy1V9
	aihfD5jIte0i+gjBdZ8xOnjsLAnyjdU/6H+BLCinpc1vwSY+V1E8suBYVNkJF82SmN5CGEUtZnM
	bw9D9TPuT3+hxBWbXhoXbvlFP9cqW3YbtUmUTLnVZk9CzR+TBg2K1v/jJwA4QPVh7liLWXUDhMF
	U8zhkJC70ycNs4LSUTntikziODcIP8GqidMA/Hie8yEWRI8NPBYmNa2bBUdNKVlGpCP6vg9KL9e
	Xem0nSHw4ScmD7hJuolmP/YZMj3rC4xmJk+jU39htg9w2yTvFD0PVMEGAgb3NIAjGPiMltLdrqw
	OmEg==
X-Google-Smtp-Source: AGHT+IF7Cc1p3VJiQ1YyYDOAIJc2DNWGlCpDf+v7AgFkMfUjz8WwZ0+eud21GkVV0fIp4Mgl/eHHnA==
X-Received: by 2002:a17:902:e552:b0:2a1:3ee3:d00b with SMTP id d9443c01a7336-2a2f2229d1bmr394514425ad.13.1767125563799;
        Tue, 30 Dec 2025 12:12:43 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 22/29] libpng: upgrade 1.6.50 -> 1.6.51
Date: Tue, 30 Dec 2025 12:11:52 -0800
Message-ID: <6adc6599fd2baf46d68476253e10c5056916ae55.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228714

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changes from version 1.6.50 to version 1.6.51
- Fixed CVE-2025-64505 (moderate severity): Heap buffer overflow in `png_do_quantize`
  via malformed palette index. (Reported by Samsung; analyzed by Fabio Gritti.)
- Fixed CVE-2025-64506 (moderate severity): Heap buffer over-read in `png_write_image_8bit`
  with 8-bit input and `convert_to_8bit` enabled.
  (Reported by Samsung and weijinjinnihao@users.noreply.github.com; analyzed by Fabio Gritti.)
- Fixed CVE-2025-64720 (high severity): Buffer overflow in `png_image_read_composite` via
  incorrect palette premultiplication. (Reported by Samsung; analyzed by John Bowler.)
- Fixed CVE-2025-65018 (high severity): Heap buffer overflow in `png_combine_row` triggered
  via `png_image_finish_read`. (Reported by yosiimich@users.noreply.github.com.)
- Fixed a memory leak in `png_set_quantize`. (Reported by Samsung; analyzed by Fabio Gritti.)
- Removed the experimental and incomplete ERROR_NUMBERS code. (Contributed by Tobias Stoeckmann.)
- Improved the RISC-V vector extension support; required RVV 1.0 or newer. (Contributed by Filip Wasil.)
- Added GitHub Actions workflows for automated testing.
- Performed various refactorings and cleanups.

Ptest successfully passed:
============================================================================
Testsuite summary for libpng 1.6.51
============================================================================
 # TOTAL: 32
 # PASS:  32
 # SKIP:  0
 # XFAIL: 0
 # FAIL:  0
 # XPASS: 0
 # ERROR: 0
============================================================================

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df0121211dca11df8a495d23ff5ac6d3d820a0a6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.50.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.51.bb
index aa2dc99f10..e499f61ff4 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
+SRC_URI[sha256sum] = "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.43.0


