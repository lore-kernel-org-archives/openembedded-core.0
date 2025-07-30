Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC64C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.47074.1753910967694116191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I4+ormyF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24009eeb2a7so2808945ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910967; x=1754515767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRpbjggcAPvxaBEZZFJjZNlUoy1yVXJyUaHtdlGq7XA=;
        b=I4+ormyF3ym2YYptUSZ8OWxnQ6Kav7zoygSXly8k2x4TkoR9d3OeCZHRhMUm+NuOae
         ufbM7/PnUmhTLoOg8sYklHqeDa9D4DLGNPMolqtcw1u+m/XssjMn1t/uBTXakgA6bnc9
         rOoZs+zzrwepMs2mR6MrxMr2Flr8+vyUl/sEH2dx/FlMlH0+VcNA+GgqZFN+t5K/d/i/
         UL4YgAWZmnvL6bJwkXvo9dAr2I705J6Uqf0wPhMOL7oRBKX0GfNrYiaQmfWJM7NypM6P
         /yZ0LRvu3tsz0LaheZTWfdo8FobZLKbhXhlTLUAQAJbYIFwfBB63h/dsdZKSW8JnU2Ny
         BlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910967; x=1754515767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRpbjggcAPvxaBEZZFJjZNlUoy1yVXJyUaHtdlGq7XA=;
        b=scroiiDeRtPSztzVndgu+0mAGd55pmGnwjp4oqViaKHd6B+NXAb2GZOyWaS2CoDc/z
         V3S99X2/YWyJHtGFi+5zm71wqNTF+vE5DWD7wM6cGLedxt8RiJxCrrgkEAWRvyUwfmsS
         AfXx3zsOXSxNlE27G4E/hlB3yzrkTT22pHTOAh5PQLqq97vvOqD1LXNZW0TEY+yDkQB4
         NVM9589G3JkdtBfSJsliWB+zouPQG0/uR8qp0PBwBRLHuTSDKUpGECw8yBA9EV3dKp6U
         JdXv5CPPVNMP0sHNFp77mltYGJs4dRflM5hGmfBYevcwo7iKXZP7U1IUPs4JD0mVi1II
         6z+w==
X-Gm-Message-State: AOJu0YzQEm8NFQd5Uncz0PXhRJ+vtTYwBSEQ5HAmoJoiqaRItIsaIpFf
	V3s1X26JthT6aFh66jAMbzipKaDuCNHJ6UtDQtESk0if3dUPp5m+eUtHpiXJxwc7I49rn5l+kAG
	BwCvK
X-Gm-Gg: ASbGnctpd8jcZXfZh82q7k2bjG8R7IMJnKAiIjJcD+pg/gdfPdwo8jg4b6+d6ajCkqL
	vxcR6SgDBB4mpNQna1AHTo5G4O3XscozaV6MS7WAx4GF7mEoo4f4zgAISZDac2Zc5s+yYFrxme3
	2eBIJWfYkMLjTHRCNXpbSeEFVpHunU4QMWlIDfS/scX5Q+WUPchQCclDb+5Vae0pQPAq5JduWf9
	cmNCkxCxy9vKpy83JZW08dJYOA1b4gqS2FP7GuSpf0E6tMmHPk/1c1MLxsuPDGELwOWV/TWW3I4
	mV78wZ5tSN+5ielYy5aAHkhvTmMfHv/Vc9egXOYOM0KUabvxn/TtdLaaiD4OMBf+V5H/G/AVJvO
	+3IsuGbF9yEph
X-Google-Smtp-Source: AGHT+IE4L4HSYJ9hHVt9aKyVQfUrbOxQ1O62oqS/F9/su/egshX3Ybi6tN8NmRS074koth/q4E3k+Q==
X-Received: by 2002:a17:902:e848:b0:234:9656:7db9 with SMTP id d9443c01a7336-24096b03cf4mr73361745ad.32.1753910966926;
        Wed, 30 Jul 2025 14:29:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/11] scripts/install-buildtools: Update to 5.0.11
Date: Wed, 30 Jul 2025 14:29:01 -0700
Message-ID: <3b3a672ae6c024096cc263a669b1131e3f653b79.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221169

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.11 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b699b34270..0dd23fe0e4 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.10'
-DEFAULT_INSTALLER_VERSION = '5.0.10'
+DEFAULT_RELEASE = 'yocto-5.0.11'
+DEFAULT_INSTALLER_VERSION = '5.0.11'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


