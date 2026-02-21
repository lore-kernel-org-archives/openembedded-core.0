Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57986C5DF8C
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:25:43 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14431.1771647935058014007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a4LQrQCP;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2078772f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647933; x=1772252733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TwyShPVnHpWfYiDmiGTz3Q3HS8Rvjg31ZyLTbQAHdcE=;
        b=a4LQrQCPd2ug02f+ntQdiGUPxqAMngk/W8dbX1874iMeClRMSFaqNMRodNV237z35l
         T859ZJoqOmC6OSvucw/oZ7M1TzIQTtQDapRbpPTFeqLNhbTgji+UqZkw4bB43lApQoFt
         5sOvDDtmJMuZchZP+tfIvKlpZGxCpzuyBS+8MQfLKv4jeU+TsEsW5vYsUkIn9UFaPEdH
         7K/Mwrd9rHl5RQr7OeeKhgxg11HTQR3fMxNudkTwdHDfpcal3X7dGWbXak2+uSvY+Fxq
         8+LUWZCwzMm2hTAAsXwS8ScXatHrE6YHMnyqrS0SN3TjiN+kGsC7n41CZfH5GPFHB24N
         QNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647933; x=1772252733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwyShPVnHpWfYiDmiGTz3Q3HS8Rvjg31ZyLTbQAHdcE=;
        b=iTJHEGdiUwnimvPEcosa1/Ya7t55zv2xeUi0f0h7vLlw+ErNb3o2gZTZDK0gELqLf1
         h/ItxauxAuC86N5Jkr9rurqvDocvEVD5DAr69ueMFMTROTwY0v+qH74TxIHQlLgdycTC
         om++11Azn/OAqIFyxMjdIIHy/3BInFj+BVUu9Ws1Dx/f+7UjaF+39h9Zi2qcKnKogCt+
         ZPdSOaISzPg0xgEbTUrlk3CMasNsg7LzUPWlcpl8/LitoF4/VVzeALHWrBdDoKhkTAqm
         mSclJBMkLzX21h4U5peIXiFOmH5nVZ8XKxHRb3ecq/xrM/UWwzuXobnf5/SXd/Q/SEJV
         lJ3A==
X-Gm-Message-State: AOJu0Yyxr/UFsgT5R9GC88InCfgHzcWwqFwIeDjnSFIndT85EuGneCGP
	UFvyxhGpDNvjfmjx0cpL4u2Px4ekx3q71Gv7nhztvjvQFoT58US/8VT8tANKc7tM
X-Gm-Gg: AZuq6aLXTHd8aUpSUId7mFt2rIKnHUF541sCaPEPAlQWL1DCB6hO8w1PobU1+GZTdJq
	jV40zWOfHEbHo9HN5U472dPAKalqOHhvqVVEpiXj/vlY6aJcfaQkCtowtBqYnA9vDdFh+1DRPCi
	Gv1I9pgnrTm/OElXCR2WGDBpmqZ/c36WS9iPDuspT32BfuP+tOfynbOGEkG6It3kakBwY3UeWOD
	ecZ4fgYS71mkTjcvkaZYp/sO4x7Fl74D09mwaLV13XukmqBVZzdVEYf3uTwgkd/jRCEQgmvckHY
	s3Gv6pCo5YWS3Nk1cEGM84h0OOIdNAFJI+ZL9xK+9u0wB3KYG6uoR1RhdXOl9UyARYB7Co3s4XH
	I8A4xvARySewOjoZ4WGfiNMRPzRrXwBSleGHE7/ryu0q/SLGuGmkvWQIQi4447PtGT9Jyu3gg69
	14vnDX4Ak6wXveCFl34Th+nHS4gufi1IMXYh8=
X-Received: by 2002:a05:600d:8446:20b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-483a960eeccmr19797625e9.33.1771647932912;
        Fri, 20 Feb 2026 20:25:32 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb3f31sm26800745e9.13.2026.02.20.20.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:25:31 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 0/2] spdx-common: Documentation and extensibility improvements
Date: Sat, 21 Feb 2026 05:25:28 +0100
Message-ID: <20260221042530.318125-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231573

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This small series improves documentation and extensibility for SPDX
configuration variables in spdx-common.bbclass.

Patch 1: Clarify SPDX_NAMESPACE_PREFIX documentation to recommend
organization-specific namespace prefixes, similar to SPDX_UUID_NAMESPACE.

Patch 2: Make SPDX_LICENSES extensible by supporting a list of license
files. This allows layers to add custom license definitions without
copying the entire oe-core license file. Also improves documentation
for when SPDX_LICENSES needs to be set (non-oe-core licenses).

Stefano Tondo (2):
  spdx-common: Add documentation for undocumented SPDX variables
  spdx-common: Clarify documentation and make SPDX_LICENSES extensible

 meta/classes/spdx-common.bbclass | 31 +++++++++++++++++++++++++++++++
 meta/lib/oe/spdx_common.py       | 31 +++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 4 deletions(-)

-- 
2.53.0


