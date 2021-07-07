Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.315.1625677569717418759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 10:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fs1DgiY4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id y21-20020a7bc1950000b02902161fccabf1so1589499wmi.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C/IBBwB5Dxk3g0WeC6zUOvjTF+NiG/7yxZVjXw2o9L8=;
        b=Fs1DgiY4v0qJi43t1uC02T2MSZncJyLgWx+qIgY/5nL75pl5mWVfouu11z7hi6uQh2
         nGBNj7Ltl8ojySVPOCnAEZci8CeeqFg8zwTB4p9/DV9aoTHEgqBYFndKfSst33U5Mm4N
         N4jBOtSTOoDJ4AxRv/g47TydJmIdo8Z6vVmfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C/IBBwB5Dxk3g0WeC6zUOvjTF+NiG/7yxZVjXw2o9L8=;
        b=fTvjaVa72eRgB9QWMsRD2tXw1GkFSxoaB2IAMfQck0Eo1BxDzB3TAzoFydWTuDQXOC
         7xmeIfiIevhEjLFH3MMGyX6FJMvyXdFISftAzYleSto47oLj7ZfKDM9442ydxE8JWgn6
         XvHmqtl0bAXnDMhbag1kK9oMLbGp2aoJ6oZNX8w19Ce2sXF0VN+uR5bEkCiTL3NnOJIR
         NnQM7F8EsntjEOeRSie9rL2r0rfHs6bTG8CFQxmMC8MujF3XKS7dM6eu2bgr7upDot/Z
         Z5fYrYeyrjC1PJHYR7FlxCgPnYjo1CHkvBgPiMQ/78iEANQJmUIelBoLPwYTaUb7A2hV
         ZvYg==
X-Gm-Message-State: AOAM533jMKRNSh0KGRPVpzdxdm4KhKZsM+SQ2+LXpKPesn1hzZlSuGI7
	wmZCRic+lS7W2fcrB9rTAsZGEbHebis5Tw==
X-Google-Smtp-Source: ABdhPJxWaKIOUJZbiZDt/jJqzgRF3Wp1BeK4zhqdIeaXtDWgZbQsXueR2EQKFHVbHH6b5QOwMZO4jg==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr60415wmc.15.1625677568098;
        Wed, 07 Jul 2021 10:06:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id r15sm6529180wmq.15.2021.07.07.10.06.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 10:06:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] license: Drop adding RRECOMMENDS for license packages
Date: Wed,  7 Jul 2021 18:06:07 +0100
Message-Id: <20210707170607.2698337-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This changes behaviour when LICENSE_CREATE_PACKAGE is in use. Packages
no longer have RRECOMMENDS adding to them.

It was highlighted that this doesn't apply to PACKAGES_DYNAMIC, nor can
it easily be made to do so. There is also a much easier way to handle this
which is:

IMAGE_INSTALL_COMPLEMENTARY += "*-lic"

which works on a per image basis and doesn't change the underlying
package dependencies. I propose we switch to this instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f7978e266b6..c87473cbb85 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -63,14 +63,6 @@ def add_package_and_files(d):
         # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
         d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
         d.setVar('FILES_' + pn_lic, files)
-    for pn in packages.split():
-        if pn == pn_lic:
-            continue
-        rrecommends_pn = d.getVar('RRECOMMENDS_' + pn)
-        if rrecommends_pn:
-            d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends_pn))
-        else:
-            d.setVar('RRECOMMENDS_' + pn, "%s" % (pn_lic))
 
 def copy_license_files(lic_files_paths, destdir):
     import shutil
-- 
2.30.2

