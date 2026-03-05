Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5CAEEF338
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:56:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39958.1772700952339249190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GK0WVN3b;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so64278215e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700950; x=1773305750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njpY43cUsFTxwlAfg2Ji7SvYZpV79HUJrf8BEPfihjY=;
        b=GK0WVN3bBq1wbB34qsWosn2/6H2kCpkybSNosxqnENLD3tXdtV0ALzuvVaa79RRA/u
         FsKlPb4tapB8hj8QNr8w7vG3tkSLnpvo4iACVxsJuGVmcZPzI80EYGB+REBjy2d7Wc6N
         0hw5iPJrFWdd3I4+Sz75/DxaSJ4eVYYeBtvQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700950; x=1773305750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njpY43cUsFTxwlAfg2Ji7SvYZpV79HUJrf8BEPfihjY=;
        b=Wxlriw27L03Nwxy8QPoSlR8z1h6kumW0inmrUXI0AO+dql7ohjRLPz37vP6E7Hj0U/
         JSKQtfqejlovcj0WOSsxNfpY+rNuQ7s8aYTCW+qjMy+/IGlaDPoseLNI7QHiC0alrIgh
         WjnJela7pNwF9KWQVxD18KPQPigArrISKAqu0u5E4gV2v6EK9zPj47fUgKWV+LZ8D/YG
         ZO2m6HYiH1Q6X++5JQLRO8IywVqrvfAce/MvAFPppsjVNHr11DNLAQKEBcyjI3DjauON
         Gm425Z9uF5r3mh/NHvpfkSK4iXe0DaQtkzOkKah0FmpLQvSAw5lGsEV20tz80A2uGqtQ
         YO1A==
X-Gm-Message-State: AOJu0YzKhyDoX/iP1PCGjN+oxQUIeN6naVQAglooG3gPyCagWS9tWC7b
	yZLdzBxvKbMMxtNWtcgarGLIu35dyxI7XzOZcDr+52fDUfkN/3IgElXDi/e45N8Ior/icXxotX8
	nI0fo
X-Gm-Gg: ATEYQzy3CImE1KqETBAzMOKaw6yaCDXj9zUAUGl9zmrkgLoT9XXZP1kIFrVuD3C8QiM
	rhselyJmZVTPuo1XyCCXcn/Ju5oQWe7avOTT295A/ajoj1Mv876nanlfdNLPVSTGHqqMrQy96jf
	kmW1EZj5agIHZXC03Us/pwTCUDtnGKEMe1relwZtvQO3XOWdMAGD2tq+NtdB9G66QuCg1kXUYxk
	ojIDi0zaA0dzP9m2qBtl4T/pk6VRjBJ1PrSGRkThVI5dEWcNVmMUXC32LE9AcBksvBlWMesdHCN
	Lo1KHjE2GF8CjbPExn03ydFRnDzKojBcTU8U1SwFZPgd83pnXopjYJasQJrsEK6Jw+X/+Wy23sV
	4MM4LIsYJKmWReNNlGUVx+xmq0Ab7unNPPpGy1v/YTNfqsUfnV9AWJZjhjgF+4NsFkRcC/wBPqq
	/anIHlyy/2ncH6/0HEH/otjskEJxWIfmu54hXXXPCUuUBIw68KtbSSNrY6ko+aTlGcon8XRgOWL
	jbOKvNvthQ/deF8ZpeE0NchU8t3
X-Received: by 2002:a05:600c:3f18:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48519828da3mr75193185e9.6.1772700950234;
        Thu, 05 Mar 2026 00:55:50 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 06/12] ffmpeg: set status for CVE-2025-12343
Date: Thu,  5 Mar 2026 09:54:55 +0100
Message-ID: <66bfcd43078d5ac3dc46e1a6a544eb2095b2c8e1.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232458

From: Peter Marko <peter.marko@siemens.com>

Per [1] is patch for this CVE [2].
This is equivalent of [3] which is included in n8.0.

[1] https://security-tracker.debian.org/tracker/CVE-2025-12343
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/b8d5f65b9e89d893f27cf00799dbc15fc0ca2f8e
[3] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/263e819aa45cd3c48bf6887be02b4ec504c02048

Signed-off-by: Peter Marko <peter.marko@siemens.com>
[YC: commit 8536c8b9e9093ac2d7d82c49e61e1c1cded5d1e0 upstream]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
index 1e59bfa33fe..0970575b3ca 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -177,3 +177,4 @@ CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used vers
 
 CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
+CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"

