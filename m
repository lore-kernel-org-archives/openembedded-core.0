Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9B1C43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:01 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.16781.1667744281328696036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1TR3qNLE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso8219328pjc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHwrUiH7C42llFKEQt9e6tOuOnwp60mFLvoWIzjx5A8=;
        b=1TR3qNLE+yrS3CYb2HGbDTuLE9I7xIdb98c9ArwvtL+t/zZJrccX7Whgh1vtwXEj2P
         FlRtvK74lhUb7dTI1zRiQeFCNr2Wl4WplqMUx6t8d1E0qVEqQcHS4YP7G86EGveBl7mZ
         Z+cI4oDOijoyn2QhC9Tpn4j0RpYzw1JlbviD5afBt8qNXdyVAtiJQJP355zfYrYIzWWx
         T+fzDOZnYiSn6sVhwDr80Vbotii0FQ72ZU3kB4Fr0Om2jz16B4YDIK/Ubn5KoR65meeX
         eO/z4ygGvYx0T14jhZZZLZ/MJ5Lpv0XrGmpHtDgBmNvhpfWSPB7FzYM+3UTZyBXTId75
         H00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHwrUiH7C42llFKEQt9e6tOuOnwp60mFLvoWIzjx5A8=;
        b=Db2pOf6HWqX+B6FFdCp0zIm5io24a7SI0e7Gx2oHCy0St3vNZl6ERwstSjUXIOzIa2
         muAlivY+uI6uEoey5vNKj26PwZkelbEIbHjRDWvoCMpCxU1Q909EIR2ImuzvaP32tF77
         nMGVSQlCYQz79btiq0ZL6vWArl1ur7IhWTCmkpsWWBkY3Ft0JllPVTq4YfOKAAtwm9Cy
         JJ5v3Nz7l0LMY1xfsQJrCBM/HiDT+O1j31tR0UNhSPkXTxbkt69sML8rGEkx0UrrDLw+
         77b7Os+/9RyygOyJU5Sh1IRTL+JvY0eTMaTLT83HuqdTWU2S913wf9pO2SfYu8K7EJHe
         hmeA==
X-Gm-Message-State: ACrzQf0mLuJNgnxvBhEF6fDZvw77Q/LG1UXy4qERh2n4XIn0H1W1BS7s
	wcSsikjPemNR4WvVUnuBiits2SsRfdPgCoEp
X-Google-Smtp-Source: AMsMyM6dbDJuv5zSGr/Wxx5vEZkQ1Epyd0fD6hk7a7GSVbXcqEywbJUS91gIhP8SD2nI4IEkh5vn/A==
X-Received: by 2002:a17:90a:8418:b0:214:536f:2743 with SMTP id j24-20020a17090a841800b00214536f2743mr22426773pjn.175.1667744280483;
        Sun, 06 Nov 2022 06:18:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/34] buildconf: compare abspath
Date: Sun,  6 Nov 2022 04:16:58 -1000
Message-Id: <803975aff35c9423f4bde4c0201d0f61242389e0.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172783

From: Adrian Freihofer <adrian.freihofer@gmail.com>

We have something like ${TOPDIR}/../../poky/meta in the bblayers.conf
file. This does not work without normalizing the path for comparison.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e0d45bcd34311ae248bac9378f46962198d148ef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/bblayers/buildconf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
index e07fc534e1..ccab332adf 100644
--- a/meta/lib/bblayers/buildconf.py
+++ b/meta/lib/bblayers/buildconf.py
@@ -64,7 +64,7 @@ TEMPLATECONF={} . {}/oe-init-build-env build-try-{}"""
         oecore = None
 
         for l in layers:
-            if l[0] == os.path.abspath(args.layerpath):
+            if os.path.abspath(l[0]) == os.path.abspath(args.layerpath):
                 targetlayer = l[0]
             if l[1] == 'meta':
                 oecore = os.path.dirname(l[0])
-- 
2.25.1


