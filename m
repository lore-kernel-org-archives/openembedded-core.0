Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3570ACCA461
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32445.1792040641584469087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M+zx+CES;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso32390475e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040640; x=1792645440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1EOrEU/DWCxwmqTT6LGVfk4MGyEKQUtFlBH3N9pHPp4=;
        b=M+zx+CES3jP9WdTWz8u/L8laT7UMR+gtWjRcopXxxiljGfIO3LDjLwO9onlMpn6B9D
         odBYwT6z/KoUDa6g9t3FBiDp12SuXIQdWCgp6wyEWcMMuIEtqW1COvfk2PxDrp5nEiup
         oXr9PpBxQ8Me6UjiuN52EWb+YzoXHLu4GWnoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040640; x=1792645440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1EOrEU/DWCxwmqTT6LGVfk4MGyEKQUtFlBH3N9pHPp4=;
        b=QR/YwroxIbk/FiuFx6T8iUBT4GFW3gMy8iCbs62KS5iUVtMUOvt163cbUI5IwvzZTV
         Ic+kfkv4jpcbt76v5oEMIq9oo7GvQ5mOGuE3ARi9yA9EMX1Jgfqnn6uV2daAhQ/4OkOU
         S1LvnM0eTZSjs/rKoVZvatGIn+1n8f25qsaLEaerLjikIoKbqLvaMRhGKA5g45PacyaQ
         a2qg8JDB51d8KyrR8bYjgYddJeREqJ4QIB7SacGyr0/LwW09WUDaSS6vMPfrljOg0yA8
         wbrGAJGpmEP7egj5iah1VLQRdR/tIvMHL0D17MWli05b+s/yHzdxWcH3GTGG3OpEpRpb
         kYLg==
X-Gm-Message-State: AFq9FYKAclX9ZuWaWqIUxu1FjYOSZSAsXpsh4Ql5lj/hyvco/hrlWTAp
	LRCCTVPrWULbNZczEAzIvoINcW5UGlwaNcq712speomtztN3/cm91aOvQ6lgXJyx5XkNnWRiDBN
	AtsW+XW0=
X-Gm-Gg: AYBFou0wIjbvI13Bcq9UHczrANHRp5v+98w/1IGFI/1pd3Z0rpGJHg9IajDHh6yuYqn
	RlJZkRlTnBZnXNUdXuq2cZVWRbH6vpYBfnsBbLjY0qjCsG31+kFwH2FiG3yEO5u/lvD0lvHBEr6
	HHAEphreOb2WCrqX51Jh0vp3eI/YRJpqPcplIHTramfg3OMHwOsYWI7bgPwzQXpIjVTzOQy00dH
	UbDsz8KsWSNUw8jiiOmOI4pdGCyc9NmdmWKLl0G1GGoyiaWgL4Ynf/g0LSCTiXMdzlbSTqHrV+6
	a1W5yDGm85DFNvWPk7lNyRrpFhVth/YrTZHcGmiv6oNlxv1+CqtIH1ahVWKJFNFyPG/QYvKRZ3p
	9RXzJNKxagSfrLb7UsyoMVYElJ2nJ83hLvLGa1xx3SlLE3c8PrxfmYw4yoCYeExdZ+eE7GYAwoO
	B08JxRIoLPzSyvfEdro78M6GSgeftmL4qju2Nf/py6wBB9OFLqE/s7Je9b8O0AbVA+aatfBVF8j
	5eFxTiEv6gmTM+5539qGvvNarAu735SD4yLbJ6JPocQigsxEnHzN+/VYR6+jHcJa2qSo+k4hg==
X-Received: by 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr347529345e9.18.1792040639783;
        Wed, 14 Oct 2026 22:03:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/55] python3: upgrade 3.12.14 -> 3.12.15
Date: Thu, 15 Oct 2026 07:02:56 +0200
Message-ID: <2efb745f229c0ca0083c705373436fd77a175e1a.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247831

From: Vijay Anusuri <vanusuri@mvista.com>

Release information:
* https://www.python.org/downloads/release/python-31215/
* The release you're looking at is Python 3.12.15, a security bugfix release for the legacy 3.12 series.

Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-82049 CVE-2026-15310
CVE-2026-19672 CVE-2026-15806 CVE-2026-17084 CVE-2026-87910

Changelog: https://docs.python.org/release/3.12.15/whatsnew/changelog.html#python-3-12-15

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/{python3_3.12.14.bb => python3_3.12.15.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.14.bb => python3_3.12.15.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.14.bb b/meta/recipes-devtools/python/python3_3.12.15.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.14.bb
rename to meta/recipes-devtools/python/python3_3.12.15.bb
index 14be125180b..6c6289b0e69 100644
--- a/meta/recipes-devtools/python/python3_3.12.14.bb
+++ b/meta/recipes-devtools/python/python3_3.12.15.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "5c8462af5790baf43a321a1559dbe0db06d1be4300fb85fb53c40060668e548a"
+SRC_URI[sha256sum] = "c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

