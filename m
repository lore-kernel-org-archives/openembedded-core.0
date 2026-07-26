Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D6FC54F52
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7134.1785054611714022738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=05OrAwqY;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4955de8797cso10339975e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054610; x=1785659410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CDl7RmghXFPX+21Wq+ylkiU9SfrKs6osndR0u+9BAJs=;
        b=05OrAwqYt+Zj2yWud8c4QznKB5WH8syHe8vDyyl4CvWFDVwvkR0+upOs1ry5cCsp0R
         lr1sDiV81+xGGtB/WAkx/hUshgsDAidvy6OZbgUYcRZrKjOHFxHNSRZN0e0cU3ntsYxk
         xMAdYZjX4X+n4n7ge1RsHpDDxr2MP3dgfmNXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054610; x=1785659410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CDl7RmghXFPX+21Wq+ylkiU9SfrKs6osndR0u+9BAJs=;
        b=Fg1bYb/Z+nwxzA5W7vjA+67RJ1I0y1YE04MRt3xuxRmViDfifsWJBb2t2aWfxo8FLf
         vewa0T3ivbvrkcNg/h1QrMOol0v3mjJ+j5VedAHAffKPXf3OXVaGQM9J4RudbTxagMIP
         FK9u5xIFlMIrgl23VQRW/ebJ9OPAAn8tZRCdIn0DZrSBXnzZGPEj/vgSqL6Xw3m0nK9j
         IO/JQKcjb4HN2tXFpuMeaxCtRB2uty/heEIRB1ruqriMAjxWCz4Z/lNl8h1ieDz/hZ4y
         bWPZyt2Gap6KzEZJFbXrfAFyztcJRzo+G+XdC/GWQK7GXhVlKG/K6cm81jwdBn1kYJk/
         j0FA==
X-Gm-Message-State: AOJu0YygxlCSkmu0M5mk6O/SWiPvTsGLjlKsx579lfkL+O1xkkYOo7HD
	CNXYTwTrqqER4PcDM1cZn9RYZKGrNmG1eQwJgjkHuE6jERL4YJwprUFTYWjdDCD297Be/TZ8XHF
	IRG/mCFw=
X-Gm-Gg: AR+sD121TOZMgfTMn3KjP//g6Gz1QbeTrMKY3QRufLUSQ/2WYbPgTVrZQGBlYI9pBBu
	f0jM7Y/N+2XZAioQo0Xj/5/ep53tBD7pB+tKZcqOKqcytqaE5AuNxo+pFvLwacgtvSQURB5yHj3
	OUD/O63yG2FIL58T3qLbPA4dg950YWwVBtyjWr/dkpI4g1rSfDuNNmovCzCdVLpmVHxL2BK/ok4
	Hv9+8yBmIpomQK4lJ2S71ANV46cF8txenDyHdSgAZGRmVDRFZeYx3+J2cCh7bvRckUtZqMndRQo
	uQxaaQjxTXswvP7NazDMnU+5EFJpjWL+mbg8aJ3LL2qHtE8WTlibUK3GnxkpEo79tb5e+DsV0D8
	ji+h5q7aJge470K6GQ8rBXPr21IhXB66qEJIxmK6ruEN0hfz25FvMXEDTD4IAAj9wxwjLJvNP7l
	uYuCzVgKnuFv6lNRTJctppUPPGm9/GFo47jjA65xhcYZutHxOYEermeUB+fxFZOTq8PFfNISF5v
	eu65Q==
X-Received: by 2002:a05:600c:a20d:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-496b5735154mr38473575e9.38.1785054609962;
        Sun, 26 Jul 2026 01:30:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/31] scripts/install-buildtools: Update to 5.0.19
Date: Sun, 26 Jul 2026 10:29:25 +0200
Message-ID: <250d7a18a7a1478f4bce0be8b07a12654059727d.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241983

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 5.0.19 release of the 5.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 24cb3099453..65200e0cf49 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.18'
-DEFAULT_INSTALLER_VERSION = '5.0.18'
+DEFAULT_RELEASE = 'yocto-5.0.19'
+DEFAULT_INSTALLER_VERSION = '5.0.19'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

