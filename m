Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.998.1625954863337686675
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jul 2021 15:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sa0HKtlh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id l7so17093436wrv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jul 2021 15:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=V7+EVYuqia94kMjwGqSGw4Te1SGfMqHKkDoZyvV/FKw=;
        b=Sa0HKtlh3GmQdab5LWZ+OxJWyJI3N0emOmjDsIkwWwL36U+ATu71GzZ4B3kIck1jiB
         Q29FFRIQNbNrnvFDP9oe36aPbYj9MvGGMogziKQC/CpP91IzhQMRJ1S/1bit7/FvNAdP
         RS51TrZDDa0GSOPDtbNtMHpYMYVAgikMQ7PEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V7+EVYuqia94kMjwGqSGw4Te1SGfMqHKkDoZyvV/FKw=;
        b=eBl5uxiiZWSreuRXaIB8mU+jhN594524+YCloKiPZheQHizODIpaLfjfv5E7+3oA1R
         XSkV8jV7z/KFaB6NvxdTzilTVfPvOpLWbBAttY8bBNlAWGCotc+7gGcTyH0yuowytHST
         1vnO8xW34gQEIZt0tRrjimXiDtj374oyuZpVjxvN16mxnaFbsbm+oaWqzA2VdeuFQUq/
         VPkIdemEsUMXIdY90c3XG1xkxbnbrqYVOWSvKvUsBt3LhcQpEqktrjWXQIedzFGE1nfp
         NEfdbXoFMxZsuvRAIvBnVEPBibVuc2THPeUyWsKD5xBR05cZrR0HfuOkadXdssKDlt8Q
         k1vQ==
X-Gm-Message-State: AOAM531W+9CwbOF8EYMRnBvTL3KYbXsbpGxjOD4LJ8t/XSzKXQhPP4s3
	2dGvv3gPy/mbLzKCG69Tks4kb5itkEGEGA==
X-Google-Smtp-Source: ABdhPJzolTKH3JH7ksVfhPaBtjlO4LXrhtk5chEV6Q26KTE3m2bcCanNdY3fG3CEdyMm2CR33sY89g==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr49673308wrn.337.1625954861895;
        Sat, 10 Jul 2021 15:07:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5e67:1ea9:260d:3e7f])
        by smtp.gmail.com with ESMTPSA id t3sm5146334wmi.14.2021.07.10.15.07.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:07:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] sstate: Drop pseudo exclusion
Date: Sat, 10 Jul 2021 23:07:40 +0100
Message-Id: <20210710220740.2793958-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710220740.2793958-1-richard.purdie@linuxfoundation.org>
References: <20210710220740.2793958-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that pseudo-native always includes statx support and we have sanity
checks on pseudo-native to ensure it always contains a minimum feature set,
we no longer need to mark pseudo-native as distro specific. This fixes
eSDK build problems.

[YOCTO #14428]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6c8e64ed00d..f6710fc2835 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -123,8 +123,6 @@ SSTATE_HASHEQUIV_REPORT_TASKDATA[doc] = "Report additional useful data to the \
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
-        if d.getVar("PN") == "pseudo-native":
-            d.appendVar('SSTATE_PKGARCH', '_${ORIGNATIVELSBSTRING}')
     elif bb.data.inherits_class('crosssdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross', d):
-- 
2.30.2

