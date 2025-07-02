Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38E7C83038
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:40 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.15053.1751425951593506182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A0knVPuc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso3774115b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425951; x=1752030751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNSWUnXJ3xOYZVEXX4gRy3F6yggtIF8qgenuDpR3kvM=;
        b=A0knVPuchi2fd80j3fc2mL8SGiyq8hjkxuXuj1avrfal6Kw4OMLyaNgX1AuojVj3Xb
         9hU3LDJnWWaO6e6Y/hQ/2QRHuH3MLqDioihghBbilj/OEoDvlM3FhghobAeU8eoFs2OJ
         zrrMQWEOzSWGFNGHK/su3VqZfb2NPTPru1senrTeSDxpHziOhyDqGLgShRhpEkdCp/KO
         atPNLnLQ50Vou6SynAbliQOd84AmYTckBit3Gz2y5k226NARleYmj0AOC19Vnc34xcuI
         WjP9KQm0I5lvI2pNEuNXzdYwcImBr3o4NmJpQ2PIKQbHmRM3QV3fe0bLRmwD+roPmcUJ
         LyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425951; x=1752030751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNSWUnXJ3xOYZVEXX4gRy3F6yggtIF8qgenuDpR3kvM=;
        b=Or1N1LWZDnx+FMZeAhfxEm2I8/r6fzcN0+jQtPMHGAAjZ4gMfW6OKD6Lm+2O5v5Owe
         MOJPM85FrrsZmvYVE+F0pd4ct9X8N7xwbmqBkmvPFCXQ/fZ1DBEjwnh/r7i4Joml/SjH
         YxD25lbBDdXxCY5Eo1H8ujTXU79poQCioI14zPr7IuS0hKyoOjtT1dU5HeGqGHOwbUxN
         htlSlTMLdkvW7CUJIo5FxnrLMVM7lPfLiTt9f7cMQgIG9rLAJw/UanVWiS6qcQlkmerr
         zMklnZ6CKZae++eYSL6172uuHIoGSVRcNjiwBjYD1U5fVFclwVv0vstLJ5v0TEemThMb
         cCZw==
X-Gm-Message-State: AOJu0YxhElZy3fzpM1L7Ve9wgyGLaGRgZ2osUX11tojx5M7t7bSDJ3D7
	xgTD6Kyh8hxfpyshnmn1di2udyPWBqHP7EYYbx3ChqypQrydWw/uf50oLpyDP4QAvpejeiROOLo
	3Mo6y
X-Gm-Gg: ASbGncvsuBnWuHTcSlPDxT3Es/bGRW+o7SPgyKYB0z8+EceB66Ec+3dCc3G61DTEoC/
	cs2899UgdXSv29WG9cN0ArtUQ+bLaLqCmWz1YcqQwbg40k7KjTaQxxVJq+AkZ5Vkvu2nlGHdm7/
	HfNDtn1YthEhIiyc9Ikej1/dIzCLn0i1cgRP5QpAOW2nVqEptcUDh8iViuejGj5QJ4X0C3VpUaJ
	D26I3xN1gXV6NBMKHlxBt7kCDfZtauRGVXg7NGeG5yLHS0MjR4i8NAGP74La18BKcrP6fk2iCRR
	4R8Etnje2F6EGi1hZX1JLnUYAvcZrfgInw7OF/P1wsaB63Eq5fRsrA==
X-Google-Smtp-Source: AGHT+IHFfBsM48wlJ38n5nw4HF6aFKDtIjHjYeOe+7QXOtZBB2OaWycqo9yHedioS9nqPFpo3Z3YtA==
X-Received: by 2002:a05:6a00:c94:b0:742:4545:2d2b with SMTP id d2e1a72fcca58-74b50e5cd3dmr1792312b3a.3.1751425950839;
        Tue, 01 Jul 2025 20:12:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/19] linux/cve-exclusion: correct fixed-version calculation
Date: Tue,  1 Jul 2025 20:11:51 -0700
Message-ID: <4e2c441b64675933cc5f684d0e19cdc18ceaab18.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219760

From: Peter Marko <peter.marko@siemens.com>

Current code takes the first version found as "fixed-version".
That is not correct as it is almost always only the oldest backport.
Fix it by unconditionally shift the assigmnet of variable "fixed" so
that we take last instead of first version.

Cc: daniel.turull@ericsson.com
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68f8e58a249c8adef18e63f0841e8bfea16f354e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index 82fb4264e3..5c85c0db88 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -67,10 +67,9 @@ def get_fixed_versions(cve_info, base_version):
 
                 if not first_affected:
                     first_affected = v
-                    fixed = less_than
+                fixed = less_than
                 if base_version < v and v < next_version:
                     first_affected = v
-                    fixed = less_than
                     fixed_backport = less_than
 
     return first_affected, fixed, fixed_backport
-- 
2.43.0


