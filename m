Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2836FDEE2E
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 17:12:54 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2811.1776964371354991173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 10:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=XxsidQKD;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8d7e7f48499so772670885a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 10:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776964369; x=1777569169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IeP3CQqFW3xeNXRIMu36BtsXqjRuDB6nayK78+/g4y4=;
        b=XxsidQKDeIEpwSb+W5K4w7a6BtEYdwJy9ZEi2q0JTOzEyLY/UXiSWHEWMnq5V00/j6
         IcMV8QOsbZ/gWzAuE2S+tlYUA0O2fWKeTlH+EHB+LzsQ7DBZf7P0Pv47B0xpuEFk7Z5A
         zlfEDD82MgWkcbRtAwKqAERvoBY514EjCtnXzVaA5025alnIiU5lajkp/D7/GehzdAyu
         lvJvpHKbo6vGM5icQQ+S+KdnxXq81+sI341qJl9ap9tTbPaedffdTHe5WyrVkNzPc1Xt
         Dw+yzQ7Z4agfrETTkwo1G3VJbl+xHc3TR0v69rrnwwPi/Rr3l33S+VIC8c70Cdvk6hTn
         fBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776964369; x=1777569169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeP3CQqFW3xeNXRIMu36BtsXqjRuDB6nayK78+/g4y4=;
        b=do6zB52yxpENGmvqp7vvLIM8Tbl8SeSuSN79KShGGQIJgYMx2nlXgJ0WswWELrm3I6
         /kSCsqR5c14iKi/0x5R2qK6TtqrxXfNhPDLHczf5SFfKj4I2ubN32DOH5A/sDUwP+wX2
         81d6C4GAZcYdcc1VTeKE6Rtecwk1SDeGWvl2w9ATzHagY8/A80yu/+gcUm2/Wtwfxfnq
         oZpXaE1SRnjTPjhWwHvUClxDgMGV9GdL1brRyowhh8/sauOAnfC29CPhZxttXYtNQbeq
         1GWh3heUmRkf0HErPEc3tuxOjs9RriQ2zwdCzJXCYWO3uXx9VhDufyFB4P+mNvzKDzKV
         o5Ow==
X-Gm-Message-State: AOJu0Yx6iUIQgd7oslf47N8B53GZ1Ox5OVW3UO1i35ftnS850bT06M6C
	ojBYyf5n2C34whWOcDCTAmFbB0lVxVSUIWVvhrgBcGkrrOh3DOdI66bmb0eyT5kdq9+XcRLPFmP
	TlGtu
X-Gm-Gg: AeBDieu2h3VTK9+7NORWR3Q/Xh4GZMPxUDsR+igof5NeW8h5ux4fwUA8yer9uC9kqE0
	kGjWcLTTZ6CSrFwmGeL3Amf+CKjtrJc/uaeC/GK0JzU6xQmbMjmRt12GpqrLJgAjKmQ5x4ljtmT
	d+AG+M7BNotwNc6bfFpWsxhv/3Ca1lD/tfRGG4HhGiZWuVCnVJbFNZk4dlbHtjy7BCc3/YuVRas
	PKQbUnJCAsTIWP8qO+hL7g7YW1rssigUtyQjInckBevxAC+4daWRECX7dX+GvIQwBFbUTgcfLrU
	p4MZLE1iMcAQYFp+brtVs+T2QcKTUrmWFAuCfI0GZAfE/btVCapsw2ZBr3EwS3mxWW+Dze7S6bP
	oeMC/f8PfcYRrpjSLuSWCraf3/I66kkumcEjnH4H7aplqF3cwQn87Njp8HBUnvSW7Amg//wauzj
	bzTJDLiTtGe3nO6sTb2jnBWBAenLD4z9XcnrMFdg==
X-Received: by 2002:a05:620a:2699:b0:8ec:9b8f:4965 with SMTP id af79cd13be357-8ec9b8f53f0mr2286838985a.41.1776964369277;
        Thu, 23 Apr 2026 10:12:49 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d8edb789sm1800887585a.31.2026.04.23.10.12.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:12:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4] python3-vcs-versioning: add recipe
Date: Thu, 23 Apr 2026 13:12:43 -0400
Message-ID: <20260423171246.309711-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 17:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235828

The setuptools-scm project[1] now ships a second module which can be
used independently of setuptools if desired. This is now a dependency
for setuptools-scm, so add a recipe for it.

Update the maintainers.inc file with the recipe and myself as
maintainer.

[1] https://github.com/pypa/setuptools-scm

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-vcs-versioning_1.1.1.bb    | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 07e840ac34..9f4ae051da 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -750,6 +750,7 @@ RECIPE_MAINTAINER:pn-python3-unittest-automake-output = "Ross Burton <ross.burto
 RECIPE_MAINTAINER:pn-python3-uritools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-uv-build = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-vcs-versioning = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb b/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
new file mode 100644
index 0000000000..788717de9e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "the blessed package to manage your versions by vcs metadata"
+HOMEPAGE = "https://pypi.org/project/vcs-versioning/"
+DESCRIPTION = "Core VCS versioning functionality extracted as a standalone \
+library that can be used independently of setuptools."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
+
+SRC_URI[sha256sum] = "fabd75a3cab7dd8ac02fe24a3a9ba936bf258667b5a62ed468c9a1da0f5775bc"
+
+PYPI_PACKAGE = "vcs_versioning"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "\
+    python3-packaging-native \
+    python3-typing-extensions-native \
+"
+
+RDEPENDS:${PN} = "\
+    python3-packaging \
+    python3-typing-extensions \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.53.0


