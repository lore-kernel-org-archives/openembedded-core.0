Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30D5C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:38:24 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7655.1787409494505112495
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KFhunb/4;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c0c45c580so12566031cf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787409493; x=1788014293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zF1/6qlD0j+VjiaxDmvSNEAxd1ZUqsD+rdDaYUZoE7o=;
        b=KFhunb/48peQfBQitxHYWvQ9Xob+NuIWwkcWnoXVaDHgEhcjih5l9YwNSfC3tFUL93
         iTjqT1ydz+Xq+KUd8v33l/vtfb3HX840W9M5bM80go+xfIVOGBkiXQATsneWUhbsOn8n
         rF5ZUYTOAInm6rYXI+4A+J/m9iW2rj47Yh9AlaIrDKdxKTIB/lESYTIAa8wnPS3FaGtR
         kUtDSTDw6kVdA/IFBiN/z+/p/BSuPgq5mqfJs1CjADwTJDLgYI6NrA/y0GT7ugQn2WXI
         u1/U+aNWHlOacj2JNKwUOEiWnPcpM/XyLDJxd2H6eEUUHwIc3GO0PAnNwakl0U8X5Rl6
         qJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787409493; x=1788014293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zF1/6qlD0j+VjiaxDmvSNEAxd1ZUqsD+rdDaYUZoE7o=;
        b=hKs8V0o/soqjNVcRQ3xAT/WOG7pYwQtu6OXZxb9denrHiPORCCBDkE5eMSwAXiC36b
         4sA0yNmBVC1RXzzcPS37a8+4p8YP8/SVsb1kSXLVT5E/b5xmZoVF36uzIzIBFShdpD5U
         kjrp2hUzSMeOqA+azWoLylopVZjfevtTmni5Uo1woPkXaK88NWC5wO1jngm57HlaxSOO
         sLc9ym8WsabRrGm6grizE7KKMnE/MXx1xPsyiHM4fcS+geD2wgPzIUCewR1X7EhwHXPx
         CdnFsV4Dt0jh8NgjO8njT8ccWtvdYqTz1TXgSIQ3DKfehjLDca64s9OYqKVD3LGLDh6t
         U4gQ==
X-Gm-Message-State: AFuF++k97w7Yj5T+6vsj5NdAH2v/HyZ3nEySk1bh22RZuBvuKYYzXOBX
	Ksbjq5BKyYM9U/mzS8McymIilkYNWfJ0+ztvlGl4PqnuVlcZI1kzJ3eDbbCKLgg3
X-Gm-Gg: AR+sD10u1t7e+IW31lLPuHG3g17tSqKvF1yA+JTfIcqh+2X5wPWXDBcuBrP7RJEdfFP
	8Hq6aPsza9VUVthPcuwWTbOdsbeFlC8GwGwCMRCEC9W+hJtEQxQ/iPAy+fONjhA4QMb+7coeWHB
	0sHkuIL5rjdUB0XI3XwTCrbdQCAGfrp1VLEAZy2wN0p2gHq7KDNwGKm77J/PXy/6V04hmHBySA2
	VaBJ2uYgDFbRAClzuHa4be8zC1JHXn6gDqpII7wY4wQrhB/vncysi0HcxAU0qf5/b61jx2/do8v
	aUgLFlyo+A4l1N2pRyW3I+S6jGh91CpfTWUI/m7wBstt0OCKlwFmM5IvDVWVAiz7jlupoNEL2Vj
	5LMcOOp/5SwWHX6B/cZR8nN61R/X9lGVnLJpDaD2qTK15THQw6Hq7FYpuln0+IuKHEJu3lmuIBT
	ACGO7/mqpK50pKNCx2c9ZrCcQKcctqOPg7p3fk/QgCI3N3bSF2vC3kkP7A0vdVRsJ7bdIw3U1kN
	5ouYgB8HSnIEAAeyprxP3pEnF3Am6Q=
X-Received: by 2002:a05:622a:2614:b0:52d:8854:3e61 with SMTP id d75a77b69052e-52df59ec943mr139222361cf.22.1787409493333;
        Sat, 22 Aug 2026 07:38:13 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e099c38c0sm14728811cf.13.2026.08.22.07.38.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 07:38:12 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/2] fix the SDK kernel module test
Date: Sat, 22 Aug 2026 10:38:05 -0400
Message-ID: <20260822143807.2256028-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243983

The kernel module test in the SDK test suite does not pass today.

The cryptodev revision it builds no longer builds against kernel 6.18,
and the kernel's host tools are compiled with a pkg-config that the SDK
environment has pointed at the target sysroot, so a host compile is
handed target include paths and fails under -Werror. OE-Core already
solves the second one for its own kernel builds, where kernel.bbclass
passes HOSTPKG_CONFIG=pkg-config-native; the SDK simply had no
equivalent.

These are independent of any SDK feature work and fix a test that is
broken in master today.

Changes in v3:
 - the kernel module test asks for pkg-config-native, the wrapper
   kernel.bbclass already gives its own host tools, rather than spelling
   out an env -u invocation of the SDK's own pkg-config

Changes in v2:
 - the SDK environment script no longer exports HOSTPKG_CONFIG. That
   half only ever took effect against a proposed kernel change that has
   since been abandoned, so nothing honoured it. The make command line
   assignment, which is what makes the test work, is unchanged
 - the second patch loses its toolchain-scripts subject prefix, since it
   no longer touches that file

Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Trevor Woerner (2):
  oeqa/sdk: update cryptodev to a revision that builds on kernel 6.18
  oeqa/sdk: build the kernel's host tools with a host pkg-config

 meta/lib/oeqa/sdk/cases/kmod.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


