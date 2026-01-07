Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEB5CF6C05
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1503.1767773367016486171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wlaHcrYI;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so13811075e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773365; x=1768378165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX5HDZF9TYMWB8uUQTScfMp+8oLpMin4E1CmUv4n6bM=;
        b=wlaHcrYIf/sCPCtAvoeE+ncCZS3YfzX8OsGJvMr/mwl0ZYBwzu9kNoQa1tySrrQ65N
         BuUYXygrcXX3lDTfvWkBCQVCYIabnuHowO8r6F0MRFrmS+Gh+qyUmsypPCmdin4+0yvH
         sUSZo2mmZZP8p0jsw+EcrBop/vh2qkQ/7u4zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773365; x=1768378165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pX5HDZF9TYMWB8uUQTScfMp+8oLpMin4E1CmUv4n6bM=;
        b=Om96xF+KA+7QiweVMTCC4cIsvD2CseYjDC9dcMG7WbBHYMMDNTq2U5UgD9/yaZBKtx
         g9HtH0jJzxCm7eYsQm+35sFeOh3rse3olxzzB34EXP6xTd7sP8qornt4KezgQbtZjssV
         JEw7TVU+1w0KbxD165oYlFrZ764qRkjx3vUaDmg6C5347kAIxqvTCEFYvkJG94UTnoUG
         c+hkxx3vQP7LO/diU4vPB6PzZ77ZlE+vfas1jMZaqP0PO4esq4ldZ3eMv5BjlWFsAWJ6
         eqV3jn2TPhiFafEPqqBRV2KUWkkRphnDm7nGepzsr+z/wMGmb1QoSQP/BTcoGktoXP41
         SQCA==
X-Gm-Message-State: AOJu0YzO/RkRqG6+DyeCUtSDwHq+xJ5afKJ2IfMbkeATUaXMbjAG+kUN
	iNYZBrTxXUtNTF54S9oFvG8OdpSodwcJfPH09bbun798PuE0UnA+HS0aMlvnhXDmjf55xS7lIqJ
	zct+J
X-Gm-Gg: AY/fxX4v3USnh0ZUDY+1aAuirPNkqwWGgUinW6olFi+CJgd7TuecWJLfnDFDLwFeZV7
	OWmpytj4kWFJKUHzAm64A0ypaI3p5KO7fICMay6b54dYjdoQ4XStO+ruKnyW4MiZVb5Bi1WYYo8
	FO6ZJgNntbS+9axZ2jVmglz3kemo3cSjLJdsyERnqSOEm5EXGfTBFktgjRboxYSXl0qNnKqspJq
	QLCVm6lEqmrtLq0cTeDupTHb95SKfkp/wPhNMEpGQo8XnpIypMiWVsdkUTpNPd0CrQxtDDsW9Tc
	IZlKm87D6aMLJ+O3lA8DxUFVxTm8jhweiD49yOuY/T15siHxfV36+M2Y3Np1POsB8su0F3h7LU/
	sHEYW9SQPwvJcH2lFjJ5bJTZaWWtSMDK6yDy4BxQnmm2nub05E+BPAHCkyw3K5XlXt2WRl0dBPw
	y1RtnLpNAVT7myX3nr5f8h4rvqRlRaBSuprbLDBTJGgc0Pw5oNrIUxirmaBjMsCZBar2gdCJJHI
	k4Wcr/uir0HlRIeW6/cpY6/hQ==
X-Google-Smtp-Source: AGHT+IEi8FeqtciphicR9naZMNeNA+H49IvsD8k9/DzDVE7jFQ/FGBstbptrtk1aI2EBlLnpoMrf6A==
X-Received: by 2002:a05:600c:a015:b0:479:1348:c61e with SMTP id 5b1f17b1804b1-47d84b54c82mr13683595e9.20.1767773365111;
        Wed, 07 Jan 2026 00:09:25 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 05/11] python3: upgrade 3.13.9 -> 3.13.11
Date: Wed,  7 Jan 2026 09:08:54 +0100
Message-ID: <148492a04791a207dcb9302f71d65e6566e23f5c.1767772757.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228951

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-6075 (in 3.13.10) and CVE-2025-12084 (in 3.13.11).

Release information:
* https://www.python.org/downloads/release/python-31310/
* Python 3.13.10 is the tenth maintenance release of 3.13, containing
  around 300 bugfixes, build improvements and documentation changes
  since 3.13.9.

* https://www.python.org/downloads/release/python-31311/
* Python 3.13.11 is the eleventh maintenance release of 3.13. This is
   an expedited release to fix the following regressions:
  * gh-142206: Exceptions in multiprocessing in running programs while
    upgrading Python.
  * gh-142218: Segmentation faults and assertion failures in
    insertdict.
  * gh-140797: Crash when using multiple capturing groups in re.Scanner
* And these security fixes:
  * gh-142145: Remove quadratic behavior in node ID cache clearing
    (CVE-2025-12084)
  * gh-119451: Fix a potential denial of service in http.client
  * gh-119452: Fix a potential virtual memory allocation denial of
    service in http.server

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3_3.13.9.bb => python3_3.13.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.13.11.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.13.9.bb b/meta/recipes-devtools/python/python3_3.13.11.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.9.bb
rename to meta/recipes-devtools/python/python3_3.13.11.bb
index 2e114a6c5b..2fcfd4aba1 100644
--- a/meta/recipes-devtools/python/python3_3.13.9.bb
+++ b/meta/recipes-devtools/python/python3_3.13.11.bb
@@ -35,7 +35,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66"
+SRC_URI[sha256sum] = "16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

