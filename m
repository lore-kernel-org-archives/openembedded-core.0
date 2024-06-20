Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E6FC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:33:41 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.47578.1718890416309206404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 06:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qBozVGd4;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-797f2d8b408so55470185a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718890415; x=1719495215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZhfGtsh5EY3yBj2GqOxFfzdtOaKOxPHKdOdFApnefY=;
        b=qBozVGd4zQdK180maEMbUOAj7qpe1LTprUrGlYxKde3oLIGUsREo1OvLEVMdxmCsSI
         xCI/CX/F+sghzxayIiV8xxfwh0SAbfUqfmp4zpeUog4aBozxosipxwlwU2G3I/9hso9H
         W7h/6e3BAwqbYimMFzK7AayPR3M7JdfdfSkQ6YWCyKSF/tC3b0PsKWI3d4Hdf+KCQeuW
         sWA7edWc2eL/2HtoP/hc/Jtj4nzhrZ3fIfZuJJxGRq3zsxlKEgwF/l885/eMxt6I+NJK
         Q0fD2Trhzuxzz4AATbt/6YyAmDJKaFb2Ep5qKcU8WZ9VLd88rOFn06z2zB4LmNbeo9Y2
         2sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718890415; x=1719495215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZhfGtsh5EY3yBj2GqOxFfzdtOaKOxPHKdOdFApnefY=;
        b=PkkWtjekyzIgjsbBx1zluPeQghNEYQW7kRJVr3ygilQXJ9L4Uo9+PCh/pmgeTOHRlZ
         uziLnoBdehAwDfgDqo21XHMctoLPIIqpUSMlw3mDqRF9dngj1stHGoa3CQfm86+0ycj7
         iX0SIc1pXfgGmwptuJ34Sqi7ilHiLpytUcxNbEcMNZfjlDbbVMoJUzwwsWzpSjTTczJB
         RX6/QSag9hzA1JYW5lY9mRbo/pbZCcAH1CcOrcj7+D7HCz7MfFBdjauiCZMajUEyVp51
         YdQ0DcnY4n3Qhw8kgqxls9Bs5wq/IYEfjAzU+9qu0BuxQyoX4mDQaD2oxQTQ1NFEZQJe
         j9qA==
X-Gm-Message-State: AOJu0YxqY6GrTGWGhD8DpObp4lxj2TK/BowXCDkdY/OD0uPLukfyZbxZ
	u3h7LG3K4TXTpEvsAC7BPMfSvZPF0z4P7dB2yVevIXdhyhYjbQ99O4S0QPAEppRjzo4Btj2NVf/
	z
X-Google-Smtp-Source: AGHT+IHKzg820fNfDPsr9xo+lltOiryUB9kvqB+wb0JfwrpaW+7hpsdFtPQi3VmAeevfQWmQtGQuMA==
X-Received: by 2002:a05:620a:4053:b0:79b:b8ef:1617 with SMTP id af79cd13be357-79bb8ef1a4dmr464111785a.54.1718890414896;
        Thu, 20 Jun 2024 06:33:34 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaedbbf3sm695386985a.28.2024.06.20.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 06:33:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] dhcpcd: upgrade 10.0.6 -> 10.0.8
Date: Thu, 20 Jun 2024 09:33:28 -0400
Message-ID: <20240620133328.223327-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 13:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200954

Changelog (https://github.com/NetworkConfiguration/dhcpcd/releases):

10.0.8:
- Fixed compile without ARP
- Fixed closefrom test for glibc
- Fixed spelling of ADVERTISEMENT

10.0.7:
- DHCP: use request_time, fallback_time and ipv4ll_time rather than reboot timeout
- DHCP6: Wait for IRT to elapse before requesting advertisments
- DHCPv6: Don't re-INFORM if the RA changes
- privsep: Reduce fd use
- dhcpcd: Add support for arp persist defence by @pradeep-brightsign in #273
- Move dhcp(v4) packet size check earlier by @pemensik in #295
- Define the Azure Endpoint and other site-specific options by @lparkes in #299
- add RFC4191 support by @goertzenator in #297
- dhcpcd: Respect IPV6_PREFERRED_ONLY flag regardless of state by @taoyl-g in #307
- Fix time_offset to be int to match RFC-2132 by @ColinMcInnes in #319
- hooks/30-hostname: Exit with 0 if setting hostname is not needed by @bdrung in #320

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../dhcpcd/{dhcpcd_10.0.6.bb => dhcpcd_10.0.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.6.bb => dhcpcd_10.0.8.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
index fd193b2cff..43de279cfd 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
+SRCREV = "a15ba1987c264eaa06c2655ddd0891aa5ac48c09"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.45.2


