Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D763DC87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:44:31 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.7399.1754750667435905311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WK76ZnW8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76bd9d723bfso2760697b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754750667; x=1755355467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmzvEi0d1vPikxnXRwDVtQn3BF6AuqgPgL9c0aZgim0=;
        b=WK76ZnW8c7opPCyHiW+thSdSEUAx/mdwjhlV7uVyFM8GiJzTVQDvxRhtSFMDwkAic9
         3PsYblnTanBj+Wb8y7V5rPQrB+o+Ff25Kq0urpEREds0Jeee42ffAohETbmMBN1aTSFg
         IGx4m209KH7u0fInr18ZUmAh/uf4115Ymyl3EjWLMfXyI4hyn4x9BUmWtaDkcU3xifl/
         r2rJySANVrNm+SvSXJVpZa6pRZb4siwLgHdm+GiRzKq/4X3tyT90EOpk8Ci5RwzbG8/X
         RJ7j4jSXUxZfOcgGjP2NuozYv3uS8zxwrE71EXxX9cgPbFD6+btX0KaYeG3PO+7JdS7F
         Bx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750667; x=1755355467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmzvEi0d1vPikxnXRwDVtQn3BF6AuqgPgL9c0aZgim0=;
        b=h/IRKU3Gh3BSUXuuwN/7/FS5K96ychFNd1/l6MwmMD+wDAbGtea9uS5nIrBuoOHe4N
         ACFViI9Vya9P8WA/6hITDbm72QR9L9NVESLYtAD88Zc3Ue2v/AZ1+LYAfzBM2J3ABoz5
         yuqAu7vR2hqitsNig0CklOGlaiQjmF3XBu6YI52dnksvnXAhoqMQKSmLaIoAwT+JaJcW
         quCZZsvg2y+sTnKz+qbcQbEOT2zUzJZ69urKYOwsw5rVPaSa1bu9dcd8YwNVp3JyEbOj
         V8WJiIRXVD5H+1ZTACS+OWL8I3tzekSIoe6oWOdMh10KF8uqWMwHHHXJ5LsSf36ZRD0E
         EfQg==
X-Gm-Message-State: AOJu0Yws1GgFyRLSXCG00NLSnC09muypgDzuawZ77Bwm2eujG5dTLrn3
	gGB3UGFaNznhWHCnLx8sMvJ6uAoR89hJY3CDOL5ucBVGe8Gt3GMEaoD3DkxtYCFPxMFnxoEHzXt
	EwPqv
X-Gm-Gg: ASbGncuO2rlFkotCIl1ls4n/GEj8zP57kcM6aim8CLfXExB9Ndp6T+zoY8NAkqjkGmZ
	WGGY0IGUPLP07iRCzvpdp1C+G/QMVgK154iXN274Bdpko8MMraRClRpYu6QhCuVQjXvuHCoY+ov
	bN5KUcXeJvNKNzwU06tCf/EjNQPsiSMlOGtC5wXixq61JSiA1WzJyxU45G1Flj2j9IoHYnxvb1B
	FhWd4rcLmvmlVEOZyT7J21/YanyDA+XhaUWb9HNGAo/z/cEtt6cEJlUPGZFaLd4xlHQ6MLaGq83
	Pnga24tx/6CdAicuwcidAy08uzXGzMtnUWPV/1I/HpARzEVpWERi4rC2XR9+MkF5xZqGrkGMWTJ
	5sQNe790hSzQZ9A==
X-Google-Smtp-Source: AGHT+IGtzINr2KlXIJsCBprd2ZiFcnnacPIr+Al5neZUT6nI0F+Siju2EmmjCyuEEMp+SRYgyIDKAw==
X-Received: by 2002:a17:903:3bcc:b0:242:e0f1:f4b9 with SMTP id d9443c01a7336-242e0f1f781mr3387965ad.20.1754750666483;
        Sat, 09 Aug 2025 07:44:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e40b:779f:346e:b2b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b428f4c8639sm5736428a12.43.2025.08.09.07.44.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 07:44:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/6] Patch review
Date: Sat,  9 Aug 2025 07:44:16 -0700
Message-ID: <cover.1754750560.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221675

Please review this set of changes for walnascar and have comments back by
end of day Tuesday, August 12

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2166

The following changes since commit 8bea495b4945e24b43398f40d634d7fdb73e981a:

  ltp: Skip semctl08 when __USE_TIME64_REDIRECTS is defined (2025-07-30 09:01:16 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Gyorgy Sarvari (1):
  gnutls: upgrade 3.8.9 -> 3.8.10

Jiaying Song (1):
  ca-certificates: correct the SRC_URI

Peter Marko (2):
  sqlite3: patch CVE-2025-6965
  glibc: stable 2.41 branch updates

Praveen Kumar (1):
  python3: fix CVE-2025-8194

Zhang Peng (1):
  avahi: fix CVE-2024-52615

 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52615.patch          | 228 ++++++++++++++++++
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.41.bb         |   2 +-
 .../python/python3/CVE-2025-8194.patch        | 224 +++++++++++++++++
 .../recipes-devtools/python/python3_3.13.4.bb |   1 +
 .../ca-certificates_20241223.bb               |   2 +-
 meta/recipes-support/gnutls/gnutls/run-ptest  |   1 +
 .../{gnutls_3.8.9.bb => gnutls_3.8.10.bb}     |   2 +-
 .../sqlite/sqlite3/CVE-2025-6965.patch        | 112 +++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
 11 files changed, 572 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb} (97%)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch

-- 
2.43.0


