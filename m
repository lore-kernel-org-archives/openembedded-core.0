Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DD4CF31BA
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:14 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.6942.1727874788646831103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NDWwrdib;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-719ba0654f9so5637172b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874788; x=1728479588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gh44MPBPRHbAZbqaKnGQS7WNFR5NHkBO7q0Yv5Cuc4U=;
        b=NDWwrdibmPWOD+q0E+E3pVJQKNpR5pQA5UXIOU/nPI8pRwKt7888GA2uLGDxuJqMea
         OuYafI792uZFz6d80wNQpGvZ6DRT6kQzFTI05acPFmRW49gTh2Y3QpqddNzU0FlB7DVi
         Mo7WDYuy/GVOt9DetdF3UC5ZNPBIxXCBX9v8/wSmbMT0wr+TT3vXJOKNH8sMDqWKyCh7
         eK+E+4mCpt7m8SjdOYUaBlvoz4laRxhedwjLnvkXhlN+SwgsZYkqJotPSP4aTFp8yO/r
         9rNkUGXDBmXd+mTATzN0u/FrKfSMAHQkjXHS+sTrGmdXQykzAnq6UR13uUPhy3ZSvaMx
         weIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874788; x=1728479588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gh44MPBPRHbAZbqaKnGQS7WNFR5NHkBO7q0Yv5Cuc4U=;
        b=gqgmma2u0YF4cjUotDsElN4ow2qsPqH+fNQp8cOFVyYVKuhHg4VMTYKwVyNBVwTiXV
         sQqWrnUWp1OcZn5UYFB71bXRZ236wg8n2TL3os0gDd8Q/Q1k4DIW57GOd+9Jdr0FEClw
         VwXY3F23+8A3SfKYZdL09kS5XuLh00f/eBGG9jJ7wKrGeufMWVjs1JSCEgyt3fAt6si8
         G4+8HpNZ2svJ7xpwX0tPgEBH+blKKwDT+ctzwNjAS6hQDPPzmrRHclqK87C96446okJg
         6WoWVARBSf+NB9TNrKrU3nq0X+ZLOE2D0UQAA4OR+I+OhfsLketOm6yHXRSbGTp+qKNh
         Ithw==
X-Gm-Message-State: AOJu0Yyhv2unRhGjHmqjuO5Fn8JcoLD5dD9IZnMPb01lm5FA017Ws6lX
	VlBDIiedhy7m7HXV2WleaFu33k9x1vXy8G5DERy1dGmK/ylVXcCrve5klz4vyh3xJfKYyoF7px5
	+cO4=
X-Google-Smtp-Source: AGHT+IGkmzavRM5ekP8t4+l+RTvIqZDWGl3UL71gtuVz3M00BTvU6bdkyU6KVjWN9bDSVfTGOVrYxw==
X-Received: by 2002:a05:6a00:23c6:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-71dc5c8f4eamr4880544b3a.14.1727874787851;
        Wed, 02 Oct 2024 06:13:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/16] wpa-supplicant: Ignore CVE-2024-5290
Date: Wed,  2 Oct 2024 06:12:43 -0700
Message-Id: <603047ab3c85009c384793cdbdd8e6ae1aebd737.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205187

From: Peter Marko <peter.marko@siemens.com>

NVD CVE report [1] links Ubuntu bug [2] which has a very good
description/discussion about this issue.
It applies only to distros patching wpa-supplicant to allow non-root
users (e.g. via netdev group) to load modules.
This is not the case of Yocto.

Quote:
So upstream isn't vulnerable as they only expose the dbus interface to
root. Downstreams like Ubuntu and Chromium added a patch that grants
access to the netdev group. The patch is the problem, not the upstream
code IMHO.

There is also a commit [3] associated with this CVE, however that only
provides build-time configuration to limit paths which can be accessed
but it acts only as a mitigation for distros which allow non-root users
to load crafted modules.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-5290
[2] https://bugs.launchpad.net/ubuntu/+source/wpa/+bug/2067613
[3] https://w1.fi/cgit/hostap/commit/?id=c84388ee4c66bcd310db57489eac4a75fc600747

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 70f1fd6fc9..696176907c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -31,6 +31,9 @@ SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7
 
 CVE_PRODUCT = "wpa_supplicant"
 
+# not-applicable-platform: this only affects Ubuntu and other platforms patching wpa-supplicant
+CVE_CHECK_IGNORE += "CVE-2024-5290"
+
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
 PACKAGES:prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
-- 
2.34.1


