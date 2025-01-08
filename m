Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC6BE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:03:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.23478.1736352215759536249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 08:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fOYGERRo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385de59c1a0so10089389f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736352214; x=1736957014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAQW7F4bvh3eD+vUeCUs2juy+DxedQ25/dGqbNJKrBU=;
        b=fOYGERRoPhneBDkwrbpNxQs4IJ9lhF2CSgxA3xhHTBR8lLYFnWC3++s6N1XUsqutcR
         A/vAsuKqU/l4P+RQwjTl5BLcsTMD2Y+1/+23Zarh+mRZn7X6z0np4oNk95qUh0Ew+TDW
         xGOQc+oN8asAz497s99rrX93LtQOmR3dDiw/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352214; x=1736957014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAQW7F4bvh3eD+vUeCUs2juy+DxedQ25/dGqbNJKrBU=;
        b=V4j/4zHzcx6JCXDrweRqULWRCV3SoyFxqYTuXM7DzMbW8LKRnrgrPmd9yOC7AODRnU
         GqCNYPkBphwoT/jXBlGAEWQXnAgaveUsK/Di0VFsOTa4wmgM+6mNzxpmGBc/NAtqGNnN
         53QfDFCRY0N/80yNoE61oGxOmuYCLDfk+LxfFSDHM8j/vOgrm55jD1B8OaI+XiLXc4UM
         /GrNlohXCoyr1k9B+g03kses8kI0VOHGigoYA98GTpdy7T+hnpek3y9t8xm3y2XY1pDK
         IpKNIxOD5UEtv0kJ1w3AVVNb00BshydA3EyOPJuyFHzd6NkHN4Q2B5puBcprUs0hsZvl
         w2hA==
X-Gm-Message-State: AOJu0YwouEEeC0ZT1zw1sE7ogYHCkIA52faOFfMI/Fm608PErsoOcR5w
	svJ6boXAs83mQtPnE0wbEqFV0sD9KmCCOq+tavYVmHpx5NTCfemdEpo3k5bJOJYixKLsw/kiB9E
	DvVg=
X-Gm-Gg: ASbGnct3Y46rgPA4xpKOpGAF1Dv9CKlv0EY2DHJCrQQQTB1DFJnaxVjeqX3t2Ckd4hE
	1uKaEIY0x75pA1eQnoJHSFE8MaOAJSm0+gi9ATi8pzhTtPVwv5gg24f+wQqMaxQHxJw3Oh0mi7l
	CWQ7ygF2rzvVEWIJ39q4ExoZ7qCAEjfevcnLzgwe6x/FM+ioWsMUDHuTMUsknNqOXtSyJRqrHOa
	YcybP/W9IIrQo1R0zh3ZBefAJCU7D+EmBCEQW3OmLQKl+ohK5U5fViJBvvXKevbY1fiSuW8nXHo
	g/BNcmuAMQ==
X-Google-Smtp-Source: AGHT+IGEHmOyp6Og4cm54CFmRXSVJetddNPkzI/pDZshNKZW+GrPfdvhEHqr9BSg+ifV1W754ICrBg==
X-Received: by 2002:a5d:6da2:0:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38a872fadf3mr3088872f8f.7.1736352213604;
        Wed, 08 Jan 2025 08:03:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92794sm24882405e9.37.2025.01.08.08.03.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:03:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] util-linux: Improve PACKAGES_DYNAMIC handling for util-linux-native
Date: Wed,  8 Jan 2025 16:03:31 +0000
Message-ID: <20250108160331.4137310-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 16:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209576

DEBUG: Assuming util-linux-swapon-native is a dynamic package, but it may not exist
DEBUG: Assuming util-linux-swapon-native is a dynamic package, but it may not exist
DEBUG: providers for util-linux-swapon-native are: ['util-linux', 'util-linux-native']
DEBUG: sorted runtime providers for util-linux-swapon-native are: ['recipes-core/util-linux/util-linux_2.40.2.bb', 'virtual:native:recipes-core/util-linux/util-linux_2.40.2.bb']
NOTE: Multiple providers are available for runtime util-linux-swapon-native (util-linux, util-linux-native)

The PACKAGES_DYANMIC line could match native and non-native packages so
tweak to improve -native handling and avoid the above warnings in world builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux_2.40.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
index 2c7dd154e19..fb4b4f59a74 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
@@ -59,7 +59,8 @@ python util_linux_libpackages() {
 
 PACKAGESPLITFUNCS =+ "util_linux_libpackages"
 
-PACKAGES_DYNAMIC = "^${PN}-.*"
+PACKAGES_DYNAMIC = "^${PN}(?!.*-native)-.*"
+PACKAGES_DYNAMIC = "^${BPN}-.*-native"
 
 UTIL_LINUX_LIBDIR = "${libdir}"
 UTIL_LINUX_LIBDIR:class-target = "${base_libdir}"

