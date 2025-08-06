Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6872C87FDA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:56:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.29048.1754495777298383020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 08:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q1LRPMzd;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b8de6f7556so2199179f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1754495775; x=1755100575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbSv6W+aWkEUvg0cPX8b46j0iFFjJY/MHZH1+QWcXDc=;
        b=q1LRPMzdU432JrJ5VRf2pkJfOYmXJ9zzzDQKCFzGfmym++WgmLIc8opIrxGrDsjy8H
         zNpaUQEmbNd2/lX7CU5cXPbwZXOConSIA9UtEDSZaUnn/nVaAX9Gu+7xnGFpQp9mbdyE
         6srnCvi08xkPIaF4N0hVqyDa03KXZ21Miz+NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754495775; x=1755100575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbSv6W+aWkEUvg0cPX8b46j0iFFjJY/MHZH1+QWcXDc=;
        b=UveXYDcG6VKm9fs2KTgQp4zCwEq66s56SQv6c44B5axuy4t3lWEM67NUkYr9YFr3yn
         4D+BngMgot6MztfdNvG5lAYax61HL/a4N9O7NMOAD7/7yoY7dczuH45BOuLE6HGUN1LI
         gW5UPma4aMqBWOn+x9LeljXfS9PfOfmT59G2iOAOElJPtN8zcUNIo5j6q8CK5/FqbQhE
         OOdKWzN0EGH07F1BeC15RNWNg4k94wg3JgeGU1w/tG/0EHXO0Yecwk6KPGhd2IunJkaK
         Mx5m3cDps0TnOWWmHvyRKaM2VPSYGDTu1MxtwfAD0MJehU1IFXrm8glGvqYze0z8471P
         ovhA==
X-Gm-Message-State: AOJu0YxtAxWoXD7iCY18wGfiMNzANqGBmonFnGtyoXNH9lEqALT84ymW
	cp4Kxw5yIWtQW25cTi3GO3jY0EzaM48TcdLmRXPJkLGnlX0C/Wv2gUqjh5pAA/Sh/kgZOlQwswE
	BecWcgqTDPA==
X-Gm-Gg: ASbGncvsPHicegzrPL17Z+08UF3FyYGTGO8kmA+NccN7xSh7M2gDBmvFsOIGf8/jFk5
	pLUGH8YNxf4czMxRlIPegSDNgHGh+JOkKtIZLYNEi84/Vet4VV8nEchF4K7XcnI7brWVdlR45Z8
	l7p1IZbYexNFwV9WDcBUbt2jZCT4QOKWqeAgcPbz6waCXhR8Fy5qPiwhpWtwG2z0+rKezo3ZF10
	iQRhwk9Aqh7qfV9bcqOHj4m83fEIMd1QGFad71R8bkxISNMyhzkL++rIpgeSmmtbjVybH+uH6p0
	+Ym1IAGDfGuq0B8WAsHHOvDdC0u0gSTvIXd8w+uv8LNFnjnpGjI0fXqK2kucNnbSkZEnI1HlECS
	BBWFBkQtag6zAcRICK4i3EiOiKBSYiSxIGigGpmp96iS5HH8Lndlb4w==
X-Google-Smtp-Source: AGHT+IGJLPlwhWiOaWaI4cmoqVVIdWG6pGPwHVgXMsE2M7e1zfNDqi0Y6YP0P/I5uz7hrfYMv/C5HQ==
X-Received: by 2002:a05:6000:2204:b0:3a6:d93e:5282 with SMTP id ffacd0b85a97d-3b8f420f197mr2707510f8f.59.1754495775456;
        Wed, 06 Aug 2025 08:56:15 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c98:1830:6f9b:f71f:aebe:8ae2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bc12csm24010476f8f.28.2025.08.06.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:56:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [master-next][PATCH 1/2] runqemu: use "zstd -o" to preserve sparse images
Date: Wed,  6 Aug 2025 17:55:48 +0200
Message-Id: <20250806155549.3395012-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 15:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221546

From: Yoann Congal <yoann.congal@smile.fr>

wic images can be sparse. Using "zstd -o" preserves the sparse state of
the image and should decrease decompression time.

Suggested-by: Adrian Freihofer <adrian.freihofer@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/runqemu | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 827300080a..4fb85177e3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -448,8 +448,7 @@ class BaseConfig(object):
             if not shutil.which('zstd'):
                 raise RunQemuError(f"'zstd' is required to decompress {self.rootfs} but was not found in PATH")
             try:
-                with open(uncompressed_path, 'wb') as out_file:
-                    subprocess.check_call(['zstd', '-d', '-c', image_path], stdout=out_file)
+                subprocess.check_call(['zstd', '-d', image_path, '-o', uncompressed_path])
             except subprocess.CalledProcessError as e:
                 self.cleanup_files.append(uncompressed_path)
                 raise RunQemuError(f"Failed to decompress {self.rootfs}: {e}")

