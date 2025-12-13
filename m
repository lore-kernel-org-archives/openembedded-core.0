Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7182D5B143
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:29 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2923.1765620146041916480
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JwNrp9Z0;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297e264528aso21753255ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620145; x=1766224945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syRGD1ZA/ybRI+Ciyc7+8izAHDf6oFFXF+FvmNyaZNo=;
        b=JwNrp9Z0pBOyFY08bSHzqcZnBQSsyQN1Im8UllkT4fy5d/1J6q2XJn9Q7e9OPNanEK
         73aLxiJ4uteEXCL6kJgZRpPVJ2fCv/6j6U+eMkV9FIQw1182+/7fEwAGlomSSZiTuxTB
         2hPs1EEQXY/kyDx0fzd90RQTP2cKDQ5W6XPxWKF08luiZx3DOtSMdIQhWm8k00VXrlJX
         gpz4fegbunwxwfHC9Kwqjot3AfdjfsJ54Haf9vS7At9lnNFAvrkg7dPtSClBl5t3Gebi
         9QupaHTaHoBhIMqcwzQbFsplTwTFcaQV41LSjCemkk1ScWjGGsEvbX1P2LdUjCDNwtUb
         cEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620145; x=1766224945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syRGD1ZA/ybRI+Ciyc7+8izAHDf6oFFXF+FvmNyaZNo=;
        b=XBkIVT9fEE+BBPDk5tzKCZfyw5+sHwTBDtm1wCOXdObhblmDUF6Ji53gIlzT1N0XoU
         5Qjn90YiKGuJjq77tjWzZFwVRuJYqXBAdNNI/Wtq4/k1Cp9Xtsk5CXgDGsNYIFQPGFe1
         WHuzr+KIcPJNl7NfoDb+/nhYxsp7zvKgtssfn5qOOotO2EHoxp5HsinwJ5oZTs384g9s
         9/GoBKgnzz/OOvx7l2QdqXyJRlJ/a8fJXSxX4PlbgUFCZQbOYxpzA+OSiuqAYZXIOrcj
         mSAoPgMpwkHaFQenCDpd91IHcHxK+WMT9KbyI9cv7hUEdL/vlswwlGB8q4P9kYGbbJ+i
         yBiA==
X-Gm-Message-State: AOJu0YyjVLvjhdn7Dh9zBHCM2CuvgK8atuEPMvL1nxacOdcHVyDD2vYe
	61YN2E156pJB5wGKSpII3/Q6EsRhQQ8Yx+nBiew6MzskANDqnUfdhUzw4SGCblJM
X-Gm-Gg: AY/fxX6NOZOCq+zcGmLtZd+Nc0uDON0Ww3vr0cI29hJce55is7TL3UXso02ap32PM6e
	3ElAxZVqidkv7oz6nSedO+qeatbg8I/dsJ9auH//BuofB0/HMXYABjNIQoS7YmJs9kuFtYCOIbs
	lZiVKBEswijfeZsxV8kECl5YKcHoBRvJQys0L6XI3goBZn2qdSy7DVOPtArzvYorFWqwiJbz9zu
	xCXQYEnprwF3P7N4DaW3dG97K32Rv2TYiimNZqDd0tGYI+mDyYmvn1dbeR5lsTB+PHrik3yCvgc
	ENo6yujMkFC6lvxhGuJFgbaCJ5dUSt9v+JK0q6kz6tnLzmgkdH08Y6y8aRfTYz2UIK1OTj/bfbu
	xw9zzUr50vNZJeKWkPqGHO1u3NsY+7hBJ2rtoiY8nUqW5/ZPjRAPuu+BBZY/08usNholYL5U/kc
	FRQrjx7FHdHsJQqEkEPl6WpqtF7tvmEQ3QwtM=
X-Google-Smtp-Source: AGHT+IFV4IdrqqCpNsbkksytZmfSz11MTjWeN1yoBdCxn8gH8U8JlcZ/+ZeFKZv62an008djxXhRhQ==
X-Received: by 2002:a17:902:d54a:b0:2a0:7f9e:518c with SMTP id d9443c01a7336-2a07f9e5437mr31761775ad.16.1765620145192;
        Sat, 13 Dec 2025 02:02:25 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:24 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Zhang Peng <peng.zhang1.cn@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 59/67] libpng: upgrade 1.6.50 -> 1.6.51
Date: Sat, 13 Dec 2025 15:29:23 +0530
Message-ID: <20251213095931.2571498-59-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227677

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
 

