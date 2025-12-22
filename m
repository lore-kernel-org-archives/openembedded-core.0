Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E2BE6ADDA
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87696.1766434116376632719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d/WaSlaX;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7a02592efaso624266366b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434115; x=1767038915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0dPBVmM1o6tb9Yr7wZRcHyopP7a4LztDYeAfsW93Xg=;
        b=d/WaSlaX1fQpEdoxqfK1xmwyrJd7l1Mqv9HhpcuTW9G+5FVroSVg3Axb9r6TfVblD8
         Eka5Jl+MjWWcmF5mXam3/N49D1zL74ksHJIJhs/kFq4jm3NDYI7kXJxhJmFjy/BFe4eQ
         MOHigWejtnanjZeyOXWF0NrjTOsp94mbsRer6sGsdGSAhV7MGj+rbsi3nw0VlEpSKbyw
         U46n+B8Flum1QQ8wsHK6OM8TW7ZSL9sJPijDgf+ESmus6irIWi4MEkPbE9EAnZl03ZiH
         DOMO8eOTtxxqJvQ5BrBwkk5HDbZVR1N3Qqs7ABsnWjm7JCsQknwBwZgCpN/Cl6JOn/Ks
         jvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434115; x=1767038915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0dPBVmM1o6tb9Yr7wZRcHyopP7a4LztDYeAfsW93Xg=;
        b=Emd6+e/y1TW3QRSOYGJqGHH6ioblJe0+d/YR/tpF83IHyy7nwfO6kTEnb1ZALsNizi
         feJI/uKYr821IxjgIuJqSwBs/vgmlunZ0GTHM3fgWdOQ0aTKekvbbg1VjgYQws9l9ZEg
         NYnHq3YlzGQAqUg18pxVXEIaCxifSCm8Rnhqo+t+DzQ9TheEUMmVy1cbqTCJqGfSP/iD
         GKgkMJKNeGyZ4njDnE+VLh0i4nn2Qrl1lBiwzhTcfelhfs/wjaYFcVbCTM60C4irz+Gw
         cbkixPWNCCutkgeYWieOOpaM/EkXg6j6h/HUKX337JxlMWsFJCnkOTzwtpI+Cda9Oz6P
         x71Q==
X-Gm-Message-State: AOJu0YyUNWSFPARp7KJVOXXxNJNuShl/sDwBq4QdnKQOuDhyeIrDXrHk
	IsjpVdU1dM9rg5ic0DqddZV0vwwl6CYDiXNyN4mN2merQnn1CEhanOuz1zp/SQ==
X-Gm-Gg: AY/fxX5KEmD0j3cJIp5nFb0U49z8iHH6HffKDx3a5KoSfR9HW4L79Dob8MPLfa1l8wp
	7YY0/OIILpeb3S0q6GoCRCinjSVqaMiRfCWMxPAH81Cd2LCQAny8HCzlWJS30Cxi4P7/hB3e3uO
	G8aWdVBd637c1NKuUOuRDKCL2V58GAN3gVDcrqn6buJeVjkCrQuwr62+cIpMt3xAFFg2iUmoaK1
	6bWqvCo7mdRo+lgiuF8mnB6Xw8ZtkM26Y/TnMvPJOOva1tysNqpPdKbJD26+rVW9M7HiEg4HJAl
	P/hbW4QPMnmI9Vh8p+ho2ZWBYUzzRQ9og6MN/vemctzvq51DPNnieZ/aCtT/6ptA8nd8OZMw8X0
	lUBNjZuQNZgB5uBWgYGedQWxmBGV/ucQ3WDa/zffTdAcHFUGkT/AcOxh2G0AtA26kdl/NBkws1h
	o6KzYWb2qVFQsKdRBOEmy5SUbA+oPRv+lPRcMH3HiTNiMCXrE=
X-Google-Smtp-Source: AGHT+IGqZECH630DDDhJw2h0KNOf0H+c1oGAb8mR3ARqTlBxtmtfgsW1hllC6CMUOCX56AzdXqkpwg==
X-Received: by 2002:a17:907:980a:b0:b7c:e4e9:b125 with SMTP id a640c23a62f3a-b8036ecbac6mr1187296766b.1.1766434114651;
        Mon, 22 Dec 2025 12:08:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 071/114] python3-pyopenssl: upgrade 25.1.0 -> 25.3.0
Date: Mon, 22 Dec 2025 21:06:53 +0100
Message-ID: <20251222200739.2278706-71-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228396

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-pyopenssl_25.1.0.bb => python3-pyopenssl_25.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_25.1.0.bb => python3-pyopenssl_25.3.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
index c1f571c552..b5230293d2 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "8d031884482e0c67ee92bf9a4d8cceb08d92aba7136432ffb0703c5280fc205b"
+SRC_URI[sha256sum] = "c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329"
 
 inherit pypi setuptools3
 
-- 
2.47.3


