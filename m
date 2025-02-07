Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300D1C0219E
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1177.1738966031466382522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T3p7jEdW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f464b9a27so38296015ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966031; x=1739570831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyigoV2zfF6iZ/PrXP7EiRRTLSTQEf2RMk7msCzUwvY=;
        b=T3p7jEdWA88EwIdldeDfqSPfnRfig1l/EL+E4u1Uw7l9K8cFx5aaFgC5jfOCyGv5YY
         9w0Fr4rDMdTfQHx2UJ3IJuKVm1RBKObLPh4xSlTjWFBRWy7RMO5s9znKpElIjytplkzT
         mz0/VOtZPwvNt/J/0+HlaXrNdu3E0EUDRTaFZ9MLnV5VvFju/Okvhht8a5SjlcKL0zrl
         yR2qIKNlZkMkHpVC56raXW9qcn0d8F9LZTNjC8BVxZSeUHBen52GqA02sZD33KqCb8ms
         RwYagADwJvw7+X1AoCl2wOzPW6j1ZSMd9dJT8wGV2jlKvHXdS1sBLDH7+ICge/LCAiYS
         T3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966031; x=1739570831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyigoV2zfF6iZ/PrXP7EiRRTLSTQEf2RMk7msCzUwvY=;
        b=iaQwJOgt9+GobW46qt2e7FFknuMY1O/BEGABS+P0aUbM3s6E2ckFHa/e3nKw1f++lk
         nBU3SMnJBRJ29tcbVucmwuma/XaOd8187krHn2u1EcnNjBNDgurz1iYxiP5e5xWGUhII
         m7fERCq6ApOq8+ZVol8Zub8lWxz6Y5RmHaM3FHAwbzs/cdL+UDXh1/it6MwLm54mS8sV
         HvuQejgMTMw9erGjxMp69/TPZcO3jG+HNBnp3QKNgjlOHo+SI+35mHw4WfifvIQlnpLZ
         EBghM8l39TGzV10IsrU6FQoSeCoBhnJX77Bb6f9ryoiVd4XPOvSTkxSoIgWEjuvs8l7V
         6Wkg==
X-Gm-Message-State: AOJu0YypqW43Edgc8QM1oChgIkd7ENuFVQY1Ox9VBVjhdMuZS45l+xEK
	//AS6udIE/jcowDrDbpEaZp+5NIzoA5fag87Te88f94OgGYql/W4jCPh2cs5NeyNy6ytPZ5uAKk
	w
X-Gm-Gg: ASbGncuX+Vl8wTRUOKKcsFUocXzSCXuj10m33JgMzAHPlqHa/hA6p6zBRG5dfwAQKvS
	uLO0B8zKB0/pM8D2qGlE6kLnWgSwjTB1W9J7DltwuHbQ2O2PURr/RpZjx4WUADCJyJizUZJwwd9
	UtCHZfqFwCGY9SUqwAWLDZ/9F2oBiOa7ezV0hvv6or/NsqKo3vCp8Gnk56nZlIDZuW/37N26Y5+
	a9F2rM8DTj4obcL3rxr8cRkfHqYtpyPer8bLSBd670mN4HGjt6KjMgf7pSdC3e0z+/vD+9qBmDC
	q6Cc
X-Google-Smtp-Source: AGHT+IEg/wziRyHFHoFArSYMp9ssRKSaCF4hYJ/h/pr9Q+i1PToQEy+yUgfDVoaW2ZUZmMJoRROxiA==
X-Received: by 2002:a17:903:32c7:b0:216:39fa:5cb4 with SMTP id d9443c01a7336-21f4e6ce13bmr85827545ad.25.1738966030729;
        Fri, 07 Feb 2025 14:07:10 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.07.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:07:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/12] libxml-parser-perl: correct SRC_URI
Date: Fri,  7 Feb 2025 14:06:51 -0800
Message-ID: <84a1c87d7a9268990b5bdd7f50a52b9be8e1c0cb.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211009

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3e44bbf9972968076f06ecac027bd7a2f3fe781)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index cffc133a45..17072ece07 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4342f85bf14a1fdd6a751573f1e61c03"
 
 DEPENDS += "expat"
 
-SRC_URI = "${CPAN_MIRROR}/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
+SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
            file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
            "
 
-- 
2.43.0


