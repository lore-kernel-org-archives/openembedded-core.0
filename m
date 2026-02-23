Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E955E98DE6
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:39:46 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37952.1771861176121375333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=p4nbqufq;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65c1ed7b9aeso399684a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771861174; x=1772465974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OTFadSx1al3SvLzRroVqTL0u9S9NnA8rLSuZl+8sRM=;
        b=p4nbqufq2SV1F75j1PdwbN7H31a1+tPVeoUVozBMUKVqvBRC5zTpLBTE5kDwy9E6xk
         TrXlW/4ROBGQxdnZm6mBmIDqKs5MpGUG8lukZBEnj0978OFFjSLhWSt2gj/N4B9lkno/
         gv2qIPEPJTHGqSUjkBLhhX14AzTbvSvIAyNhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861174; x=1772465974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OTFadSx1al3SvLzRroVqTL0u9S9NnA8rLSuZl+8sRM=;
        b=Er89LCnkT5ualUjO8wjgXX/WGNTHOKomc4oJtKlcKXb4ot+YLOZEFG0GNiuZA3sdLK
         Is0Cw1EDUXLVmm6jz7fvKkbjt0x6KukTvCxO24J6diNF9LQCppnTC7jQnV09XHdWLJby
         MJC5pXA+noHN/VpxWB1f+VEY8/MvbzxTjsrf9tbOMqt/U4hCdjnIdWSH89IYPKqnMtxx
         apedjmn1pC9JVn67rXV0NinjcYl7/NCgJKv5O8mw5R+kuFs13xHh5hJgs+773k8bnRKY
         1s54THepMYjwH7Xx+D9hq0mVhI5UhDf5F9IWtNll0rdsPY2c0MeetPN2E//pda7dmxXa
         4rrg==
X-Gm-Message-State: AOJu0YySQDWDrlGEDzKKCPUUUxV/i6GZIIDI9LAeX7VP19uHkIQuMBBw
	GGMuAobuuwIqU1j2pVtz3wCbnFo0/7NciflnaQaXQXGOxfHk+HhzvrDdrDbKm0iNn/RO3Fk27tm
	Xo0JihKM=
X-Gm-Gg: AZuq6aLEPqp0IFxB9GqKGiANa+SKB7rDk383Fy7emvzXeRrt5LjbX59sH5qzTn+J3z/
	/szdeEK+NSIsqkdaNzkTBApI1cPynGrDDH0GARO2yjqJuB3ES2iMdk991tfppt+U9L7SdJdrr+w
	bjRo+1D/XNN+P/CsCC/ObQ7BULy/VTKSFDpWvoCmgYHHvr6fEXg3y7iZJNpAdvWivCfSBPojcSu
	D4tqxG3lV6Jd0VMB6ZUgD1HOiNpG6BT6/EG+rmvZNa/ji4hxL656SIVL9A3rFgeoXj67oLoAFMq
	MOqGaL9l/VZscTM3kcfAfsmF+6DpxfkABCrxIbdbQiNxJOUIpBz2dfqjqvJK/kK6/XY5G1BW9T6
	p+MhMVtaULSMuiZpW1AvuJQAlKtTISAbf8l17+Vn8m4Sh4s1f6xKkM3Z761bMNQb8HcN2ldZXCe
	It17N7Q6Ct1EI6vMR/vSV6KjhRonA1aEqnNbk59w8ma8JEUxKTcKflcHrfpb+rlfIInbpIKlpST
	TDrBWjHVG/Ht+CjJDxWs3DXdzov3pEzg9ZbkNAGIBaqQ8/dbaoNvR5JfT3fzoYI7vtg0w==
X-Received: by 2002:a17:907:3f1b:b0:b71:a627:3d9f with SMTP id a640c23a62f3a-b90816f7a49mr319484166b.0.1771861174313;
        Mon, 23 Feb 2026 07:39:34 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90ba281d69sm33643666b.28.2026.02.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:39:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 6/8] librepo: add PACKAGECONFIG[sequoia]
Date: Mon, 23 Feb 2026 16:39:27 +0100
Message-ID: <20260223153929.2641007-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
References: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231678

Currently, librepo compiled with -DUSE_GPGME=ON (the default setting)
causes dnf5 to fail importing repository keys. A very long writeup
of the issue is linked below. [1]

Add a new PACKAGECONFIG[sequoia] option which sets -DUSE_GPGME=OFF
and adds rpm and rpm-sequoia to the dependency list which ensures
dnf5 works with repository signing.

1: https://github.com/rpm-software-management/dnf5/issues/2539

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-devtools/librepo/librepo_1.21.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/librepo/librepo_1.21.0.bb b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
index d65567c14b..674919716f 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
@@ -16,6 +16,8 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake setuptools3-base pkgconfig
 
+PACKAGECONFIG[sequoia] = "-DUSE_GPGME=OFF,-DUSE_GPGME=ON,rpm rpm-sequoia"
+
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
     -DPYTHON_DESIRED=3 \
-- 
2.53.0


