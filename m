Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D4AC5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 05:22:07 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.9152.1749014526321222729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 22:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxF7utO9;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6930389b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 22:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749014525; x=1749619325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D971onPQ7+xgz7ugKxfdTh8AjAm6uLheBrv7G7CB7HY=;
        b=LxF7utO9sWMdIN7tI1aQMcok9oOddK9nLHO8fPgKL9coPlqlA/2+z/iMfxoLcEh01U
         V38idnLpilBA0pG/YeTBu6hnkFE9vLwBJEhJX3frzaa6rz/Dd1/qHfOVJK3nC2H7OLZQ
         1Iczae9ubKkjTo3ymW5uGMELO0kaDpU30Ey/8bMsHqi1pjF/TX691QwRv3ouYqdr53eO
         +VuEfgOP1E4oSMpgdtxEFm/2XdPhTosMpcb41PxOiFvm3xNr6JD983RdmLxsXExy1joW
         /ncN8DRrsN8X2dlbuzwt3oxeCtWwQCl9nWH0rPEitzONYkxIO6ajUvJorzzWMpiEXAyt
         BYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749014525; x=1749619325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D971onPQ7+xgz7ugKxfdTh8AjAm6uLheBrv7G7CB7HY=;
        b=MWJ97pzQbcOIqOImhVWnc5k6wMjQXI3A7ylSF6hqUtRu4HR5rfDl8eNccIdC4WQ/TC
         ibbk51YFoPhhuyjl6NjQwf+xz7pvu0/fcofIFS4vtDtOs+afbjsROn3DjQBwMPXt1tMG
         UgEn8y3s37fqvB7+911aLc11F/3WW1O3DZLPwQi3mCVVDeQ+ln7gvGJYBvSFArvvd5FF
         QEvzR57MYcTyObNeP6dWEFz/aOs3XD5IUo5bAJ4U84ylIyEDg9WLd5howMfsOJe67l6T
         Io1WwWU9wcF2kwYhVD7nENTBLvNhdKMCOYmqy0p309mVVI8t/DTQJRD3nZpMJ12B4KHU
         tKNA==
X-Gm-Message-State: AOJu0Yx4irm1mqjGTtpzMdCIruF9VinHG7CIXX511q5rM8+xm678dmXd
	Gm5/BBOsfJW3GiLz4guP9yram32FkfK6yjV/fw9O8Gll5UY8hX7MM6Mmp7jfR+U5
X-Gm-Gg: ASbGncvG6jvOD88kIUQceHUH0M5ETfFYoc8lPFkqT0qnCTm65iR2m45VgnB3ilbwGjf
	SOxsbZX/UP4IBPM5oh9qvae/qFScVIxN+mBIkuSQ25aRjl8FV0Iic0HYzHRC8lGC3KPIf/RNPGn
	LDxicPRHGaFK4WGrm1rt8BBmJznf2+qXeT6zcNmQsS40tDb6LzKVxekkTJeZVosGUtD7Z6LxbVH
	mb/pTBJddPu2WbOh+gZz5KdhlXVF8tlJomYg6X/H39TQNeWMZ9yzs01vOGb9s2joEzcZCv3be9Y
	NE33AFdKhNW0Id19aMBdHZ+vIU09G9zv6Ming0GgDbMBKZXbRPlNuGXkdJKc8Ug=
X-Google-Smtp-Source: AGHT+IFVrX2NdQCRHJc0rsl2aa/z+MdmfHvAaEBZ1YnM+ET1yCkQ4jDrNxByXO7GD/DvKrL8ine3tw==
X-Received: by 2002:a05:6a00:882:b0:747:bd3b:eadc with SMTP id d2e1a72fcca58-7480b48c7d9mr2390135b3a.23.1749014525383;
        Tue, 03 Jun 2025 22:22:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::d6e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41edsm10617635b3a.146.2025.06.03.22.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 22:22:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] m4: Adjust ptest dependencies
Date: Tue,  3 Jun 2025 22:22:02 -0700
Message-ID: <20250604052202.1789858-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 05:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217835

This ensures the dependencies match across musl and glibc
additional deps on iso8859 gconv/locale seems to be not
needed anymore for glibc tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.20.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devtools/m4/m4-1.4.20.inc
index 0640395050a..33b17f05194 100644
--- a/meta/recipes-devtools/m4/m4-1.4.20.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.20.inc
@@ -49,9 +49,4 @@ do_install_ptest:append:libc-glibc() {
                        -e  "s;LOCALE_FR_UTF8='none';LOCALE_FR_UTF8='fr_FR.utf8';g" ${D}${PTEST_PATH}/tests/Makefile
 }
 
-RDEPENDS:${PN}-ptest += "make coreutils diffutils bash"
-RDEPENDS:${PN}-ptest:append:libc-glibc = "\
-     locale-base-fr-fr \
-     locale-base-fr-fr.iso-8859-1 \
-     glibc-gconv-iso8859-1 \
-"
+RDEPENDS:${PN}-ptest += "make coreutils diffutils bash locale-base-fr-fr"

