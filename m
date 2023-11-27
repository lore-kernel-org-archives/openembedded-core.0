Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0CEC0755A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.91949.1701080286644417208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gSqOkuz3;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9ffef4b2741so534351766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080285; x=1701685085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVloT+FJDywhqZ54jO8yRKRqUKecxdKioEHjFt0GhfY=;
        b=gSqOkuz3yayrE+RrDIJvICcxflcq63l8Fxe+KV08R7uulyhge2DIEMC/0Rajd7WyCt
         FcCEiQMxAR1Ry7OAg+tUoDX06k08bfSXQzZq4950pKsY2jJr8I1exGtqIYbrissZQIlS
         pSCXhpQfgBScxroFQCqM484y1lj1K61/EcKyoxvJkcdgSN+SP9N3Q1g3mCq+lcax43H0
         ev0BFL7yEdKLVMXo43vHp966b2DPgESFqNpRd1kciclpZ9pKyEPLUsqyQXP9qLCtJIlE
         ff28kOO9oWhQPaIR3Ds3xjGxwoT9om98cFPC7LnV2edn3Db4zNNlgVk4gVCNdZhl8Qnf
         Ii5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080285; x=1701685085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVloT+FJDywhqZ54jO8yRKRqUKecxdKioEHjFt0GhfY=;
        b=qTErBc0ymOMI1ki2basbnASHiiTri777tB9tOn/s4SSgDD+VcBtNCIJeXs+2UATC1R
         BJvl4X9Iee0DRhmfbQodaJnXHc78+1R9ARZoa9gpzXUzFAmavJnN9YKp4Aa6rILDJsRD
         GKzpA0sp/mxMnaqq/vdhm7wem0UvdF/+D21Wh2bdOjIeRpt6Sq3CtxzDDfYKdBHSRlxJ
         fmerEwae6X4QBCXE7UMaW0gUcSPcYVWtMageXF1vlx4yuACKdaBQiOL3sGz3tnDGMamw
         8vjrFbkYseMSsuSOPrDT0W28+0SuwY3TAeils0ZYLSJ+gjwuuY5PmbiE7WN8nTfNS9i/
         u27Q==
X-Gm-Message-State: AOJu0YyFOMHzozI1EVlK6O5Am+xzHP1uPj9VxkxJd7r3obSsn5TUwFP0
	HPF7b5Cor081lqUpseshYrq9B1BAEyE=
X-Google-Smtp-Source: AGHT+IGuH9S4H8uJmOwCV5D2Xs2ussJyQU6L+BsP44R9fGShcRM5SORxIzpsYC45NUDUfoGf3Vplgw==
X-Received: by 2002:a17:907:6023:b0:a01:b8c6:7724 with SMTP id fs35-20020a170907602300b00a01b8c67724mr7620174ejc.73.1701080285095;
        Mon, 27 Nov 2023 02:18:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/19] epiphany: upgrade 44.6 -> 45.1
Date: Mon, 27 Nov 2023 11:17:42 +0100
Message-Id: <20231127101751.3187950-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191277

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_44.6.bb => epiphany_45.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_44.6.bb => epiphany_45.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_44.6.bb b/meta/recipes-gnome/epiphany/epiphany_45.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_44.6.bb
rename to meta/recipes-gnome/epiphany/epiphany_45.1.bb
index 577eb43a80e..c8631e05e97 100644
--- a/meta/recipes-gnome/epiphany/epiphany_44.6.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_45.1.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "5335dd573581db61e126d854dc16ae519657a5b8790789a47d25e43e17cd3a43"
+SRC_URI[archive.sha256sum] = "7c994ef34ecd60e915de331ee123c08938f9623cefada6d50b99e3c9c5ad8135"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.39.2


