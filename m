Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CA8CD37AA
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7593.1778221607195294103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZqOhCYYS;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891f625344so17576315e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221605; x=1778826405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9fJCqNd2jMaCXUfcz/32twzTx2E0wPEZKbXTL1EGYg=;
        b=ZqOhCYYShq0jKZjcrSDVQbUuCzuyJSQeZ46oR0lfkg7iPmSDakbeO3UR5ZigUV4f+6
         aZuoRFuGWRdqGUuidK9o/+nNQXhXJQ05q2FTsrV1MQ3X2mYsNndJFWD2MWfM0ckAgGod
         xR3G0Zn0NTihYqSW7J8FHCyohC6ZTVP2GYsv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221605; x=1778826405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9fJCqNd2jMaCXUfcz/32twzTx2E0wPEZKbXTL1EGYg=;
        b=Xr6UOi8jvOhxqs0oLDylRvsWNRL6HFT0LCUFVzHnk0ADKgzo7oMNW0EJnvL6SggPw6
         FkJms2XimzHFw6gVy/5/PUWdNsc5GxDY0Tgq6udyVGQNjVeKbqc0nal5V5uvXgvZvFGL
         wp1R9PpmvtjlPlNQUQ23kX2bbvuxgHKLHDHgT6GzTGVDMhQXKUWkAsWAYoqWHNZ0a0af
         9bUxcNrMRpmqvGWUkiHbj6uVY8Ecx1FAGbJfgA8uDLKpwwylB9MLrh+CZkKNbdXG1pBF
         qgDvTXAX8VEf0LzCXtX0s+OJsQsQ/Ne/p4JXXckJWPBMI6/NTQtQOwjFA3sgnPePFH3B
         qpew==
X-Gm-Message-State: AOJu0YwBj7xbY2T74M01hDKd3iHSBnwI/VyQGlCrA5g43R26CLgZ8jZP
	aC2tadhtcntNHKokWvITPN05IF6OKbE5UQ3cmItzTBKmUQSem3Qe9F6TyjjwkBX4bSwCzbEKejs
	mmN1IdR0=
X-Gm-Gg: AeBDievjblmxhye3HnlssYbqI7fX7yWjonmVprF92joR6JTcsjomDH0KBxh6eiX0GQU
	OfE03SqNoC1Uxq32/krcOF1v7gOpA8NIzvNaeIk6FzUk1MbfQh1EzddJbqaJNpaA8Y3uq8ecEDz
	iQhy7iIgPaaiH4eerOv5/G1hSDEIsqx9BrQ59PZKiV9YpaAIEsZxNQ/yUQfwBiHll9We4ROm31p
	L7uUvtlDxmVyIhtsnWMEEFSg2JnmYarnRAsVHU7vMixD9t3yLP/seRc51PTVYZoWaQ2jRybNJTE
	6eeOQPvW9XCqbtHH4kgq6sY1a4ent0sirm3TnUXf7HHK/2IgsBzCqSvhccT/fz7gUH6OnYniHT1
	cX2zKw92+YjquqXeMbMk1RoZT+9A8pV5RxniwAezZ/gl8v158+uCWSC2tpQPJXbSM0zEZ9yyhAl
	GeUj6B2SkIgLafFgvAobzhfS6V92RPYSQpqvamzq8Sh6mQSsnhPNk72otX49tc0HyImKsG4mMUL
	PYCc5sMYI7SyaTej7x6Jnw7MU0=
X-Received: by 2002:a05:600c:32af:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48e5dfcd722mr53586325e9.1.1778221605221;
        Thu, 07 May 2026 23:26:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] coreutils: set CVE_PRODUCT
Date: Fri,  8 May 2026 08:25:57 +0200
Message-ID: <348391ccf91ac474252f75a5679fc42505faa54d.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198884.git.yoann.congal@smile.fr>
References: <cover.1778198884.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236637

From: Peter Marko <peter.marko@siemens.com>

This removes rust uutils coreutils CVEs from reports.
Comparing sbom-cve-check shows that only
CVE-2026-35338..CVE-2026-35381 are removed and all of them contained
reference to uutils.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 5c39687f62e5864ea783cbed497c2eb5387dcf96)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/coreutils/coreutils_9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index caed1f8c499..a9618c8ab84 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -23,6 +23,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
 
+CVE_PRODUCT = "gnu:coreutils"
+
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
 CVE_STATUS[CVE-2016-2781] = "disputed: runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue."

