Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B99CCD183
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:00 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.2318.1760064651434698320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=deMX8zb7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f343231fcso1224004b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064651; x=1760669451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kT6vxYsa2PUl90wCvgwS55S9Cw887Yh5uFgHoSwiIg=;
        b=deMX8zb7Zr6/7OnQSm5PFvh9Un8pHA08UKzT6esUJJxeT+YL8xPcTXueS/Yhgn3ADS
         GwP8wef/o47hSVGHlq1PC8pkocraUC9FFyNxaavPLPkvO8tCeH8HDhz7FY3492SZFPTG
         j7ZNwGd0b9zEGfAsBidTU1vCQleqKxFfA+WcGoNoJ8/Yvwhq+r0uixbXIIBPiQr2eS2w
         P4+Fnfw5O0lS4FCawCsIs9DO3EkwYFW6RyEPEI5vMrRjNBFmQo9Nr8nmeHmIfmLV4Dsf
         w1FDy2WZE/etKkBSSzRuxm4YVLzYYT5R7MmsjjjekUv28jwNTWvR9X3uLFaLj1h8j/Ys
         NiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064651; x=1760669451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kT6vxYsa2PUl90wCvgwS55S9Cw887Yh5uFgHoSwiIg=;
        b=H2dWe0dBxrI6TZ2alx2oqYvShql3L3aS/1lgexNuvKWSs9Mu8+kCpS5QeLV0c5ptsl
         hQv+fzqMU9fMeQu65d4rh9rys6EgC/BeAnNN4fO/1/PF8Ly543El5drqdNNsRvaKNtlr
         Ek2FcjGGPTv2Wkd/D1OpxVc/AtcT7bpHepD7ximCvlMkzmgKpp+zTdIo4tNq2MtBmpX+
         Z2ByRgfQGi6HImzxLGjBtnZ3VdrsOksMjsnGKsHTCheIF0CsQo8SoWZWmU3kt44CxlvH
         3x9644Yi147oeG9iA2/9xVIjAqwgwmuPbCBhUMnWuNw7FihNxm0H8M7jnxhWldoHApcM
         C1+g==
X-Gm-Message-State: AOJu0YyP0bCNDFL6RvjecUChcUzpY7yO0q9PsSMqAPN08wLcDxOzAbRU
	gVCLswGSNXumK4F25xYfRYK7Sz2T2xvbACvAtHn8ByVoErJuhlKlFaCsq069a4tfJkxBKz6IUUE
	PvBS8
X-Gm-Gg: ASbGncuKC7rYrK2Avam35+SKeTmdmE+M67MUy/QIhKUIz+yusdNctv/wGfJBg39u9XN
	MShTOLSXVDRV9x1RBB5rbrQiKRn5+9DiQxMjzAJZ2ObihoW7wFBaUHYxBj4+xxmDhgb3hpe2WL4
	e4VmeRADdQuCab5MIwiMwnq0creW4SmT3R5amP8frQyhv5JESQQIfEkrhcueYVp/093ueszBDp4
	iIlrKskU8fzmFse0T+yWk++T4JX6HohMpVNlP555dSPdD05gJ5vSXeoM+nKM508C8VN8fQ1ZUhz
	CSYJLJpm2QX9Bsr/Ao3OEQUNWPuYwFYCXH6ZLnaM3OUPXAoloIy13N9c0JoCivuTtZy7HIQxc0o
	o38zqn7oWF9Nq3X+DXg2tiOekpVYH5Nmj2wZr0g==
X-Google-Smtp-Source: AGHT+IHMh1mrhrt17ZesCZ0gHQBC19IJlj8CeNy35ZLtZYlKfPYjqrSvm8KgSfW7H1o0nPxGaui1sw==
X-Received: by 2002:a05:6a20:3d19:b0:32d:7f48:4aa7 with SMTP id adf61e73a8af0-32da850e806mr12384942637.60.1760064650673;
        Thu, 09 Oct 2025 19:50:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/18] gstreamer1.0: ignore CVE-2025-2759
Date: Thu,  9 Oct 2025 19:50:23 -0700
Message-ID: <7937625a30f6046ba483a000497b15169659f5eb.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224648

From: Peter Marko <peter.marko@siemens.com>

Copy statement from [1] that it is problem of installers (non-Linux).
Also [2] linked in NVD says "Fixed in 1.25.1 Gstreamer Installer".
Since Yocto builds from sources into our own packages, ignore it.

[1] https://security-tracker.debian.org/tracker/CVE-2025-2759
[2] https://www.zerodayinitiative.com/advisories/ZDI-25-268/

(From OE-Core rev: 99ee1df6bde2ffd4fa2ddea44c0a9b94d9d77bae)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index cfc66745e3..5b0ba37977 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -96,4 +96,6 @@ CVE_STATUS_PLUGINS_GOOD = " \
 "
 CVE_STATUS_PLUGINS_GOOD[status] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-good"
 
+CVE_STATUS[CVE-2025-2759] = "not-applicable-platform: affects installation packages for non Linux OSes"
+
 PTEST_BUILD_HOST_FILES = ""
-- 
2.43.0


