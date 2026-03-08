Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04B5F5513E
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 09:57:21 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32660.1772963835031102431
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 01:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tbACE49w;
 spf=pass (domain: konsulko.com, ip: 209.85.222.179, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb4136d865so1434601685a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 01:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772963834; x=1773568634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zORC2mmbQOUoYQCiFLiWi6VPiY7Q7R19jlnWcqc3zXo=;
        b=tbACE49w1HmxoMXjLFHWKqTQJXrq1PXag6Vy+MtKnm9k6vRglwIfkwsKcaHIemRLjk
         lzxoIKrrLiBX8r82G/YKH1bx7sGcioUSAAdHxphcCDp41mSQ1Gt0txN6BrdgD5eqyIVd
         qCr3mmNBfti0jel/E1yAfjVDpRuuLwCD1gKBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772963834; x=1773568634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zORC2mmbQOUoYQCiFLiWi6VPiY7Q7R19jlnWcqc3zXo=;
        b=tDMMqnYOJ66B+qFa0VtWEjDZ1ckF1T0zFO0d944jenBjaGO77kvtZT1oaqflV8lzWF
         WtCSR/r2spbwfcSRiFqqtbuwU6h5Quy0cHjTgc7np1P3Daiy4+ZXwqW8lcUBCuurCMR/
         PDdSyU+LfyRJu0itaU7Knm9LRIiQWHyb6aN228hSI34LIfPV/Nq5wb12g/QE4SdOJ3K6
         3SSdYfRP7EuL6/rk62JN1MP44MUR6U20c68pJNcMB6erMwAK08YfqsHRZxee1DfeNC7L
         L2/tUCa1S5mZuOF2gS4zh1iaPBrbhIpeYxVfnIDvGD/duEMDeDilF+CTyMtTZIjvhao0
         NfBw==
X-Gm-Message-State: AOJu0Yw4QHoEsRAGNfpcvpRfid2avZDJ95Igv7fowHR4NH7HZqE7Y67h
	ZL8zQjPRCOd/PZxeUp9r1RngXIiVIXSD1NZlHEGYKuMXDtFzhrMjgxwxQtm1R46S9r7T4fR3b0B
	wPQf6
X-Gm-Gg: ATEYQzxU7i2lRjNkLER14qgxsI7VCjdvDjKXW1iBSZ0z+E6JbMFQVHgRdACvl3kKGWZ
	D7Rgjfe8X9lEz37zPcpakzpAstLFuF/0QNcl/XibH7MZohWFrXDOThHzHSEujRRyL/cyj1+WDy2
	FhlMLthXVL7XC5iC8K6IlchP0XOnEOHo4gofP5/e7denyJxQ8uFq+Hrc2jSpttSvwWJ8TGFgHte
	6ytRObBgz6a1pwwA+ur1b74n7+48rNpQAZCazUd3a6QxljTbJ+zyAqc1p2/zgl30GWDx3Ucnbg4
	zkN7PZPMeGJW5Kq2hrg3UnLl4VTi+Ujvu3n1GrBnKZqqo93yOnEHE008rCbwE7nv4+Iu3XcO7Kp
	4R2GebQxw8uXQGzXhYEfZ2SsBQq4r70vv0We+cMNeZ0TN52L+y3R8x6m9W+WUFrIw7Ja5zAlQ5p
	aGdZdyVzFZq+16rFQ5XiJs7IgEcvmRA3bD8G10ZDXJwFQ6xIBcd7NM4rC08+2IG3DvDtoUvn9Wj
	uNXTRIQOYtXOggDkh5rPvZ8D9IcUubX/pSiGNlzzjYUTJHoEsHONdaLyLSDluBaNzZfxgWTF1U=
X-Received: by 2002:a05:620a:4586:b0:8cb:72b2:2a01 with SMTP id af79cd13be357-8cd6d42728emr977433585a.18.1772963833577;
        Sun, 08 Mar 2026 01:57:13 -0800 (PST)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a3171bca1sm50858976d6.51.2026.03.08.01.57.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 01:57:12 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Weston 15.0.0 upgrade
Date: Sun,  8 Mar 2026 05:56:58 -0400
Message-ID: <cover.1772963425.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 09:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232637

Per discussion on the dev call this past week, here's an upgrade of
the Weston recipe to the recent 15.0.0 release to hopefully make M3.
I have successfully tested core-image-weston on all the QEMU platforms,
and I believe the couple of failures I saw in my local selftests are
explainable (e.g. the tarball not being in YP's download cache).

Note that I have left the now deprecated fullscreen-shell and
screen-share options in PACkAGECONFIG to avoid causing issues this
close to feature freeze.  I think it would make sense to take them
out of the default options post-LTS and consider removing the RDP
example from weston.ini (or replacing it with e.g. VNC).

Best rregards,

Scott


Changes:

Scott Murray (1):
  weston: update to 15.0.0

 .../wayland/weston-init/weston.ini            |  2 +-
 ...d-drm-meson.build-allow-libdisplay-i.patch | 28 -------------------
 .../{weston_14.0.2.bb => weston_15.0.0.bb}    | 17 +++++++----
 3 files changed, 12 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
 rename meta/recipes-graphics/wayland/{weston_14.0.2.bb => weston_15.0.0.bb} (88%)

-- 
2.51.0


