Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D91EF99E4
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 23:01:57 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1688.1771023715172796976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 15:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IAUiNgdQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: colinmca242@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40ea36b56b7so1108157fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 15:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771023714; x=1771628514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bsi7tks3g7nmS9o2zDj9DgSzZ+v38PR7RdvJDV/8uU=;
        b=IAUiNgdQuPdl0iYGQBLFn2ZBd5vhgSIXI9LnU+ohV1DiNOujWYZ68Y73vmuI7EwXIb
         e5TP5YtcO13bQyTGQdni4EO4JCO2T4axO1MmFLywy1FFx9XVe61mbvSS/BVobhkIgyVk
         D4oWCFKpGH5N045cOvdi407rMPD5884jTQBzVB4TbS7GQm4Rm42mr0VjQmRo7N3LuLmx
         MoIIt7Zm2+N9HncGIRWWsHszM/MnOswdhH127hExPJgKpNOHObYOD7zhZex2LeJQn49C
         Cv2Gb0b9u/e6/BVUKMRzqfm8reNJEe2aAUzgrYawNxj1MOmzPTmLFb09nBoXPn5dcFkZ
         Wqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023714; x=1771628514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/bsi7tks3g7nmS9o2zDj9DgSzZ+v38PR7RdvJDV/8uU=;
        b=T34tPZUbeqLqymvhrKf7aFqaDHza5yN9JdBASxJWDTHyw0Ne3QKNaXVCVMimY13cuM
         AA2hZioUxelIFuSSXFWApvFOy55mr6xMMnE2VyJSwX43FI41BN5LTkff07piJo5Xt/X8
         sVXFVRW3f7Hpts6ApR/okoPGYvPr/rwmi4Agl6hVTtf/0y3/rUcoDOOCy763kDmAfbpI
         2OTQr6Rc9dHcbYtMG0ENFEQFGZjqKkHCTOOEDuPhk2EvUYhRaBf4f2/LsJHECK5sLlQg
         6wpHo2gGmLfZXXXLu5QBMhBz0twXWzxDQcCpS8bRbicPdrtrFgGBSyk6oA1/FX2VB+wB
         VnEw==
X-Gm-Message-State: AOJu0YwHlAYY15/nJqS88bqR1xAVvUHttHj1lZmbxMXN2Qz256sGdf2P
	acd58LQENcfmPbaDpNr8OysatEvRvlDWOPi4qwYR7XA+kH1gQo2uChl7H65bIg==
X-Gm-Gg: AZuq6aJGf6CAGtyRkHwb0iCiS9isPFiayU6kERzKasYFpsekYvyL9Uvu4jItfCZWsm4
	7jbw2a6z7+MmnuK7P06gmaOqF/wFZ1wJSIbVR6U7sQh9IqzMiBRw5r4VXW/9Q7mdDfLdM5Za2cb
	ZYtUhTyI/4/tUV7a3GvRcamlDe0SbrqOwF2dps4vZMhCfheGzffBfpfkDFJg/9tltuZgpxemdeE
	I3E69zysD2beZfxcHxgXG2COw8b3ztCCo1YoC1sJpXFvD9XY8D1+8oXoHHirMwjg2eOnM9C41I2
	rDCUxQctrSeZw8kicCxQvBFQxXJa0xL0Ou1fSkPdMYPnFR9EvFh52W59YCE9NoxBZh+Jc9czKIv
	UyH3MBSSbnrucZ8Bq2HrR6aaPRFWJORMv7VvJooAM/RIbE+snpMSUEC642hWuotlau6/Z/11iQt
	e05zwgOL52hDO2OHWUImo=
X-Received: by 2002:a05:6870:824d:b0:3e8:9b25:2fc4 with SMTP id 586e51a60fabf-40ef3ad9771mr2117527fac.7.1771023713928;
        Fri, 13 Feb 2026 15:01:53 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf101db0sm8092157fac.12.2026.02.13.15.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:01:53 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH v2 0/4] Disable OpenSSL and Python3-cryptography legacy features by default
Date: Fri, 13 Feb 2026 17:01:26 -0600
Message-ID: <20260213230130.757732-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211184917.1045939-1-colinmca242@gmail.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 23:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231140

TLS 1.0 and 1.1 have been deprecated by the IETF since 2021, and
OpenSSL's legacy module contains deprecated and unmaintained components.
This series disables legacy support by default in both OpenSSL and
python3-cryptography, requiring users to explicitly opt-in if needed.

The first two patches add packageconfig options to control legacy TLS
protocol support and the legacy OpenSSL module. The final patch aligns
python3-cryptography with the new OpenSSL defaults.

Note that the TLS 1.0/1.1 changes replace the existing "no-tls1" and
"no-tls1_1" packageconfig options with affirmative "tls1" and "tls1_1"
options that are disabled by default. While less disruptive to enable
the "no-*" options by default, using affirmative options provides
consistency with the new "legacy" option and is clearer than having
default-enabled "no-*" options.

V2 changes:
* Added a backport of the TLS test fix from GH-144790 to fix test
  failures with TLS 1.2 as the minimum version when TLS 1.0 and 1.1 are disabled.
* Updated TLS patch commit message to be more clear as "1.x" could also
  apply to TLS 1.2/1.3
* Removed conditional logic to add the legacy package based on the
  packageconfig setting
* Moved OpenSSL legacy package to an rrecommends for libcrypto and
  ptests

Testing:
* For OpenSSL legacy package:
  ptests ran: openssl and python3-cryptography
  * legacy enabled, legacy-openssl disabled: Builds and ptests pass
  * legacy enabled, legacy-openssl enabled: Builds and ptests pass
  * legacy disabled, legacy-openssl enabled: Build fails as expected,
    with "Nothing provides openssl-ossl-module-legacy"
  * legacy disabled, legacy-openssl disabled: Builds and ptests pass
* For TLS 1.0/1.1 changes:
  ptests ran: openssl and python3
  * tls1 disabled, tls1_1 disabled: Builds and ptests pass
  * tls1 disabled, tls1_1 enabled: Builds and ptests pass
  * tls1 enabled, tls1_1 disabled: Builds and ptests pass
  * tls1 enabled, tls1_1 enabled: Builds and ptests pass

Colin Pinnell McAllister (4):
  python3: Backport TLS test fix
  openssl: Disable TLS 1.0/1.1 by default
  openssl: Add legacy packageconfig option
  python3-cryptography: Disable legacy-openssl by default

 .../openssl/openssl_3.5.5.bb                  |  8 ++--
 .../python/python3-cryptography.bb            |  2 +-
 ...Allow-TLS-v1.2-to-be-minimum-version.patch | 39 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.2.bb |  1 +
 4 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch

-- 
2.53.0


