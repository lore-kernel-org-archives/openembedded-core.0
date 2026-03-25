Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4DA103A993
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:19:59 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13729.1774405198029979086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qxacjubH;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82a67ce6969so1389730b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405197; x=1775009997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKK9R1lIALhuheNxFrOInom3XjU9MRr6rNnEkTnqOag=;
        b=qxacjubH2XZWp9SDd/Wudwc4B/iNzMCoZRfwnDrv+iwFMZJxi+8/4vbcsO+Xnee54v
         PeV0+zh5CNhXt3P+3rfH+XmCJ83A+NLsVKAlbEmwenpTLe4lycMdA/hPoIGT6phEpY+m
         DLhT3Bl9gfTCWQck0M0Dl0JrLUgGWF3TX6ZqFwItf7PyTAlGCfaImP3dhu+81K2J5Kix
         q2eu6DNLhnaetQb1cVNibxIg72ED0wgTW5T3TlER6tYsZu0t1xIeNicbDkRvF1c/mLyI
         6hN5OWd+XWno/a9hvUL/5keykvJz4ABpB6LilqAl/M2e+7HL9/C1PNiuVuBzi8ouCjkZ
         s4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405197; x=1775009997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKK9R1lIALhuheNxFrOInom3XjU9MRr6rNnEkTnqOag=;
        b=YX0NA33o3d2D98E6E2nLRLKDcX6Q+Ix9+yKoOSC68fiPgdSSMMEvRDkql812EYh57G
         C4+i6Jmjooj5snLUedS3zghkwGK56FMHzcX8cOuhZysn+QMNaQLsFB+uBslcSUw9LjGe
         sJSScWrQeDzlJz27+8ThKdZoZr9xkxd/iGhDMFn5uVqFIHMkrYEAiSGMiVpEiUgPHmig
         3OeBbPD9hFPTH4uN1Br06NFycz7iiU+Ky/OteiNhCIcW7XhvfBldY0bZkbs6ED4Neac8
         ue0rkeMsvJ/jWki+qhC8ZDhfMV1AYbfKHfwxWqm6hnKmpJFJBOc9BQPOjOdPp+TpgtkT
         nTZQ==
X-Gm-Message-State: AOJu0YyNJ4a/qokde/1LF3iC1zSsHe1wCCXAlDxdGFbIQJ2rc5py6f3Y
	DmPOvtjD0FwVcidBzDYc8Q3kKZBFt1B8/8E+z3ieAyLIoOxprUYi2znbyaVQK+y/
X-Gm-Gg: ATEYQzzgLjWHH02paF9F9woHcW/SQBi/63V2oWCYtRRWtcMZEmSZi778G7C25Ae19A/
	jQlYExDHfCmequROGtHbtgFay2v6QXRywlcR0lq9C6P5TWU9Yph+x6mLVl25hUQOdzZOjsJ4GfL
	iUYhPzJ4LZooYGt8vEL4oY+qEODA6CzmQC6CxcL9GIu7KWaaR1lVs6LRrvQNld6B97WF7mLyitw
	dd0KuWQ71Q/h/2mYcIzGED6gglTFWsSTgdjsIpEv860Xex/Ym1LNlBfiXqRBMBhGrTXWjqq+vW9
	vJbH1JsFZp6inXm9suWnfbC4gOTXsYd4Btg7z8X4Bvf19TdT/dYOWThJfJVWhKsPnI30Zo8n1nD
	ZTp2mHKFCqSG7tG5um5fVjgFmit8NyvYv0co/ZHoNtZrhjbnuLveWpqE0mI07OAw7ewHVPlU5Gk
	JqQ22pNSqrvUjcqUMVsRYlLEojMmyC9IY/fSo=
X-Received: by 2002:a05:6a00:4287:b0:82a:805a:7e2 with SMTP id d2e1a72fcca58-82c6de6dbd4mr1735469b3a.9.1774405197276;
        Tue, 24 Mar 2026 19:19:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 09/12] seatd: upgrade 0.9.1 -> 0.9.2
Date: Wed, 25 Mar 2026 15:18:53 +1300
Message-ID: <20260325021856.4053666-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233847

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 719713495ebd46addc779b60360d4dde81170d72)

Bugfix release:
https://git.sr.ht/~kennylevinsen/seatd/refs/0.9.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/seatd/{seatd_0.9.1.bb => seatd_0.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.9.1.bb => seatd_0.9.2.bb} (97%)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.2.bb
similarity index 97%
rename from meta/recipes-core/seatd/seatd_0.9.1.bb
rename to meta/recipes-core/seatd/seatd_0.9.2.bb
index 3be27dda9d..9e1b50c087 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
+SRCREV = "a3c56c324c3a84474cc1615d94ccd6a6255d0c10"
 
 inherit meson pkgconfig systemd update-rc.d useradd
 

