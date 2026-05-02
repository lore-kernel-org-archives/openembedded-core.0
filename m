Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F45CD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9367.1777739399526342980
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C5Rddaah;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44c350a5b87so197832f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739397; x=1778344197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILzbXtwEAOSXklTQvHwrRWHrRwqRrA0O4gXMaNWRK4I=;
        b=C5RddaahR5BQnS8XBHm0hyRHPNAAOQCj90Gocx8ZltOZ4mSWJyfapHZ41VEa3wmsJE
         LGglekHjdSkyYDmezyQzfqLOJsZv8FMECUOcth98jM8Ge4QikoZe1LnqlrzGcrgn6gpc
         Tsv9Dsg7mRaUxu4k8vZfItz32DyQn3YPek+GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739397; x=1778344197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILzbXtwEAOSXklTQvHwrRWHrRwqRrA0O4gXMaNWRK4I=;
        b=Wlujhdp1QqrG+2he/znxThpOvnqXf5bvlFtb6yjA5YjMMvCn4Vp1a0G9agexdOg9WN
         sDmOphVEG5R0QNb2oxSmndvuUP5Pe3DcbqISUi7uj/v5ursVow6jz+BrloqYvp3vjpXl
         COHWCoDjmeUzUC9ceoG8uaMBvWpXvWGbTAuwcnyho5JDcLkjYYNgyJdG3W6M96ipH5TQ
         6SRTMpEXaetf4oTGRTu9jp4oaVWbhzsz+TPt+BZEobzK+h//m4d/NMiUxTDEiY4tdi2I
         0mACy7RNNvvAOk+t3prin2/D3+k3V2IDfuGvB18Zk2ZV+R7A5gh32ECAzrbc54DKUmSP
         yQcg==
X-Gm-Message-State: AOJu0YyKus2D9zE0eMS8ltj5wFqYL7+bqRlzB28CTS6ZAhdX61/Ki8F9
	3YtyhHkhGELnTUMXZkUaUCtJOLA7SrHVWfHoAOsCZKIkSybUuxj9N5oya8/C97iFRGKtvUPLHi+
	cIgheoSL7tNe5dIsSa0gZzBVDXe7VL7iHIsYi3dzPxN+Wm13haPM2pQCyzYR85L1uuHXKolLrto
	hUPg/SLBQqTtcgGiI=
X-Gm-Gg: AeBDiev2mSFp4EI8/rk0So8StYJFkOd4PXnAbqcD5p2VqbRpqqBuyt1agqAY/0b0WNH
	o2fnuEu9bdxEASIa9TjFnoUKnDc71SiINfcnsAsqcdTB21pI6Sy/D55cNW8KNbKYAZzBeSkAXGN
	bduKj9dHAtik8HDxY71YaM+JN/oodX6lPnZsE2abL7m1iCNPbpboHgf2Yy4PjV1CDF6X98zMpqy
	/Nr6tvskP8j73+BhYxz30x3oyD3X41EWMUHCkN2HXNUqas0apxsRPW4VReiZbAlUjCr7IzSsPIK
	LUT3iN5kmoX001xyMOwby7eFXJfQnz45JWCGq8Gq/f4JV7XpZjwHyuos3J7hDSEHy00Dl6dHrKG
	SsB8VkQ92r2pcgLXPqRLHOOmLa7Stjp5AMnOGj/Av2t66OBOAEpNyuIDa7xCux2TQuarAt5Fqbl
	YjNYJET+G6lqpHSL1Dbzx++0cW+zM0C4ie8Y0m4XDK49u+lwVXu7qLtVyWoc2Zzw70gBob9EUdJ
	A==
X-Received: by 2002:a05:6000:2c11:b0:43d:7a97:78a2 with SMTP id ffacd0b85a97d-44bb596297fmr5809145f8f.28.1777739396607;
        Sat, 02 May 2026 09:29:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/62] libdrm: upgrade 2.4.131 -> 2.4.133
Date: Sat,  2 May 2026 17:28:35 +0100
Message-ID: <20260502162929.1377831-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236324

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../drm/{libdrm_2.4.131.bb => libdrm_2.4.133.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.131.bb => libdrm_2.4.133.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.131.bb b/meta/recipes-graphics/drm/libdrm_2.4.133.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.131.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.133.bb
index 1c55dd5550a..afddb21e0a2 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.131.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.133.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5"
+SRC_URI[sha256sum] = "fc68f9d0ba2ea63c9432a299e14fea09fad7a8a66e8039fcd7802ca59f77b4f5"
 
 inherit meson pkgconfig manpages
 

