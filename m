Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5E3C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:14:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.21.1636737289083754473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NR+ZzT94;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id b12so16754962wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wHvKTCld8IVTB5rUgzaTG29dDcqy5SZ5pFccKe/h8U4=;
        b=NR+ZzT94IeHBUBCvhlj4HIPMmG09g6J1gnI2wZyaVhKsx+8XxeLEd2ckF3aMkxj7e3
         qmxsVUvHX6EwjrKmMvcEBIMNnEqd1Wp+WhkFKfMrGBSjayow9ePS5mUOC9Uv+Q8R8fZQ
         IuQ6CyPAXORiRvozhNiKTvPwOOmMjWHeZz8jM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wHvKTCld8IVTB5rUgzaTG29dDcqy5SZ5pFccKe/h8U4=;
        b=CaS7vjTDJqMyzBzlXf64gfwE8g9hoyvoUYMebKmaiflnhpj3LJVOrR+Xn755ONJWYv
         RGqhba7jcTsRT33uPXqPdLqOnaMT9sTI/iP1E0qQwwqernL1j8BjQd6a8DpfksqX13fj
         fevtzC5PrO6Z3SFOWhTTDj5UXbEQlrg241vjH1gyk40rUez6+bR/BNKxvDHFBPsPFk/3
         /RMeYV6m5aE7nUyzgmfKT8O0SQUTUKpMjmvMieo0cLZCe8PDfCmdJyH6PCvPeG7x3dAT
         +wq3T/rSZFolH9ehsz3xhwWXc4fZyn9NNdk5G/LkPBNq3pPlizSycXAFTu+dVkhY4uoo
         BcaQ==
X-Gm-Message-State: AOAM532MQA2LfrgoxdSU5062tDD4tPAY40JXFXHFxf365nvGpXffRX/X
	wjhEeMrTCxtgBNDviYlVW3kGM+vhUG3WeQ==
X-Google-Smtp-Source: 
 ABdhPJx2BvflLMPnyYePGr7NT7Ww+kFGlEdJC+q6zbJ5Eea8MfYH+LpZe4G+TbLMsLgIryE/uo1nHA==
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr20615742wrz.76.1636737287465;
        Fri, 12 Nov 2021 09:14:47 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id e3sm6263833wrp.8.2021.11.12.09.14.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 09:14:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] package: Add sanity check for allarch packagegroups
Date: Fri, 12 Nov 2021 17:14:44 +0000
Message-Id: <20211112171444.3898562-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211112171444.3898562-1-richard.purdie@linuxfoundation.org>
References: <20211112171444.3898562-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 17:14:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158230

We exclude allarch packagegroups from rebuilding when their dependencies change.
The reasoning is that we are just depending on a name so having these rebuild
lots is just pointless and inefficient. We also don't want them duplicated for
multiple machines for efficiency.

In general this works fine, as long as the package names don't change. That
is also rare but there is one corner case which does catch users out - debian
package renaming. When this does break, users question sstate and so on and
lose faith in the system even if this is a known choice we made.

This commit adds an error message if an allarch packagegroup depends on any
package which shows package renaming in action (through the PKG variable
being set).

If you run into this issue you either need to remove the dependency from the
packagegroup or mark the packagegroup as tune specific, i.e. set:

PACKAGE_ARCH = "${TUNE_PKGARCH}"

before the packagegroup inherit.

[YOCTO #7298]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 92eba988929..84eafbd5293 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -619,6 +619,8 @@ def get_package_mapping (pkg, basepkg, d, depversions=None):
     key = "PKG:%s" % pkg
 
     if key in data:
+        if bb.data.inherits_class('allarch', d) and bb.data.inherits_class('packagegroup', d) and pkg != data[key]:
+            bb.error("An allarch packagegroup shouldn't depend on packages which are dynamically renamed (%s to %s)" % (pkg, data[key]))
         # Have to avoid undoing the write_extra_pkgs(global_variants...)
         if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
             and data[key] == basepkg:
-- 
2.32.0


