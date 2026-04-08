Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD481073CB4
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:06:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105748.1775653568757412971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 06:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pgiEvgYk;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so3646775f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653567; x=1776258367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n1KPgTas4vum1HDbS5Rbh4W21wBnmhlMaSUpm90XDfM=;
        b=pgiEvgYknDmshDYIy+Ztet1UkRSR+IXEp86EOEVLUOhZCxEYIecJKwozPrMg3LuVTi
         8r+ZK+xvqx+sWZCEJAxWcA8Ilg31AanfSnil4j6f9BEJIC8bOtyh7E4uaBDjEeF3MaXa
         yCe2u7n/2gLd90jR1mSzCwpT8b3e1FsZSCfk7z1WkCR5UIdpssD3QfagGx+FtqvFGrNj
         TsQxUtT1IXj7tW1rOSdnroWwNph3032LoUy2vCI4L7IqDPkOckZM08q7wqWac0OTnBPW
         iFeAvXUiPCEXb3N6VFw67fKTiji2KD0eOkWk+Z5QxcJom4ZNRwlQXWHVybAdVtnzUaG9
         zn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653567; x=1776258367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1KPgTas4vum1HDbS5Rbh4W21wBnmhlMaSUpm90XDfM=;
        b=s8R/dmZRKRGE9mPUSgCYweWKSKFqZG4WTvHSCHJOgdUPMb1thtHp0W3XAGMcDOCT2K
         YfTF91T1/Px8E2cVoy4hvrsH9jbaavctv1xJI6Q7B1U7eefG4UYLNfuANzDfPGSEoeWc
         f0gIFFgCuv6sQlRiRlysjeMoEP6gihRckpYNPYgMkAEISLbWDJyAgutlcG3UIvbiJo8b
         LwuyAHlw8DTZ7yjY5gTs6Hkf+DJK/NvFgnku9CaFEIm4B7n7odNzjGx2A2zLQYvGHDKE
         I+8mr7vWeayvImo1ccgtUdBeoUdKb1wiqT1JOUUFPRoWS0VwrZsz9C0mN6z7ueyBf7+B
         Q8Ew==
X-Gm-Message-State: AOJu0YzyKBB58JcLLisLxS2p7TDPhJzWnGo2/hybrcS5NzazMgfV6VYw
	XxStsIuTHNY0IVGnJcKLlXTWjSYJHMKLu7WExZ7Dbt60WQOstTLtN0uzDZPXHw==
X-Gm-Gg: AeBDievsqLAeNi/6sPn7QZDN+aF8Y6eSr2mcGYX8d/AZk40ZeDTSqM29m5PqH7XKbL4
	CkETFsoZTmwHGJ/fVKxY73SMxT0YP4lFg3GN8MWuY9WUKpFuveU3IKotaZg5/gHu7461FL5BXWq
	VqkxU8qvZmcb1ef0/u79QhYm+BKwB0X9vVV8oJe0A1wHmzOXXTtJJ86Gw/c2lkRXRMoepJ5dxN8
	izoH9ylFRAhnADxDf9U4FaZyHiabWHU+UfewqL+ZcB++6a1soc5NSsrJph1c5gkiR79XYimtmwD
	fKqO54ybjmvgSX59wUJnQf9iRazCFCt0g8+jOEG7ZYNdbUwzUqJwI5mERDZ2rC6bsfYGwz8TK31
	blVLOmwEk643PRaZ5rbAGa9e2H0yYEVJN1+UVWBuXl1J4/bArOYUcKJokOlNKEWSRbYMGmypWa5
	G9eD5zCHr/g/Zv8w8Dxqhnex4CPIV1fNSYyslHITTSy9+5AgE6Wbfn3+aPHEbq+FfAkQ3WfbcUT
	EKu21oc7OLJrSUkwwethtkYkj2GU989Nlc07Nn9OYd7djkQ23xipUipKEGP8twpncQxzEAzqWJQ
	AtH0aeThKckaCkj/qbM+
X-Received: by 2002:a05:6000:4201:b0:439:c299:4d8f with SMTP id ffacd0b85a97d-43d2928b8eemr31116341f8f.17.1775653566837;
        Wed, 08 Apr 2026 06:06:06 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm60379977f8f.1.2026.04.08.06.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:06:06 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Franz Schnyder <franz.schnyder@toradex.com>
Subject: [PATCH v1] gnutls: Add p11-kit for native builds
Date: Wed,  8 Apr 2026 15:05:53 +0200
Message-ID: <20260408130553.819420-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 13:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234836

From: Franz Schnyder <franz.schnyder@toradex.com>

U-Boot mkeficapsule host tool now uses pkcs11 related gnutls symbols.
If gnutls-native is built without p11-kit support, linking
mkeficapsule will fail.

Enable p11-kit for gnutls-native.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 92156c277c..7218428012 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -31,6 +31,7 @@ SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea01
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
 PACKAGECONFIG ??= "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
+PACKAGECONFIG:append:class-native = " p11-kit"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-- 
2.43.0


