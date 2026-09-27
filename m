Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61F1C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:56 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33582.1790495023341611260
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Olv59hxk;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso1182661f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495021; x=1791099821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+ltU5Fptqu5AZtCGP7ruogO2bYxnfQbtV/912E9LRE=;
        b=Olv59hxk/Oke5aJPQqvCTmbtYs4MgKIhXnzpkIqzLi8HZ7NXCB6ZlsY4PXSIGdFY/6
         3Gvt4TpwAh6lMtDjacRSDlX4maKTMwD69j1EqMnU3hefQ+R4jjd6ATEC8/oMth4ONyn8
         8rS5mLHU5M9futGRzPUogUcjh21B6ioDbpSKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495021; x=1791099821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n+ltU5Fptqu5AZtCGP7ruogO2bYxnfQbtV/912E9LRE=;
        b=ltZv3+O4s4CWHeiyru2dgmWhKSEeDBWNPG9Sv3T8x6veFWbS2FKr4qWA7wktW2U+pb
         LQJO9XVtugq2T20SSt1NqSN3aE3XnPwdEnc9xOJaWeqmMf0Vo5CYqkISR797Kxa+z4qC
         5YMLDX+reExEkYMjB1oIAHERiys4+rjpmKZZvXraTm9eDNJpYMSVJlR45N7NFwrMeZKb
         f9tFp6AaWjyRU7NM73ndmBjdcl+Fg6t5o6F38bLSAvuR2aAQGC++zYvolgBYUxPOTTGM
         ILS3/ccfQnEtuNglFZDDEHpHD41+cqiyyJQ95w5Q7A6KVbM6/849AwxliBkQo+XFRa6T
         0eXA==
X-Gm-Message-State: AFq9FYLN/4M0zoEycs72XNIfZnDSA+Oaezq9BQh30KzeYYNWkwn/m5FW
	6WfbDFvJH+knlZvk+PvQTz7inUSZFkaUyidVgRXGCiNacbta+C1+Xo4EBJXMa7dzH8iTMqUkJJz
	yvtsfPeQ=
X-Gm-Gg: AYBFou05r/SGCwNQkDXLtTXuyudF/qYQjfv4ydZ/Uo1nzKnEkwYi3m1P2i7bvHczXLQ
	BQlkqgZmnhNroVYRM8ZrcUUImgMy+ApL71Xtq2HP4Hv0lr2beEzhxgEJPeLlF5W8gs2omrnJW3G
	mrdt/sgoMwFu0pLBzmiFf1JKpzNaJRJrnNWv3QP81HLdiYXFe20D2iGECrgstjoxkvQIO95D+Le
	5m0pm8lwKUY0LjZktdaFEvukHsIwpjTOXg2J9KvzoV3DuB5+1Gt3yLUyUQS3aemQYR+RLAfQcSl
	X0bJTPbIHUGznpeW38a4yfLR8Zlq4qouhHV0bV5YTxex5NOAIn2IM0LRg2EeBxGSDxIx4nAcZqU
	HSbuxB1skHOMh8pyDOLLhk4e1VNqoCVU7Ny1EDBV6G4RNvAcW/xwB2t0Uxu43ROlLHOpE9odVaL
	cMKbG6Sgy0V5CLayA2um1QiNWIFH1aF7cdmk10w6wwQUKTqtJBdjb82Ne+SIYo/ZahJlm6rrinf
	7hdNcl+T0QU3LeKSAnMhdrt6utBQGIkqvkfYDeHm2BxGm277y8BNdKCgEy68/4q98yu6vLxzg==
X-Received: by 2002:a05:6000:40e1:b0:488:5fca:a837 with SMTP id ffacd0b85a97d-4887da11182mr12247663f8f.20.1790495021535;
        Sun, 27 Sep 2026 00:43:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/28] ffmpeg: mark CVE-2026-52295, CVE-2026-52296 and CVE-2026-52297 fixed
Date: Sun, 27 Sep 2026 09:42:56 +0200
Message-ID: <0970f28b05c0f328c7c93335797237346fd5eb2d.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246655

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2026-52295:
Debian[1] identified the fix[2] which exists[3] in the upstream version.

CVE-2026-52296:
Debian[4] identified the fix[5] which exists[6] in the upstream version.

CVE-2026-52297:
Debian[7] identified the fix[8] which exists[9] in the upstream version.

[1]https://security-tracker.debian.org/tracker/CVE-2026-52295
[2]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/016a241102250372a9c2e96f6e8dca67ec01d3f7
[3]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/ff43ef5219ad543e57ed56d065e9d4a3b0426468

[4]https://security-tracker.debian.org/tracker/CVE-2026-52296
[5]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/23227a444de4a8f7696f46660cdd044b460f7e47
[6]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/d18354f8d4bd018eb486d18079ff0afb3b84c506

[7]https://security-tracker.debian.org/tracker/CVE-2026-52297
[8]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/8439e0203744a30d280668fcd086f74ed5001da1
[9]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/ebff1abbad8b036bfc0f52a4785433b06e865e3b

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a typo]
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 48ece247600..b3b78a7936b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -196,3 +196,6 @@ CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2026-8461] = "cpe-stable-backport: this CVE are fixed since v8.0.3"
 CVE_STATUS[CVE-2026-40962] = "cpe-stable-backport: this CVE are fixed since v8.0.2"
+CVE_STATUS[CVE-2026-52295] = "fixed-version: fixed since v8.0.2"
+CVE_STATUS[CVE-2026-52296] = "fixed-version: fixed since v8.0.2"
+CVE_STATUS[CVE-2026-52297] = "fixed-version: fixed since v8.0.2"

