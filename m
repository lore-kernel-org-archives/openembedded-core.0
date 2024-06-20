Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C33C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:04:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.46929.1718888640524089473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 06:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=C4jqud5g;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.176, mailfrom: dse@thaumatec.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so16997281fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1718888638; x=1719493438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8PDGTq5bskj0lTPEED3+R1lrf527o4Lmsotd4X/tJE=;
        b=C4jqud5gSUppp57fB1oEWP6s6nRsBgWb+xqG1OmPK0FdULYNgR1gOBsDwYDOyvEFOh
         T6HVVdTJn19DtwIFjjzGJ4X8NODxjBWiky55FUxxeXY4aCCigGrZrtB1KRv8GT5Ti7ek
         3bH/2WTvmEB4XLMLJ7Mipr8ca7CNZQreXhDSK7cxr2r1UYCnbZ4mk0CqK1bGoHWS6yqU
         l8CDHRYh/teRmAuR2hoKEPpDGdoJQwE2m4TBdLN3N8VrsPSIRtTGMPREpygXMRGOsaSW
         YBD+hb+JsJkXK+xelmmiTTGsqAJjimFQKt/hRs65DZcxpgb00PkH6EC/F4MqsU32n68d
         aGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718888638; x=1719493438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8PDGTq5bskj0lTPEED3+R1lrf527o4Lmsotd4X/tJE=;
        b=fr0pC9er/hsDny4pmdaDIbRct8CIMPjs5PlHgkMwszNIS6mpB96CGCeZhEx+O44TCk
         /LBE7brNoh8chNu8U0s5A5ABDPbvLcHWk/AFYTSCIpy236QasKePdTjSFFTJOH6vSZas
         UgEogSvQu6WlIbX22d2tf5hLtbtp6C7eEyAlHAi55jYaGlrXtQFntIwbCNp7pgdJbd7O
         GyVuQGqfefL22l4Sop85OPSdzr+FHMlEailu26s76V8ea7piHyngPWmAVs67UB4b4YYc
         lu+/UhJ0PaPdMOeMm16TvLaKWqwaqPyGnRKI/06kZutBWY5a2/Qw+HuSMw1pv0gxpGeV
         DTsA==
X-Gm-Message-State: AOJu0Yxpl3Su7wQY5R+mpl+YSOwFQUPijr+eqVgVoCBUCj5dh4gUC9TI
	hoKHwPHZl70tM6kXV1UA4PzdMT5qrCP0tOjFEG/SCvXBIx607dk0xqkurQWz2LbzfJ0dySUiSJu
	I
X-Google-Smtp-Source: AGHT+IEBLzRPjn0MTNDbGYGvgDA9SWhx6U8xyzwUJedIOcKGXFhXH417WigwA+TdHJfVmXfKkJakzw==
X-Received: by 2002:a05:6512:786:b0:52c:cb07:1d63 with SMTP id 2adb3069b0e04-52ccb071da9mr3330628e87.2.1718888638536;
        Thu, 20 Jun 2024 06:03:58 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f939296d8sm248494066b.35.2024.06.20.06.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 06:03:58 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH] os-release: Fix VERSION_CODENAME in case it is empty
Date: Thu, 20 Jun 2024 15:03:31 +0200
Message-ID: <20240620130343.220397-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 13:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200952

If DISTRO_CODENAME was not set, VERSION_CODENAME field was populated
with unparsed string. This resulted in the following line in os-release
file:

  VERSION_CODENAME="${DISTRO_CODENAME}"

According to systemd documentation, this field is optional.
Fix the problem by setting VERSION_CODENAME conditionally, only if
DISTRO_CODENAME was set.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 8906906bc3..93af08c182 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -24,7 +24,7 @@ ID = "${DISTRO}"
 NAME = "${DISTRO_NAME}"
 VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in d else ''}"
 VERSION_ID = "${DISTRO_VERSION}"
-VERSION_CODENAME = "${DISTRO_CODENAME}"
+VERSION_CODENAME = "${@d.getVar('DISTRO_CODENAME') or ''}"
 PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
 
 # The vendor field is hardcoded to "openembedded" deliberately. We'd
-- 
2.45.2



