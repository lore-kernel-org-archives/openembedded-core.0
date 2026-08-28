Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F35C61DE7
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2988.1787945904862638823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jBdps3ky;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso14202175e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945903; x=1788550703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+CgAsMTK8ZLJgCcIsiVEoSZkJAe3pEYZS6vuFJDjuyI=;
        b=jBdps3kyy9tlRV3KsYl3hE2LwHvubYVD5sp/YIfDFDpCt9kq+yzUuXySsiemnqUkjg
         ZcOqWJ4V3z1AAAcL1OkPI5O/YqLD+ewa91wkNiZ+kpJQKc/GBHGecvhTJF/pg1lYuH1L
         XZLGkJpd3C1xu2QFDMrW8k2BTuDEpjXTrU0h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945903; x=1788550703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+CgAsMTK8ZLJgCcIsiVEoSZkJAe3pEYZS6vuFJDjuyI=;
        b=mo1mjuU3qcNJRYBZ427nVvi+o49/UNKueVwxVH7MYVNHybJwN9JO0OcKVli+fvw2mh
         6VlBgPvGyAysEb9bP7dwqvFjol0hGa6ii4pn6V4qCXiLl9UvxlOyQqOZYK62axjXDNYS
         s4WjFMbUDj1ycnj5LPXYjhLDvbphOcMGaxMsHNe80lqC+/wjX3VyR2S2I6eeqwKJboNe
         lcPDDZRv572126dxa49qOamgZeyCzSe1KCD6RH+YcAE3clWxPSbI+ifrTYk1sOsKo5ys
         rZ2aeKfoMWDr9AwHd8fLDm2UzVDI+kQZ9D1LuR4Tm65194yGjPjoFNxmhI0SoMv115OK
         FrIw==
X-Gm-Message-State: AFuF++lq7XMpJ0nCXC9gXE844KutRPw4ThESnXf17NkeHpZh0+k5b2Rr
	fEujC4QjCWXEncuW93brOhES9xrdGnWxiyvYsgqUeupgv5qBIfI4270p3hkXxjdyl/dGsFWoZys
	qJlripa0=
X-Gm-Gg: AR+sD12Stm/xvAVz9q3JFnbOIIH8/G3S5oCUHXmN8VJn4h5k8N3IZ5/8hsvOZjRmWwf
	1yXZD6XPSoKYTnIinudmq3eLCgdSzDsCEKnOVnSKaZTCH9MuK8YPy3/lGyDoNtPxHlU5e2Xsnsx
	S1ytg1rbS35mPduBCKOCCT0/VM942yk6R4B322g/nqXoX8pjjRmUH7nVdjJeuvF3bbZnGHKTWVc
	jvPIE2+GQ7lFMQpiVOKNyl67uJeQsG4BkTQ8Mn93ZbOhfKuDjK6/6+jHaohSGAkwB2daKWvI/cS
	dtRBgpaRpIOv0wTW0wXEeuWPFUeJL/9TThCa7bLfBY1y8bx3XIO6aODPFwSwqM3tt4K27GesEDQ
	8nt2jjfMqE/cvLqnfIgL8GK1VVsqKRvxcSCKDN2qR0lyBkmzOH4TqGMXS+qsiL6NkrLG1tb6SQX
	7ddeseaaAnM1NtQ0eHjVOS82rm99YAEOKDTxUFXGnNolaXXRktoPX0swqXaWwI23b2JwHPMgbC2
	3H5OqAct1fXxeQz08l7fUP8TZ5gndo/b+IUEvpAzIxcKsv30zUbaUUI0xVMkpEbTKaVSQ1y2SI=
X-Received: by 2002:a05:600c:1908:b0:49b:9113:e03c with SMTP id 5b1f17b1804b1-49b91c26365mr108941205e9.8.1787945903098;
        Fri, 28 Aug 2026 12:38:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/56] ffmpeg: set status for CVE-2026-8461 and CVE-2026-40962
Date: Fri, 28 Aug 2026 21:35:43 +0200
Message-ID: <f12591ad5d832524f04786896909103bd41a0e42.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244594

From: Peter Marko <peter.marko@siemens.com>

[1] shows that CVE-2026-8461 was fixed by [2] backported as [3].
[4] shows that CVE-2026-40962 was fixed by [4] backported as [4].

[1] https://security-tracker.debian.org/tracker/CVE-2026-8461
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/c23d4da3128c279b714b282e6ec292e8755007e3
[3] https://git.ffmpeg.org/gitweb/ffmpeg.git/3e8f3537f957da011d7360acacc9941f3ce5c306
[4] https://security-tracker.debian.org/tracker/CVE-2026-40962
[5] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/e392fb8c9c3949d975531d2b23c645d2465a7ebc
[6] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/2b14ba12669d75f5f73d8634c6db36e704144532

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index f2a729fc41c..8a6eb4eb863 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -183,3 +183,5 @@ CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2026-8461] = "cpe-stable-backport: this CVE are fixed since v8.0.3"
+CVE_STATUS[CVE-2026-40962] = "cpe-stable-backport: this CVE are fixed since v8.0.2"

