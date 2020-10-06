Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.93.1602022461866565832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 15:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OkgFxofZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 13so378201wmf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 15:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fWPOMLQat9fWtUp/NaTc5VP1sXINUEnuxhXHB6cu4cA=;
        b=OkgFxofZb6QclmajVlS6PhpT95MYysubU4nnhAtsd/JaDHE2k+xfT6ZZ9+pmDnWj7z
         dSAQ+IXmLTPj6PgdQOtj0vMSIjNxXd6PozP9rN8wU+nRryoA1VmhERLEkAC0SAcjeKNr
         pJYG6/xV96FMDJCJRGoEdpT7Tqu+stIGITvXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fWPOMLQat9fWtUp/NaTc5VP1sXINUEnuxhXHB6cu4cA=;
        b=TYUY2atQ8Z74mW8vHdPSjoi4ZNEF/kc2R+LjFPgKRMxQPM5zPKXeOAlV2G8eS8bt4/
         FWPPtMib49pse1Ne26+TNSOxpfSNi9/VLx1OFkFt3Oo6Zf8NC75OWIkVtObIbuNkxony
         fcvPW29n7agjGGHh35PHaJF9i+Hswr7NkkDBmdQCGulVjsu2NpAYLmRmJ+hizIua49Uf
         vgEPB2umMZunwrDeuyAit/7n8ga3Enff2O4k0ItDRBopDBiDhTjEjpozOfP9kW5GeoP5
         H65sOEWAJ7eHk4DVNiVMRd0iDs+wVe7qZ4Tpe3rUMqaeXDAFUavJ4THJx0RlSrdE4IMu
         AbdA==
X-Gm-Message-State: AOAM532rn1g/otzrGD6v/4U10lR9wNXB+5uNNQahpvQWVn3OWSA+R5wV
	yvNvd/i1qmY+QfWThK4SV9T22Ay2YUAgAA==
X-Google-Smtp-Source: ABdhPJywjNOgVdK/RG64RKnT29LTZpGa1LXIG00hRuEhakoYWaDxoSpbZngvOvPwJqMdFfcOTEGyUA==
X-Received: by 2002:a1c:9d87:: with SMTP id g129mr93898wme.30.1602022460058;
        Tue, 06 Oct 2020 15:14:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id r14sm178256wrn.56.2020.10.06.15.14.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 15:14:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] glibc: do_stash_locale must not delete files from ${D}
Date: Tue,  6 Oct 2020 23:14:17 +0100
Message-Id: <20201006221418.3110811-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_stash_locale doesn't run in fakeroot context, do_install does. We therefore
shouldn't delete files that do_install has added or it leaves potentially
problemtic entries in the fakeroot database. Leaving the files around
doesn't change or break anything else.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 5f1ab60dc61..f7e4b59a5b8 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -192,7 +192,6 @@ do_stash_locale () {
 	fi
 
 	cp -fpPR ${D}${datadir}/* $dest${datadir}
-	rm -rf ${D}${datadir}/locale/
 	cp -fpPR ${WORKDIR}/SUPPORTED $dest
 
 	target=$dest/scripts
-- 
2.25.1

