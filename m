Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8D4C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:05:09 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.5205.1741687508176173769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 03:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AeSfISFM;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso8533817a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741687506; x=1742292306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UW2yppr0UC37axYTvDoXLS/zRStMmFia//ArQr0Gfd4=;
        b=AeSfISFM/uYRO6mJqjM9BGnwmi3p1+RrjTuVSijOq7ojxcHsXbuEbuU06UwUjH39Kq
         iBIRlEoDrfdNLne2gb6E5GJ0UoPPEj/cBZDIuvPmxiD+nbTIfcNpFPtOIhGnbFwigtG1
         H657rGZ4vbtZJqnMxjO+oeJFDcwanyVWVtxHv3Zy2ajKDZQLHWCYA2/5LS/0SynxfQ4V
         qc2rmNi2W5yHVBYAynbZ/wDeQWgQmO+KyMnJfT+Wdbb3bYP5LRlnrRh7YHEjZPCBwLBz
         9270iMfdoJEPKunpzbWPGs4MMrCSDT1Q4NbHDxUkhp3lj0k+rlWrZMAvLrVH4CfqrbVV
         sOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741687506; x=1742292306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UW2yppr0UC37axYTvDoXLS/zRStMmFia//ArQr0Gfd4=;
        b=GgqM0lC5M9eB392TeMJbZt7MR6sKOeRMXfvgORDlfOGe6fUd2RyGjsHlREEl/CFAVA
         S2GlIA2fVibRGmj9RthTFj9LPL6+dQlGaEMo2DwGrX3oiX+vl6VJ+L/MCpDKJZUkDlM2
         vKdRFjpKm3HA0LiLtssWfy1MRjjzt+iSAV5ovkP1sbacP3N13409DdXuzxnJj0ERtAfh
         rcWruvi5x84DcOza0PcAs/z6R+BJLrTUih9DrfkwVPsUyr3eVICKK7bbZ06JCXgMpwLj
         dJDxNQBMx0uKo/0SHUYZeXRR5p05YTt8E2sYs/fM9bYf1tsJjH8VdltfkQbePHEPE981
         lfNw==
X-Gm-Message-State: AOJu0YwNN2t8shWGYw9hHsmm45nbl+E4KrSgX01sAK8na04PWJ/+r4H6
	Fp65JKHVV3GeJHOndg7Dtj2izqDb5/Vigrg67G0I3Auqx+yR/w5vznV5Mw==
X-Gm-Gg: ASbGncu6/2ntScV/pXbJ6jgOyyAmQ1rB8G4MZSmUxaty0qfbSy4ETPjXFg3SaaDnZtl
	Z2tcBiP0CoWTtvh8+vnwcqtkSF0VFPWk67jW1+aauU1ihOnWjvOYdv3XgaB2TTWyyDwHVT62KSv
	KM8FekHXgcoB4v+oKlQzhDn2qA/Gl1ZzuHrhdhlvWadY3exvSXh6kQU1TrNLPW03hJA9kGRp8UV
	3LNO4pxcBA6u0ldX1W/KT7OoyJ0JIczzBx8+/BVM0S1qmDrTiLclFpd7sTYm4kOCEqRwrVrAckR
	VPCJeQgKjqksm/ePAjZ/RI+s3ZNZ7fHF0Uo7XfjRuhafarQepQAZ+7NdDdTBdsl2K44fAvNsVmi
	Cd6+01AZn+sWTsgcb
X-Google-Smtp-Source: AGHT+IFohUzNOvXPzYKloaii76YcCi5kkAwgqc2CawyrBqZBTdCmxsWaM2djgkxTKNCsMM94kR6Xwg==
X-Received: by 2002:a05:6402:2750:b0:5dc:cfc5:9305 with SMTP id 4fb4d7f45d1cf-5e5e24d8103mr19820528a12.25.1741687506295;
        Tue, 11 Mar 2025 03:05:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7472128sm8074949a12.23.2025.03.11.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:05:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] gcr: exclude x.y.9z pre-releases from upstream version check
Date: Tue, 11 Mar 2025 11:05:00 +0100
Message-Id: <20250311100500.355914-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311100500.355914-1-alex.kanavin@gmail.com>
References: <20250311100500.355914-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212553

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gcr/gcr_4.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
index dcd8658d9cb..3fc8ec0a643 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
@@ -15,6 +15,7 @@ CFLAGS += "-D_GNU_SOURCE"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspection gettext mime mime-xdg
+UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-- 
2.39.5


