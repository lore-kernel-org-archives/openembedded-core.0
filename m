Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B98C43217
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:35 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.6466.1646731953799642190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oXREy1wO;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id g3so11401386edu.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZV1LrkpQFMj/y4aDbt2VQXjGhSJmvyXptjOyqJn/cQ=;
        b=oXREy1wOottzFiTNEtQOxY4jeKrF6dMgK16smdn49MHwIKNxM5ozMNDmWavHugsWns
         i90XG1khMPwvO/CH/uo6s/jLbTjKGYMSgYuTZA5uSeLJkEelPato+6y/msygvpOBLXw/
         tcGDyM9tu72X5jZWZMUBoPKXZtKKq/24ABKf3Tf70lWFF+JU49aCNKFleMr417/AaU2/
         AETB5xLMCsGPPKrC+twv7G3NueN7+afLiH0+XE4o0xC7SRK4NiZJNiSgswB9klduRI1k
         aG1vglmfolwvEhjS0YKAnkq93h1HjSIpcsPt/dcm0fqiUqml3TeB5iA+stvO5SD9r5yC
         2Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZV1LrkpQFMj/y4aDbt2VQXjGhSJmvyXptjOyqJn/cQ=;
        b=lDlsSblJWrs+b2Fpbpf5fy25HM/Jqv1e+PzpqnoxwSnU7m0Y+z5iXPkFtgDxblbU1x
         JpkMFQV5YCQYhXvun+I7BG5tbxFWW7ZNYNBhovSHfuuW/skgqJUhstMsIcVlOk33fUxP
         YM7iSxkNT5vaBDTIwh5R8PkEj2kaxxicQzb168gS7FjjE7mxMT2eUkv0Y7dGhrv5SUZf
         t6D1dih7MQixluGjFbUHqqoJe2s6Qnbg30ZpEG0MimT4a1c5ZFXTPfMixyISh8K9TEme
         cuDpb2q0I7abMCWIDHKtZG3jgqmq21mgVAqSiC6ZPmMRVZDp+r+R69lEzhBq27CHfe5K
         bL5w==
X-Gm-Message-State: AOAM533ddstkfeRlRvhYro97myESLjDVuHHpFQp+94SsHVltHy0WIbRu
	BvmKhAMaxg6Z6A0qn8NJNFTjK/QHcMk=
X-Google-Smtp-Source: 
 ABdhPJw668I1eaPH9VGFVqIdDIvEbLs865P3kT8O1pBK+dtOzqBRK7eOSAyROqSWnFwbg6UwOyhmGQ==
X-Received: by 2002:aa7:c64d:0:b0:415:eb27:4 with SMTP id
 z13-20020aa7c64d000000b00415eb270004mr15359282edr.365.1646731952239;
        Tue, 08 Mar 2022 01:32:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/16] kea: upgrade 2.0.1 -> 2.0.2
Date: Tue,  8 Mar 2022 10:32:14 +0100
Message-Id: <20220308093224.3436483-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162883

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/kea/{kea_2.0.1.bb => kea_2.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.0.1.bb => kea_2.0.2.bb} (94%)

diff --git a/meta/recipes-connectivity/kea/kea_2.0.1.bb b/meta/recipes-connectivity/kea/kea_2.0.2.bb
similarity index 94%
rename from meta/recipes-connectivity/kea/kea_2.0.1.bb
rename to meta/recipes-connectivity/kea/kea_2.0.2.bb
index 900ceb62e4..13da1f858d 100644
--- a/meta/recipes-connectivity/kea/kea_2.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.0.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=07b7477a1d815a4aacab73b1531f577a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b4ecee995eeb6780a17dd7e539e97abc"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "f50bb9a954e314316b4033a175dc807496bb9c1754110bd92a21c165a9e84c57"
+SRC_URI[sha256sum] = "8d28213bdc8e2bb870a383b30ac1e53d54e1eba43d2f86e5151b08b66aa6cf32"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.30.2


