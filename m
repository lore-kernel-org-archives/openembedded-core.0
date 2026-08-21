Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4662C5DF92
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:10:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3659.1787303404511841589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aVZRR34t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso382785f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787303403; x=1787908203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IT+WtEIX+93cRi5NZoPuegpW8NqsGTwj2xbJVFThbCA=;
        b=aVZRR34tyRhvxH4szQvrZCja5SGKwFVT8b/+TEfsRl3Npj72SczFoN0OUZmEjdgBeV
         GgXfzWpF0Vaktk18YAln56xRZkApYrWEkzOl2jCYpX6FZzb8nKH67REChY21fn2Yzeiz
         u70KTl0nsxBlCHt+MDmNI5lRMClaTQBgbCLeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303403; x=1787908203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IT+WtEIX+93cRi5NZoPuegpW8NqsGTwj2xbJVFThbCA=;
        b=TzMPdL/XpVLIr/sfulwM5C0ZfxHTWPe7g8du+QpAseGd5pOuefhsevBcvWgK/1zCTw
         0LYb9G1WyU9oXrVCIlv1MlHuwJdojWy11c37bpsyF6WJirNj6XQDN37k/qiZcYeqX0SV
         ZV8SJcJGkjgIr33RLYsWELhNuwEugmMpXYo0oSVveMAq1U82lxmA93Vkzfa55Kf8ezry
         PMWG8qXQja2TzFEbq85Y8xz7jEZIxRKY1RvOfjh+2qt01jK0AO0+KO9/7ZqA+o5OkQzT
         grgiPlDFvLrYGOfZw4IXn1UG1mJBNPHFHNLDUEoaX4nUForcGppgXfYJ6igtGx5V6zbF
         OwSg==
X-Gm-Message-State: AFuF++mNX24ZSj56CH3KTHKOkbziRaWHKvrigjFdxT3ANsHgydR8dGiE
	rEy7na1/OGOCaa7dQs1ZQt45iZ2G16XuW0iiu8y35nQNAUZuTFWKPGV1wIhIOQ08BQCDp93P1pB
	3u9HfAao=
X-Gm-Gg: AR+sD13WDKi5H97t786qhFoqwug1J9SR08XXddS2CQX35Fz8CCKlcd7Sq0qe1nYZVk3
	LVOWUjhX+cf9tcyQHTLNXdlFT/RCo7jrf96LPz7G0rP07Q6PPevKAnER9XEmHLeSxk/c6gisHR2
	yYrD51yCeNLQy7myZTVbssV2RGXRql62PAoF4OWauJ9zdlMiWB/8K/wxIMROByGMtT3OyBUI1uG
	od2epN/CA8qiEDxZX1HwgYbjs8D2QN5NT0Uf/KWtCoqrxAHbZT76343Bfy7m/tB+l1KrX+UZzrI
	3oLogmAr+1R09VT6brXjYqcf993YRCEaHWBHGGyM9tgutgDhmLaZnd/zOi3FHXW+B7FmeCApFyp
	h20s0M66471nKo8abe7ssKQ8MSwOvN23fYoKB8hhOx19+3g4VyXjFX5ES0w2r0XnRhLc4mprJSZ
	QsZ6pPYz60EEQ/xTzRPF/DcOK8N0Tj4yqHEFedu5EV/C06RVcGOrnp/QBvaci8LEITk/uC22DAx
	dZL6Q24Zg0AUuvWrg==
X-Received: by 2002:a5d:64cd:0:b0:47f:83ee:e56f with SMTP id ffacd0b85a97d-482c0b909b5mr7562763f8f.18.1787303402504;
        Fri, 21 Aug 2026 02:10:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d23sm17049620f8f.22.2026.08.21.02.10.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:10:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] libcap-ng: upgrade 0.9.3 -> 0.9.5
Date: Fri, 21 Aug 2026 10:09:53 +0100
Message-ID: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243909

0.9.5
- Fix broken utility_logic_test when run as a 32 bit app
- Install the cap-audit man page conditionally
- Fix V3 file capability usage
- Preserve existing securebits in capng_lock
- Make python configuration a little more strict

0.9.4
- Add bluetooth collection to netcap --advanced
- Don't drop netcap --advanced if only VSOCK kernel headers are missing
- In cap-audit, verify executable is being passed
- Add a systemd simulator to cap-audit: use --service to test a service file
- Improve cap-audit recommendations by correlating syscall outcomes
- Allow supplying vmlinux.h for reproducible cap-audit builds
- Restore --with-python/--without-python as generic Python configure options
- Fix on-demand bash completion loading for the utilities

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libcap-ng-python_0.9.3.bb => libcap-ng-python_0.9.5.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.3.bb => libcap-ng_0.9.5.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.3.bb => libcap-ng-python_0.9.5.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.3.bb => libcap-ng_0.9.5.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 5c1a7fdfeaf..2a31be6f4dd 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "0ab44af5a23e8edb69a39c0dc803ce4395ff2086"
+SRCREV = "9ae44402f4c405f08b9dd5ec070127d0d92afee4"
 
 inherit lib_package autotools pkgconfig bash-completion
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb

