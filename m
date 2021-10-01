Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA4BC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:45 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.8460.1633096244153002141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ze1mVn0m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id s21so15586924wra.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4ab/QmgJPoFAiKJJ/WDckyRuRnkPm5cPatCU82DXWX4=;
        b=Ze1mVn0mT+f2B83duLe+KVMJ6mYUNnpZbAthdxODx2a+WoMWkTqvSEE57yF/4Eltz8
         qBUmyLNkuvq8FsXrvNRxEdsljQ39qGMHi4iqUds7FaBYOfNIe75vivkCIy9B3v2lNFKI
         lExXKPZsB6qdTExozILhT1CEwTwPEhAww3ftk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ab/QmgJPoFAiKJJ/WDckyRuRnkPm5cPatCU82DXWX4=;
        b=MwD97Z81rhUXxL0xFZ6o5D2PYsdTb+7zP+0AchERCBnOGjlIs7aRIGNTrKDFXQCNVn
         j+mhlcDiPeDI/B1X0vtftiy29nanv94V2LWN4Fvj+i6Lr8m7TY70h2JPogtmWrZd3+Cr
         Aj8XUI0ieGzK9k/P3Qw2BqFelpI5dIQhejdz+Ee86iPB2B5sA6R4yldRuGRVnnywVZ3B
         2GY76S/qrJxcIyqoxJCM7jfqSj/z+44UXjLo30S1Q3XpwGALOmhfIJMQEonYwCfjIEOg
         7ycg5uoFYPmRT4YHR9S6a+XFFK8byArQBNhn3pduNZOlnKX4/hkktchwHKJPyriJiguv
         sUzQ==
X-Gm-Message-State: AOAM5334tHGD/EW+oLx6k4XY4BP0tUWvJOgwa364oSXVpQc052cayMTB
	phx+1n1zBXU7Wbg3dSgQcJI1bEMo9zMSxhHY
X-Google-Smtp-Source: 
 ABdhPJxZs71MFEg7MQDWIjBc+hh+Rn7CGtNlY+f6i503NGCSxRSj1DNc02oJrtdIGTodOVz/VmPxlA==
X-Received: by 2002:adf:e6d0:: with SMTP id
 y16mr12632939wrm.181.1633096242150;
        Fri, 01 Oct 2021 06:50:42 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] package: Ensure pclist files are deterministic and don't
 use full paths
Date: Fri,  1 Oct 2021 14:50:33 +0100
Message-Id: <20211001135040.2251283-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
References: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156518

Currently the pkgconfig pclist files contain full paths which are build
host specific and the order of entries is not deterministic.

Fix both these issues so the files are deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 460997ad543..985dfacd09c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2112,12 +2112,12 @@ python package_do_pkgconfig () {
     for pkg in packages.split():
         pkgconfig_provided[pkg] = []
         pkgconfig_needed[pkg] = []
-        for file in pkgfiles[pkg]:
+        for file in sorted(pkgfiles[pkg]):
                 m = pc_re.match(file)
                 if m:
                     pd = bb.data.init()
                     name = m.group(1)
-                    pkgconfig_provided[pkg].append(name)
+                    pkgconfig_provided[pkg].append(os.path.basename(name))
                     if not os.access(file, os.R_OK):
                         continue
                     with open(file, 'r') as f:
@@ -2140,7 +2140,7 @@ python package_do_pkgconfig () {
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
         if pkgconfig_provided[pkg] != []:
             with open(pkgs_file, 'w') as f:
-                for p in pkgconfig_provided[pkg]:
+                for p in sorted(pkgconfig_provided[pkg]):
                     f.write('%s\n' % p)
 
     # Go from least to most specific since the last one found wins
-- 
2.32.0


