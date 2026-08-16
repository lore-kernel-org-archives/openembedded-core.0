Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E385AC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 18:23:30 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14807.1786904606409004924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 11:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IeP/LOeW;
 spf=pass (domain: konsulko.com, ip: 209.85.216.47, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3604469a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786904606; x=1787509406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XiAi11IEF4NNORgKdINztt9s8/GJe/VYJtQSfM02Jdg=;
        b=IeP/LOeWXBPgdRTW8jUaw4oBhztJUk+/aBuWcmb/q3Bqwj1MS5HrymdbcmUJKx7mMk
         e+/bBYTud2rVYh3P2M4DKA5+O0RVQWcJba+xKMUxT/UeXobNZUccPnWFOjGVLbIR//82
         Om79miOiF33ZLe+UrWamxr8s0OxuqPl3TGhVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786904606; x=1787509406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiAi11IEF4NNORgKdINztt9s8/GJe/VYJtQSfM02Jdg=;
        b=NPSsAp6y+uEeNtKBdZTYM5dXRnYKEDhYwl/FiX8wqs+HsErG5bCH5gTmwML9A/LlA5
         gf0cWDmCtspZT0ULpcCkjCxd8Pkaw05EamuYYgiiyZYb4VUrKY9ZDXXm8XXdvpLpGGpE
         gE+iHPvd3Hu3e25m4+3jzv9nBm/nZQ/8MbHEMN0xJaaFKvU6smXM8sZjFUFv87GCaaFD
         C6URUpYTZYgs8KgRB1HwmI9QYsKxUzqSJhkTmCTj0CONw784jGHQQ4rmB49CWBteTnLv
         lBV09eWRggn7mmjyAMfGzBDRIEQ7/0XrwtsDxFMY6PpYK2YW32r0+dwsmJPbQ27G/g7M
         h2LQ==
X-Gm-Message-State: AOJu0YzzITiylM3rBzxriOwUS2pjhe7kgssyPV6MiqflPBhfgdy2kPHb
	SS/hk5jSJAiYQ4fY3gKXZvkQj7K0s+uZsBWxS4qgbalaFRrwioTa+aXy/rhFVoNyKZeG5W2rkoX
	4JCYu
X-Gm-Gg: AR+sD10oOMz3pfWa1/zhtXbQBeDBQ/oEtt1YIL5gsWkRIxgu/CHI2BSvreIvkKadBea
	9m1AB1x1p2iM5QzPNUWgCG/e4Y4ZlL8ry9xIdcRn/dLfQKpReP/PQVzn6U5UTnq9T8nrsAJgUvp
	4+GQTNP67GjFgbo4wneThbTnwt5QCB5vYZsiS4UFcuyorlfvgzfjFEtiJgkKAlmfzA02GXD5iJ4
	AGPDmsvulww8wUNZoOkXEilTdOR8rXBez7+HTC3GGch5VLwyK2xHiTy5DPwCOTrrfcZqBLBxIxK
	lLy43XfxTdk84aMRDVA5UAPhtejaMj8Og3Pg6svmdBcXl5DKMpVsb262FRs15aSZP8b54xophW8
	n45fo824RV4P3LCgIanNE/cR+dE2PDVjf1GogEG2j+o3O8sMfx1iIG2BqqiX7ZL1fBvqeVGIVkE
	Usmp9zGj/nnjDZbQNp/xe8vL4W7elqiz+q20FDYmwPWs2O0+GaWaZqV1RN5orpPyEpFJxSQX4lI
	CoVg//eHhkmQqV4
X-Received: by 2002:a17:90b:5101:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-3933b6d0deamr24425394a91.1.1786904605665;
        Sun, 16 Aug 2026 11:23:25 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:9a1e:93e3:2a6f:adab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fba7e8sm2065295a91.11.2026.08.16.11.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 11:23:25 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-wheel: upgrade 0.47.0 -> 0.48.0
Date: Sun, 16 Aug 2026 11:19:06 -0700
Message-ID: <20260816181905.1791912-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 18:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243544

From: Tim Orling <tim.orling@konsulko.com>

For a full comparison of changes (9 commits, 12 files changed) see:
https://github.com/pypa/wheel/compare/0.47.0...0.48.0

Release notes:
https://wheel.readthedocs.io/en/stable/news.html

Source: docs/news.rst

**0.48.0** (2026-08-12)

- Added a ``--local-version`` option to ``wheel pack`` to add, replace, or remove a
  PEP 440 local version identifier from a wheel
  (`#570 <https://github.com/pypa/wheel/issues/570>`_)
- Fixed ``wheel convert`` unnecessarily upgrading compatible core metadata versions
  (`#643 <https://github.com/pypa/wheel/issues/643>`_)
- Fixed ``wheel tags`` producing invalid archives when retagging wheels whose
  entries use ZIP64, by dropping the central-directory ZIP64 extra field that is
  not valid in a local file header
  (`#692 <https://github.com/pypa/wheel/issues/692>`_)
- Fixed ``wheel convert`` writing the converted wheel outside the destination
  directory when the input archive contained a maliciously crafted project name
  or version with path separators (arbitrary file write / path traversal)
  (`GHSA-vgq5-9859-3mmw <https://github.com/pypa/wheel/security/advisories/GHSA-vgq5-9859-3mmw>`_)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64 with core-image-ptest-python3-wheel

The AUH run failed for an unrelated transient fetching of libarchive
reason:
ERROR: libarchive-native-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')

 .../python/{python3-wheel_0.47.0.bb => python3-wheel_0.48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.47.0.bb => python3-wheel_0.48.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.47.0.bb b/meta/recipes-devtools/python/python3-wheel_0.48.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-wheel_0.47.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.48.0.bb
index 4320442729..21c9c7464c 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.48.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02fa3c9b3"
+SRC_URI[sha256sum] = "94800765601e9171bf5d58d066e640662842bcedcbab982b2c90787a2c987322"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.47.3


