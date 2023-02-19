Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD3DC6379F
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3837.1676835066214117063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MK12z6UJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t6so1030905wrz.7
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+SvYozh4x2NW4zX/cYRucLB2JLthOkMz81Pqy2hJDE=;
        b=MK12z6UJXAx70dp+nV5Hu9Tgfi39xCcY+hT7/h2ySi+f3M3Ikf+OjN+s632n7PLruu
         O150rtM4kwbfcswZPcA61+jWIQXlW3zx8yipPmodqbPMSx+o7YCMSurd9tUbTd/UyOMB
         Evfap7kOvVCOrhdde46E5BqDlP/gH7wa34pbS6lf+A32APAwCM8HXvYFz2x5biMVyUQx
         m21+KQwS1d77D47+/+TyQ4MoCF+iFzbmR53hZrWhDMCnBUE0Hk7wxHzkE+Rtw2Gpre01
         tZjvu9tWL9Vhwoon06CsJ0qxgVc3w3kTKPW3wbJgMDiHJdO4C38SWeaKDj6lz3PeJ4Jf
         upjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+SvYozh4x2NW4zX/cYRucLB2JLthOkMz81Pqy2hJDE=;
        b=3U1GzhiqoIQjDJqMRZXf44gEfF+mjWn9XhFY8u1JtO1Ki/hFSS0h30k2zf7xyKae8J
         LVzjkPWbK4qkwzVdtreL/SxxInVmHYKD9JysfhPtKgLgbRRfGKP1yAOoNOCBfJeKE5d/
         GXMxuwTQQbFFapeGJ8A3gjTYM8wS/4irbQvEYguCvJ2W1pLkCK8G1qJs0w9pNjBSO92/
         /nMlCqWVmgBU07pXO14s51hGiq+btldZl87TZg5V4ZnUzhBPN+s9B5V09kVxQInrl66r
         GWEJCyT9C4t/GtTwDFL1QrPeaiRSmgHocCxv7st7gVYnOeFelwKf6kVFvZhSNQwtgRIQ
         oqZg==
X-Gm-Message-State: AO0yUKW5mF+YAehngrCOf2U4J4njyTMPNDevwcFypCRxqc0Cp5OFoBJM
	rnDZls3snvgGWc0edYjFRJSZIHy2uIU=
X-Google-Smtp-Source: AK7set/z+YyxX/Fk1vURBOYSLWCs5uEtSIxMYptwN3lLlrQIZjgNNGeBIiN1ROWd7GYS9yjJDu/2Qw==
X-Received: by 2002:adf:fed2:0:b0:2c5:60e6:eac with SMTP id q18-20020adffed2000000b002c560e60eacmr2476916wrs.24.1676835086134;
        Sun, 19 Feb 2023 11:31:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/39] libhandy: upgrade 1.8.0 -> 1.8.1
Date: Sun, 19 Feb 2023 20:30:54 +0100
Message-Id: <20230219193101.338397-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177375

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libhandy/{libhandy_1.8.0.bb => libhandy_1.8.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.8.0.bb => libhandy_1.8.1.bb} (93%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.8.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb
similarity index 93%
rename from meta/recipes-gnome/libhandy/libhandy_1.8.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.8.1.bb
index 2f7d47290c..41c8e9bfb8 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.8.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb
@@ -9,8 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=main"
-SRCREV = "fce63fcc85621c33dab85e32b349d707bf6d1552"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-8"
+SRCREV = "f06c1bfa95a3160575b36315c6d9437376d8af77"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-- 
2.30.2


