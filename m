Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A652CDE038
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 20:40:09 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.54494.1727383207904491556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 13:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nQ1Xu2jq;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so17660731fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 13:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727383206; x=1727988006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WsonJXrT7KLnBYAglwt7uLg/X4CRc7klqZmBtXgsbUw=;
        b=nQ1Xu2jqgFwEQ9UmVcgbkkcLL9y+gRClnVQIRYQas3UZaZzW7+XyNAoHS01pb/z7aD
         VRYZtWMarZKwjmKPzLp8SXQTnlrvvlp0C5PHIAIfnKFY0yOuE36pwbNv9hXCf0QGR+Tt
         9YIuM9lQkKuOtjon7wZZjyrvarr5hEzdx3k+l6+m/7OR/Z56Mo/FS4On/8SzIdNBiPFg
         po/YQ53Z/XE2J2NbS000M1PLLb2WsY7bn9ENDDhCNXACME/ZC8RgMcjazo/ss0dWdOdU
         v68TAlm3St9xU5ZVNQ/jAlAvxwRRAjHCiTk+kXpBPFMQFO1loQKc6EImffRuDiTFV2DU
         fDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727383206; x=1727988006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsonJXrT7KLnBYAglwt7uLg/X4CRc7klqZmBtXgsbUw=;
        b=nUM9sfL8GyVdoCmI6+uzDMQknOwF0T/oQWFpvziHrX+n9PMts1LEX2wOpKhHH6xYRM
         ehmFmgcEh9ZnSFZPzMm0zkgDjmEpM3/Cd54/5rwuHtUc04ds4lPwHlpx3ARbYukMFf0H
         rXQO7C9/8rIty95nd/cTLNjoE54nxxWTObvOchBbLuLsx+qPZf8YWpdBpNXCssRntzwg
         fKB+nIyN6Re0s9l9+xyazABqGcKttbQse3f0QDrFovNbbtLhiBOpsMBCxYw2ev5STpvu
         h/PtIaxzFIFst5FI147vQGPzhv7QoQ1E//GdG6NqGLzLZbIuQ2g184l76jrtMV/ZBXUL
         00jg==
X-Gm-Message-State: AOJu0YzLJIHDuVZ3bA53/B/Q3I3QMkAf6OB+/XD8cMPMDd//YnEnCkuO
	fKifLg3kcRTnI97OnyUfaRbRo1Mn1jU0Oz3J2wmszhOVw3J8HNtP53i+u+AM
X-Google-Smtp-Source: AGHT+IGjevcvcKqf7CIJOq5tf7ULjO9bZEDL6v/fTWr9xHIu9rbdv2/igqad3kKlRYTGvQUl6MyS5g==
X-Received: by 2002:a05:651c:198a:b0:2f9:cf21:b92 with SMTP id 38308e7fff4ca-2f9d3e3a33fmr6524721fa.5.1727383205480;
        Thu, 26 Sep 2024 13:40:05 -0700 (PDT)
Received: from nova.ambu.lan (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88240a4b9sm309078a12.23.2024.09.26.13.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 13:40:05 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][scarthgap][PATCH v2] lib/oe/package-manager: return early in install_complementary with empty globs
Date: Thu, 26 Sep 2024 22:40:01 +0200
Message-ID: <20240926204001.2245184-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 20:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204998

Return early when globs is either None or an empty string. If globs is
an empty string from the self.d.getVar, we should skip the reset of
install_complementary, as the result from processing with empty glob in
oe-pkgdata-util will always be 0 packages to install.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/lib/oe/package_manager/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index d3b2317894..1d923c436e 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -365,7 +365,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 for complementary_linguas in (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
                     globs += (" " + complementary_linguas) % lang
 
-        if globs is None:
+        if not globs:
             return
 
         # we need to write the list of installed packages to a file because the
-- 
2.45.2


