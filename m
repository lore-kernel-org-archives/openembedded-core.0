Return-Path: <efecanicoz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E8EC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:27:52 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34725.1788787667940719947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FwYTr71t;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: efecanicoz@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2569aa5116so689800366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788787666; x=1789392466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUCpTQg1qPGfZAAixtvqqyIXTDcE/vweDAhDpAThnFo=;
        b=FwYTr71t9z2nOjeVQ3D+DTqFFPv8Wflz3fUX3j4uwNKwo2G4AIVJHQIBqtboTAMV8c
         1TEzX/vSasIPsiG/uu5+oj40DN8wZQuhqFGoWV7DzMjTfik3sIWjliDA5/bJ98hN8k+W
         IacJ4ROWdVcBeRm2omep1qIfPw4Des9R0ZfWvGVIi5r7enXoRrAoR0CC3lui+cKeAkrR
         lbSNinZhfQOO5OgBBw89HBXqqrWTOvJlN9WolmulSLtlRuTF9Ar6sJBtAk4zFkh+2I+4
         W2+ZiwbUekxRdLXT2ZHZKHUwLFI8pDlvMxTDXjtrCYyfXnllT6QMp3wDudmimdiLmUSl
         yCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787666; x=1789392466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUCpTQg1qPGfZAAixtvqqyIXTDcE/vweDAhDpAThnFo=;
        b=UGzVolRTye0EvEkMI911UOE/elfngAL0XKYN8iNXunXF8670QySu8SqoI5cnJJa+qD
         wyKM5VL8u11tB9Y4jJh/4CC8G4O8JNk8IbXpRyrX4wqQMI1a13+4UWKMgMI+TGAsfEYP
         rwP5F8wn5tDDhVAskPHXP3Xi9TsOnF4YZulbwxryxcXT5aNh9v7f53uzF3QcN4hBReMt
         BEI0PFvndVBBctMqkotgNGCNc7XtAH2jT4W6Lx/duxFkr1b7kEO5DrMesdPEkuBhVFMg
         Mk0pyCjT0qf/cKCqbv+NJUiOe7fCoC48KKNC51aGy0vaYJe1G3HcvFQUQ+vwLSLZFNF1
         IEZw==
X-Gm-Message-State: AFuF++lfQxTuAFye9JWhkhdheCJ+4zRopI+r0wyneHCzBWhQyA6OkyTM
	UDI4rBaU2gIOgXFuCLiH4KdyMW+6BAOIDOsEfGiZe14JoVX0JLsgqVF2rDVgGw==
X-Gm-Gg: AYBFou1k2EcHT+aAHNCMJQoP9ASgasxOYU4+7bwQs20qgoDTEi1kYcZ7j5vi2NfwS+c
	0SdJ077pfQ3OSHXAWvSvqrc18c0k5c95+ZarA8AvC5FMnO0wHMfsDI4TjVf7uzZr3/LbGQa/3mi
	YhsXP1YSxbbwyG/9OPuQI6k9aqSW3nBJeqkDmF2XFRBhEa9DAv+bxhv9XavFSiW/V2ogNWl6I+V
	zod7oKWPDzbaCSxYthvPFWk+8MaqD5ED2l1iaWb7yteFLYQfTBUqNYvWSMQqtWOhapZSJdtPd1i
	HyHtXk6ubx36BNMRgD4mb3hs/Fjk0an1xOwrVTJjArVYYphGYDL5+JQ9gM8cH+rP2cr9/8TKudF
	5iYsFsQxoYOMCuyXBAun4RPFmTT7YOOO/ObUiUvP4WJElPkZQtNxljqIu/UnStnW+ou0aPcwFrv
	qez/2Ap3wXEC9UZosG9Vp0rUKmh+lNQLsxXhZtBFjcEUgJ0wcCp+9cpnQtWxLz+fmw+d3Z3EWf8
	F52npMVxNrriVF3/8ryyw==
X-Received: by 2002:a17:907:c48b:b0:c25:f7dc:2dd with SMTP id a640c23a62f3a-c25f7dc091fmr990519166b.30.1788787665939;
        Mon, 07 Sep 2026 06:27:45 -0700 (PDT)
Received: from IRS-520670-Linux.atlascopco.group ([147.161.188.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa0b9sm474845466b.11.2026.09.07.06.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:27:45 -0700 (PDT)
From: Efe Can Icoz <efecanicoz@gmail.com>
X-Google-Original-From: Efe Can Icoz <efe.canicoz@atlascopco.com>
To: openembedded-core@lists.openembedded.org
Cc: Efe Can Icoz <efe.canicoz@atlascopco.com>
Subject: [PATCH] multilib: make preferred_provider mirroring deterministic
Date: Mon,  7 Sep 2026 15:27:37 +0200
Message-ID: <20260907132737.106279-1-efe.canicoz@atlascopco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245257

Sort PREFERRED_PROVIDER_ and PREFERRED_RPROVIDER_ lists before iterating over
them to make multilib mirroring deterministic. Otherwise ordering becomes
random and if base version comes after overriden version, new created
multilib-base version is wiping previously created multilib-overriden versions
in setVar function.

Sorting providers and rproviders makes sure that base versions of any variable
comes before any of it's override definitions.

Signed-off-by: Efe Can Icoz <efe.canicoz@atlascopco.com>
---
 meta/classes/multilib_global.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index d9372d9ed1..d936dfe787 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -67,7 +67,7 @@ def preferred_ml_updates(d):
     sort_versions(required_versions, "REQUIRED")
     sort_versions(preferred_versions, "PREFERRED")
 
-    for prov in providers:
+    for prov in sorted(providers):
         val = d.getVar(prov, False)
         pkg = prov.replace("PREFERRED_PROVIDER_", "")
         if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
@@ -112,7 +112,7 @@ def preferred_ml_updates(d):
         if prov != provexp and d.getVar(prov, False):
             d.renameVar(prov, provexp)
 
-    for prov in rproviders:
+    for prov in sorted(rproviders):
         val = d.getVar(prov, False)
         pkg = prov.replace("PREFERRED_RPROVIDER_", "")
         for p in prefixes:
-- 
2.43.0


