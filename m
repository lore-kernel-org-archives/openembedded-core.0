Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F56C44536
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 02:57:56 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29034.1769050672940969842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 18:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lYlPx7PX;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: colinmca242@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40418578e28so200284fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 18:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769050672; x=1769655472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nEUc6l7bS4mOToQ7LCLJf6FOiEZ5DgDIOHB0yACPovI=;
        b=lYlPx7PXs8K3Dc/yLG4ZdRVIDOaTEcOxAg9t6RQaPDg8ecKBqeCk0YZBh7RU51EoxV
         0X1AMmnYuEhQQmKKXZnRJ5P07k1UxkO8Rabvao/AoqwoZ2111iBFHwwMl3Fm+ryRrInv
         4w8Maqiq56Ok12qIh0hV/dc+o3SBCUEAKBAxBRoYVMsCq0OUSed8WRA+UR+yoOdlCBl3
         63vl5LwxlHIpP9qA/5rhhrXQx89vvYXB6iHbeWlro03NJq5PMF3GGBsWBmt6vUVsEKCx
         0B8h6FbYJd162/asnBuWj1CN77Hquv9ON88F+s+UCpc1WzlV+j/MkjEKp3UFMcXb+mX+
         u6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769050672; x=1769655472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEUc6l7bS4mOToQ7LCLJf6FOiEZ5DgDIOHB0yACPovI=;
        b=DLR1xQD1vOLxBURjmTDTFAEKXa3YlEZ27FZr/U69zg6KXCaCVheYum/4TqyTpEmeYC
         GbnIC/8JY3EygFq+vne+7tpVfIwCXKQNJjY3V3p1+VHe7dDfXJil1PJTd1qTrqu5/E3/
         IykZhg5+Mo3JNhO/2RHU+iUwsPHAoUULAKYEEvWm8P2zBJDXlY5xPFjIXGinIwiAoOWF
         obHdotAYhXqHsspceVjI4rlgTjLR7aKkiv6G9XVHKS3R4C9He0dMWfHv7hO1zOZ5Z36k
         FbXqKfmqeUsjXHoUiCqcQ9m57Eqp5xddlV1mRN1iZ2JM2cpyNjiv/TqgyMYc6ORj8pdg
         rXEA==
X-Gm-Message-State: AOJu0YzvWxN3Z3lYt9ku7ezZb6IdZUtpz4HoaPd7XpvMJFrFiz8zl2Wn
	B9Lo4Wnzk1Z1eK7asPWRLCYEC/Zr+PU1ODSf7SbjLW2NT47okU5enLME/C0XzA==
X-Gm-Gg: AZuq6aI1kqgXDzzvyPp2TsK52k1qGFQYCYcfrQ2dNO7FfEzMRXxojU+41q5U4r1PMcs
	uy2YLjqZrm1MNr+fsPI/ESx2OupoURFHoXdKOrBxUzrPeA0E1JCzoQ5EMxg+FN3I5YqNNFPZxLp
	PJV+u37W0L1kpD7GQDTO4QOa0BlB4U9EAAtxsdZHC9xWUfgU3tVsz6ZBQjqVyg5zbN9paXUcxq3
	D9caZ0M2b8irKpFJIncGcnOio2xTplpMGU9wY4yYEjtGK9nTt+SuNf8Ckb7fbmciBQu/GUuF7GG
	fn6hgkqDce5WTXzFt8fnTXyvKnb57eso74KmRD65DiKr4vTkB9zcMcP26mjjcfXweOpRoZWDlTm
	86LfVF07/QOPBjkcWf6TxtknKi2oYN6eJjy0+ldSxsHMU2Yslywwy8Vs9fl8iPpo7DfKU5xjXqy
	IOTwzwTM8=
X-Received: by 2002:a05:6870:831f:b0:3ec:8851:54d2 with SMTP id 586e51a60fabf-4044cdfb96fmr10820757fac.21.1769050671704;
        Wed, 21 Jan 2026 18:57:51 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bd5cf99sm11710759fac.17.2026.01.21.18.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:57:51 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH] python3-cryptography: Add legacy-openssl packageconfig
Date: Wed, 21 Jan 2026 20:57:36 -0600
Message-ID: <20260122025736.187410-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 02:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229831

Fixes [YOCTO #15416]

Adds legacy-openssl packageconfig option to allow users to specify
if they would like the cryptography module to support the legacy OpenSSL
module or not. The legacy-openssl packageconfig option ensures the
openssl-ossl-module-legacy package is set as a runtime dependency. If
the packageconfig option is disabled,
CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY will prevent the library from ever
attempting to load the legacy provdier.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---

I wasn't sure if this new packageconfig option should be enabled or
disabled by default. Leaving it enabled seems like the less disruptive
option, although it's leaving the module in a less secure state by
default.

I'm happy to update the patch to leave the option disabled by default
if others think that would be better.

 meta/recipes-devtools/python/python3-cryptography.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index b3b45cd172..366fda5e87 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -22,6 +22,11 @@ require ${BPN}-crates.inc
 
 inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
 
+PACKAGECONFIG ??= "legacy-openssl"
+PACKAGECONFIG[legacy-openssl] = ",,,openssl-ossl-module-legacy"
+
+export CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY = "${@bb.utils.contains('PACKAGECONFIG', 'legacy-openssl', '0', '1', d)}"
+
 DEPENDS += " \
     python3-cffi-native \
     openssl \
-- 
2.49.1


