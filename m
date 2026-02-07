Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC47EEE0ADC
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 11:51:41 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3533.1770465101237080463
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Feb 2026 03:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z5rv2SNE;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: colinmca242@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40970f97638so2002467fac.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 03:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770465100; x=1771069900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Il+s86g8lFaEwcX6Lls4Vn3wIOzHTBRqsxwbPL9/6Kg=;
        b=Z5rv2SNEaCG8GUJ+yIRvlD2ARid5TuUbioY1ZwyktQdBTPgydA9jT3RJ6aEqestcjo
         sho0wELbDfmd6qUYuujQsRQyu2t6b553o1wBQ8zmADvSS1eMG0wtCIUDcTOUPiejNGX7
         u3iLeOHrpG7r5Cu403JtxlkhgSCBburOkIUOMJbypsNHgVWtEe5UItytpRFGg5To1+qd
         H/VhLuDJwnOsJnz6GOn8D1lvWoJ1C58XQS0RvZusOZyWBx8jI4Ie7D20WVbb3LdX6Ucu
         om9M8frFaHU2bl6XvYKrVIZ+kZDmkunHcLbsLbjUieD1GdxSfyvA8n7bi0wiQQ/qzBOs
         VnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770465100; x=1771069900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Il+s86g8lFaEwcX6Lls4Vn3wIOzHTBRqsxwbPL9/6Kg=;
        b=Qm081SKyBh0MJh6QXjsqE4gBo1Lpm6NEoT6kRHHkMQKKWU0A3myr/ku8RXu5H5x+KK
         LkPbx9b/S6yKCC5c/HlnGKPe+ClkQFfnNKQGMZef8cC1MoSOMREOgVYXm7lz5EywVbaY
         Bgfoy4t5N0vgh/juzg08wOP4m0jp3AZWhKoOEaVy6QO88QCoK1wqL+kEXfso9Kl2bxr4
         Z/Vnh/yhWaMMrAQ4th9ETnhXOefsMxl60uwdMVX7i1M+F7qRWUpRDajkX26sd2U61YoJ
         2gmcrd0CAKN6rGdEN/B0K+xevldNIXufega+8H8lzx6ah+ReKdVqbPVVRNxOHXHJ0+RH
         qHFQ==
X-Gm-Message-State: AOJu0YxoAhIkGDvCQvb+9uhw/U0I6XJP0Gl4oWWPj1xNxnRiKutt8z5I
	Hl02n4sWo7qZFEAIuMvSazzbVY2/7iEusLKlENnWv+axaOBjRGjYGUKmCwigBmYe
X-Gm-Gg: AZuq6aJ+SRcAu49NvqkP2rkSCa2Ys/0vQpoWVpOX27jHt+aBisX7eOUnID5QirFld5i
	bd6F8YY4QktWy611bMB1KRRo9hJ0O1amXPeM1RoDE0VmYj6SksAvIcz4iLBrUK7EHYfAJ30bKRv
	LGYLdmFB4oJkNDl3Uh6GmqBEhkFWRkXoe0NzBNmSyC+mjMUV6TKOdEK5KyvUI5SStG0+z+flpBc
	Oyk1k3+Hnl5xia+w8f61XURuz+SqzLOHHj3huI2IuXX24XsD1dAXjjxXt8mGjyVKzLivQy8YNW6
	FP8tC3bPwg7+FO+LBIHxffQJObayeAxV3PwE/uuyiWnBUSy1yweJSDKhm6ys68fCdRpe2tByDJl
	e1XB2iPffP73e2B9U//ZMJFkVRPKTvyjbGH/VUM8sI5LRADSaXs44+9J2XL1WT0tBbI4BF4U2/n
	j0IM4Hv1k=
X-Received: by 2002:a05:6820:198e:b0:661:1d0c:a5c0 with SMTP id 006d021491bc7-66d0c667216mr3072164eaf.69.1770465099801;
        Sat, 07 Feb 2026 03:51:39 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40a992eed6bsm3461034fac.1.2026.02.07.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 03:51:38 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH v2] python3-cryptography: Add legacy-openssl packageconfig
Date: Sat,  7 Feb 2026 05:51:32 -0600
Message-ID: <20260207115132.36854-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122025736.187410-1-colinmca242@gmail.com>
References: <20260122025736.187410-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 11:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230670

Fixes [YOCTO #15416]

The OpenSSL legacy provider supplies algorithms that are either used
infrequently or have been deemed insecure by modern standards. The
Python3 cryptography module can optionally support this provider via the
openssl-ossl-module-legacy package.

Currently, the cryptography module builds with legacy provider support
enabled by default, regardless of whether the legacy modules are
actually included in the system. This patch makes that dependency
explicit by introducing a legacy-openssl packageconfig option that:

* Ensures runtime dependency on openssl-ossl-module-legacy when enabled
* Allows users to disable legacy algorithm support via build configuration
* Aligns python3-cryptography's defaults with OpenSSL's current defaults

The packageconfig option defaults to enabled for consistency with
OpenSSL's current configuration and to avoid breaking existing
deployments. A future security improvement will disable legacy modules
by default in OpenSSL, at which point this packageconfig can also
default to disabled.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
v2 changes:
* Updated commit message to clarify intent and rationale for the change

This patch stands on its own and can be merged without the related
OpenSSL patch. I will work on the OpenSSL patch separately, since
there's some work required to ensure ptests can run without the legacy
provider. Additionally, the libcrypto dependency needs to be
investigated. I do not want this change to be blocked by the OpenSSL
patch, since this is a bugfix that can be merged independently.

 meta/recipes-devtools/python/python3-cryptography.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index b3b45cd172..366fda5e87 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -22,6 +22,11 @@ require ${BPN}-crates.inc
 
 inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
 
+PACKAGECONFIG ??= "legacy-openssl"
+PACKAGECONFIG[legacy-openssl] = ",,,openssl-ossl-module-legacy"
+
+export CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY = "${@bb.utils.contains('PACKAGECONFIG', 'legacy-openssl', '0', '1', d)}"
+
 DEPENDS += " \
     python3-cffi-native \
     openssl \
-- 
2.52.0


