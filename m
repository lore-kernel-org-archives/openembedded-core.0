Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DF110987B6
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:50:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17745.1774025395281108907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eg312NYM;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so16088605e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025393; x=1774630193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDrVg14LcxqPYZjg4bPrKjG9Gta18B9qVT3slIjoagk=;
        b=eg312NYMq6Knot56tyJobpi6YjnQCCI1JtEitl0+4ITUfZFPwiqAf+f8rnYMTNI5Q4
         bkd9iOEqCH7+e4lDUDUn1OZHLyeDl/xF09ETWShJ4YOl/LNQLUZToc/cupyGO25bdZ6/
         q+H5g4jLjLkFTP0uB/nHkmDZ20MWT8XPMdtkh6SuSXNtggaZFFLWvzUmPf8ARmP5XoTt
         SqpbRESG8ROtm7b5DXTcASt3HJNiqBygj1UzdiGhxFV7pYHP5PHDGzVpcuFLVy/KkGx4
         aGHW4oGn/orpWlooGqp+YLaYBETjhGdHTBJ7OUpQliZ4R5G8kOKeCI49fVMx4VKmbRcx
         l/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025393; x=1774630193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fDrVg14LcxqPYZjg4bPrKjG9Gta18B9qVT3slIjoagk=;
        b=a4we9sQFg45nvFI+r/caVhv1Gjdj6cC+vYnGMp11eLqPIlizo+5myx8ie82iCeAAhD
         No2NFBfMq3bgd9EQQlIgQzbeAQTHu1Gp6oucwb9/kb0DdBb3dbL3Kwi1+BP6UToKAWMB
         pAmmpOBchfKANyUEsTyvK4tY39fSUD2UY+CpnwEBfSvvXg3wQT3ZULxG+nHYwgIE/o79
         xWQmdoJoatWZ8xZ/Y968fDo80B8ngfJ7Bf4bAUqUcMVKLYwqFT7COR8EvWlDxVGbEk79
         Afd8cx0lrg/E+3DPVqyzrX6Y2AQcQj3LH4j/AJcozp54E3MYdsNguEWfl3hyoO9Wy3B7
         UdlQ==
X-Gm-Message-State: AOJu0Yz13VT8gHiY2jiIUjaIylDRaCKWVz5sQynB1maFszN/l8g/zjPF
	V5+LzSDD6WGDsdGXcAkA68v21TO9f8M8l6XlQSsXJi490TXkeuxX3cdLabBXr09q
X-Gm-Gg: ATEYQzx28MfMefPLVfA8YJVoX7Zrz8fGU+HLKkyc9dvdjaYNq+4rzEMkgTxR2Qs8eTf
	4+NiWiaN02OKQCQamZkqYZPGMe+UELDSVwistDOgYT1N5/AOAqDsVI62jV935eP9VM2HzqKz8vJ
	bab4BJgEPXZyDWFMQ/VSPrh+4GVMaDPt/R17rBxLdRBC37wP2zH0lgUFborMdKD/eEq3bY+3Opm
	XQiRaXxRqhWql2nCv/jQocRrmpivPb7hFKQzgUe20nO6w/or//IqvsIU3T6ezZdo4sFdRuiQ3+t
	Sq7YAtCXIX6cLvlUo6uWiQ+gRdYY1OUCX7On8dqb2dqTagTViXC6Obe+jIuIBcf05iL7KW5aa0g
	C89HANH9GFo5lpRwebr6XX9QIgnrelEXvtBfOAuMdfoC/3li4j18B+21tCAGTrjwrUrfwWBPn4e
	yrQRMsvpsC9SYjXf7LC2Ek/H+FjBuhUzUPc+ciUL79w6/DjQ==
X-Received: by 2002:a05:600c:3e10:b0:485:3428:774c with SMTP id 5b1f17b1804b1-486fe8b0073mr64990365e9.4.1774025392730;
        Fri, 20 Mar 2026 09:49:52 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm73018905e9.3.2026.03.20.09.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:49:52 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core][PATCH v10 0/7] SPDX 3.0 SBOM enrichment and compliance improvements
Date: Fri, 20 Mar 2026 17:49:44 +0100
Message-ID: <20260320164951.128572-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312153845.164369-1-stondo@gmail.com>
References: <20260312153845.164369-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233620

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This series enhances SPDX 3.0 SBOM generation with enriched
metadata, ecosystem-specific Package URLs, and compliance
improvements.

Changes since v9 (addressing Richard Purdie's review):

  3/7: Use =+ instead of :prepend when extending
       SPDX_PACKAGE_URLS from recipe classes.

Stefano Tondo (7):
  spdx30: Add configurable file exclusion pattern support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Add ecosystem-specific PURL generation via bbclasses
  spdx30: Enrich source downloads with version and PURL
  oeqa/selftest: Add tests for source download enrichment
  cve_check: Escape special characters in CPE 2.3 strings
  spdx-common: Add documentation for undocumented SPDX variables

 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 ++
 meta/classes-recipe/go-mod.bbclass       |   3 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   3 +
 meta/classes/create-spdx-3.0.bbclass     |  17 +++
 meta/classes/spdx-common.bbclass         |  33 +++++
 meta/lib/oe/cve_check.py                 |  38 ++++-
 meta/lib/oe/spdx30_tasks.py              | 175 +++++++++++++++++++++--
 meta/lib/oeqa/selftest/cases/spdx.py     |  71 ++++++++-
 10 files changed, 351 insertions(+), 10 deletions(-)

-- 
2.53.0

