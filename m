Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C20C44520
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:27:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12269.1784291241967501779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cpnNSptO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ec555a26so51203135e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784291240; x=1784896040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkuzwM4WEQnuydM3vyCELolHO6h3Ft2JiJMstDR5q9o=;
        b=cpnNSptOgxJIdkKb62FaS5gPjGIvUhwXkCTF8qZ74zLXT2vB2H4CN84Dv7bNG2r1j3
         SDZdPU8/jkfHcIfX5B4Wq7QOr4xRvWG/NEXic2c5hEO33M9eYUBIkLRua8AwNfXYi0N+
         GS8pYf+hPp99MqmgcDmKZKYdddQ0oACACcQGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784291240; x=1784896040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PkuzwM4WEQnuydM3vyCELolHO6h3Ft2JiJMstDR5q9o=;
        b=UBdbRW4Sbn4BUOPths19xTnPIr6tQ5vx7Tq6Rt3OxYW0EWegr0t2kyiQ78h1dl9gNB
         HCqhLwZkFHg9XG55Ub1oEJg8cY8tDl0hq0XtiK80J6sgf+kVtVjJlh/ZZVZQNhYHiCnW
         UN+Jg3v/IyccUfEHnnH9E65KHoV3BnnPB49jqD86Z7fV8g44Uwm2tMv3mrIg9Q9J4xab
         xCQAOHABNISg4kVgBXOn7llzevOq/8WQt3/VSBqAd/+pAg2T0wekdJG5P8Ocne+2jjhJ
         qxgMO1uTZnt2VpfdwP5G4S+Fewi+tPvJHy6+4CK48v4ixJpi3No5m4TjbGID1+s1TVaD
         MFPA==
X-Gm-Message-State: AOJu0Yw5HYFxa2+kJQ/UwZIe8q7ahKDCvz9Edvaqa8Iuj63BP1FyJidz
	MPsJsL095VRETk7V9zyrsjaUYQeR+S1LehGnNJ47bkkmMWrJJ6rrzqeaR0yV7Xy1KOPbdW7yk51
	Oxjca+M4=
X-Gm-Gg: AfdE7ckU+/Y/fCFVOWlueXa0JrV6nYb7hN5I/rpq5Iu2F91sa4201r/Hn6vKi773rpn
	6sMgSzqck5N9R1DBi8X5aQUhdt1D0m2MPpEehhP72K5jT0mbMWYFfF5W/Ya1R2z8YegjfQAJ6Qd
	+1vFOjC4nkBqau32brw/wAm1QDmk4M5PpbMe/UFIvJ7gH2QaWzyzVLr4bXYRCY/k1yCCInLL99E
	pSoLZJtPpoEU9uwYvI19YSul3/Qmthudny6wMFMCwh83EJnLDGcllgXJmz/xVA0VwDofnRva5uU
	rWY7lKFpWz6j1lI/l4JHkGUka6vpdCS8Snu5XucojNQUzOXCwWborDZJgvBtemgvPDR/NDERq8N
	qKVNtMCX/T/ryvVtvLnFcaff6KoETQ/sBm68gm1M974zuyUkhvMCsfdCR27r2qUSfipHFbIVR2b
	PWL0kC+5dqoda4wUCtV6y30YLhh3MEOw==
X-Received: by 2002:a05:600c:81b:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-4954a3f1611mr20204315e9.16.1784291239971;
        Fri, 17 Jul 2026 05:27:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4f8:d22a:f372:6bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a359a6sm46842485e9.1.2026.07.17.05.27.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:27:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] enchant2: Update source checksum
Date: Fri, 17 Jul 2026 13:27:17 +0100
Message-ID: <20260717122717.3289548-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241168

To quote upstream:
"Note: the source tarball was updated on 13th July 2026 to add missing gnulib files required for building on Windows."

so we need to update our source checksums to match the revised tarball.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/enchant/enchant2_2.8.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.19.bb b/meta/recipes-support/enchant/enchant2_2.8.19.bb
index 51616ba8782..f5d5897fd06 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.19.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.19.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8e7f6cb0c3b79be3146eb3ab93650484adbc59dae5f2c1958fde557080ba678c"
+SRC_URI[sha256sum] = "c8d70991d544ee39274b96bd01d2858a009fe732ff43f2aaf605fd61ecd06f60"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 

