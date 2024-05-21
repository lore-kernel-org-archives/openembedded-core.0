Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA43C25B7F
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.1226.1716311092433888032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SwMdZyK0;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-792bd1f5b38so339479985a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311091; x=1716915891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFtnPn5OrJLvv5mmULnhp5w2vmi/b5aEwuwtay+umOU=;
        b=SwMdZyK0TszycKLRl0g6VUtPN5rgrnsSTXaDvVjM38+VRRO+3QYuDOA/UfdTKEYEA6
         LYGCI3SsbMuGRRV1CZkQjfXQkOCGhfL/hXsBZKyx60jwHXg+M4JpiAPeHCzA5beNJuCS
         vNqAD5Jpmuc1zNZim29QLeTf13UJgLS2GmW1p630VbfFxpGMG9aEIbAW6zcatIOh+nNQ
         QzG8K2BUsfVRUEFXzF0zrF5bkR4E+C20H+YLCjuJfejTVVIDO9J4XE+o7QrIyruKvJ71
         Hu+4f6yUEFdX9C+p/s4l/6focx0HIHl4We9drnNoZr9IQkg2mcV+XjZpeU8esGBUwm0M
         Tp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311091; x=1716915891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFtnPn5OrJLvv5mmULnhp5w2vmi/b5aEwuwtay+umOU=;
        b=acM4N/NWwN12kmMdUHMFlMrI+y6uci9f0UxZagVFL6cgfa2qAP+NcyMxAWFA1aDaRn
         RGbkLnGctsVaHMUyS9tYHiZvLTFw6blUdrJoOTA7OmdiVCV9f7+ognQxfrej6kJ5lMS6
         yNHHUQIX5mwd0qym3IW2DM4zabyZ61+19BOD0pZHtZe/CVQ+uv3sGR71WFe76/AZUdLy
         9Yc05sSsnTUA7/nlREp3MDtBvsM8a80ncsdNqzQF3acCifwR0vELpS8YV5sZT3rA9k86
         jM1csyPsCgy5o8lrrWuvtGljEKIC8S7WSODG6qUKCHlprS0FFzzn9uwlqDXEB3JVnqmi
         ArOw==
X-Gm-Message-State: AOJu0Yyt8pCUk7ntO9AJKiMvooYRD9OFq40+hS9cLnERXI5zCv2Wako+
	/U7CpwJEDn6Tgvl3ZvkFTL863GTTH6bF3DpwnxYdFBofePA3FhD+aYp9ZLhZksglmhTPRiLvwRk
	O
X-Google-Smtp-Source: AGHT+IEXyWco+0VHqxFtMG5NZGreFBTgocBD+EijFU0SXDx8SXWRkEu0DrGs2Mh18J/xa6TEs01Qrw==
X-Received: by 2002:a05:620a:15a8:b0:792:c13a:1a80 with SMTP id af79cd13be357-792c75b2e88mr3294815385a.44.1716311091266;
        Tue, 21 May 2024 10:04:51 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 06/10] python3-pyproject-metadata: upgrade 0.7.1 -> 0.8.0
Date: Tue, 21 May 2024 13:04:41 -0400
Message-ID: <20240521170445.1892398-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199662

PYPI_PACKAGE is updated since the upstream now uses an underscore in the
package name.

Changelog (https://pep621.readthedocs.io/en/stable/changelog.html#id1):

  - Support specifying the metadata_version as 2.1, 2.2, or 2.3
  - Always normalize extras following PEP 685
  - Preserve the user-specified name style in the metadata. .canonical_name added to get the normalized name
  - Require “version” in the dynamic table if unset (following PEP 621)
  - Support extras using markers containing “or”
  - Support empty extras
  - Using .as_rfc822() no longer modifies the metadata object
  - Fix email-author listing for names containing commas
  - Separate core metadata keywords with commas, following the (modified) spec
  - An error message reported project.license instead of project.readme
  - Produce slightly cleaner tracebacks Fix a typo in an exception message
  - Subclasses now type check correctly
  - The build backend is now flit-core

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...-metadata_0.7.1.bb => python3-pyproject-metadata_0.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.7.1.bb => python3-pyproject-metadata_0.8.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb
index 8b9549f3d07..8d00826f86c 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb
@@ -12,11 +12,11 @@ HOMEPAGE = "https://github.com/FFY00/python-pyproject-metadata"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-PYPI_PACKAGE = "pyproject-metadata"
+PYPI_PACKAGE = "pyproject_metadata"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
+SRC_URI[sha256sum] = "376d5a00764ac29440a54579f88e66b7d9cb7e629d35c35a1c7248bfebc9b455"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.45.1


