Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96475E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.14681.1736325757853425564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YeXl5N2d;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so2836860766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325756; x=1736930556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9obYTSJumEyFROGRrD9sPVvNHgneUg22xFMjQjFK9c=;
        b=YeXl5N2dRENpMs6RvsyQl6ahD93rJT08IO/4ObhGlanEc/qTI2XwXjLPeWMroJjiOY
         ygvfRr4BVw/V1GuOWkr+9RLPvfNVXtueLwzlH8R0qnc5Pnup46fulZCb91D3SKaRI84p
         eVkp8jjEyNE2MesgO8ISPE3CDPbwv0rKp5VY8+PFR8ulMMTAaTkyBRR4lFyx5ApIwfcS
         2xid+mG27GvPJDtMApHp27V0lFTxcSEcNOHZ0qiT5Flj3EEVG9fJCDUOsY8MeT0RhpIV
         UJH9LUV2Si9MxJer510SxlYbW6qLDbBmzhuvp4jZgr8GaRc5ISr9nKLaElUtRJVkxJxK
         kElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325756; x=1736930556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9obYTSJumEyFROGRrD9sPVvNHgneUg22xFMjQjFK9c=;
        b=hFgS+JG3lgOJhLE2oynYLDNnQ6kK7gSog74G1epQ4okokISlK7rJbHOFQIAo+m4d2V
         7paH4mzTLS/Iek9TpSx/tYqx5hEdPSA5Ex+VXGLl/3V08mLCOqmEfQBSWOvQq/Nn3G4r
         ydaodvi4z3FjvOjYhO8MlncZHf4JMvaDgdQ4gIhq3gwgqldXQptaCLUbik8Sn6lZ4dKS
         MfVbMZutGzgkIv2EtjNLZipG6BrNNK+GmC5sT7hbt28G4MT9b52RpM7QrQeOaIeU0SQI
         8pI5cc7JOAmkI+ww6m1OAI+bu5NtGd1eBErf8ysXeGdWQieeAS1midWsJ2ZA4TQFObpN
         fK2A==
X-Gm-Message-State: AOJu0Yzat17rPnSNY6uD2H0iXfAJHTaXs5Fi4LFa6FHKa55lumtk+5bi
	bFUSl32lmNLgE6EGmxiYEwBCHDn2iRjM0ucc2jgz++p15w8JS4zef2zbQw==
X-Gm-Gg: ASbGncsHtn3KYDKJtPBKrvMt5/zm5Uf8NMvsIHSsJw9+x70GOynTIdkKX771uiDPynJ
	jDW2fuu5AFLzME6/SXyFeszn79O4amwaC/JWfwlA1bFAb61IT4ngAuE7wBIsuqSTfWZvXOaE1Hg
	ccZ8Ap6sjXZuPosO2x23pH/JNdRgHUUEliZxXud2lGeYXY4pFD6HqDO+SQR5lKgLmVJ+K6R7X+7
	J/1GzuvDlsY+1Dqxpl5+ZAp15we9e7ftAyiuQ1wvt8rkUUvgYqcTk4POkYY3zQGp+24bL5E1iCh
	drqgsi5B6e5meW/zuw==
X-Google-Smtp-Source: AGHT+IEsMeXwO9t0IseTurjkNrAt08Gyvh4iGV/2vvLO3mJrswIneoLBuAz7CnQ+6M5kXWkU2YYEuw==
X-Received: by 2002:a17:907:d1b:b0:aa6:ac9b:681f with SMTP id a640c23a62f3a-ab2abcab4c1mr205960966b.43.1736325755920;
        Wed, 08 Jan 2025 00:42:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/20] texinfo: update 7.1.1 -> 7.2
Date: Wed,  8 Jan 2025 09:42:15 +0100
Message-Id: <20250108084226.117178-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209531

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../texinfo/0001-Makefile.am-do-not-build-manpages.patch  | 8 ++++----
 .../texinfo/{texinfo_7.1.1.bb => texinfo_7.2.bb}          | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/texinfo/{texinfo_7.1.1.bb => texinfo_7.2.bb} (95%)

diff --git a/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch b/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
index e3e8f30b5e7..cf0529db980 100644
--- a/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
+++ b/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
@@ -15,12 +15,12 @@ diff --git a/Makefile.am b/Makefile.am
 index f733797..1013fcf 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -66,7 +66,7 @@ if HOST_IS_WINDOWS
+@@ -76,7 +76,7 @@
  endif
  endif
-   SUBDIRS += install-info po po_document tp Pod-Simple-Texinfo texindex util \
--             doc man
-+             doc
+   SUBDIRS += install-info po po_document tp Pod-Simple-Texinfo \
+-             texindex util doc man
++             texindex util doc
    SUBDIRS += js
  endif
  
diff --git a/meta/recipes-extended/texinfo/texinfo_7.1.1.bb b/meta/recipes-extended/texinfo/texinfo_7.2.bb
similarity index 95%
rename from meta/recipes-extended/texinfo/texinfo_7.1.1.bb
rename to meta/recipes-extended/texinfo/texinfo_7.2.bb
index cc8683f085b..784f67f65b5 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.1.1.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.2.bb
@@ -34,7 +34,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[sha256sum] = "a46b46b54fd79641a8af5be4ad525788956ccf9798d3113396abeafa9020ef63"
+SRC_URI[sha256sum] = "e86de7dfef6b352aa1bf647de3a6213d1567c70129eccbf8977706d9c91919c8"
 
 tex_texinfo = "texmf/tex/texinfo"
 
@@ -75,7 +75,7 @@ FILES:info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
                   ${mandir}/man1/info.1* ${mandir}/man5/info.5* \
                   ${mandir}/man1/infokey.1* ${mandir}/man1/install-info.1*"
 
-FILES:${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo"
+FILES:${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo ${datadir}/texi2any"
 RDEPENDS:${PN} = "perl"
 FILES:${PN}-doc = "${infodir}/texi* \
                    ${datadir}/${tex_texinfo} \
-- 
2.39.5


