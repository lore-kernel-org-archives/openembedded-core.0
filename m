Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB93C98311
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:59:49 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7575.1790171984444661843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F9HdSI0h;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so6563555e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790171982; x=1790776782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HME7PJeOunHEKQAgakDKk2KKsL/uzaxBWo8pvoisrZc=;
        b=F9HdSI0hI67pbABa4O6qafsv03UnanMkuJcjiojvwLDH9ICc9vWj2hLkb5gDpwUgKg
         uEKOBTIWgpmG3EA64hb+/teRC6hFPjZYaoVuDnGFDdnnJPqx6m9K6jgj04DLka2VqAIt
         JJX4/rDTmO+dBhUx2Ur7b17rdJ7PA5Vxxu20I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171982; x=1790776782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HME7PJeOunHEKQAgakDKk2KKsL/uzaxBWo8pvoisrZc=;
        b=2WHsyE/G0rN/Z20/n28jw6RIoV6+/TlXlmFwgQfagI1jsr2Zmtn4u7Dayl8LIUKbH5
         2s8YhNgBoFWsmRXQ850Jqo5kai9S07k5TW7CiwV/XYCiGX/6Fxxu/9gsEaVYz4qWfHXC
         D3GexTJPhrLi54qqwEe584rjOqUxqAbdhRbANC187pNHdZeIJCv0jdNrX5syjJIy1a3V
         VggXiKK8qSZbSI1704XD8rm3yYlUKDUPNhc0HRw/l84iPd+CG9YbyYc3Jk3I0vNk+wjZ
         MFYEmsiWpJhNwajpXiQ2FOydwy0hDus9/uUJsDZfrBk/fiOAwaJOtKKeVNv9SQGPjmQu
         R7yQ==
X-Gm-Message-State: AFuF++nPm2BCWGzyU94o/eeOJAWY2gko2cSBT3B5QclObBlEMOUvjzdi
	n6o/lAC2toUyo6z/WQLQSKgdHwRMwFyQCQyx5G1/BLRK+hBiWE9ZmzDwz9OZ0duiGMlD8AwNGHM
	X2CkAuCY=
X-Gm-Gg: AYBFou2rGDGHxTxIcMzXL1wBLeFfzuX2GBSWuUwIfoOj932x1txEqNHElqHPNuQ4Wde
	rAoAclbjWbOV9hgFXZGUNukBa+AtiFU0h6VYBMyP/9Z+iYs5Wc+1t6eNzde98lbJBAqkvI5aRYa
	MVh7qS3NsFbGekkuH1ceDHXTCANE1UHql3SawSghL2E3TQmVyIFUs1bnoihIAibBh4CBQqygbQE
	1FZ2HgjS4Op9k009w2TXhyEpn8DNfM80c1PKkwD8CbJ0b5z4l1k/sEP/gTQwVE/R953WSdg8UbP
	6gRZ+N0MIbUO1a9mtrlWFhcFE06d82VB90V0D1CBcIZNxqR/JQoUo3u4y7vNQlobWlFxFY8Ds9I
	YzLKr8+829GW8LguDLOGOphDXJ856MWoLePixzvXrV00sh5uZsq/mgRFNGnEup/CaKt5gNlaZDA
	D78qrWMsb7s1uTz/uaEbYXn+dYKT0MIGwVDJ7xJd2nUg448+kOGuUnBmJRjcnCKxjGUDYnU3bro
	50CPpgRF7GCap/xckkKx1cL5OA=
X-Received: by 2002:a05:600c:1d27:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49fdf139bf6mr39387785e9.27.1790171982379;
        Wed, 23 Sep 2026 06:59:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe43fc27csm8027945e9.2.2026.09.23.06.59.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:59:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] libslirp: upgrade 4.9.4 -> 4.9.5
Date: Wed, 23 Sep 2026 14:59:35 +0100
Message-ID: <20260923135939.3797785-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
References: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 13:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246515

  - Fix bounds-check in processing OEM commands
  - Fix bounds-check in dhcpv6 against MTU

  - Fix blocking sendto on UDP ockets #97

[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...master
[4.9.5]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.4...v4.9.5

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../slirp/{libslirp_4.9.4.bb => libslirp_4.9.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.4.bb => libslirp_4.9.5.bb} (92%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.4.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
similarity index 92%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
index 79a24f30378..d77121bf309 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "d09dc9a70360ee7838acccbd234ab83f3b9b37a5"
+SRCREV = "390848f47391f412451b2d259d8527fabb51e5e3"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"

