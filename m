Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715AEC47071
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:17:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.5023.1700018263349472275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ya01zVM0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so57231905ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018262; x=1700623062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNOpgxyGx/G0HaosL/4bSriIk0If/lLzri6xdNhq09c=;
        b=ya01zVM0AakKTAxvd45l+yMmsEGD3xp6J8dGkTFtt0ACEtCjKyfqMSWEj+DRidRS7j
         V3M5gtgpO0rE7fzM39lB0xZn42QI6JuAEatXVLVKenwzFSpj0HynEeUg4i7HRUfcZefU
         INwp8IGmZ/Tuy65Y8gIw0oTprd65mLJqDiVZLzlm57QBE0jNjgWITtCEUikc3uTNT0n2
         KMZDwNoVzdearNYN770EHe9u1g7R4K29x9WqfqBWOpj1hjUrKrJM9gEdL447iY6L4J7m
         0ETUln4M9qj57bKiPwYDBRHsdcCsQq8/l1SNPwtFJ/d2SgyBZZKKGx5I9tD2Y/m4Uccs
         j0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018262; x=1700623062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNOpgxyGx/G0HaosL/4bSriIk0If/lLzri6xdNhq09c=;
        b=tKCHi2Fb7IADqne6HSGhICAJj/WoVLFs0p6S3WLGrkSYj3JskThYigLI9coA6bDJpG
         oIyuix/KmGgxw+lgMi+zjLtWIJiFiDNYn3TK004Na3DzBhDULAb4iH91RId9x9z8HLlh
         oc4ckmSqjajq6HPOXEqox1j6Q0eOSb74FtvGPtY3Fbbeaa85DsOgP65R67UfLYmKbOT6
         m6KzMh+tZoRTdQbA3xIHFncjiJKCDHgJc6AQrpLP/E2wyfZ5VdRWBHmeg0Pz5RDMG9gn
         nRq3PI3AafEjpKb1tZDiPUPY7QuFIolW0hwJvzYa3/h1dgKQMhc0C9hAMN/KFDqAWf1D
         QSqQ==
X-Gm-Message-State: AOJu0YzSsYcsvHLh8gm72GBUrD3FLK8RTyqu5kjeOc9g4jEqffwgW3K6
	2uriPMK2RCjBx/sTFkW5m42FJF4mSbzGNIhdAzC8iw==
X-Google-Smtp-Source: AGHT+IE1i12FmD2K6VlEs1mB+D0R6uszOQwIl64ZN8iG05acaWvwI8q/XnLOCWZ4eP6+9v/u2iwfig==
X-Received: by 2002:a17:903:2308:b0:1ca:29f:4b06 with SMTP id d8-20020a170903230800b001ca029f4b06mr5039300plh.2.1700018262531;
        Tue, 14 Nov 2023 19:17:42 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:17:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/17] kexec-tools: Ignore Fedora/RedHat specific CVE-2021-20269
Date: Tue, 14 Nov 2023 17:17:18 -1000
Message-Id: <d34567be6e87afdec55973f8f75be8d44b4acd1b.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190531

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
index 871b36440f..206c6ccae7 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
@@ -30,6 +30,9 @@ inherit autotools update-rc.d systemd
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
+# affects kexec-tools shipped by Fedora versions prior to 2.0.21-8 and RHEL versions prior to 2.0.20-47.
+CVE_CHECK_WHITELIST += "CVE-2021-20269"
+
 do_compile_prepend() {
     # Remove the prepackaged config.h from the source tree as it overrides
     # the same file generated by configure and placed in the build tree
-- 
2.34.1


