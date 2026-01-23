Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E206DD72353
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 08:43:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63477.1769157821848124372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 00:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hlEDySLE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so26484265e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769157820; x=1769762620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKXdjP2gRpPSkvTOQN1cqV0vt15xM0kP2SplleXY7g0=;
        b=hlEDySLEl/s6OSKzJVnn2cVWmGEIh5X+ZCg0lGi+9xHcOQ3P9zS8iGQxbZAQzgK+jf
         jx/eETs46ecIJpnuiPZgZCQgBBPTO/sItk1/Ute+Q9fKnh7y5HtunDWuuyGDhCeTPfFz
         1Yt2bpOW5Sq0por/djDxVi4O7U64zIxWGSyJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769157820; x=1769762620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKXdjP2gRpPSkvTOQN1cqV0vt15xM0kP2SplleXY7g0=;
        b=ANAZSGGa6TWFIJqiNuBh4WXFBEMTt1wpIRm8gFUillfLLDjBwYyQZ3sDwJfAop0pRj
         Y21ukQ9oHsLEWvAykTw+VcBou8oIt3GJZCz3XuPV6wIgpgAtdCPN8XggUlMiTQub7te2
         gx6K6uaEqcS4NSWLbPlEHHlSzcb7Y1rP1JEYRSYniMkEnmtu1YMa8Q7RkyMtx/Kw1dXC
         BMSpGOXUyjGfyJyhIKnBGe/Kpmu5zI5RsuNgsy0AmOyAlhoCvl3MQRr2nL/iJ5+Hbme5
         88u97DB0t/t+PjyIwhP3tmi86UDekwiMp9FIsP3tgWgrJxpT02jrIQAq+yMcMSvBuD5p
         T71w==
X-Gm-Message-State: AOJu0YwHFetrG9RTqsbzDIswZA0G2sqEUAYdX8hKUdmMHrOvDltQVPJ9
	7FK2LTGmHHZZaIOHJXwx9/GrJkhM5aRQL0WnNz2xn5WsJ1BXoof5afDCIG5/F2qpvYaxhGHo3+e
	v/Wl7
X-Gm-Gg: AZuq6aJbaprydRDS+64rvCLlf8ldTVWVZLYISqMxj/F4ILEfGRVN5QRAWQctQwMhM/b
	ZJFPA8Oh8AdJFhlxOjjn4PHy1h6boi9UM+loTixKoYlRq5NPqKnTX0AbZqlX3VsYQex0bJRbscq
	SRSZF14TfkjiTo9ps3EV4LRfHfQoE+9d7IfaZK4u9bAyv4ETXnAd+8wJR2aNW1yTHxiDSOWTvp9
	XJ9Iwk4vV/9Q3/MDWjgwwVF3MRBVkN95sj0q3fCwNpNpGWEJlWoprZknWMUjUIZzHOAVAsVGbU0
	0/4DCG1zOh8eOMpHPEB71Cv2CPtZ6wyolPiCVfQQByF+bqJfLavwpMJ7LoHlt5swRYKUuKt7c8X
	2Pc7SOzUe2mVPQxEJdprNZ/tu4wh0o6uTDO9X7/TOD1L5FdpFEqnt9aW6ubDJRo/tfKFNhgPJsK
	fDo9WRTAs/e43rriVHZqWO8I/+DieQXZa2N6w=
X-Received: by 2002:a05:600c:4692:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4804c9cf39emr32007915e9.32.1769157819464;
        Fri, 23 Jan 2026 00:43:39 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6939sm15275455e9.5.2026.01.23.00.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 00:43:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 2/2] python3-wcwidth: Upgrade 0.2.14 -> 0.3.1
Date: Fri, 23 Jan 2026 10:43:35 +0200
Message-ID: <20260123084336.3061764-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123084336.3061764-1-leon.anavi@konsulko.com>
References: <20260123084336.3061764-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 08:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229877

Upgrade to release 0.3.1:

Add benchmarking using codspeed.io
improve width() performance

From release 0.3.0:

- Migrate from setup.py + setuptools to pyproject.toml + hatchling
- Small improvements to update-tables.py and wcwidth-browser.py
- New: iter_graphemes()
- New: width() terminal-aware string measurement
- New: ljust(), rjust(), center() justify text
- New: wrap()
- improve wcswidth() performance ~30%
- New ambigous_width=1 argument
- New strip_sequences() and cut() functions
- Width 0 for Default_Ignorable_Code_Point characters
- Bugfix for Prepended_Concatenation_Mark characters

Fixes:

WARNING: python3-wcwidth-0.3.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with hatchling.build,
use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wcwidth_0.2.14.bb => python3-wcwidth_0.3.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.14.bb => python3-wcwidth_0.3.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb b/meta/recipes-devtools/python/python3-wcwidth_0.3.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.3.1.bb
index da2dc60263..beee5f352c 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.3.1.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "4d478375d31bc5395a3c55c40ccdf3354688364cd61c4f6adacaa9215d0b3605"
+SRC_URI[sha256sum] = "5aedb626a9c0d941b990cfebda848d538d45c9493a3384d080aff809143bd3be"
 
-inherit pypi setuptools3 ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
 
 do_install_ptest:aapend() {
       install -d ${D}${PTEST_PATH}/bin
-- 
2.47.3


