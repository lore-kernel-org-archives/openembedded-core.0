Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.46505.1590480769727757849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=C/K6CAxv;
 spf=pass (domain: googlemail.com, ip: 209.85.208.50, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-ed1-f50.google.com with SMTP id e10so16896140edq.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ebjPo8S7T6tS+IYN4pq2Pdbaf5Yqy307bTi93O8ZerQ=;
        b=C/K6CAxv6Uc5ZPjTjDeWRICOBZHLfmF5KtG7us5AS8ML9hBJVGVvWXflFDgkpK62XF
         79W/R57pxZJusqFWHjKmoQ4HTaoKmoM+bhhG7DPNAaAuH3fjxYy/oGhifBLYBGO2T8QD
         jEuPqsR4Efyt6uJXIBi0mTY7vSnGXSFoCCaIPyGMhOwdmBjInQXM68Zgt0J3JZKlg2b2
         pyKowvAtcEr5Y6nhmNF5kltGe1zlXWfVV2mO3/7thCl0keUD5GFOhVPYIzaQn2RxH0nO
         lbMAXrtqt0dwhMPB/o7ZrFtFV5uh6R34ULr9hi4IstoxwbLdA4g5QJOOkrxXr7Z3/nnl
         Soug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ebjPo8S7T6tS+IYN4pq2Pdbaf5Yqy307bTi93O8ZerQ=;
        b=KLn7rw0hDEbYM58jgAcXlTRwsBWc3i8Xn2tk8zaSsPtzXlgtdC78pugYB4dLDJOx5T
         CTxR5/q4D3rqQmxttKeTgVSVA6HSOjB3MslWr8w56MpkuYqlerQBowWN/5TvAjs9e/3k
         QL4sfzM1XijbUi2XXnZPdJ/qFsQbqjC/C5FaTisAZ+kY4uISd5T4Cgi5KoGDBmN2TypY
         caQDTEw/oS6w5fkJcMQ/9yNsk9K+UbGcUNruPU2jMHKHKj3kTSlEazHoGbCa5MAclYSs
         IUjlZDrvxF1lKVKT/NwaBlbYQobarGOC9bHVmuPhVklwe26IC4kJb1M8DLGJq17WdfRr
         tg2Q==
X-Gm-Message-State: AOAM530xsRL6y/08tLkZQQ1r9cpv54WJuqhyTfx8BPStyUsBmwYdpMvq
	wLyDD3tAchlDw/NUXu6altsNbSGRURs=
X-Google-Smtp-Source: ABdhPJw+ITxfCBasuepHbKeOGNNAK0leY0V4fpx9iMhSmRBRv6ccueyl/ZPeljQ2kx+kH71wqTMyyg==
X-Received: by 2002:a50:d54f:: with SMTP id f15mr19679958edj.37.1590480767945;
        Tue, 26 May 2020 01:12:47 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from michelle.fritz.box (p200300f85702e800eba7f57533fa7a37.dip0.t-ipconnect.de. [2003:f8:5702:e800:eba7:f575:33fa:7a37])
        by smtp.gmail.com with ESMTPSA id w10sm16944519eju.106.2020.05.26.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 01:12:47 -0700 (PDT)
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: [meta-oe][PATCH 4/4] libksba: made libksba-lic "GPLv2+ | LGPLv3+"
Date: Tue, 26 May 2020 10:12:33 +0200
Message-Id: <20200526081233.62413-4-matthias.schoepfer@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>

If not set manually to "GPLv2+ | LGPLv3+", install of non GPLv3 parts (the
library in this case) will be prevented in a setup that has

INCOMPATIBLE_LICENSE = "GPLv3 LGPLv3 GPLv3+ LGPLv3+ GPL-3.0 LGPL-3.0 AGPL-3.0"
COPY_LIC_MANIFEST = "1"
COPY_LIC_DIRS = "1"
LICENSE_CREATE_PACKAGE = "1"

set, because during image creation, libksba-lic will have incompatible
license.

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 meta/recipes-support/libksba/libksba_1.3.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
index 336d7f8177..1a8f18a9ef 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
 LICENSE = "GPLv3+ & (GPLv2+ | LGPLv3+)"
 LICENSE_${PN} = "GPLv2+ | LGPLv3+"
 LICENSE_${PN}-doc = "GPLv3+"
+LICENSE_${PN}-lic = "GPLv2+ | LGPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
-- 
2.26.2

