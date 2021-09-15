Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.2911.1631742359649993594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 14:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TIIVc+2j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id s24so3263457wmh.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwE6e5j4DaesPqC5juh/ZDvLRNZHyA8ANUaMSftFgnM=;
        b=TIIVc+2jYxO0zK6jFVDnGsSnMJ/C9kuL7U+BTfbQCap/vspzFJ0JwS7iI8bY0bCx9F
         kLLioCRpkx78ivQULpYGHtNvVE+vrzSNRN+VT9KvNku5mZRKdNw+RiOdNjh3/kWOfwwX
         KmkwnojP5KFJmuvJ8kuI8NMM5e4xw5TNkiUt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwE6e5j4DaesPqC5juh/ZDvLRNZHyA8ANUaMSftFgnM=;
        b=tEAEXtdcvqhRxI/GywoMgzIZvoENuJ0FKzUHREfhbIHpF1VRRynqgmJEnROmx3u+im
         ggFrzozNTsXMHbGmbLFl1Sia09q5KrhpIPQv0R4ebQoeavnclxBnRKRkTJ28IVbfDxjU
         Z60if/NpRBhzmfLH/aZBb9GByo0GanTAKDaAQSVYXyBzMo4+NpIkLXrT6RPsumm3x9bN
         LuwJkHgnpEbaUw1X3kY5UI7gzi+lV/6h8CtuFdbZaiJ/1YtkaQE5ajDJfw6IyuIQGZsg
         dC620x/PDwX+2podPStl+tDN3YIOSgkuv9DWY9Rg7ebcIR40b2HwJxHsPhSrNyYM/Goa
         UprQ==
X-Gm-Message-State: AOAM531ouhOcdL3H58WLnJCpVoQeCdBlrdWU1OuEY1gS96MpwB3lHDdw
	zqSYMMdHwC9gH3/O3150k0Vucy4mO18IIgI7
X-Google-Smtp-Source: ABdhPJxzWuwrxj5kPHx5ZVma/etmka6H2aWhy1jGakAfF+iCblEu1dnuN7s4LUfx35GYq0FkO//BcA==
X-Received: by 2002:a1c:3845:: with SMTP id f66mr1775168wma.63.1631742357857;
        Wed, 15 Sep 2021 14:45:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c])
        by smtp.gmail.com with ESMTPSA id o17sm1170559wrj.96.2021.09.15.14.45.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 14:45:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] useradd: Ensure preinst data is expanded correctly in pkgdata
Date: Wed, 15 Sep 2021 22:45:56 +0100
Message-Id: <20210915214556.1418064-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The preinst data in pkgdata will not expand out the ${XXX_PARAM} variables
since they don't use a package suffix. It happens that the final expansion
used for the packages is corrected by a second trip through the datastore.

The first version is used for calculation of the task output hash and
recent improvements in hash reuse showed this data wasn't using included
in the hashes, meaning for example builds with dynamic IDs were mixing
sstate with builds using static IDs. The result was a mess.

Fix this by expanding the data in the preinst correctly to use the
package specific _PARAM values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/useradd.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 287ef843340..20771a0ce59 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -230,6 +230,10 @@ fakeroot python populate_packages:prepend () {
         preinst += 'perform_useradd () {\n%s}\n' % d.getVar('perform_useradd')
         preinst += 'perform_groupmems () {\n%s}\n' % d.getVar('perform_groupmems')
         preinst += d.getVar('useradd_preinst')
+        # Expand out the *_PARAM variables to the package specific versions
+        for rep in ["GROUPADD_PARAM", "USERADD_PARAM", "GROUPMEMS_PARAM"]:
+            val = d.getVar(rep + ":" + pkg) or ""
+            preinst = preinst.replace("${" + rep + "}", val)
         d.setVar('pkg_preinst:%s' % pkg, preinst)
 
         # RDEPENDS setup
-- 
2.32.0

