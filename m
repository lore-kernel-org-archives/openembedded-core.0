Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id F186F7423E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2018 20:15:53 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id s12so6654621wrc.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Apr 2018 13:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=W/elC6wZoTYh6qWv41tuxvhPgd/vbCRMIT8Lo9XoEtY=;
	b=vesAoRTZOFULnRnng0Np3p6pv0ErIm9YxqeT4r94jW9I/uuPI04KA2qnyf4Jl0Nh+8
	J/v3Lv4uQ4xSLCuGdzzruxdlgXmuY1MxQ0QDUyKRnon2yydhS2O4OdCvhBdrM6WfqyZS
	K/lV6lWq+/K9ObXVcgh11WQn7VDJCu7RaPBAKx+OsWXdShBFVBSpWyqTKf8jcA7waroB
	osh6wwxgHn43zth/onHAMp0T1ZNWVCR+0pIplzpNsacewu4Jl8A4Xd2mYaBn+jZqKo6i
	GMUyVTNYNdA4vTYFPCsL+Mq/mnyV8PnvyFYMn25Vn02NoQhBP8+TDGFQANldlauyRNt9
	pJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W/elC6wZoTYh6qWv41tuxvhPgd/vbCRMIT8Lo9XoEtY=;
	b=Hupch0MseyN7Kak5tEx2djvK9WZqnLTRjPOmwy9/7mvQIUErhCKFqRaquX7RtCJgmc
	byt/GnPcpBu4YjbWrpZ/DQNBJ+amIn0z8Nuu8F2Ak4dZngNzhyB+I3APf/TCvnd8kdco
	mj5L+KjGzDY5KgDFG8rXXSPZR15OQeffmLZrhEzPZ1Yow2zPKqsQ5MvqF3YQ79jTEbS5
	xKvmiSOegvUtR1lLrvIbIoGi3JGMpIp47VNX+vaM4Q1t78IwvIj29fWXpPA4IvZGLFQZ
	r8e+QzfBa6pcBKegO1z5iBQOnT7ydR4MberthO/qTEVrOpbbAyc8uw8/tdlCtiEYB8NL
	rPHg==
X-Gm-Message-State: AElRT7FdYTF54sXrGpht54kmRwgPexRO6K7SIy95iL7iLUUMGr60tGur
	95g3rjVADTqwlWCCGo9JEFABDg==
X-Google-Smtp-Source: AIpwx4+xEDQMcRue3H/u5sgwX4gPss4cULJd2GfcblpdrIclK8uf2i1dAuQj8GPo8xx5UCTInzhwzg==
X-Received: by 10.223.143.86 with SMTP id p80mr26526590wrb.31.1523218554315;
	Sun, 08 Apr 2018 13:15:54 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v74sm9970564wmv.48.2018.04.08.13.15.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 08 Apr 2018 13:15:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Apr 2018 20:16:00 +0000
Message-Id: <20180408201600.538-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] license.bbclass: be a bit more strict when searching ${PN}-${LICENSE_PACKAGE_SUFFIX} in packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2018 20:15:54 -0000

* linux-firmware contains ${PN}-license package since this commit:
  commit 1ee083da0730408fffdbbf5f29abc299c0e61be9
  Author: Jackie Huang <jackie.huang@windriver.com>
  Date:   Mon Apr 13 10:17:21 2015 +0800

    linux-firmware: fix the mess of licenses
* LICENSE_CREATE_PACKAGE functionality in license.bbclass when enabled
  adds new package with suffix:
  LICENSE_PACKAGE_SUFFIX ??= "-lic"
  but then it checks if ${PN}-${LICENSE_PACKAGE_SUFFIX} is included
  in PACKAGES before adding it and when found it shows:
  WARNING: linux-firmware-1_0.0+gitAUTOINC+4c0bf113a5-r0 do_package: linux-firmware-lic package already existed in linux-firmware.
  and doesn't add the ${PN}-lic to PACKAGES and causes another warning:
  WARNING: linux-firmware-1_0.0+gitAUTOINC+4c0bf113a5-r0 do_package: QA Issue: linux-firmware: Files/directories were installed but not shipped in any package:
  /usr
  /usr/share
  /usr/share/licenses
  /usr/share/licenses/linux-firmware

  that's because it was searching ${PN}-lic in PACKAGES as a string
  so it found ${PN}-lic as a substring of ${PN}-license, add a split
  to search in an list

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d353110464..6d36a5f503 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -336,7 +336,7 @@ def add_package_and_files(d):
     files = d.getVar('LICENSE_FILES_DIRECTORY')
     pn = d.getVar('PN')
     pn_lic = "%s%s" % (pn, d.getVar('LICENSE_PACKAGE_SUFFIX', False))
-    if pn_lic in packages:
+    if pn_lic in packages.split():
         bb.warn("%s package already existed in %s." % (pn_lic, pn))
     else:
         # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
-- 
2.15.1


