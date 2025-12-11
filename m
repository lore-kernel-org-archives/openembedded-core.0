Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F53D41D5A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:29:43 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11923.1765466980625374345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UyALxbky;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477a1c28778so2422485e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765466978; x=1766071778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ILGm81oGz6TsRd94CckL0ifVmJHdBipztdkNRx4bfI=;
        b=UyALxbkyCSlqcBe0cerfN/bEgbaadTfB7L8xn/EWMJ+Xbz8TJ4NY2BvkicwLQfGepZ
         XZO0MbRZ32+RaEuM9kBXASd6GreBf7Rc2zejEsyig80vfC7zE2Peo04qBtq5VavRGyul
         +P2x3EDIEdStqg4yC6UfMzqcQS+pCXN/51q3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765466978; x=1766071778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ILGm81oGz6TsRd94CckL0ifVmJHdBipztdkNRx4bfI=;
        b=l+CoJyZvFybmtbgtY62+RfTPbtR22xrq8/O0HpLlOt3yt/JfAcBLnXpGNSda0scnCn
         qRVw8AYJQh54/hVaTePE0Rt8mUgkB02AT0LyybOpb9r9TDrSu+CcQl2W25pXGTN1xNgV
         qnWChSw/pt3tRYNGTLofiJLXQcgOrlaA/gD+OHOwzETQE/0guM+JtK6gnDGzv0iplbz5
         nnZt0Nbyp/XxiDyo9oRHLaLQfhhhaeFGKAq3S0LKteLxoIGrtD8Yr4Sx9s3UrJXckc/o
         E3Sd+Z5z/iGrg+hTNA7Cfmgv3KH9/v6CQZ4U0mS+wpFIfgyJZcvhMxHFkuSI8l40ezis
         Mzxg==
X-Gm-Message-State: AOJu0YxztjvTHUb6fF0yY9jwlmnEbMa0lZRFnDzB1nvaBWKCwwBXI2Fw
	tG39BnzEkqE5Irv/d1srbKNLvJ6YZDi9zp+wcFhcq9SDeJ8ZIboHgOhPwKIBlmy3cQMFYwS2/Dl
	Xu82kZs1ZIQ==
X-Gm-Gg: AY/fxX5Q6yyUa4cmnugZBOABTmy0jINbnGyTgWhS0adppb6Alm2nYMp4l2vzQ3f43DW
	TuYDARhBwA1xCa7f0Zakj7tDiU4XInQ5KlVyhCQ0x5fJpn2kYRgp/ymK93QVRsI9PMQDCkV+woM
	wYFmVf3hGzPoQdENB8EsKgu6LNntNvxJEMR5w7F6NWxz9d+bV0RjygxFTc5SBt5jiiPmZyag/IZ
	BAZKSUgTxaS/1BBLes69+MnkH5JKC/qEK9b5HUVIYxeIIpqYWYCnvGwMByDOrgkoqo6gOs1N5sv
	y15+Bzk4LRA2n32fLlTDSpbukx0WE2skBvzaXTfFEICAIDb18ZHrfrUB4vpuch39O48e3g/uJMZ
	PK0f/ASZBPRsQRWJYWMp6Cx1McePls5V7LSKRFQiB4RksY/Fevg9wVjSDbALTRMBjP1/nw3ZT/b
	cDGtBYIQXEJnBl0jwlpcL+sLZhnZfKn7Q2aJl9pBkbXOoFQepE2Q==
X-Google-Smtp-Source: AGHT+IHtQSvXjf6un0ePt9Zuido/jx+AjiBeNFPCCEoxdjEdc2SS8wycX5/miVD3I386/YL3EvjfIA==
X-Received: by 2002:a05:600c:1c9a:b0:477:55ce:f3bc with SMTP id 5b1f17b1804b1-47a8378cd34mr65830665e9.19.1765466978266;
        Thu, 11 Dec 2025 07:29:38 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d9a5:9dbc:9018:5f05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f8b31bsm43149445e9.13.2025.12.11.07.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:29:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oelint: Remove obsolete class
Date: Thu, 11 Dec 2025 15:29:36 +0000
Message-ID: <20251211152936.1267124-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227547

Most of the checks in this class are covered by other areas of the code now.
If there is anyting important missing, it should be added elsewhere. The
code hasn't had meaningful changes since 2014. Drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/oelint.bbclass | 90 -------------------------------------
 1 file changed, 90 deletions(-)
 delete mode 100644 meta/classes/oelint.bbclass

diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
deleted file mode 100644
index 458a25ecc39..00000000000
--- a/meta/classes/oelint.bbclass
+++ /dev/null
@@ -1,90 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-addtask lint before do_build
-do_lint[nostamp] = "1"
-python do_lint() {
-    pkgname = d.getVar("PN")
-
-    ##############################
-    # Test that DESCRIPTION exists
-    #
-    description = d.getVar("DESCRIPTION", False)
-    if description[1:10] == '{SUMMARY}':
-        bb.warn("%s: DESCRIPTION is not set" % pkgname)
-
-
-    ##############################
-    # Test that HOMEPAGE exists
-    #
-    homepage = d.getVar("HOMEPAGE", False)
-    if homepage == '':
-        bb.warn("%s: HOMEPAGE is not set" % pkgname)
-    elif not homepage.startswith("http://") and not homepage.startswith("https://"):
-        bb.warn("%s: HOMEPAGE doesn't start with http:// or https://" % pkgname)
-
-
-    ##############################
-    # Test for valid SECTION
-    #
-    section = d.getVar("SECTION", False)
-    if section == '':
-        bb.warn("%s: SECTION is not set" % pkgname)
-    elif not section.islower():
-        bb.warn("%s: SECTION should only use lower case" % pkgname)
-
-
-    ##############################
-    # Check that all patches have Signed-off-by and Upstream-Status
-    #
-    srcuri = d.getVar("SRC_URI", False).split()
-    fpaths = (d.getVar('FILESPATH') or '').split(':')
-
-    def findPatch(patchname):
-        for dir in fpaths:
-            patchpath = dir + patchname
-            if os.path.exists(patchpath):
-                 return patchpath
-
-    def findKey(path, key):
-        ret = True
-        f = open('%s' % path, mode = 'r')
-        line = f.readline()
-        while line:
-            if line.find(key) != -1:
-                ret = False
-            line = f.readline()
-        f.close()
-        return ret
-
-    def checkPN(pkgname, varname, str):
-        if str.find("{PN}") != -1:
-            bb.warn("%s: should use BPN instead of PN in %s" % (pkgname, varname))
-        if str.find("{P}") != -1:
-            bb.warn("%s: should use BP instead of P in %s" % (pkgname, varname))
-
-    length = len("file://")
-    for item in srcuri:
-        if item.startswith("file://"):
-            item = item[length:]
-            if item.endswith(".patch") or item.endswith(".diff"):
-                path = findPatch(item)
-                if findKey(path, "Signed-off-by"):
-                    bb.warn("%s: %s doesn't have Signed-off-by" % (pkgname, item))
-                if findKey(path, "Upstream-Status"):
-                    bb.warn("%s: %s doesn't have Upstream-Status" % (pkgname, item))
-
-
-    ##############################
-    # Check for ${PN} or ${P} usage in SRC_URI or S
-    # Should use ${BPN} or ${BP} instead to avoid breaking multilib
-    #
-    for s in srcuri:
-        if not s.startswith("file://"):
-            checkPN(pkgname, 'SRC_URI', s)
-
-    checkPN(pkgname, 'S', d.getVar('S', False))
-}

