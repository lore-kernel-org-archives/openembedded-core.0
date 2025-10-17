Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711E8CCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 12:27:30 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.14197.1760704042236491234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 05:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rJNgqIIl;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59093250aabso2443303e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760704040; x=1761308840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGe5AD0gcJrU58HZF4efq9LUsSWzHKTdlbE+yWyUVg0=;
        b=rJNgqIIlGmja+hsaC4oXo1y6h6FanIJfeA8Xev7GaU13FkHXuM5LrlGG4XCO1B0kLi
         JOxVordjzxyMsIyhWKTCpBeySPdK4Hi8iiNCcNkT28kIbUg5kaBG85jAxRxH/gzW+zqB
         Wq9+XFXxhMsMQPfNdtVWhVNQa/aVfbtVJJFGy1qvN4jtTEZCt+8FqaZUKB3qVxNo1mYS
         eAr5c/yjwSKybsSZVzl58vjPvLf1ncx+d3qoWa7sty7gZa/dtakrZkH7N+5RMnQKn/lN
         1BISjrzI73xmi3TtqOdIrmM0pMsW3nWplHU/sd/VDDmDoYE7mXXrJ/PSxADZauBfh/I/
         FeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760704040; x=1761308840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGe5AD0gcJrU58HZF4efq9LUsSWzHKTdlbE+yWyUVg0=;
        b=X1SqbZZYJCHaa4VCEm7CfHQfMVBvowUDIc5WP/S/stlQFVddDpu/i0dU3w40weohsP
         GGjIFzLkD5Pf/lndCJbsMfReXjWkr0E8d2iJXT/cLsmgiueGI+u5PQ9NrPbnFX6eDjCl
         H0Z6Jwwlbu08A37oN8+QlKPEjvcB4TajfVSdZNJsTj3j+Z3KmHAW6pXN6W61c5+F9eEw
         KqtBv6sJkb4D3feW9K9f4q+wkZCpmce4G7ds5goUlQS8KGabdqGt1rcNJ0NhorWC22E4
         U8gcIhcIa6WKbBwoB4PHapPeJy8ld73tnh8YEC7QFCoTCQQfUk08y/V/R6R/mh5hJiRR
         X1Vw==
X-Gm-Message-State: AOJu0Yx5RpsX7KvCX2O+lKk58eh4k3gWbfIRDeV9sHEQL7rGGOybJRdU
	cZgwp79N4+J02S5g+ya+jUQ4ut6OoCW/1+FE6HyQbTIp+mcISII0qRa5JGZc+gnBcXAYSSXgfep
	xmADK5/g=
X-Gm-Gg: ASbGncs+MUPmxtFduswEnNAZHb1qOzvm5jEriuCzbrFTr/Jumwu310ZAeOm04rgpdAh
	DZ0XAumifnJHkFjf6tvivYa52odRi4/YYfOkvFporDLlLWOsp84QD5WAHPmX4LOZtcbYV1Cdn0E
	JtUTts4njvUXt/acUPoPYdvQvnO+yEVihFr0xxjT/za/Hb8ePM2NaF+uaOp4RRuLzNad6r94Ha8
	1mo+R9diX3DQVcH6lXhk3GQZipvb65EcE16/+/GHXytR5iSyOzYBiF2Ut6ZuKbstVpqDKL0jMH0
	W06mXdXLK8rUH+DqfI2QCWzC+JNJuh8YmKhlrRoujtl0usl1rpyXxeQMKxaCY4zRourJjddqgE9
	goPvoGYsoC4u0+LzxD02a7cue05Bc5CM34xH7uLDOE5QGdtUX+IsYue6C0JulF+hsVlZQ+/sFyH
	VkDnBWdi21uypg2J+Tj/n2kMfzpMvEKmT7lA==
X-Google-Smtp-Source: AGHT+IEOBotkZIZ9qPgNP1mAlJwtEV9Up0dWoGU414dheOYsn4ypA4ZtGBFgnTyENLMBc5RtxLQB6w==
X-Received: by 2002:a05:651c:892:b0:372:9420:9509 with SMTP id 38308e7fff4ca-377978c6da9mr12616651fa.15.1760704040284;
        Fri, 17 Oct 2025 05:27:20 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ab05sm61421371fa.44.2025.10.17.05.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:27:20 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/5] selftest imagefeatures.py: disable qemu graphics
Date: Fri, 17 Oct 2025 15:26:46 +0300
Message-ID: <20251017122649.493701-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017122649.493701-1-mikko.rapeli@linaro.org>
References: <20251017122649.493701-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 12:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225014

Not needed by the test and graphics may introduce
boot failures.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 87c3da228a..3109b68531 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -36,7 +36,7 @@ class ImageFeatures(OESelftestTestCase):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        with runqemu("core-image-minimal") as qemu:
+        with runqemu("core-image-minimal", runqemuparams='nographic') as qemu:
             # Attempt to ssh with each user into qemu with empty password
             for user in [self.root_user, self.test_user]:
                 ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
@@ -62,7 +62,7 @@ class ImageFeatures(OESelftestTestCase):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        with runqemu("core-image-minimal") as qemu:
+        with runqemu("core-image-minimal", runqemuparams='nographic') as qemu:
             # Attempt to ssh with each user into qemu with empty password
             for user in [self.root_user, self.test_user]:
                 ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
-- 
2.34.1


