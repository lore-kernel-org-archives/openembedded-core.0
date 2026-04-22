Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442D8F9B5EE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:03:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76640.1776848570761925106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 02:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TH390fXH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso3427717f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 02:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776848569; x=1777453369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VGUsUqyTVimeofbu0IlMv5DuISGUc2KTKanVAbqKoU=;
        b=TH390fXHQhqTEusHHWPqxz6d+pJzIA4oBp6JNldeBUARh30VfDzWObM+rv2z7a+/Yo
         yUmYalLgGFwHWQUXmIVpnl5/OlQj98qUuI5ZFJxtPY7XlHyeinte2FRD8rA5UqXDYfpb
         fi04ZxKwQarFelf/LPOaxYeQYrbNqfNRRb8H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776848569; x=1777453369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VGUsUqyTVimeofbu0IlMv5DuISGUc2KTKanVAbqKoU=;
        b=XjWxw/JrUTPHTD7m7McUKvKpwqQFK8hXXqq4JtQ6LtnjXLPiTk6Eqz1XhLuz2mjCXQ
         yRr3ndrb90jCipzaDsEYOhplGiXaT8X9qsxcdD80GwOspdLod17yKSwRgStbCFWAxtAA
         eA4Cg1H2RVJ2HfLuf7CaejcthQxdYPhZ7WGlj1XEtdbf7lHgnDjRvaa6LDWchjPBXDpG
         58WMFSo383kpohV5W3InjO/q+SVJgt/D0Ad9gdvdBO45z9yQknu6QORGvVGnqdii9nqj
         GH1UZVuWqUxbIvX0mFGutsEv8k71X3bO5DWP3pv77G+ksKHC067DJhDus9T9fTg6XY3d
         7miA==
X-Gm-Message-State: AOJu0YwLSq7HUlA9PX7vGvuacZ2LMdrUq5gPRdpR+3dgyg9bAne8waeG
	s3+HM6G7d9LDdNwnr5QmU0yJoMG4sLbUXhLcqfWY7UVhWkagzCeujFwS8qgRBq3Fmqf5jxKomzG
	XgXq6TSo=
X-Gm-Gg: AeBDieum5o3E1JXpCCtNUyQlRz4hdIMa9bEvkz1LfKQ8Ic4P+7CVtrMe7feKjluSmbe
	uki7XM0+8N6CDJvnY5dziQ1JwnepUmYOdKWmt5O2ao+M/nLzNVu8YkTAPYt8qKMaRMIJx2B953Y
	uAyc8eQqL5eqHn/2j8Fre4KuxD/r+yfmTQpxQl1dhRXWNV6bSeFRg+fi9JOqVZPo/mqXEchyYhY
	Dy7fS5zNwZCd2I48u8sx/vF7R7j9s/pi/lIAuYC6CBFgrhaR45hLK9cxnQZQkS0M8YJIAGZoy4Y
	CSN79g1bporZ78WgZKMThWSNbya8xqyDODDmt2mRp4z32u0aSCycEMw52iCqBAbX18dV800KSZJ
	XiacC+5LxChQJC94p4P2a108IQkr+L1wf5n8L84gO6kS7TmKreEmrbw/iD3SamMZdNKJeTnkfl9
	6A1JoNdvuKPPkTUkpd9/6RMS64IJSKyC4oXonWDzBuXvsN2RXQd0Kl/v3KV7lSfLVJdCwY6hBB9
	w==
X-Received: by 2002:a05:6000:2909:b0:43d:30ea:9383 with SMTP id ffacd0b85a97d-43fe3dbe020mr33160449f8f.8.1776848568154;
        Wed, 22 Apr 2026 02:02:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a9c6:3deb:bd01:ef01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d6casm40010559f8f.32.2026.04.22.02.02.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:02:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gnutls: Enable p11-kit by default
Date: Wed, 22 Apr 2026 10:02:46 +0100
Message-ID: <20260422090246.60299-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235700

I'm not thrilled to do this but the signs are that during the lifetime of
the next project release, we're going to need this and it may be best just
to do it now. U-boot is the current tool that is likely to but it feels like
there will be others.

We could just do this in the native case however I suspect if we're going
to do it, we should do it for target and other cases as well for consistency.
Most other distros are shipping with this turned on. It can still be turned off
for those who don't need/want it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/gnutls/gnutls_3.8.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 92156c277c9..ba923daeb08 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea01
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-PACKAGECONFIG ??= "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
+PACKAGECONFIG ??= "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} p11-kit"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.

